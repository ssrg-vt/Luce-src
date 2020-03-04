/*
 * Copyright (c) 2010, Stefan Lankes, RWTH Aachen University
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *    * Redistributions of source code must retain the above copyright
 *      notice, this list of conditions and the following disclaimer.
 *    * Redistributions in binary form must reproduce the above copyright
 *      notice, this list of conditions and the following disclaimer in the
 *      documentation and/or other materials provided with the distribution.
 *    * Neither the name of the University nor the names of its contributors
 *      may be used to endorse or promote products derived from this
 *      software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#define __KERNEL__ // some things require this, like ssize_t

#include "../dummy.h"
#include "../errno.h"
#include "../semaphore_types.h"
#include "../spinlock_types.h"
#include "../spinlock.h"
#include "../syscall.h"
#include "../tasks_types.h"

/*
 * Note that linker symbols are not variables, they have no memory allocated for
 * maintaining a value, rather their address is their value.
 */
extern const void kernel_start;

//TODO: don't use one big kernel lock to comminicate with all proxies
static spinlock_irqsave_t lwip_lock = SPINLOCK_IRQSAVE_INIT;

//extern
spinlock_irqsave_t stdio_lock;
extern int32_t isle;
extern int32_t possible_isles;
// extern
volatile int libc_sd;

tid_t sys_getpid(void)
{
	task_t* task = per_core(current_task);

	return task->id;
}

int sys_getprio(tid_t* id)
{
	task_t* task = per_core(current_task);

	if (!id || (task->id == *id))
		return task->prio;
	return -EINVAL;
}

int sys_setprio(tid_t* id, int prio)
{
	return -ENOSYS;
}

// static inline
int socket_send(int fd, const void* buf, size_t len)
{
	int ret, sz = 0;

	do {
		ret = lwip_write(fd, (char*)buf + sz, len-sz);
		if (ret >= 0)
			sz += ret;
		else
			return ret;
	} while(sz < len);

	return len;
}

// static inline
int socket_recv(int fd, void* buf, size_t len)
{
	int ret, sz = 0;

	do {
		ret = lwip_read(fd, (char*)buf + sz, len-sz);
		if (ret >= 0)
			sz += ret;
		else
			return ret;
	} while(sz < len);

	return len;
}

// struct iovec doesn't appear to be defined anywhere else, strange
ssize_t readv(int d, const struct iovec *iov, int iovcnt)
{
	return -ENOSYS;
}

ssize_t writev(int fildes, const struct iovec *iov, int iovcnt)
{
	return -ENOSYS;
}

typedef struct {
	int sysnr;
	int fd;
	size_t len;
} __attribute__((packed)) sys_write_t;

typedef struct {
	int fd;
	const char* buf;
	size_t len;
} __attribute__((packed)) uhyve_write_t;


// inline static
void uhyve_send(unsigned short _port, unsigned int _data)
{
	*((unsigned int*)(size_t)_port) = _data;
}

ssize_t sys_write(int fd, const char* buf, size_t len)
{
	if (BUILTIN_EXPECT(!buf, 0))
		return -EINVAL;

	ssize_t i, ret;
	sys_write_t sysargs = {__NR_write, fd, len};

	// do we have an LwIP file descriptor?
	if (fd & LWIP_FD_BIT) {
		spinlock_irqsave_lock(&lwip_lock);
		ret = lwip_write(fd & ~LWIP_FD_BIT, buf, len);
		spinlock_irqsave_unlock(&lwip_lock);
		if (ret < 0)
			return -errno;

		return ret;
	}

	if (is_uhyve()) {
		uhyve_write_t uhyve_args = {fd, (const char*) buf, len};

		uhyve_send(UHYVE_PORT_WRITE, (unsigned)virt_to_phys((size_t)&uhyve_args));

		return uhyve_args.len;
	}

	if (libc_sd < 0)
	{
		spinlock_irqsave_lock(&stdio_lock);
		for(i=0; i<len; i++)
			kputchar(buf[i]);
		spinlock_irqsave_unlock(&stdio_lock);

		return len;
	}

	spinlock_irqsave_lock(&lwip_lock);

	int s = libc_sd;
	socket_send(s, &sysargs, sizeof(sysargs));

	i=0;
	while(i < len)
	{
		ret = lwip_write(s, (char*)buf+i, len-i);
		if (ret < 0) {
			spinlock_irqsave_unlock(&lwip_lock);
			return ret;
		}

		i += ret;
	}

	if (fd > 2)
		i = socket_recv(s, &i, sizeof(i));

	spinlock_irqsave_unlock(&lwip_lock);

	return i;
}

