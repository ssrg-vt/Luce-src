#ifndef __DUMMY_H__
#define __DUMMY_H__

#include "hstddef.h"
#include "semaphore_types.h"
#include "tasks_types.h"

#define LOG_ERROR(...)
#define LOG_DEBUG(...)

int kputs(const char *) __attribute__((noinline));
uint8_t irq_nested_disable(void) __attribute__((noinline));
void irq_nested_enable(uint8_t was_enabled) __attribute__((noinline));

// syscall stuff
int lwip_write(int s, const void *dataptr, size_t size) __attribute__((noinline));
int lwip_read(int s, void *mem, size_t len) __attribute__((noinline));
int lwip_close(int s) __attribute__((noinline));

/** @brief Converts a virtual address to a physical
 *
 * A non mapped virtual address causes a pagefault!
 *
 * @param addr Virtual address to convert
 * @return physical address
 */
size_t virt_to_phys(size_t vir) __attribute__((noinline));

const int32_t is_uhyve(void) __attribute__((noinline));
int kputchar(int) __attribute__((noinline));
void* kmalloc(size_t sz) __attribute__((noinline));
void kfree(void* addr) __attribute__((noinline));
int timer_wait(unsigned int ticks) __attribute__((noinline));
void udelay(uint32_t usecs) __attribute__((noinline));
int sem_init(sem_t* s, unsigned int v) __attribute__((noinline));
int sem_destroy(sem_t* s) __attribute__((noinline));
int sem_wait(sem_t* s, uint32_t ms) __attribute__((noinline));
int sem_post(sem_t* s) __attribute__((noinline));
int clone_task(tid_t* id, entry_point_t ep, void* arg, uint8_t prio) __attribute__((noinline));

// string stuff
size_t strlen(const char* str) __attribute__((noinline));
void* memcpy(void* destination, const void* source, size_t num) __attribute__((noinline));

// memory stuff
size_t get_pages(size_t npages) __attribute__((noinline));

/** @brief Map a continuous region of pages
 *
 * @param viraddr Desired virtual address
 * @param phyaddr Physical address to map from
 * @param npages The region's size in number of pages
 * @param bits Further page flags
 * @return
 */
int page_map(size_t viraddr, size_t phyaddr, size_t npages, size_t bits) __attribute__((noinline));
int put_pages(size_t phyaddr, size_t npages) __attribute__((noinline));
uint32_t has_nx(void) __attribute__((noinline));

// vma stuff

/** @brief Search for a free memory area
 *
 * @param size Size of requestes VMA in bytes
 * @param flags
 * @return Type flags the new area shall have
 * - 0 on failure
 * - the start address of a free area
 */
size_t vma_alloc(size_t size, uint32_t flags) __attribute__((noinline));

/** @brief Free an allocated memory area
 *
 * @param start Start address of the area to be freed
 * @param end End address of the to be freed
 * @return
 * - 0 on success
 * - -EINVAL (-22) on failure
 */
int vma_free(size_t start, size_t end) __attribute__((noinline));

#endif // __DUMMY_H__
