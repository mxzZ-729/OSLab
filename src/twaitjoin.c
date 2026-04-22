#include "types.h"
#include "stat.h"
#include "user.h"

volatile int thread_seen = 0;

void
thread_worker(void *arg1, void *arg2)
{
  int value;

  value = *(int*)arg1;
  thread_seen = value;
  exit();
}

int
main(void)
{
  int childpid, threadpid, joined, waited;
  int value;

  printf(1, "twaitjoin: start\n");

  childpid = fork();
  if(childpid < 0){
    printf(1, "twaitjoin: fork failed\n");
    exit();
  }

  if(childpid == 0){
    sleep(20);
    exit();
  }

  value = 1234;
  threadpid = thread_create(thread_worker, &value, 0);
  if(threadpid < 0){
    printf(1, "twaitjoin: thread_create failed\n");
    kill(childpid);
    wait();
    exit();
  }

  joined = thread_join();
  if(joined != threadpid){
    printf(1, "twaitjoin: join returned %d expected %d\n", joined, threadpid);
    kill(childpid);
    wait();
    exit();
  }

  if(thread_seen != value){
    printf(1, "twaitjoin: thread saw %d expected %d\n", thread_seen, value);
    kill(childpid);
    wait();
    exit();
  }

  if(thread_join() != -1){
    printf(1, "twaitjoin: extra thread_join should fail\n");
    kill(childpid);
    wait();
    exit();
  }

  waited = wait();
  if(waited != childpid){
    printf(1, "twaitjoin: wait returned %d expected %d\n", waited, childpid);
    exit();
  }

  if(wait() != -1){
    printf(1, "twaitjoin: extra wait should fail\n");
    exit();
  }

  printf(1, "twaitjoin: OK\n");
  exit();
}
