
_tthread:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    printf(1, "child: a=%d b=%d before=%d\n", a, b, global);
    global = a + b;
    exit();
}

int main(void) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
    int a = 7, b = 5;
    int pid, joined;

    pid = thread_create(worker, &a, &b);
   f:	8d 45 f4             	lea    -0xc(%ebp),%eax
int main(void) {
  12:	83 ec 14             	sub    $0x14,%esp
    int a = 7, b = 5;
  15:	c7 45 f0 07 00 00 00 	movl   $0x7,-0x10(%ebp)
    pid = thread_create(worker, &a, &b);
  1c:	50                   	push   %eax
  1d:	8d 45 f0             	lea    -0x10(%ebp),%eax
  20:	50                   	push   %eax
  21:	68 80 00 00 00       	push   $0x80
    int a = 7, b = 5;
  26:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
    pid = thread_create(worker, &a, &b);
  2d:	e8 ce 02 00 00       	call   300 <thread_create>
    if (pid < 0) {
  32:	83 c4 10             	add    $0x10,%esp
  35:	85 c0                	test   %eax,%eax
  37:	78 27                	js     60 <main+0x60>
  39:	89 c3                	mov    %eax,%ebx
        printf(1, "thread_create failed\n");
        exit();
    }

    joined = thread_join();
  3b:	e8 20 03 00 00       	call   360 <thread_join>
    printf(1, "parent: pid=%d joined=%d global=%d\n", pid, joined, global);
  40:	8b 15 80 0c 00 00    	mov    0xc80,%edx
  46:	83 ec 0c             	sub    $0xc,%esp
  49:	52                   	push   %edx
  4a:	50                   	push   %eax
  4b:	53                   	push   %ebx
  4c:	68 94 08 00 00       	push   $0x894
  51:	6a 01                	push   $0x1
  53:	e8 f8 04 00 00       	call   550 <printf>
    exit();
  58:	83 c4 20             	add    $0x20,%esp
  5b:	e8 9a 03 00 00       	call   3fa <exit>
        printf(1, "thread_create failed\n");
  60:	50                   	push   %eax
  61:	50                   	push   %eax
  62:	68 74 08 00 00       	push   $0x874
  67:	6a 01                	push   $0x1
  69:	e8 e2 04 00 00       	call   550 <printf>
        exit();
  6e:	e8 87 03 00 00       	call   3fa <exit>
  73:	66 90                	xchg   %ax,%ax
  75:	66 90                	xchg   %ax,%ax
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <worker>:
void worker(void *arg1, void *arg2) {
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	56                   	push   %esi
    int a = *(int *)arg1;
  84:	8b 45 08             	mov    0x8(%ebp),%eax
void worker(void *arg1, void *arg2) {
  87:	53                   	push   %ebx
    int a = *(int *)arg1;
  88:	8b 18                	mov    (%eax),%ebx
    int b = *(int *)arg2;
  8a:	8b 45 0c             	mov    0xc(%ebp),%eax
    printf(1, "child: a=%d b=%d before=%d\n", a, b, global);
  8d:	83 ec 0c             	sub    $0xc,%esp
    int b = *(int *)arg2;
  90:	8b 30                	mov    (%eax),%esi
    printf(1, "child: a=%d b=%d before=%d\n", a, b, global);
  92:	a1 80 0c 00 00       	mov    0xc80,%eax
  97:	50                   	push   %eax
  98:	56                   	push   %esi
  99:	53                   	push   %ebx
    global = a + b;
  9a:	01 f3                	add    %esi,%ebx
    printf(1, "child: a=%d b=%d before=%d\n", a, b, global);
  9c:	68 58 08 00 00       	push   $0x858
  a1:	6a 01                	push   $0x1
  a3:	e8 a8 04 00 00       	call   550 <printf>
    exit();
  a8:	83 c4 20             	add    $0x20,%esp
    global = a + b;
  ab:	89 1d 80 0c 00 00    	mov    %ebx,0xc80
    exit();
  b1:	e8 44 03 00 00       	call   3fa <exit>
  b6:	66 90                	xchg   %ax,%ax
  b8:	66 90                	xchg   %ax,%ax
  ba:	66 90                	xchg   %ax,%ax
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
  c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c1:	31 c0                	xor    %eax,%eax
{
  c3:	89 e5                	mov    %esp,%ebp
  c5:	53                   	push   %ebx
  c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  d7:	83 c0 01             	add    $0x1,%eax
  da:	84 d2                	test   %dl,%dl
  dc:	75 f2                	jne    d0 <strcpy+0x10>
    ;
  return os;
}
  de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  e1:	89 c8                	mov    %ecx,%eax
  e3:	c9                   	leave
  e4:	c3                   	ret
  e5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  ec:	00 
  ed:	8d 76 00             	lea    0x0(%esi),%esi

000000f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	53                   	push   %ebx
  f4:	8b 55 08             	mov    0x8(%ebp),%edx
  f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  fa:	0f b6 02             	movzbl (%edx),%eax
  fd:	84 c0                	test   %al,%al
  ff:	75 17                	jne    118 <strcmp+0x28>
 101:	eb 3a                	jmp    13d <strcmp+0x4d>
 103:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 108:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 10c:	83 c2 01             	add    $0x1,%edx
 10f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 112:	84 c0                	test   %al,%al
 114:	74 1a                	je     130 <strcmp+0x40>
 116:	89 d9                	mov    %ebx,%ecx
 118:	0f b6 19             	movzbl (%ecx),%ebx
 11b:	38 c3                	cmp    %al,%bl
 11d:	74 e9                	je     108 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 11f:	29 d8                	sub    %ebx,%eax
}
 121:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 124:	c9                   	leave
 125:	c3                   	ret
 126:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 12d:	00 
 12e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 130:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 134:	31 c0                	xor    %eax,%eax
 136:	29 d8                	sub    %ebx,%eax
}
 138:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13b:	c9                   	leave
 13c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 13d:	0f b6 19             	movzbl (%ecx),%ebx
 140:	31 c0                	xor    %eax,%eax
 142:	eb db                	jmp    11f <strcmp+0x2f>
 144:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 14b:	00 
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <strlen>:

uint
strlen(const char *s)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 156:	80 3a 00             	cmpb   $0x0,(%edx)
 159:	74 15                	je     170 <strlen+0x20>
 15b:	31 c0                	xor    %eax,%eax
 15d:	8d 76 00             	lea    0x0(%esi),%esi
 160:	83 c0 01             	add    $0x1,%eax
 163:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 167:	89 c1                	mov    %eax,%ecx
 169:	75 f5                	jne    160 <strlen+0x10>
    ;
  return n;
}
 16b:	89 c8                	mov    %ecx,%eax
 16d:	5d                   	pop    %ebp
 16e:	c3                   	ret
 16f:	90                   	nop
  for(n = 0; s[n]; n++)
 170:	31 c9                	xor    %ecx,%ecx
}
 172:	5d                   	pop    %ebp
 173:	89 c8                	mov    %ecx,%eax
 175:	c3                   	ret
 176:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17d:	00 
 17e:	66 90                	xchg   %ax,%ax