typedef struct {
	const char* name;
	int flags;
	int mode;
	int ret;
} __attribute__((packed)) uhyve_open_t;

int sys_open(const char* name, int flags, int mode)
{
	if (is_uhyve()) {
		uhyve_open_t uhyve_open = {(const char*)virt_to_phys((size_t)name), flags, mode, -1};

		uhyve_send(UHYVE_PORT_OPEN, (unsigned)virt_to_phys((size_t) &uhyve_open));

		return uhyve_open.ret;
	}

	int s, i, ret, sysnr = __NR_open;
	size_t len;

	spinlock_irqsave_lock(&lwip_lock);
	if (libc_sd < 0) {
		ret = -EINVAL;
		goto out;
	}

	s = libc_sd;
	len = strlen(name)+1;

	//i = 0;
	//lwip_setsockopt(s, IPPROTO_TCP, TCP_NODELAY, (char *) &i, sizeof(i));

	ret = socket_send(s, &sysnr, sizeof(sysnr));
	if (ret < 0)
		goto out;

	ret = socket_send(s, &len, sizeof(len));
	if (ret < 0)
		goto out;

	i=0;
	while(i<len)
	{
		ret = socket_send(s, name+i, len-i);
		if (ret < 0)
			goto out;
		i += ret;
	}

	ret = socket_send(s, &flags, sizeof(flags));
	if (ret < 0)
		goto out;

	ret = socket_send(s, &mode, sizeof(mode));
	if (ret < 0)
		goto out;

	//i = 1;
	//lwip_setsockopt(s, IPPROTO_TCP, TCP_NODELAY, (char *) &i, sizeof(i));

	socket_recv(s, &ret, sizeof(ret));

out:
	spinlock_irqsave_unlock(&lwip_lock);

	return ret;
}

typedef struct {
	int sysnr;
	int fd;
} __attribute__((packed)) sys_close_t;

typedef struct {
        int fd;
        int ret;
} __attribute__((packed)) uhyve_close_t;

int sys_close(int fd)
{
	int ret, s;
	sys_close_t sysargs = {__NR_close, fd};

	// do we have an LwIP file descriptor?
	if (fd & LWIP_FD_BIT) {
		ret = lwip_close(fd & ~LWIP_FD_BIT);
		if (ret < 0)
			return -errno;

		return 0;
	}

	if (is_uhyve()) {
		uhyve_close_t uhyve_close = {fd, -1};

		uhyve_send(UHYVE_PORT_CLOSE, (unsigned)virt_to_phys((size_t) &uhyve_close));

		return uhyve_close.ret;
	}

	spinlock_irqsave_lock(&lwip_lock);
	if (libc_sd < 0) {
		ret = 0;
		goto out;
	}

	s = libc_sd;
	ret = socket_send(s, &sysargs, sizeof(sysargs));
	if (ret != sizeof(sysargs))
		goto out;
	socket_recv(s, &ret, sizeof(ret));

out:
	spinlock_irqsave_unlock(&lwip_lock);

	return ret;
}

typedef struct {
	int sysnr;
	int fd;
	size_t len;
} __attribute__((packed)) sys_read_t;

typedef struct {
	int fd;
	char* buf;
        size_t len;
	ssize_t ret;
} __attribute__((packed)) uhyve_read_t;

