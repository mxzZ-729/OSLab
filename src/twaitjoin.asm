
_twaitjoin:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  exit();
}

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 24             	sub    $0x24,%esp
  int childpid, threadpid, joined, waited;
  int value;

  printf(1, "twaitjoin: start\n");
  13:	68 d8 08 00 00       	push   $0x8d8
  18:	6a 01                	push   $0x1
  1a:	e8 b1 05 00 00       	call   5d0 <printf>

  childpid = fork();
  1f:	e8 4e 04 00 00       	call   472 <fork>
  if(childpid < 0){
  24:	83 c4 10             	add    $0x10,%esp
  27:	85 c0                	test   %eax,%eax
  29:	78 70                	js     9b <main+0x9b>
    printf(1, "twaitjoin: fork failed\n");
    exit();
  }

  if(childpid == 0){
  2b:	74 5f                	je     8c <main+0x8c>
  2d:	89 c3                	mov    %eax,%ebx
    sleep(20);
    exit();
  }

  value = 1234;
  threadpid = thread_create(thread_worker, &value, 0);
  2f:	50                   	push   %eax
  30:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  33:	6a 00                	push   $0x0
  35:	50                   	push   %eax
  36:	68 20 01 00 00       	push   $0x120
  value = 1234;
  3b:	c7 45 e4 d2 04 00 00 	movl   $0x4d2,-0x1c(%ebp)
  threadpid = thread_create(thread_worker, &value, 0);
  42:	e8 39 03 00 00       	call   380 <thread_create>
  if(threadpid < 0){
  47:	83 c4 10             	add    $0x10,%esp
  threadpid = thread_create(thread_worker, &value, 0);
  4a:	89 c6                	mov    %eax,%esi
  if(threadpid < 0){
  4c:	85 c0                	test   %eax,%eax
  4e:	78 67                	js     b7 <main+0xb7>
    kill(childpid);
    wait();
    exit();
  }

  joined = thread_join();
  50:	e8 8b 03 00 00       	call   3e0 <thread_join>
  if(joined != threadpid){
  55:	39 c6                	cmp    %eax,%esi
  57:	75 55                	jne    ae <main+0xae>
    kill(childpid);
    wait();
    exit();
  }

  if(thread_seen != value){
  59:	8b 15 d4 0d 00 00    	mov    0xdd4,%edx
  5f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  62:	39 c2                	cmp    %eax,%edx
  64:	74 5a                	je     c0 <main+0xc0>
    printf(1, "twaitjoin: thread saw %d expected %d\n", thread_seen, value);
  66:	8b 15 d4 0d 00 00    	mov    0xdd4,%edx
  6c:	50                   	push   %eax
  6d:	52                   	push   %edx
  6e:	68 68 09 00 00       	push   $0x968
    printf(1, "twaitjoin: join returned %d expected %d\n", joined, threadpid);
  73:	6a 01                	push   $0x1
  75:	e8 56 05 00 00       	call   5d0 <printf>
    kill(childpid);
  7a:	89 1c 24             	mov    %ebx,(%esp)
  7d:	e8 28 04 00 00       	call   4aa <kill>
    wait();
  82:	e8 fb 03 00 00       	call   482 <wait>
    exit();
  87:	e8 ee 03 00 00       	call   47a <exit>
    sleep(20);
  8c:	83 ec 0c             	sub    $0xc,%esp
  8f:	6a 14                	push   $0x14
  91:	e8 74 04 00 00       	call   50a <sleep>
    exit();
  96:	e8 df 03 00 00       	call   47a <exit>
    printf(1, "twaitjoin: fork failed\n");
  9b:	50                   	push   %eax
  9c:	50                   	push   %eax
  9d:	68 ea 08 00 00       	push   $0x8ea
  a2:	6a 01                	push   $0x1
  a4:	e8 27 05 00 00       	call   5d0 <printf>
    exit();
  a9:	e8 cc 03 00 00       	call   47a <exit>
    printf(1, "twaitjoin: join returned %d expected %d\n", joined, threadpid);
  ae:	56                   	push   %esi
  af:	50                   	push   %eax
  b0:	68 3c 09 00 00       	push   $0x93c
  b5:	eb bc                	jmp    73 <main+0x73>
    printf(1, "twaitjoin: thread_create failed\n");
  b7:	56                   	push   %esi
  b8:	56                   	push   %esi
  b9:	68 18 09 00 00       	push   $0x918
  be:	eb b3                	jmp    73 <main+0x73>
    kill(childpid);
    wait();
    exit();
  }

  if(thread_join() != -1){
  c0:	e8 1b 03 00 00       	call   3e0 <thread_join>
  c5:	83 c0 01             	add    $0x1,%eax
  c8:	74 09                	je     d3 <main+0xd3>
    printf(1, "twaitjoin: extra thread_join should fail\n");
  ca:	51                   	push   %ecx
  cb:	51                   	push   %ecx
  cc:	68 90 09 00 00       	push   $0x990
  d1:	eb a0                	jmp    73 <main+0x73>
    kill(childpid);
    wait();
    exit();
  }

  waited = wait();
  d3:	e8 aa 03 00 00       	call   482 <wait>
  if(waited != childpid){
  d8:	39 c3                	cmp    %eax,%ebx
  da:	74 13                	je     ef <main+0xef>
    printf(1, "twaitjoin: wait returned %d expected %d\n", waited, childpid);
  dc:	53                   	push   %ebx
  dd:	50                   	push   %eax
  de:	68 bc 09 00 00       	push   $0x9bc
  e3:	6a 01                	push   $0x1
  e5:	e8 e6 04 00 00       	call   5d0 <printf>
    exit();
  ea:	e8 8b 03 00 00       	call   47a <exit>
  }

  if(wait() != -1){
  ef:	e8 8e 03 00 00       	call   482 <wait>
  f4:	83 c0 01             	add    $0x1,%eax
  f7:	74 13                	je     10c <main+0x10c>
    printf(1, "twaitjoin: extra wait should fail\n");
  f9:	52                   	push   %edx
  fa:	52                   	push   %edx
  fb:	68 e8 09 00 00       	push   $0x9e8
 100:	6a 01                	push   $0x1
 102:	e8 c9 04 00 00       	call   5d0 <printf>
    exit();
 107:	e8 6e 03 00 00       	call   47a <exit>
  }

  printf(1, "twaitjoin: OK\n");
 10c:	50                   	push   %eax
 10d:	50                   	push   %eax
 10e:	68 02 09 00 00       	push   $0x902
 113:	6a 01                	push   $0x1
 115:	e8 b6 04 00 00       	call   5d0 <printf>
  exit();
 11a:	e8 5b 03 00 00       	call   47a <exit>
 11f:	90                   	nop

00000120 <thread_worker>:
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	83 ec 08             	sub    $0x8,%esp
  value = *(int*)arg1;
 126:	8b 45 08             	mov    0x8(%ebp),%eax
 129:	8b 00                	mov    (%eax),%eax
  thread_seen = value;
 12b:	a3 d4 0d 00 00       	mov    %eax,0xdd4
  exit();
 130:	e8 45 03 00 00       	call   47a <exit>
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 140:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 141:	31 c0                	xor    %eax,%eax
{
 143:	89 e5                	mov    %esp,%ebp
 145:	53                   	push   %ebx
 146:	8b 4d 08             	mov    0x8(%ebp),%ecx
 149:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 157:	83 c0 01             	add    $0x1,%eax
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 15e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 161:	89 c8                	mov    %ecx,%eax
 163:	c9                   	leave
 164:	c3                   	ret
 165:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 16c:	00 
 16d:	8d 76 00             	lea    0x0(%esi),%esi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 55 08             	mov    0x8(%ebp),%edx
 177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 17a:	0f b6 02             	movzbl (%edx),%eax
 17d:	84 c0                	test   %al,%al
 17f:	75 17                	jne    198 <strcmp+0x28>
 181:	eb 3a                	jmp    1bd <strcmp+0x4d>
 183:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 188:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 18c:	83 c2 01             	add    $0x1,%edx
 18f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 192:	84 c0                	test   %al,%al
 194:	74 1a                	je     1b0 <strcmp+0x40>
 196:	89 d9                	mov    %ebx,%ecx
 198:	0f b6 19             	movzbl (%ecx),%ebx
 19b:	38 c3                	cmp    %al,%bl
 19d:	74 e9                	je     188 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 19f:	29 d8                	sub    %ebx,%eax
}
 1a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a4:	c9                   	leave
 1a5:	c3                   	ret
 1a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ad:	00 
 1ae:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 1b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1b4:	31 c0                	xor    %eax,%eax
 1b6:	29 d8                	sub    %ebx,%eax
}
 1b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1bb:	c9                   	leave
 1bc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 1bd:	0f b6 19             	movzbl (%ecx),%ebx
 1c0:	31 c0                	xor    %eax,%eax
 1c2:	eb db                	jmp    19f <strcmp+0x2f>
 1c4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1cb:	00 
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strlen>:

uint
strlen(const char *s)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1d6:	80 3a 00             	cmpb   $0x0,(%edx)
 1d9:	74 15                	je     1f0 <strlen+0x20>
 1db:	31 c0                	xor    %eax,%eax
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	83 c0 01             	add    $0x1,%eax
 1e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1e7:	89 c1                	mov    %eax,%ecx
 1e9:	75 f5                	jne    1e0 <strlen+0x10>
    ;
  return n;
}
 1eb:	89 c8                	mov    %ecx,%eax
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret
 1ef:	90                   	nop
  for(n = 0; s[n]; n++)
 1f0:	31 c9                	xor    %ecx,%ecx
}
 1f2:	5d                   	pop    %ebp
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	c3                   	ret
 1f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1fd:	00 
 1fe:	66 90                	xchg   %ax,%ax

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 207:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 d7                	mov    %edx,%edi
 20f:	fc                   	cld
 210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 212:	8b 7d fc             	mov    -0x4(%ebp),%edi
 215:	89 d0                	mov    %edx,%eax
 217:	c9                   	leave
 218:	c3                   	ret
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	84 d2                	test   %dl,%dl
 22f:	75 12                	jne    243 <strchr+0x23>
 231:	eb 1d                	jmp    250 <strchr+0x30>
 233:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 238:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 23c:	83 c0 01             	add    $0x1,%eax
 23f:	84 d2                	test   %dl,%dl
 241:	74 0d                	je     250 <strchr+0x30>
    if(*s == c)
 243:	38 d1                	cmp    %dl,%cl
 245:	75 f1                	jne    238 <strchr+0x18>
      return (char*)s;
  return 0;
}
 247:	5d                   	pop    %ebp
 248:	c3                   	ret
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 250:	31 c0                	xor    %eax,%eax
}
 252:	5d                   	pop    %ebp
 253:	c3                   	ret
 254:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 25b:	00 
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 265:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 268:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 269:	31 db                	xor    %ebx,%ebx
{
 26b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 26e:	eb 27                	jmp    297 <gets+0x37>
    cc = read(0, &c, 1);
 270:	83 ec 04             	sub    $0x4,%esp
 273:	6a 01                	push   $0x1
 275:	56                   	push   %esi
 276:	6a 00                	push   $0x0
 278:	e8 15 02 00 00       	call   492 <read>
    if(cc < 1)
 27d:	83 c4 10             	add    $0x10,%esp
 280:	85 c0                	test   %eax,%eax
 282:	7e 1d                	jle    2a1 <gets+0x41>
      break;
    buf[i++] = c;
 284:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 288:	8b 55 08             	mov    0x8(%ebp),%edx
 28b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 28f:	3c 0a                	cmp    $0xa,%al
 291:	74 10                	je     2a3 <gets+0x43>
 293:	3c 0d                	cmp    $0xd,%al
 295:	74 0c                	je     2a3 <gets+0x43>
  for(i=0; i+1 < max; ){
 297:	89 df                	mov    %ebx,%edi
 299:	83 c3 01             	add    $0x1,%ebx
 29c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29f:	7c cf                	jl     270 <gets+0x10>
 2a1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 2aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ad:	5b                   	pop    %ebx
 2ae:	5e                   	pop    %esi
 2af:	5f                   	pop    %edi
 2b0:	5d                   	pop    %ebp
 2b1:	c3                   	ret
 2b2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2b9:	00 
 2ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	56                   	push   %esi
 2c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c5:	83 ec 08             	sub    $0x8,%esp
 2c8:	6a 00                	push   $0x0
 2ca:	ff 75 08             	push   0x8(%ebp)
 2cd:	e8 e8 01 00 00       	call   4ba <open>
  if(fd < 0)
 2d2:	83 c4 10             	add    $0x10,%esp
 2d5:	85 c0                	test   %eax,%eax
 2d7:	78 27                	js     300 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2d9:	83 ec 08             	sub    $0x8,%esp
 2dc:	ff 75 0c             	push   0xc(%ebp)
 2df:	89 c3                	mov    %eax,%ebx
 2e1:	50                   	push   %eax
 2e2:	e8 eb 01 00 00       	call   4d2 <fstat>
  close(fd);
 2e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ea:	89 c6                	mov    %eax,%esi
  close(fd);
 2ec:	e8 b1 01 00 00       	call   4a2 <close>
  return r;
 2f1:	83 c4 10             	add    $0x10,%esp
}
 2f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2f7:	89 f0                	mov    %esi,%eax
 2f9:	5b                   	pop    %ebx
 2fa:	5e                   	pop    %esi
 2fb:	5d                   	pop    %ebp
 2fc:	c3                   	ret
 2fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 300:	be ff ff ff ff       	mov    $0xffffffff,%esi
 305:	eb ed                	jmp    2f4 <stat+0x34>
 307:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 30e:	00 
 30f:	90                   	nop

00000310 <atoi>:

int
atoi(const char *s)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	53                   	push   %ebx
 314:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 317:	0f be 02             	movsbl (%edx),%eax
 31a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 31d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 320:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 325:	77 1e                	ja     345 <atoi+0x35>
 327:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 32e:	00 
 32f:	90                   	nop
    n = n*10 + *s++ - '0';
 330:	83 c2 01             	add    $0x1,%edx
 333:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 336:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 33a:	0f be 02             	movsbl (%edx),%eax
 33d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 340:	80 fb 09             	cmp    $0x9,%bl
 343:	76 eb                	jbe    330 <atoi+0x20>
  return n;
}
 345:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 348:	89 c8                	mov    %ecx,%eax
 34a:	c9                   	leave
 34b:	c3                   	ret
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000350 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	8b 45 10             	mov    0x10(%ebp),%eax
 357:	8b 55 08             	mov    0x8(%ebp),%edx
 35a:	56                   	push   %esi
 35b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 35e:	85 c0                	test   %eax,%eax
 360:	7e 13                	jle    375 <memmove+0x25>
 362:	01 d0                	add    %edx,%eax
  dst = vdst;
 364:	89 d7                	mov    %edx,%edi
 366:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 36d:	00 
 36e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 370:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 371:	39 f8                	cmp    %edi,%eax
 373:	75 fb                	jne    370 <memmove+0x20>
  return vdst;
}
 375:	5e                   	pop    %esi
 376:	89 d0                	mov    %edx,%eax
 378:	5f                   	pop    %edi
 379:	5d                   	pop    %ebp
 37a:	c3                   	ret
 37b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000380 <thread_create>:

int
thread_create(void(*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	83 ec 10             	sub    $0x10,%esp
  int pid;
  void *raw;
  void *stack;

  raw = malloc(PGSIZE * 2);
 387:	68 00 20 00 00       	push   $0x2000
 38c:	e8 5f 04 00 00       	call   7f0 <malloc>
  if (raw == 0) {
 391:	83 c4 10             	add    $0x10,%esp
 394:	85 c0                	test   %eax,%eax
 396:	74 37                	je     3cf <thread_create+0x4f>
 398:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  stack = (void *)(((uint)raw + sizeof(void *) + PGSIZE - 1) & ~(PGSIZE - 1));
 39a:	8d 80 03 10 00 00    	lea    0x1003(%eax),%eax
 3a0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  ((void **)stack)[-1] = raw;
 3a5:	89 58 fc             	mov    %ebx,-0x4(%eax)

  pid = clone(start_routine, arg1, arg2, stack);
 3a8:	50                   	push   %eax
 3a9:	ff 75 10             	push   0x10(%ebp)
 3ac:	ff 75 0c             	push   0xc(%ebp)
 3af:	ff 75 08             	push   0x8(%ebp)
 3b2:	e8 63 01 00 00       	call   51a <clone>
  if (pid < 0) {
 3b7:	83 c4 10             	add    $0x10,%esp
 3ba:	85 c0                	test   %eax,%eax
 3bc:	78 05                	js     3c3 <thread_create+0x43>
    free(raw);
    return -1;
  }
  return pid;
}
 3be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c1:	c9                   	leave
 3c2:	c3                   	ret
    free(raw);
 3c3:	83 ec 0c             	sub    $0xc,%esp
 3c6:	53                   	push   %ebx
 3c7:	e8 94 03 00 00       	call   760 <free>
    return -1;
 3cc:	83 c4 10             	add    $0x10,%esp
    return -1;
 3cf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3d4:	eb e8                	jmp    3be <thread_create+0x3e>
 3d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3dd:	00 
 3de:	66 90                	xchg   %ax,%ax

000003e0 <thread_join>:

int
thread_join(void) 
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	53                   	push   %ebx
  int pid;
  void *raw;
  void *stack;

  pid = join(&stack);
 3e4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 3e7:	83 ec 20             	sub    $0x20,%esp
  pid = join(&stack);
 3ea:	50                   	push   %eax
 3eb:	e8 32 01 00 00       	call   522 <join>
  if (pid < 0) {
 3f0:	83 c4 10             	add    $0x10,%esp
 3f3:	85 c0                	test   %eax,%eax
 3f5:	78 21                	js     418 <thread_join+0x38>
 3f7:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  raw = ((void **)stack)[-1];
 3f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  free(raw);
 3fc:	83 ec 0c             	sub    $0xc,%esp
 3ff:	ff 70 fc             	push   -0x4(%eax)
 402:	e8 59 03 00 00       	call   760 <free>
  return pid;
 407:	83 c4 10             	add    $0x10,%esp
}
 40a:	89 d8                	mov    %ebx,%eax
 40c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 40f:	c9                   	leave
 410:	c3                   	ret
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 418:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 41d:	eb eb                	jmp    40a <thread_join+0x2a>
 41f:	90                   	nop

00000420 <lock_init>:
  return value;
}

void 
lock_init(lock_t *lock)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 426:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 42c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 433:	5d                   	pop    %ebp
 434:	c3                   	ret
 435:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 43c:	00 
 43d:	8d 76 00             	lea    0x0(%esi),%esi

00000440 <lock_acquire>:

void
lock_acquire(lock_t *lock)
{
 440:	55                   	push   %ebp
  asm volatile (
 441:	ba 01 00 00 00       	mov    $0x1,%edx
{
 446:	89 e5                	mov    %esp,%ebp
 448:	8b 4d 08             	mov    0x8(%ebp),%ecx
  asm volatile (
 44b:	f0 0f c1 11          	lock xadd %edx,(%ecx)
  int myturn = fetch_and_add(&lock->ticket, 1);
  while (myturn != lock->turn);
 44f:	90                   	nop
 450:	8b 41 04             	mov    0x4(%ecx),%eax
 453:	39 d0                	cmp    %edx,%eax
 455:	75 f9                	jne    450 <lock_acquire+0x10>
}
 457:	5d                   	pop    %ebp
 458:	c3                   	ret
 459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000460 <lock_release>:

void 
lock_release(lock_t *lock)
{
 460:	55                   	push   %ebp
  asm volatile (
 461:	b8 01 00 00 00       	mov    $0x1,%eax
{
 466:	89 e5                	mov    %esp,%ebp
 468:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile (
 46b:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  fetch_and_add(&lock->turn, 1);
 470:	5d                   	pop    %ebp
 471:	c3                   	ret

00000472 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 472:	b8 01 00 00 00       	mov    $0x1,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret

0000047a <exit>:
SYSCALL(exit)
 47a:	b8 02 00 00 00       	mov    $0x2,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret

00000482 <wait>:
SYSCALL(wait)
 482:	b8 03 00 00 00       	mov    $0x3,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret

0000048a <pipe>:
SYSCALL(pipe)
 48a:	b8 04 00 00 00       	mov    $0x4,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret

00000492 <read>:
SYSCALL(read)
 492:	b8 05 00 00 00       	mov    $0x5,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret

0000049a <write>:
SYSCALL(write)
 49a:	b8 10 00 00 00       	mov    $0x10,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret

000004a2 <close>:
SYSCALL(close)
 4a2:	b8 15 00 00 00       	mov    $0x15,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret

000004aa <kill>:
SYSCALL(kill)
 4aa:	b8 06 00 00 00       	mov    $0x6,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret

000004b2 <exec>:
SYSCALL(exec)
 4b2:	b8 07 00 00 00       	mov    $0x7,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret

000004ba <open>:
SYSCALL(open)
 4ba:	b8 0f 00 00 00       	mov    $0xf,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret

000004c2 <mknod>:
SYSCALL(mknod)
 4c2:	b8 11 00 00 00       	mov    $0x11,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret

000004ca <unlink>:
SYSCALL(unlink)
 4ca:	b8 12 00 00 00       	mov    $0x12,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret

000004d2 <fstat>:
SYSCALL(fstat)
 4d2:	b8 08 00 00 00       	mov    $0x8,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret

000004da <link>:
SYSCALL(link)
 4da:	b8 13 00 00 00       	mov    $0x13,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret

000004e2 <mkdir>:
SYSCALL(mkdir)
 4e2:	b8 14 00 00 00       	mov    $0x14,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret

000004ea <chdir>:
SYSCALL(chdir)
 4ea:	b8 09 00 00 00       	mov    $0x9,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret

000004f2 <dup>:
SYSCALL(dup)
 4f2:	b8 0a 00 00 00       	mov    $0xa,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret

000004fa <getpid>:
SYSCALL(getpid)
 4fa:	b8 0b 00 00 00       	mov    $0xb,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret

00000502 <sbrk>:
SYSCALL(sbrk)
 502:	b8 0c 00 00 00       	mov    $0xc,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret

0000050a <sleep>:
SYSCALL(sleep)
 50a:	b8 0d 00 00 00       	mov    $0xd,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret

00000512 <uptime>:
SYSCALL(uptime)
 512:	b8 0e 00 00 00       	mov    $0xe,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret

0000051a <clone>:
SYSCALL(clone)
 51a:	b8 16 00 00 00       	mov    $0x16,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret

00000522 <join>:
SYSCALL(join)
 522:	b8 17 00 00 00       	mov    $0x17,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret
 52a:	66 90                	xchg   %ax,%ax
 52c:	66 90                	xchg   %ax,%ax
 52e:	66 90                	xchg   %ax,%ax

00000530 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 538:	89 d1                	mov    %edx,%ecx
{
 53a:	83 ec 3c             	sub    $0x3c,%esp
 53d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 540:	85 d2                	test   %edx,%edx
 542:	0f 89 80 00 00 00    	jns    5c8 <printint+0x98>
 548:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 54c:	74 7a                	je     5c8 <printint+0x98>
    x = -xx;
 54e:	f7 d9                	neg    %ecx
    neg = 1;
 550:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 555:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 558:	31 f6                	xor    %esi,%esi
 55a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 560:	89 c8                	mov    %ecx,%eax
 562:	31 d2                	xor    %edx,%edx
 564:	89 f7                	mov    %esi,%edi
 566:	f7 f3                	div    %ebx
 568:	8d 76 01             	lea    0x1(%esi),%esi
 56b:	0f b6 92 64 0a 00 00 	movzbl 0xa64(%edx),%edx
 572:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 576:	89 ca                	mov    %ecx,%edx
 578:	89 c1                	mov    %eax,%ecx
 57a:	39 da                	cmp    %ebx,%edx
 57c:	73 e2                	jae    560 <printint+0x30>
  if(neg)
 57e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 581:	85 c0                	test   %eax,%eax
 583:	74 07                	je     58c <printint+0x5c>
    buf[i++] = '-';
 585:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 58a:	89 f7                	mov    %esi,%edi
 58c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 58f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 592:	01 df                	add    %ebx,%edi
 594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 598:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 59b:	83 ec 04             	sub    $0x4,%esp
 59e:	88 45 d7             	mov    %al,-0x29(%ebp)
 5a1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 5a4:	6a 01                	push   $0x1
 5a6:	50                   	push   %eax
 5a7:	56                   	push   %esi
 5a8:	e8 ed fe ff ff       	call   49a <write>
  while(--i >= 0)
 5ad:	89 f8                	mov    %edi,%eax
 5af:	83 c4 10             	add    $0x10,%esp
 5b2:	83 ef 01             	sub    $0x1,%edi
 5b5:	39 c3                	cmp    %eax,%ebx
 5b7:	75 df                	jne    598 <printint+0x68>
}
 5b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5bc:	5b                   	pop    %ebx
 5bd:	5e                   	pop    %esi
 5be:	5f                   	pop    %edi
 5bf:	5d                   	pop    %ebp
 5c0:	c3                   	ret
 5c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5c8:	31 c0                	xor    %eax,%eax
 5ca:	eb 89                	jmp    555 <printint+0x25>
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
 5d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5d9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 5dc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 5df:	0f b6 1e             	movzbl (%esi),%ebx
 5e2:	83 c6 01             	add    $0x1,%esi
 5e5:	84 db                	test   %bl,%bl
 5e7:	74 67                	je     650 <printf+0x80>
 5e9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 5ec:	31 d2                	xor    %edx,%edx
 5ee:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 5f1:	eb 34                	jmp    627 <printf+0x57>
 5f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 5f8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5fb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 600:	83 f8 25             	cmp    $0x25,%eax
 603:	74 18                	je     61d <printf+0x4d>
  write(fd, &c, 1);
 605:	83 ec 04             	sub    $0x4,%esp
 608:	8d 45 e7             	lea    -0x19(%ebp),%eax
 60b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 60e:	6a 01                	push   $0x1
 610:	50                   	push   %eax
 611:	57                   	push   %edi
 612:	e8 83 fe ff ff       	call   49a <write>
 617:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 61a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 61d:	0f b6 1e             	movzbl (%esi),%ebx
 620:	83 c6 01             	add    $0x1,%esi
 623:	84 db                	test   %bl,%bl
 625:	74 29                	je     650 <printf+0x80>
    c = fmt[i] & 0xff;
 627:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 62a:	85 d2                	test   %edx,%edx
 62c:	74 ca                	je     5f8 <printf+0x28>
      }
    } else if(state == '%'){
 62e:	83 fa 25             	cmp    $0x25,%edx
 631:	75 ea                	jne    61d <printf+0x4d>
      if(c == 'd'){
 633:	83 f8 25             	cmp    $0x25,%eax
 636:	0f 84 04 01 00 00    	je     740 <printf+0x170>
 63c:	83 e8 63             	sub    $0x63,%eax
 63f:	83 f8 15             	cmp    $0x15,%eax
 642:	77 1c                	ja     660 <printf+0x90>
 644:	ff 24 85 0c 0a 00 00 	jmp    *0xa0c(,%eax,4)
 64b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 650:	8d 65 f4             	lea    -0xc(%ebp),%esp
 653:	5b                   	pop    %ebx
 654:	5e                   	pop    %esi
 655:	5f                   	pop    %edi
 656:	5d                   	pop    %ebp
 657:	c3                   	ret
 658:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 65f:	00 
  write(fd, &c, 1);
 660:	83 ec 04             	sub    $0x4,%esp
 663:	8d 55 e7             	lea    -0x19(%ebp),%edx
 666:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 66a:	6a 01                	push   $0x1
 66c:	52                   	push   %edx
 66d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 670:	57                   	push   %edi
 671:	e8 24 fe ff ff       	call   49a <write>
 676:	83 c4 0c             	add    $0xc,%esp
 679:	88 5d e7             	mov    %bl,-0x19(%ebp)
 67c:	6a 01                	push   $0x1
 67e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 681:	52                   	push   %edx
 682:	57                   	push   %edi
 683:	e8 12 fe ff ff       	call   49a <write>
        putc(fd, c);
 688:	83 c4 10             	add    $0x10,%esp
      state = 0;
 68b:	31 d2                	xor    %edx,%edx
 68d:	eb 8e                	jmp    61d <printf+0x4d>
 68f:	90                   	nop
        printint(fd, *ap, 16, 0);
 690:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 693:	83 ec 0c             	sub    $0xc,%esp
 696:	b9 10 00 00 00       	mov    $0x10,%ecx
 69b:	8b 13                	mov    (%ebx),%edx
 69d:	6a 00                	push   $0x0
 69f:	89 f8                	mov    %edi,%eax
        ap++;
 6a1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 6a4:	e8 87 fe ff ff       	call   530 <printint>
        ap++;
 6a9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6ac:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6af:	31 d2                	xor    %edx,%edx
 6b1:	e9 67 ff ff ff       	jmp    61d <printf+0x4d>
        s = (char*)*ap;
 6b6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6b9:	8b 18                	mov    (%eax),%ebx
        ap++;
 6bb:	83 c0 04             	add    $0x4,%eax
 6be:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6c1:	85 db                	test   %ebx,%ebx
 6c3:	0f 84 87 00 00 00    	je     750 <printf+0x180>
        while(*s != 0){
 6c9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 6cc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 6ce:	84 c0                	test   %al,%al
 6d0:	0f 84 47 ff ff ff    	je     61d <printf+0x4d>
 6d6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6d9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6dc:	89 de                	mov    %ebx,%esi
 6de:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 6e0:	83 ec 04             	sub    $0x4,%esp
 6e3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 6e6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6e9:	6a 01                	push   $0x1
 6eb:	53                   	push   %ebx
 6ec:	57                   	push   %edi
 6ed:	e8 a8 fd ff ff       	call   49a <write>
        while(*s != 0){
 6f2:	0f b6 06             	movzbl (%esi),%eax
 6f5:	83 c4 10             	add    $0x10,%esp
 6f8:	84 c0                	test   %al,%al
 6fa:	75 e4                	jne    6e0 <printf+0x110>
      state = 0;
 6fc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 6ff:	31 d2                	xor    %edx,%edx
 701:	e9 17 ff ff ff       	jmp    61d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 706:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 709:	83 ec 0c             	sub    $0xc,%esp
 70c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 711:	8b 13                	mov    (%ebx),%edx
 713:	6a 01                	push   $0x1
 715:	eb 88                	jmp    69f <printf+0xcf>
        putc(fd, *ap);
 717:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 71a:	83 ec 04             	sub    $0x4,%esp
 71d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 720:	8b 03                	mov    (%ebx),%eax
        ap++;
 722:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 725:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 728:	6a 01                	push   $0x1
 72a:	52                   	push   %edx
 72b:	57                   	push   %edi
 72c:	e8 69 fd ff ff       	call   49a <write>
        ap++;
 731:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 734:	83 c4 10             	add    $0x10,%esp
      state = 0;
 737:	31 d2                	xor    %edx,%edx
 739:	e9 df fe ff ff       	jmp    61d <printf+0x4d>
 73e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 740:	83 ec 04             	sub    $0x4,%esp
 743:	88 5d e7             	mov    %bl,-0x19(%ebp)
 746:	8d 55 e7             	lea    -0x19(%ebp),%edx
 749:	6a 01                	push   $0x1
 74b:	e9 31 ff ff ff       	jmp    681 <printf+0xb1>
 750:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 755:	bb 11 09 00 00       	mov    $0x911,%ebx
 75a:	e9 77 ff ff ff       	jmp    6d6 <printf+0x106>
 75f:	90                   	nop

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 d8 0d 00 00       	mov    0xdd8,%eax
{
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 76e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 778:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 77a:	39 c8                	cmp    %ecx,%eax
 77c:	73 32                	jae    7b0 <free+0x50>
 77e:	39 d1                	cmp    %edx,%ecx
 780:	72 04                	jb     786 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 782:	39 d0                	cmp    %edx,%eax
 784:	72 32                	jb     7b8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 786:	8b 73 fc             	mov    -0x4(%ebx),%esi
 789:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78c:	39 fa                	cmp    %edi,%edx
 78e:	74 30                	je     7c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 790:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 793:	8b 50 04             	mov    0x4(%eax),%edx
 796:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 799:	39 f1                	cmp    %esi,%ecx
 79b:	74 3a                	je     7d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 79d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 79f:	5b                   	pop    %ebx
  freep = p;
 7a0:	a3 d8 0d 00 00       	mov    %eax,0xdd8
}
 7a5:	5e                   	pop    %esi
 7a6:	5f                   	pop    %edi
 7a7:	5d                   	pop    %ebp
 7a8:	c3                   	ret
 7a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b0:	39 d0                	cmp    %edx,%eax
 7b2:	72 04                	jb     7b8 <free+0x58>
 7b4:	39 d1                	cmp    %edx,%ecx
 7b6:	72 ce                	jb     786 <free+0x26>
{
 7b8:	89 d0                	mov    %edx,%eax
 7ba:	eb bc                	jmp    778 <free+0x18>
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7c0:	03 72 04             	add    0x4(%edx),%esi
 7c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c6:	8b 10                	mov    (%eax),%edx
 7c8:	8b 12                	mov    (%edx),%edx
 7ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7cd:	8b 50 04             	mov    0x4(%eax),%edx
 7d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d3:	39 f1                	cmp    %esi,%ecx
 7d5:	75 c6                	jne    79d <free+0x3d>
    p->s.size += bp->s.size;
 7d7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7da:	a3 d8 0d 00 00       	mov    %eax,0xdd8
    p->s.size += bp->s.size;
 7df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7e5:	89 08                	mov    %ecx,(%eax)
}
 7e7:	5b                   	pop    %ebx
 7e8:	5e                   	pop    %esi
 7e9:	5f                   	pop    %edi
 7ea:	5d                   	pop    %ebp
 7eb:	c3                   	ret
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7fc:	8b 15 d8 0d 00 00    	mov    0xdd8,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 802:	8d 78 07             	lea    0x7(%eax),%edi
 805:	c1 ef 03             	shr    $0x3,%edi
 808:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 80b:	85 d2                	test   %edx,%edx
 80d:	0f 84 8d 00 00 00    	je     8a0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 813:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 815:	8b 48 04             	mov    0x4(%eax),%ecx
 818:	39 f9                	cmp    %edi,%ecx
 81a:	73 64                	jae    880 <malloc+0x90>
  if(nu < 4096)
 81c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 821:	39 df                	cmp    %ebx,%edi
 823:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 826:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 82d:	eb 0a                	jmp    839 <malloc+0x49>
 82f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 830:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 832:	8b 48 04             	mov    0x4(%eax),%ecx
 835:	39 f9                	cmp    %edi,%ecx
 837:	73 47                	jae    880 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 839:	89 c2                	mov    %eax,%edx
 83b:	3b 05 d8 0d 00 00    	cmp    0xdd8,%eax
 841:	75 ed                	jne    830 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 843:	83 ec 0c             	sub    $0xc,%esp
 846:	56                   	push   %esi
 847:	e8 b6 fc ff ff       	call   502 <sbrk>
  if(p == (char*)-1)
 84c:	83 c4 10             	add    $0x10,%esp
 84f:	83 f8 ff             	cmp    $0xffffffff,%eax
 852:	74 1c                	je     870 <malloc+0x80>
  hp->s.size = nu;
 854:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 857:	83 ec 0c             	sub    $0xc,%esp
 85a:	83 c0 08             	add    $0x8,%eax
 85d:	50                   	push   %eax
 85e:	e8 fd fe ff ff       	call   760 <free>
  return freep;
 863:	8b 15 d8 0d 00 00    	mov    0xdd8,%edx
      if((p = morecore(nunits)) == 0)
 869:	83 c4 10             	add    $0x10,%esp
 86c:	85 d2                	test   %edx,%edx
 86e:	75 c0                	jne    830 <malloc+0x40>
        return 0;
  }
}
 870:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 873:	31 c0                	xor    %eax,%eax
}
 875:	5b                   	pop    %ebx
 876:	5e                   	pop    %esi
 877:	5f                   	pop    %edi
 878:	5d                   	pop    %ebp
 879:	c3                   	ret
 87a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 880:	39 cf                	cmp    %ecx,%edi
 882:	74 4c                	je     8d0 <malloc+0xe0>
        p->s.size -= nunits;
 884:	29 f9                	sub    %edi,%ecx
 886:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 889:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 88c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 88f:	89 15 d8 0d 00 00    	mov    %edx,0xdd8
}
 895:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 898:	83 c0 08             	add    $0x8,%eax
}
 89b:	5b                   	pop    %ebx
 89c:	5e                   	pop    %esi
 89d:	5f                   	pop    %edi
 89e:	5d                   	pop    %ebp
 89f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 8a0:	c7 05 d8 0d 00 00 dc 	movl   $0xddc,0xdd8
 8a7:	0d 00 00 
    base.s.size = 0;
 8aa:	b8 dc 0d 00 00       	mov    $0xddc,%eax
    base.s.ptr = freep = prevp = &base;
 8af:	c7 05 dc 0d 00 00 dc 	movl   $0xddc,0xddc
 8b6:	0d 00 00 
    base.s.size = 0;
 8b9:	c7 05 e0 0d 00 00 00 	movl   $0x0,0xde0
 8c0:	00 00 00 
    if(p->s.size >= nunits){
 8c3:	e9 54 ff ff ff       	jmp    81c <malloc+0x2c>
 8c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8cf:	00 
        prevp->s.ptr = p->s.ptr;
 8d0:	8b 08                	mov    (%eax),%ecx
 8d2:	89 0a                	mov    %ecx,(%edx)
 8d4:	eb b9                	jmp    88f <malloc+0x9f>