00000180 <memset>:

void*
memset(void *dst, int c, uint n)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 187:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18a:	8b 45 0c             	mov    0xc(%ebp),%eax
 18d:	89 d7                	mov    %edx,%edi
 18f:	fc                   	cld
 190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 192:	8b 7d fc             	mov    -0x4(%ebp),%edi
 195:	89 d0                	mov    %edx,%eax
 197:	c9                   	leave
 198:	c3                   	ret
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <strchr>:

char*
strchr(const char *s, char c)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	84 d2                	test   %dl,%dl
 1af:	75 12                	jne    1c3 <strchr+0x23>
 1b1:	eb 1d                	jmp    1d0 <strchr+0x30>
 1b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 1b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1bc:	83 c0 01             	add    $0x1,%eax
 1bf:	84 d2                	test   %dl,%dl
 1c1:	74 0d                	je     1d0 <strchr+0x30>
    if(*s == c)
 1c3:	38 d1                	cmp    %dl,%cl
 1c5:	75 f1                	jne    1b8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1c7:	5d                   	pop    %ebp
 1c8:	c3                   	ret
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1d0:	31 c0                	xor    %eax,%eax
}
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret
 1d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1db:	00 
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001e0 <gets>:

char*
gets(char *buf, int max)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1e5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 1e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1e9:	31 db                	xor    %ebx,%ebx
{
 1eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1ee:	eb 27                	jmp    217 <gets+0x37>
    cc = read(0, &c, 1);
 1f0:	83 ec 04             	sub    $0x4,%esp
 1f3:	6a 01                	push   $0x1
 1f5:	56                   	push   %esi
 1f6:	6a 00                	push   $0x0
 1f8:	e8 15 02 00 00       	call   412 <read>
    if(cc < 1)
 1fd:	83 c4 10             	add    $0x10,%esp
 200:	85 c0                	test   %eax,%eax
 202:	7e 1d                	jle    221 <gets+0x41>
      break;
    buf[i++] = c;
 204:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 208:	8b 55 08             	mov    0x8(%ebp),%edx
 20b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 20f:	3c 0a                	cmp    $0xa,%al
 211:	74 10                	je     223 <gets+0x43>
 213:	3c 0d                	cmp    $0xd,%al
 215:	74 0c                	je     223 <gets+0x43>
  for(i=0; i+1 < max; ){
 217:	89 df                	mov    %ebx,%edi
 219:	83 c3 01             	add    $0x1,%ebx
 21c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 21f:	7c cf                	jl     1f0 <gets+0x10>
 221:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 22a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22d:	5b                   	pop    %ebx
 22e:	5e                   	pop    %esi
 22f:	5f                   	pop    %edi
 230:	5d                   	pop    %ebp
 231:	c3                   	ret
 232:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 239:	00 
 23a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000240 <stat>:

int
stat(const char *n, struct stat *st)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	56                   	push   %esi
 244:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 245:	83 ec 08             	sub    $0x8,%esp
 248:	6a 00                	push   $0x0
 24a:	ff 75 08             	push   0x8(%ebp)
 24d:	e8 e8 01 00 00       	call   43a <open>
  if(fd < 0)
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	78 27                	js     280 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 259:	83 ec 08             	sub    $0x8,%esp
 25c:	ff 75 0c             	push   0xc(%ebp)
 25f:	89 c3                	mov    %eax,%ebx
 261:	50                   	push   %eax
 262:	e8 eb 01 00 00       	call   452 <fstat>
  close(fd);
 267:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 26a:	89 c6                	mov    %eax,%esi
  close(fd);
 26c:	e8 b1 01 00 00       	call   422 <close>
  return r;
 271:	83 c4 10             	add    $0x10,%esp
}
 274:	8d 65 f8             	lea    -0x8(%ebp),%esp
 277:	89 f0                	mov    %esi,%eax
 279:	5b                   	pop    %ebx
 27a:	5e                   	pop    %esi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret
 27d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 280:	be ff ff ff ff       	mov    $0xffffffff,%esi
 285:	eb ed                	jmp    274 <stat+0x34>
 287:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 28e:	00 
 28f:	90                   	nop

00000290 <atoi>:

int
atoi(const char *s)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 297:	0f be 02             	movsbl (%edx),%eax
 29a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 29d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2a0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2a5:	77 1e                	ja     2c5 <atoi+0x35>
 2a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ae:	00 
 2af:	90                   	nop
    n = n*10 + *s++ - '0';
 2b0:	83 c2 01             	add    $0x1,%edx
 2b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ba:	0f be 02             	movsbl (%edx),%eax
 2bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2c0:	80 fb 09             	cmp    $0x9,%bl
 2c3:	76 eb                	jbe    2b0 <atoi+0x20>
  return n;
}
 2c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c8:	89 c8                	mov    %ecx,%eax
 2ca:	c9                   	leave
 2cb:	c3                   	ret
 2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	8b 45 10             	mov    0x10(%ebp),%eax
 2d7:	8b 55 08             	mov    0x8(%ebp),%edx
 2da:	56                   	push   %esi
 2db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2de:	85 c0                	test   %eax,%eax
 2e0:	7e 13                	jle    2f5 <memmove+0x25>
 2e2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2e4:	89 d7                	mov    %edx,%edi
 2e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ed:	00 
 2ee:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 2f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2f1:	39 f8                	cmp    %edi,%eax
 2f3:	75 fb                	jne    2f0 <memmove+0x20>
  return vdst;
}
 2f5:	5e                   	pop    %esi
 2f6:	89 d0                	mov    %edx,%eax
 2f8:	5f                   	pop    %edi
 2f9:	5d                   	pop    %ebp
 2fa:	c3                   	ret
 2fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000300 <thread_create>:

