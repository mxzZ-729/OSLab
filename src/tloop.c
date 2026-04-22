#include "types.h"
#include "stat.h"
#include "user.h"

volatile int done = 0;

void job(void *arg1, void *arg2) {
  done++;
  exit();
}

int main(void) {
  int i, pid;

  for(i = 0; i < 20; i++){
    pid = thread_create(job, 0, 0);
    if(pid < 0){
      printf(1, "create failed at round %d\n", i);
      exit();
    }
    if(thread_join() < 0){
      printf(1, "join failed at round %d\n", i);
      exit();
    }
  }

  printf(1, "done=%d\n", done);
  exit();
}
