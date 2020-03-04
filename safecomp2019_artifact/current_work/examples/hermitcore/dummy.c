#include "dummy.h"

int kputs(const char *asdf) {
	return 0;
}

uint8_t irq_nested_disable(void) {
	return 0;
}

void irq_nested_enable(uint8_t was_enabled) {}

int lwip_write(int s, const void *dataptr, size_t size) {
	return 0;
}

int lwip_read(int s, void *mem, size_t len) {
	return 0;
}

int lwip_close(int s) {
	return 0;
}

size_t virt_to_phys(size_t vir) {
	return 0;
}

const int32_t is_uhyve(void) {
	return 0;
}

int kputchar(int c) {
	return 0;
}

void* kmalloc(size_t sz) {
	return NULL;
}

void kfree(void* addr) {}

int timer_wait(unsigned int ticks) {
	return 0;
}

void udelay(uint32_t usecs) {}

int sem_init(sem_t* s, unsigned int v) {
	return 0;
}

int sem_destroy(sem_t* s) {
	return 0;
}

int sem_wait(sem_t* s, uint32_t ms) {
	return 0;
}

int sem_post(sem_t* s) {
	return 0;
}

int clone_task(tid_t* id, entry_point_t ep, void* arg, uint8_t prio) {
	return 0;
}

// our parser can't handle the instructions used for efficient strlen
size_t strlen(const char* str) {
	return 0;
}

void* memcpy(void* destination, const void* source, size_t num) {
	return NULL;
}

size_t get_pages(size_t npages) {
	return 0;
}

int page_map(size_t viraddr, size_t phyaddr, size_t npages, size_t bits) {
	return 0;
}

int put_pages(size_t phyaddr, size_t npages) {
	return 0;
}

uint32_t has_nx(void) {
	return 0;
}

size_t vma_alloc(size_t size, uint32_t flags) {
	return 0;
}

int vma_free(size_t start, size_t end) {
	return 0;
}