ssize_t sys_read(int fd, char* buf, size_t len)
{
	sys_read_t sysargs = {__NR_read, fd, len};
	ssize_t j, ret;

	// do we have an LwIP file descriptor?
	if (fd & LWIP_FD_BIT) {
		spinlock_irqsave_lock(&lwip_lock);
		ret = lwip_read(fd & ~LWIP_FD_BIT, buf, len);
		spinlock_irqsave_unlock(&lwip_lock);
		if (ret < 0)
			return -errno;

		return ret;
	}

	if (is_uhyve()) {
		uhyve_read_t uhyve_args = {fd, (char*) buf, len, -1};

		uhyve_send(UHYVE_PORT_READ, (unsigned)virt_to_phys((size_t)&uhyve_args));

		return uhyve_args.ret;
	}

	if (libc_sd < 0)
		return -ENOSYS;

	spinlock_irqsave_lock(&lwip_lock);

	int s = libc_sd;
	socket_send(s, &sysargs, sizeof(sysargs));
	socket_recv(s, &j, sizeof(j));

	ssize_t i=0;
	while(i < j)
	{
		ret = lwip_read(s, (char*)buf+i, j-i);
		if (ret < 0) {
			spinlock_irqsave_unlock(&lwip_lock);
			return ret;
		}

		i += ret;
	}

	spinlock_irqsave_unlock(&lwip_lock);

	return j;
}

int sys_spinlock_init(spinlock_t** lock)
{
	int ret;

	if (BUILTIN_EXPECT(!lock, 0))
		return -EINVAL;

	*lock = (spinlock_t*) kmalloc(sizeof(spinlock_t));
	if (BUILTIN_EXPECT(!(*lock), 0))
		return -ENOMEM;

	ret = spinlock_init(*lock);
	if (ret) {
		kfree(*lock);
		*lock = NULL;
	}

	return ret;
}

int sys_spinlock_destroy(spinlock_t* lock)
{
	int ret;

	if (BUILTIN_EXPECT(!lock, 0))
		return -EINVAL;

	ret = spinlock_destroy(lock);
	if (!ret)
		kfree(lock);

	return ret;
}

int sys_spinlock_lock(spinlock_t* lock)
{
	if (BUILTIN_EXPECT(!lock, 0))
		return -EINVAL;

	return spinlock_lock(lock);
}

int sys_spinlock_unlock(spinlock_t* lock)
{
	if (BUILTIN_EXPECT(!lock, 0))
		return -EINVAL;

	return spinlock_unlock(lock);
}

int sys_sem_init(sem_t** sem, unsigned int value)
{
	int ret;

	if (BUILTIN_EXPECT(!sem, 0))
		return -EINVAL;

	*sem = (sem_t*) kmalloc(sizeof(sem_t));
	if (BUILTIN_EXPECT(!(*sem), 0))
		return -ENOMEM;

	ret = sem_init(*sem, value);
	if (ret) {
		kfree(*sem);
		*sem = NULL;
	}

	return ret;
}

int sys_sem_destroy(sem_t* sem)
{
	int ret;

	if (BUILTIN_EXPECT(!sem, 0))
		return -EINVAL;

	ret = sem_destroy(sem);
	if (!ret)
		kfree(sem);

	return ret;
}

int sys_sem_wait(sem_t* sem)
{
	if (BUILTIN_EXPECT(!sem, 0))
		return -EINVAL;

	return sem_wait(sem, 0);
}

int sys_sem_post(sem_t* sem)
{
	if (BUILTIN_EXPECT(!sem, 0))
		return -EINVAL;

	return sem_post(sem);
}

int sys_sem_timedwait(sem_t *sem, unsigned int ms)
{
	if (BUILTIN_EXPECT(!sem, 0))
		return -EINVAL;

	return sem_wait(sem, ms);
}

int sys_sem_cancelablewait(sem_t* sem, unsigned int ms)
{
	if (BUILTIN_EXPECT(!sem, 0))
		return -EINVAL;

	return sem_wait(sem, ms);
}

int sys_clone(tid_t* id, void* ep, void* argv)
{
	return clone_task(id, ep, argv, per_core(current_task)->prio);
}

int main(void) {
	return 0;
}
