#include "types.h"
#include "stat.h"
#include "user.h"

volatile int global = 0;

void worker(void *arg1, void *arg2) {
    int a = *(int *)arg1;
    int b = *(int *)arg2;

    printf(1, "child: a=%d b=%d before=%d\n", a, b, global);
    global = a + b;
    exit();
}

int main(void) {
    int a = 7, b = 5;
    int pid, joined;

    pid = thread_create(worker, &a, &b);
    if (pid < 0) {
        printf(1, "thread_create failed\n");
        exit();
    }

    joined = thread_join();
    printf(1, "parent: pid=%d joined=%d global=%d\n", pid, joined, global);
    exit();
}