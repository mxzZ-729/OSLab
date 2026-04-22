#include "types.h"
#include "stat.h"
#include "user.h"

volatile int counter = 0;
lock_t lock;

void increment(void *arg1, void *arg2) {
    int n = *(int *)arg1 + *(int *)arg2;
    int i;

    for (i = 0; i < n; i++) {
        lock_acquire(&lock);
        counter++;
        lock_release(&lock);
    }
    exit();
}

int main(void) {
    int n1 = 250, n2 = 250;
    int pid1, pid2;

    pid1 = thread_create(increment, &n1, &n2);
    pid2 = thread_create(increment, &n1, &n2);

    if (pid1 < 0 || pid2 < 0) {
        printf(1, "thread_create failed\n");
        exit();
    }

    thread_join();
    thread_join();

    printf(1, "counter=%d expeted=%d\n", counter, (n1 + n2) * 2);
    exit();
}