int
thread_create(void(*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	53                   	push   %ebx
 304:	83 ec 10             	sub    $0x10,%esp
  int pid;
  void *raw;
  void *stack;

  raw = malloc(PGSIZE * 2);
 307:	68 00 20 00 00       	push   $0x2000
 30c:	e8 5f 04 00 00       	call   770 <malloc>
  if (raw == 0) {
 311:	83 c4 10             	add    $0x10,%esp
 314:	85 c0                	test   %eax,%eax
 316:	74 37                	je     34f <thread_create+0x4f>
 318:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  stack = (void *)(((uint)raw + sizeof(void *) + PGSIZE - 1) & ~(PGSIZE - 1));
 31a:	8d 80 03 10 00 00    	lea    0x1003(%eax),%eax
 320:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  ((void **)stack)[-1] = raw;
 325:	89 58 fc             	mov    %ebx,-0x4(%eax)

  pid = clone(start_routine, arg1, arg2, stack);
 328:	50                   	push   %eax
 329:	ff 75 10             	push   0x10(%ebp)
 32c:	ff 75 0c             	push   0xc(%ebp)
 32f:	ff 75 08             	push   0x8(%ebp)
 332:	e8 63 01 00 00       	call   49a <clone>
  if (pid < 0) {
 337:	83 c4 10             	add    $0x10,%esp
 33a:	85 c0                	test   %eax,%eax
 33c:	78 05                	js     343 <thread_create+0x43>
    free(raw);
    return -1;
  }
  return pid;
}
 33e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 341:	c9                   	leave
 342:	c3                   	ret
    free(raw);
 343:	83 ec 0c             	sub    $0xc,%esp
 346:	53                   	push   %ebx
 347:	e8 94 03 00 00       	call   6e0 <free>
    return -1;
 34c:	83 c4 10             	add    $0x10,%esp
    return -1;
 34f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 354:	eb e8                	jmp    33e <thread_create+0x3e>
 356:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 35d:	00 
 35e:	66 90                	xchg   %ax,%ax

00000360 <thread_join>:

int
thread_join(void) 
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
  int pid;
  void *raw;
  void *stack;

  pid = join(&stack);
 364:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 367:	83 ec 20             	sub    $0x20,%esp
  pid = join(&stack);
 36a:	50                   	push   %eax
 36b:	e8 32 01 00 00       	call   4a2 <join>
  if (pid < 0) {
 370:	83 c4 10             	add    $0x10,%esp
 373:	85 c0                	test   %eax,%eax
 375:	78 21                	js     398 <thread_join+0x38>
 377:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  raw = ((void **)stack)[-1];
 379:	8b 45 f4             	mov    -0xc(%ebp),%eax
  free(raw);
 37c:	83 ec 0c             	sub    $0xc,%esp
 37f:	ff 70 fc             	push   -0x4(%eax)
 382:	e8 59 03 00 00       	call   6e0 <free>
  return pid;
 387:	83 c4 10             	add    $0x10,%esp
}
 38a:	89 d8                	mov    %ebx,%eax
 38c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 38f:	c9                   	leave
 390:	c3                   	ret
 391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 398:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 39d:	eb eb                	jmp    38a <thread_join+0x2a>
 39f:	90                   	nop

000003a0 <lock_init>:
  return value;
}

void 
lock_init(lock_t *lock)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 3a6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 3ac:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 3b3:	5d                   	pop    %ebp
 3b4:	c3                   	ret
 3b5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3bc:	00 
 3bd:	8d 76 00             	lea    0x0(%esi),%esi

000003c0 <lock_acquire>:

void
lock_acquire(lock_t *lock)
{
 3c0:	55                   	push   %ebp
  asm volatile (
 3c1:	ba 01 00 00 00       	mov    $0x1,%edx
{
 3c6:	89 e5                	mov    %esp,%ebp
 3c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  asm volatile (
 3cb:	f0 0f c1 11          	lock xadd %edx,(%ecx)
  int myturn = fetch_and_add(&lock->ticket, 1);
  while (myturn != lock->turn);
 3cf:	90                   	nop
 3d0:	8b 41 04             	mov    0x4(%ecx),%eax
 3d3:	39 d0                	cmp    %edx,%eax
 3d5:	75 f9                	jne    3d0 <lock_acquire+0x10>
}
 3d7:	5d                   	pop    %ebp
 3d8:	c3                   	ret
 3d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003e0 <lock_release>:

void 
lock_release(lock_t *lock)
{
 3e0:	55                   	push   %ebp
  asm volatile (
 3e1:	b8 01 00 00 00       	mov    $0x1,%eax
{
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile (
 3eb:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  fetch_and_add(&lock->turn, 1);
 3f0:	5d                   	pop    %ebp
 3f1:	c3                   	ret

000003f2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3f2:	b8 01 00 00 00       	mov    $0x1,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret

000003fa <exit>:
SYSCALL(exit)
 3fa:	b8 02 00 00 00       	mov    $0x2,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret

00000402 <wait>:
SYSCALL(wait)
 402:	b8 03 00 00 00       	mov    $0x3,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret

0000040a <pipe>:
SYSCALL(pipe)
 40a:	b8 04 00 00 00       	mov    $0x4,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret

00000412 <read>:
SYSCALL(read)
 412:	b8 05 00 00 00       	mov    $0x5,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret

0000041a <write>:
SYSCALL(write)
 41a:	b8 10 00 00 00       	mov    $0x10,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret

00000422 <close>:
SYSCALL(close)
 422:	b8 15 00 00 00       	mov    $0x15,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret

0000042a <kill>:
SYSCALL(kill)
 42a:	b8 06 00 00 00       	mov    $0x6,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret

00000432 <exec>:
SYSCALL(exec)
 432:	b8 07 00 00 00       	mov    $0x7,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret

0000043a <open>:
SYSCALL(open)
 43a:	b8 0f 00 00 00       	mov    $0xf,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret

00000442 <mknod>:
SYSCALL(mknod)
 442:	b8 11 00 00 00       	mov    $0x11,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret

0000044a <unlink>:
SYSCALL(unlink)
 44a:	b8 12 00 00 00       	mov    $0x12,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret

00000452 <fstat>:
SYSCALL(fstat)
 452:	b8 08 00 00 00       	mov    $0x8,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret

0000045a <link>:
SYSCALL(link)
 45a:	b8 13 00 00 00       	mov    $0x13,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret

00000462 <mkdir>:
SYSCALL(mkdir)
 462:	b8 14 00 00 00       	mov    $0x14,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret

0000046a <chdir>:
SYSCALL(chdir)
 46a:	b8 09 00 00 00       	mov    $0x9,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret

00000472 <dup>:
SYSCALL(dup)
 472:	b8 0a 00 00 00       	mov    $0xa,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret

0000047a <getpid>:
SYSCALL(getpid)
 47a:	b8 0b 00 00 00       	mov    $0xb,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret

00000482 <sbrk>:
SYSCALL(sbrk)
 482:	b8 0c 00 00 00       	mov    $0xc,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret

0000048a <sleep>:
SYSCALL(sleep)
 48a:	b8 0d 00 00 00       	mov    $0xd,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret

00000492 <uptime>:
SYSCALL(uptime)
 492:	b8 0e 00 00 00       	mov    $0xe,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret

0000049a <clone>:
SYSCALL(clone)
 49a:	b8 16 00 00 00       	mov    $0x16,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret

000004a2 <join>:
SYSCALL(join)
 4a2:	b8 17 00 00 00       	mov    $0x17,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret
 4aa:	66 90                	xchg   %ax,%ax
 4ac:	66 90                	xchg   %ax,%ax
 4ae:	66 90                	xchg   %ax,%ax

000004b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4b8:	89 d1                	mov    %edx,%ecx
{
 4ba:	83 ec 3c             	sub    $0x3c,%esp
 4bd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 4c0:	85 d2                	test   %edx,%edx
 4c2:	0f 89 80 00 00 00    	jns    548 <printint+0x98>
 4c8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4cc:	74 7a                	je     548 <printint+0x98>
    x = -xx;
 4ce:	f7 d9                	neg    %ecx
    neg = 1;
 4d0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 4d5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 4d8:	31 f6                	xor    %esi,%esi
 4da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4e0:	89 c8                	mov    %ecx,%eax
 4e2:	31 d2                	xor    %edx,%edx
 4e4:	89 f7                	mov    %esi,%edi
 4e6:	f7 f3                	div    %ebx
 4e8:	8d 76 01             	lea    0x1(%esi),%esi
 4eb:	0f b6 92 10 09 00 00 	movzbl 0x910(%edx),%edx
 4f2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 4f6:	89 ca                	mov    %ecx,%edx
 4f8:	89 c1                	mov    %eax,%ecx
 4fa:	39 da                	cmp    %ebx,%edx
 4fc:	73 e2                	jae    4e0 <printint+0x30>
  if(neg)
 4fe:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 501:	85 c0                	test   %eax,%eax
 503:	74 07                	je     50c <printint+0x5c>
    buf[i++] = '-';
 505:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 50a:	89 f7                	mov    %esi,%edi
 50c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 50f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 512:	01 df                	add    %ebx,%edi
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 518:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 51b:	83 ec 04             	sub    $0x4,%esp
 51e:	88 45 d7             	mov    %al,-0x29(%ebp)
 521:	8d 45 d7             	lea    -0x29(%ebp),%eax
 524:	6a 01                	push   $0x1
 526:	50                   	push   %eax
 527:	56                   	push   %esi
 528:	e8 ed fe ff ff       	call   41a <write>
  while(--i >= 0)
 52d:	89 f8                	mov    %edi,%eax
 52f:	83 c4 10             	add    $0x10,%esp
 532:	83 ef 01             	sub    $0x1,%edi
 535:	39 c3                	cmp    %eax,%ebx
 537:	75 df                	jne    518 <printint+0x68>
}
 539:	8d 65 f4             	lea    -0xc(%ebp),%esp
 53c:	5b                   	pop    %ebx
 53d:	5e                   	pop    %esi
 53e:	5f                   	pop    %edi
 53f:	5d                   	pop    %ebp
 540:	c3                   	ret
 541:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 548:	31 c0                	xor    %eax,%eax
 54a:	eb 89                	jmp    4d5 <printint+0x25>
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000550 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 559:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 55c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 55f:	0f b6 1e             	movzbl (%esi),%ebx
 562:	83 c6 01             	add    $0x1,%esi
 565:	84 db                	test   %bl,%bl
 567:	74 67                	je     5d0 <printf+0x80>
 569:	8d 4d 10             	lea    0x10(%ebp),%ecx
 56c:	31 d2                	xor    %edx,%edx
 56e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 571:	eb 34                	jmp    5a7 <printf+0x57>
 573:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 578:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 57b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 580:	83 f8 25             	cmp    $0x25,%eax
 583:	74 18                	je     59d <printf+0x4d>
  write(fd, &c, 1);
 585:	83 ec 04             	sub    $0x4,%esp
 588:	8d 45 e7             	lea    -0x19(%ebp),%eax
 58b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 58e:	6a 01                	push   $0x1
 590:	50                   	push   %eax
 591:	57                   	push   %edi
 592:	e8 83 fe ff ff       	call   41a <write>
 597:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 59a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 59d:	0f b6 1e             	movzbl (%esi),%ebx
 5a0:	83 c6 01             	add    $0x1,%esi
 5a3:	84 db                	test   %bl,%bl
 5a5:	74 29                	je     5d0 <printf+0x80>
    c = fmt[i] & 0xff;
 5a7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5aa:	85 d2                	test   %edx,%edx
 5ac:	74 ca                	je     578 <printf+0x28>
      }
    } else if(state == '%'){
 5ae:	83 fa 25             	cmp    $0x25,%edx
 5b1:	75 ea                	jne    59d <printf+0x4d>
      if(c == 'd'){
 5b3:	83 f8 25             	cmp    $0x25,%eax
 5b6:	0f 84 04 01 00 00    	je     6c0 <printf+0x170>
 5bc:	83 e8 63             	sub    $0x63,%eax
 5bf:	83 f8 15             	cmp    $0x15,%eax
 5c2:	77 1c                	ja     5e0 <printf+0x90>
 5c4:	ff 24 85 b8 08 00 00 	jmp    *0x8b8(,%eax,4)
 5cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d3:	5b                   	pop    %ebx
 5d4:	5e                   	pop    %esi
 5d5:	5f                   	pop    %edi
 5d6:	5d                   	pop    %ebp
 5d7:	c3                   	ret
 5d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5df:	00 
  write(fd, &c, 1);
 5e0:	83 ec 04             	sub    $0x4,%esp
 5e3:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5e6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5ea:	6a 01                	push   $0x1
 5ec:	52                   	push   %edx
 5ed:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 5f0:	57                   	push   %edi
 5f1:	e8 24 fe ff ff       	call   41a <write>
 5f6:	83 c4 0c             	add    $0xc,%esp
 5f9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5fc:	6a 01                	push   $0x1
 5fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 601:	52                   	push   %edx
 602:	57                   	push   %edi
 603:	e8 12 fe ff ff       	call   41a <write>
        putc(fd, c);
 608:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60b:	31 d2                	xor    %edx,%edx
 60d:	eb 8e                	jmp    59d <printf+0x4d>
 60f:	90                   	nop
        printint(fd, *ap, 16, 0);
 610:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 613:	83 ec 0c             	sub    $0xc,%esp
 616:	b9 10 00 00 00       	mov    $0x10,%ecx
 61b:	8b 13                	mov    (%ebx),%edx
 61d:	6a 00                	push   $0x0
 61f:	89 f8                	mov    %edi,%eax
        ap++;
 621:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 624:	e8 87 fe ff ff       	call   4b0 <printint>
        ap++;
 629:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 62c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 62f:	31 d2                	xor    %edx,%edx
 631:	e9 67 ff ff ff       	jmp    59d <printf+0x4d>
        s = (char*)*ap;
 636:	8b 45 d0             	mov    -0x30(%ebp),%eax
 639:	8b 18                	mov    (%eax),%ebx
        ap++;
 63b:	83 c0 04             	add    $0x4,%eax
 63e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 641:	85 db                	test   %ebx,%ebx
 643:	0f 84 87 00 00 00    	je     6d0 <printf+0x180>
        while(*s != 0){
 649:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 64c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 64e:	84 c0                	test   %al,%al
 650:	0f 84 47 ff ff ff    	je     59d <printf+0x4d>
 656:	8d 55 e7             	lea    -0x19(%ebp),%edx
 659:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 65c:	89 de                	mov    %ebx,%esi
 65e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 660:	83 ec 04             	sub    $0x4,%esp
 663:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 666:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 669:	6a 01                	push   $0x1
 66b:	53                   	push   %ebx
 66c:	57                   	push   %edi
 66d:	e8 a8 fd ff ff       	call   41a <write>
        while(*s != 0){
 672:	0f b6 06             	movzbl (%esi),%eax
 675:	83 c4 10             	add    $0x10,%esp
 678:	84 c0                	test   %al,%al
 67a:	75 e4                	jne    660 <printf+0x110>
      state = 0;
 67c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 67f:	31 d2                	xor    %edx,%edx
 681:	e9 17 ff ff ff       	jmp    59d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 686:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 689:	83 ec 0c             	sub    $0xc,%esp
 68c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 691:	8b 13                	mov    (%ebx),%edx
 693:	6a 01                	push   $0x1
 695:	eb 88                	jmp    61f <printf+0xcf>
        putc(fd, *ap);
 697:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 69a:	83 ec 04             	sub    $0x4,%esp
 69d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 6a0:	8b 03                	mov    (%ebx),%eax
        ap++;
 6a2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 6a5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6a8:	6a 01                	push   $0x1
 6aa:	52                   	push   %edx
 6ab:	57                   	push   %edi
 6ac:	e8 69 fd ff ff       	call   41a <write>
        ap++;
 6b1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6b4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6b7:	31 d2                	xor    %edx,%edx
 6b9:	e9 df fe ff ff       	jmp    59d <printf+0x4d>
 6be:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 6c0:	83 ec 04             	sub    $0x4,%esp
 6c3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6c6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6c9:	6a 01                	push   $0x1
 6cb:	e9 31 ff ff ff       	jmp    601 <printf+0xb1>
 6d0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 6d5:	bb 8a 08 00 00       	mov    $0x88a,%ebx
 6da:	e9 77 ff ff ff       	jmp    656 <printf+0x106>
 6df:	90                   	nop

000006e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	a1 84 0c 00 00       	mov    0xc84,%eax
{
 6e6:	89 e5                	mov    %esp,%ebp
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	53                   	push   %ebx
 6eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6fa:	39 c8                	cmp    %ecx,%eax
 6fc:	73 32                	jae    730 <free+0x50>
 6fe:	39 d1                	cmp    %edx,%ecx
 700:	72 04                	jb     706 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 702:	39 d0                	cmp    %edx,%eax
 704:	72 32                	jb     738 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 706:	8b 73 fc             	mov    -0x4(%ebx),%esi
 709:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 70c:	39 fa                	cmp    %edi,%edx
 70e:	74 30                	je     740 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 710:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 713:	8b 50 04             	mov    0x4(%eax),%edx
 716:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 719:	39 f1                	cmp    %esi,%ecx
 71b:	74 3a                	je     757 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 71d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 71f:	5b                   	pop    %ebx
  freep = p;
 720:	a3 84 0c 00 00       	mov    %eax,0xc84
}
 725:	5e                   	pop    %esi
 726:	5f                   	pop    %edi
 727:	5d                   	pop    %ebp
 728:	c3                   	ret
 729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 730:	39 d0                	cmp    %edx,%eax
 732:	72 04                	jb     738 <free+0x58>
 734:	39 d1                	cmp    %edx,%ecx
 736:	72 ce                	jb     706 <free+0x26>
{
 738:	89 d0                	mov    %edx,%eax
 73a:	eb bc                	jmp    6f8 <free+0x18>
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 740:	03 72 04             	add    0x4(%edx),%esi
 743:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 746:	8b 10                	mov    (%eax),%edx
 748:	8b 12                	mov    (%edx),%edx
 74a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 74d:	8b 50 04             	mov    0x4(%eax),%edx
 750:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 753:	39 f1                	cmp    %esi,%ecx
 755:	75 c6                	jne    71d <free+0x3d>
    p->s.size += bp->s.size;
 757:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 75a:	a3 84 0c 00 00       	mov    %eax,0xc84
    p->s.size += bp->s.size;
 75f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 762:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 765:	89 08                	mov    %ecx,(%eax)
}
 767:	5b                   	pop    %ebx
 768:	5e                   	pop    %esi
 769:	5f                   	pop    %edi
 76a:	5d                   	pop    %ebp
 76b:	c3                   	ret
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000770 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 779:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 77c:	8b 15 84 0c 00 00    	mov    0xc84,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 782:	8d 78 07             	lea    0x7(%eax),%edi
 785:	c1 ef 03             	shr    $0x3,%edi
 788:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 78b:	85 d2                	test   %edx,%edx
 78d:	0f 84 8d 00 00 00    	je     820 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 793:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 795:	8b 48 04             	mov    0x4(%eax),%ecx
 798:	39 f9                	cmp    %edi,%ecx
 79a:	73 64                	jae    800 <malloc+0x90>
  if(nu < 4096)
 79c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7a1:	39 df                	cmp    %ebx,%edi
 7a3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7a6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7ad:	eb 0a                	jmp    7b9 <malloc+0x49>
 7af:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7b2:	8b 48 04             	mov    0x4(%eax),%ecx
 7b5:	39 f9                	cmp    %edi,%ecx
 7b7:	73 47                	jae    800 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7b9:	89 c2                	mov    %eax,%edx
 7bb:	3b 05 84 0c 00 00    	cmp    0xc84,%eax
 7c1:	75 ed                	jne    7b0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 7c3:	83 ec 0c             	sub    $0xc,%esp
 7c6:	56                   	push   %esi
 7c7:	e8 b6 fc ff ff       	call   482 <sbrk>
  if(p == (char*)-1)
 7cc:	83 c4 10             	add    $0x10,%esp
 7cf:	83 f8 ff             	cmp    $0xffffffff,%eax
 7d2:	74 1c                	je     7f0 <malloc+0x80>
  hp->s.size = nu;
 7d4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7d7:	83 ec 0c             	sub    $0xc,%esp
 7da:	83 c0 08             	add    $0x8,%eax
 7dd:	50                   	push   %eax
 7de:	e8 fd fe ff ff       	call   6e0 <free>
  return freep;
 7e3:	8b 15 84 0c 00 00    	mov    0xc84,%edx
      if((p = morecore(nunits)) == 0)
 7e9:	83 c4 10             	add    $0x10,%esp
 7ec:	85 d2                	test   %edx,%edx
 7ee:	75 c0                	jne    7b0 <malloc+0x40>
        return 0;
  }
}
 7f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7f3:	31 c0                	xor    %eax,%eax
}
 7f5:	5b                   	pop    %ebx
 7f6:	5e                   	pop    %esi
 7f7:	5f                   	pop    %edi
 7f8:	5d                   	pop    %ebp
 7f9:	c3                   	ret
 7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 800:	39 cf                	cmp    %ecx,%edi
 802:	74 4c                	je     850 <malloc+0xe0>
        p->s.size -= nunits;
 804:	29 f9                	sub    %edi,%ecx
 806:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 809:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 80c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 80f:	89 15 84 0c 00 00    	mov    %edx,0xc84
}
 815:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 818:	83 c0 08             	add    $0x8,%eax
}
 81b:	5b                   	pop    %ebx
 81c:	5e                   	pop    %esi
 81d:	5f                   	pop    %edi
 81e:	5d                   	pop    %ebp
 81f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 820:	c7 05 84 0c 00 00 88 	movl   $0xc88,0xc84
 827:	0c 00 00 
    base.s.size = 0;
 82a:	b8 88 0c 00 00       	mov    $0xc88,%eax
    base.s.ptr = freep = prevp = &base;
 82f:	c7 05 88 0c 00 00 88 	movl   $0xc88,0xc88
 836:	0c 00 00 
    base.s.size = 0;
 839:	c7 05 8c 0c 00 00 00 	movl   $0x0,0xc8c
 840:	00 00 00 
    if(p->s.size >= nunits){
 843:	e9 54 ff ff ff       	jmp    79c <malloc+0x2c>
 848:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 84f:	00 
        prevp->s.ptr = p->s.ptr;
 850:	8b 08                	mov    (%eax),%ecx
 852:	89 0a                	mov    %ecx,(%edx)
 854:	eb b9                	jmp    80f <malloc+0x9f>
