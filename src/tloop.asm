
_tloop:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
void job(void *arg1, void *arg2) {
  done++;
  exit();
}

int main(void) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
  int i, pid;

  for(i = 0; i < 20; i++){
   e:	31 db                	xor    %ebx,%ebx
int main(void) {
  10:	51                   	push   %ecx
  11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    pid = thread_create(job, 0, 0);
  18:	83 ec 04             	sub    $0x4,%esp
  1b:	6a 00                	push   $0x0
  1d:	6a 00                	push   $0x0
  1f:	68 80 00 00 00       	push   $0x80
  24:	e8 b7 02 00 00       	call   2e0 <thread_create>
    if(pid < 0){
  29:	83 c4 10             	add    $0x10,%esp
  2c:	85 c0                	test   %eax,%eax
  2e:	78 29                	js     59 <main+0x59>
      printf(1, "create failed at round %d\n", i);
      exit();
    }
    if(thread_join() < 0){
  30:	e8 0b 03 00 00       	call   340 <thread_join>
  35:	85 c0                	test   %eax,%eax
  37:	78 33                	js     6c <main+0x6c>
  for(i = 0; i < 20; i++){
  39:	83 c3 01             	add    $0x1,%ebx
  3c:	83 fb 14             	cmp    $0x14,%ebx
  3f:	75 d7                	jne    18 <main+0x18>
      printf(1, "join failed at round %d\n", i);
      exit();
    }
  }

  printf(1, "done=%d\n", done);
  41:	a1 40 0c 00 00       	mov    0xc40,%eax
  46:	52                   	push   %edx
  47:	50                   	push   %eax
  48:	68 6c 08 00 00       	push   $0x86c
  4d:	6a 01                	push   $0x1
  4f:	e8 dc 04 00 00       	call   530 <printf>
  exit();
  54:	e8 81 03 00 00       	call   3da <exit>
      printf(1, "create failed at round %d\n", i);
  59:	50                   	push   %eax
  5a:	53                   	push   %ebx
  5b:	68 38 08 00 00       	push   $0x838
  60:	6a 01                	push   $0x1
  62:	e8 c9 04 00 00       	call   530 <printf>
      exit();
  67:	e8 6e 03 00 00       	call   3da <exit>
      printf(1, "join failed at round %d\n", i);
  6c:	51                   	push   %ecx
  6d:	53                   	push   %ebx
  6e:	68 53 08 00 00       	push   $0x853
  73:	6a 01                	push   $0x1
  75:	e8 b6 04 00 00       	call   530 <printf>
      exit();
  7a:	e8 5b 03 00 00       	call   3da <exit>
  7f:	90                   	nop

00000080 <job>:
void job(void *arg1, void *arg2) {
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	83 ec 08             	sub    $0x8,%esp
  done++;
  86:	a1 40 0c 00 00       	mov    0xc40,%eax
  8b:	83 c0 01             	add    $0x1,%eax
  8e:	a3 40 0c 00 00       	mov    %eax,0xc40
  exit();
  93:	e8 42 03 00 00       	call   3da <exit>
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
  a0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  a1:	31 c0                	xor    %eax,%eax
{
  a3:	89 e5                	mov    %esp,%ebp
  a5:	53                   	push   %ebx
  a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  b7:	83 c0 01             	add    $0x1,%eax
  ba:	84 d2                	test   %dl,%dl
  bc:	75 f2                	jne    b0 <strcpy+0x10>
    ;
  return os;
}
  be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c1:	89 c8                	mov    %ecx,%eax
  c3:	c9                   	leave
  c4:	c3                   	ret
  c5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  cc:	00 
  cd:	8d 76 00             	lea    0x0(%esi),%esi

000000d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	53                   	push   %ebx
  d4:	8b 55 08             	mov    0x8(%ebp),%edx
  d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  da:	0f b6 02             	movzbl (%edx),%eax
  dd:	84 c0                	test   %al,%al
  df:	75 17                	jne    f8 <strcmp+0x28>
  e1:	eb 3a                	jmp    11d <strcmp+0x4d>
  e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  e8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  ec:	83 c2 01             	add    $0x1,%edx
  ef:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  f2:	84 c0                	test   %al,%al
  f4:	74 1a                	je     110 <strcmp+0x40>
  f6:	89 d9                	mov    %ebx,%ecx
  f8:	0f b6 19             	movzbl (%ecx),%ebx
  fb:	38 c3                	cmp    %al,%bl
  fd:	74 e9                	je     e8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  ff:	29 d8                	sub    %ebx,%eax
}
 101:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 104:	c9                   	leave
 105:	c3                   	ret
 106:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 10d:	00 
 10e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 110:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 114:	31 c0                	xor    %eax,%eax
 116:	29 d8                	sub    %ebx,%eax
}
 118:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 11b:	c9                   	leave
 11c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 11d:	0f b6 19             	movzbl (%ecx),%ebx
 120:	31 c0                	xor    %eax,%eax
 122:	eb db                	jmp    ff <strcmp+0x2f>
 124:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 12b:	00 
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000130 <strlen>:

uint
strlen(const char *s)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 136:	80 3a 00             	cmpb   $0x0,(%edx)
 139:	74 15                	je     150 <strlen+0x20>
 13b:	31 c0                	xor    %eax,%eax
 13d:	8d 76 00             	lea    0x0(%esi),%esi
 140:	83 c0 01             	add    $0x1,%eax
 143:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 147:	89 c1                	mov    %eax,%ecx
 149:	75 f5                	jne    140 <strlen+0x10>
    ;
  return n;
}
 14b:	89 c8                	mov    %ecx,%eax
 14d:	5d                   	pop    %ebp
 14e:	c3                   	ret
 14f:	90                   	nop
  for(n = 0; s[n]; n++)
 150:	31 c9                	xor    %ecx,%ecx
}
 152:	5d                   	pop    %ebp
 153:	89 c8                	mov    %ecx,%eax
 155:	c3                   	ret
 156:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 15d:	00 
 15e:	66 90                	xchg   %ax,%ax

00000160 <memset>:

void*
memset(void *dst, int c, uint n)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	57                   	push   %edi
 164:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 167:	8b 4d 10             	mov    0x10(%ebp),%ecx
 16a:	8b 45 0c             	mov    0xc(%ebp),%eax
 16d:	89 d7                	mov    %edx,%edi
 16f:	fc                   	cld
 170:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 172:	8b 7d fc             	mov    -0x4(%ebp),%edi
 175:	89 d0                	mov    %edx,%eax
 177:	c9                   	leave
 178:	c3                   	ret
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000180 <strchr>:

char*
strchr(const char *s, char c)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 45 08             	mov    0x8(%ebp),%eax
 186:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 18a:	0f b6 10             	movzbl (%eax),%edx
 18d:	84 d2                	test   %dl,%dl
 18f:	75 12                	jne    1a3 <strchr+0x23>
 191:	eb 1d                	jmp    1b0 <strchr+0x30>
 193:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 198:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 19c:	83 c0 01             	add    $0x1,%eax
 19f:	84 d2                	test   %dl,%dl
 1a1:	74 0d                	je     1b0 <strchr+0x30>
    if(*s == c)
 1a3:	38 d1                	cmp    %dl,%cl
 1a5:	75 f1                	jne    198 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1a7:	5d                   	pop    %ebp
 1a8:	c3                   	ret
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1b0:	31 c0                	xor    %eax,%eax
}
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret
 1b4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1bb:	00 
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001c0 <gets>:

char*
gets(char *buf, int max)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1c5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 1c8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1c9:	31 db                	xor    %ebx,%ebx
{
 1cb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1ce:	eb 27                	jmp    1f7 <gets+0x37>
    cc = read(0, &c, 1);
 1d0:	83 ec 04             	sub    $0x4,%esp
 1d3:	6a 01                	push   $0x1
 1d5:	56                   	push   %esi
 1d6:	6a 00                	push   $0x0
 1d8:	e8 15 02 00 00       	call   3f2 <read>
    if(cc < 1)
 1dd:	83 c4 10             	add    $0x10,%esp
 1e0:	85 c0                	test   %eax,%eax
 1e2:	7e 1d                	jle    201 <gets+0x41>
      break;
    buf[i++] = c;
 1e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1e8:	8b 55 08             	mov    0x8(%ebp),%edx
 1eb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1ef:	3c 0a                	cmp    $0xa,%al
 1f1:	74 10                	je     203 <gets+0x43>
 1f3:	3c 0d                	cmp    $0xd,%al
 1f5:	74 0c                	je     203 <gets+0x43>
  for(i=0; i+1 < max; ){
 1f7:	89 df                	mov    %ebx,%edi
 1f9:	83 c3 01             	add    $0x1,%ebx
 1fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ff:	7c cf                	jl     1d0 <gets+0x10>
 201:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 20a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 20d:	5b                   	pop    %ebx
 20e:	5e                   	pop    %esi
 20f:	5f                   	pop    %edi
 210:	5d                   	pop    %ebp
 211:	c3                   	ret
 212:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 219:	00 
 21a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000220 <stat>:

int
stat(const char *n, struct stat *st)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	56                   	push   %esi
 224:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 225:	83 ec 08             	sub    $0x8,%esp
 228:	6a 00                	push   $0x0
 22a:	ff 75 08             	push   0x8(%ebp)
 22d:	e8 e8 01 00 00       	call   41a <open>
  if(fd < 0)
 232:	83 c4 10             	add    $0x10,%esp
 235:	85 c0                	test   %eax,%eax
 237:	78 27                	js     260 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 239:	83 ec 08             	sub    $0x8,%esp
 23c:	ff 75 0c             	push   0xc(%ebp)
 23f:	89 c3                	mov    %eax,%ebx
 241:	50                   	push   %eax
 242:	e8 eb 01 00 00       	call   432 <fstat>
  close(fd);
 247:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 24a:	89 c6                	mov    %eax,%esi
  close(fd);
 24c:	e8 b1 01 00 00       	call   402 <close>
  return r;
 251:	83 c4 10             	add    $0x10,%esp
}
 254:	8d 65 f8             	lea    -0x8(%ebp),%esp
 257:	89 f0                	mov    %esi,%eax
 259:	5b                   	pop    %ebx
 25a:	5e                   	pop    %esi
 25b:	5d                   	pop    %ebp
 25c:	c3                   	ret
 25d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 260:	be ff ff ff ff       	mov    $0xffffffff,%esi
 265:	eb ed                	jmp    254 <stat+0x34>
 267:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 26e:	00 
 26f:	90                   	nop

00000270 <atoi>:

int
atoi(const char *s)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 277:	0f be 02             	movsbl (%edx),%eax
 27a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 27d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 280:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 285:	77 1e                	ja     2a5 <atoi+0x35>
 287:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 28e:	00 
 28f:	90                   	nop
    n = n*10 + *s++ - '0';
 290:	83 c2 01             	add    $0x1,%edx
 293:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 296:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 29a:	0f be 02             	movsbl (%edx),%eax
 29d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2a0:	80 fb 09             	cmp    $0x9,%bl
 2a3:	76 eb                	jbe    290 <atoi+0x20>
  return n;
}
 2a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2a8:	89 c8                	mov    %ecx,%eax
 2aa:	c9                   	leave
 2ab:	c3                   	ret
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	8b 45 10             	mov    0x10(%ebp),%eax
 2b7:	8b 55 08             	mov    0x8(%ebp),%edx
 2ba:	56                   	push   %esi
 2bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2be:	85 c0                	test   %eax,%eax
 2c0:	7e 13                	jle    2d5 <memmove+0x25>
 2c2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2c4:	89 d7                	mov    %edx,%edi
 2c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2cd:	00 
 2ce:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 2d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2d1:	39 f8                	cmp    %edi,%eax
 2d3:	75 fb                	jne    2d0 <memmove+0x20>
  return vdst;
}
 2d5:	5e                   	pop    %esi
 2d6:	89 d0                	mov    %edx,%eax
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret
 2db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000002e0 <thread_create>:

int
thread_create(void(*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	53                   	push   %ebx
 2e4:	83 ec 10             	sub    $0x10,%esp
  int pid;
  void *raw;
  void *stack;

  raw = malloc(PGSIZE * 2);
 2e7:	68 00 20 00 00       	push   $0x2000
 2ec:	e8 5f 04 00 00       	call   750 <malloc>
  if (raw == 0) {
 2f1:	83 c4 10             	add    $0x10,%esp
 2f4:	85 c0                	test   %eax,%eax
 2f6:	74 37                	je     32f <thread_create+0x4f>
 2f8:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  stack = (void *)(((uint)raw + sizeof(void *) + PGSIZE - 1) & ~(PGSIZE - 1));
 2fa:	8d 80 03 10 00 00    	lea    0x1003(%eax),%eax
 300:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  ((void **)stack)[-1] = raw;
 305:	89 58 fc             	mov    %ebx,-0x4(%eax)

  pid = clone(start_routine, arg1, arg2, stack);
 308:	50                   	push   %eax
 309:	ff 75 10             	push   0x10(%ebp)
 30c:	ff 75 0c             	push   0xc(%ebp)
 30f:	ff 75 08             	push   0x8(%ebp)
 312:	e8 63 01 00 00       	call   47a <clone>
  if (pid < 0) {
 317:	83 c4 10             	add    $0x10,%esp
 31a:	85 c0                	test   %eax,%eax
 31c:	78 05                	js     323 <thread_create+0x43>
    free(raw);
    return -1;
  }
  return pid;
}
 31e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 321:	c9                   	leave
 322:	c3                   	ret
    free(raw);
 323:	83 ec 0c             	sub    $0xc,%esp
 326:	53                   	push   %ebx
 327:	e8 94 03 00 00       	call   6c0 <free>
    return -1;
 32c:	83 c4 10             	add    $0x10,%esp
    return -1;
 32f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 334:	eb e8                	jmp    31e <thread_create+0x3e>
 336:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 33d:	00 
 33e:	66 90                	xchg   %ax,%ax

00000340 <thread_join>:

int
thread_join(void) 
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	53                   	push   %ebx
  int pid;
  void *raw;
  void *stack;

  pid = join(&stack);
 344:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 347:	83 ec 20             	sub    $0x20,%esp
  pid = join(&stack);
 34a:	50                   	push   %eax
 34b:	e8 32 01 00 00       	call   482 <join>
  if (pid < 0) {
 350:	83 c4 10             	add    $0x10,%esp
 353:	85 c0                	test   %eax,%eax
 355:	78 21                	js     378 <thread_join+0x38>
 357:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  raw = ((void **)stack)[-1];
 359:	8b 45 f4             	mov    -0xc(%ebp),%eax
  free(raw);
 35c:	83 ec 0c             	sub    $0xc,%esp
 35f:	ff 70 fc             	push   -0x4(%eax)
 362:	e8 59 03 00 00       	call   6c0 <free>
  return pid;
 367:	83 c4 10             	add    $0x10,%esp
}
 36a:	89 d8                	mov    %ebx,%eax
 36c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 36f:	c9                   	leave
 370:	c3                   	ret
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 378:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 37d:	eb eb                	jmp    36a <thread_join+0x2a>
 37f:	90                   	nop

00000380 <lock_init>:
  return value;
}

void 
lock_init(lock_t *lock)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 386:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 38c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 393:	5d                   	pop    %ebp
 394:	c3                   	ret
 395:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 39c:	00 
 39d:	8d 76 00             	lea    0x0(%esi),%esi

000003a0 <lock_acquire>:

void
lock_acquire(lock_t *lock)
{
 3a0:	55                   	push   %ebp
  asm volatile (
 3a1:	ba 01 00 00 00       	mov    $0x1,%edx
{
 3a6:	89 e5                	mov    %esp,%ebp
 3a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  asm volatile (
 3ab:	f0 0f c1 11          	lock xadd %edx,(%ecx)
  int myturn = fetch_and_add(&lock->ticket, 1);
  while (myturn != lock->turn);
 3af:	90                   	nop
 3b0:	8b 41 04             	mov    0x4(%ecx),%eax
 3b3:	39 d0                	cmp    %edx,%eax
 3b5:	75 f9                	jne    3b0 <lock_acquire+0x10>
}
 3b7:	5d                   	pop    %ebp
 3b8:	c3                   	ret
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003c0 <lock_release>:

void 
lock_release(lock_t *lock)
{
 3c0:	55                   	push   %ebp
  asm volatile (
 3c1:	b8 01 00 00 00       	mov    $0x1,%eax
{
 3c6:	89 e5                	mov    %esp,%ebp
 3c8:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile (
 3cb:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  fetch_and_add(&lock->turn, 1);
 3d0:	5d                   	pop    %ebp
 3d1:	c3                   	ret

000003d2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3d2:	b8 01 00 00 00       	mov    $0x1,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret

000003da <exit>:
SYSCALL(exit)
 3da:	b8 02 00 00 00       	mov    $0x2,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret

000003e2 <wait>:
SYSCALL(wait)
 3e2:	b8 03 00 00 00       	mov    $0x3,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret

000003ea <pipe>:
SYSCALL(pipe)
 3ea:	b8 04 00 00 00       	mov    $0x4,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret

000003f2 <read>:
SYSCALL(read)
 3f2:	b8 05 00 00 00       	mov    $0x5,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret

000003fa <write>:
SYSCALL(write)
 3fa:	b8 10 00 00 00       	mov    $0x10,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret

00000402 <close>:
SYSCALL(close)
 402:	b8 15 00 00 00       	mov    $0x15,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret

0000040a <kill>:
SYSCALL(kill)
 40a:	b8 06 00 00 00       	mov    $0x6,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret

00000412 <exec>:
SYSCALL(exec)
 412:	b8 07 00 00 00       	mov    $0x7,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret

0000041a <open>:
SYSCALL(open)
 41a:	b8 0f 00 00 00       	mov    $0xf,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret

00000422 <mknod>:
SYSCALL(mknod)
 422:	b8 11 00 00 00       	mov    $0x11,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret

0000042a <unlink>:
SYSCALL(unlink)
 42a:	b8 12 00 00 00       	mov    $0x12,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret

00000432 <fstat>:
SYSCALL(fstat)
 432:	b8 08 00 00 00       	mov    $0x8,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret

0000043a <link>:
SYSCALL(link)
 43a:	b8 13 00 00 00       	mov    $0x13,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret

00000442 <mkdir>:
SYSCALL(mkdir)
 442:	b8 14 00 00 00       	mov    $0x14,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret

0000044a <chdir>:
SYSCALL(chdir)
 44a:	b8 09 00 00 00       	mov    $0x9,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret

00000452 <dup>:
SYSCALL(dup)
 452:	b8 0a 00 00 00       	mov    $0xa,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret

0000045a <getpid>:
SYSCALL(getpid)
 45a:	b8 0b 00 00 00       	mov    $0xb,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret

00000462 <sbrk>:
SYSCALL(sbrk)
 462:	b8 0c 00 00 00       	mov    $0xc,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret

0000046a <sleep>:
SYSCALL(sleep)
 46a:	b8 0d 00 00 00       	mov    $0xd,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret

00000472 <uptime>:
SYSCALL(uptime)
 472:	b8 0e 00 00 00       	mov    $0xe,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret

0000047a <clone>:
SYSCALL(clone)
 47a:	b8 16 00 00 00       	mov    $0x16,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret

00000482 <join>:
SYSCALL(join)
 482:	b8 17 00 00 00       	mov    $0x17,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret
 48a:	66 90                	xchg   %ax,%ax
 48c:	66 90                	xchg   %ax,%ax
 48e:	66 90                	xchg   %ax,%ax

00000490 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
 495:	53                   	push   %ebx
 496:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 498:	89 d1                	mov    %edx,%ecx
{
 49a:	83 ec 3c             	sub    $0x3c,%esp
 49d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 4a0:	85 d2                	test   %edx,%edx
 4a2:	0f 89 80 00 00 00    	jns    528 <printint+0x98>
 4a8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4ac:	74 7a                	je     528 <printint+0x98>
    x = -xx;
 4ae:	f7 d9                	neg    %ecx
    neg = 1;
 4b0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 4b5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 4b8:	31 f6                	xor    %esi,%esi
 4ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4c0:	89 c8                	mov    %ecx,%eax
 4c2:	31 d2                	xor    %edx,%edx
 4c4:	89 f7                	mov    %esi,%edi
 4c6:	f7 f3                	div    %ebx
 4c8:	8d 76 01             	lea    0x1(%esi),%esi
 4cb:	0f b6 92 d4 08 00 00 	movzbl 0x8d4(%edx),%edx
 4d2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 4d6:	89 ca                	mov    %ecx,%edx
 4d8:	89 c1                	mov    %eax,%ecx
 4da:	39 da                	cmp    %ebx,%edx
 4dc:	73 e2                	jae    4c0 <printint+0x30>
  if(neg)
 4de:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4e1:	85 c0                	test   %eax,%eax
 4e3:	74 07                	je     4ec <printint+0x5c>
    buf[i++] = '-';
 4e5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 4ea:	89 f7                	mov    %esi,%edi
 4ec:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 4ef:	8b 75 c0             	mov    -0x40(%ebp),%esi
 4f2:	01 df                	add    %ebx,%edi
 4f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 4f8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 4fb:	83 ec 04             	sub    $0x4,%esp
 4fe:	88 45 d7             	mov    %al,-0x29(%ebp)
 501:	8d 45 d7             	lea    -0x29(%ebp),%eax
 504:	6a 01                	push   $0x1
 506:	50                   	push   %eax
 507:	56                   	push   %esi
 508:	e8 ed fe ff ff       	call   3fa <write>
  while(--i >= 0)
 50d:	89 f8                	mov    %edi,%eax
 50f:	83 c4 10             	add    $0x10,%esp
 512:	83 ef 01             	sub    $0x1,%edi
 515:	39 c3                	cmp    %eax,%ebx
 517:	75 df                	jne    4f8 <printint+0x68>
}
 519:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51c:	5b                   	pop    %ebx
 51d:	5e                   	pop    %esi
 51e:	5f                   	pop    %edi
 51f:	5d                   	pop    %ebp
 520:	c3                   	ret
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 528:	31 c0                	xor    %eax,%eax
 52a:	eb 89                	jmp    4b5 <printint+0x25>
 52c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000530 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 539:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 53c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 53f:	0f b6 1e             	movzbl (%esi),%ebx
 542:	83 c6 01             	add    $0x1,%esi
 545:	84 db                	test   %bl,%bl
 547:	74 67                	je     5b0 <printf+0x80>
 549:	8d 4d 10             	lea    0x10(%ebp),%ecx
 54c:	31 d2                	xor    %edx,%edx
 54e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 551:	eb 34                	jmp    587 <printf+0x57>
 553:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 558:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 55b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 560:	83 f8 25             	cmp    $0x25,%eax
 563:	74 18                	je     57d <printf+0x4d>
  write(fd, &c, 1);
 565:	83 ec 04             	sub    $0x4,%esp
 568:	8d 45 e7             	lea    -0x19(%ebp),%eax
 56b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 56e:	6a 01                	push   $0x1
 570:	50                   	push   %eax
 571:	57                   	push   %edi
 572:	e8 83 fe ff ff       	call   3fa <write>
 577:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 57a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 57d:	0f b6 1e             	movzbl (%esi),%ebx
 580:	83 c6 01             	add    $0x1,%esi
 583:	84 db                	test   %bl,%bl
 585:	74 29                	je     5b0 <printf+0x80>
    c = fmt[i] & 0xff;
 587:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 58a:	85 d2                	test   %edx,%edx
 58c:	74 ca                	je     558 <printf+0x28>
      }
    } else if(state == '%'){
 58e:	83 fa 25             	cmp    $0x25,%edx
 591:	75 ea                	jne    57d <printf+0x4d>
      if(c == 'd'){
 593:	83 f8 25             	cmp    $0x25,%eax
 596:	0f 84 04 01 00 00    	je     6a0 <printf+0x170>
 59c:	83 e8 63             	sub    $0x63,%eax
 59f:	83 f8 15             	cmp    $0x15,%eax
 5a2:	77 1c                	ja     5c0 <printf+0x90>
 5a4:	ff 24 85 7c 08 00 00 	jmp    *0x87c(,%eax,4)
 5ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b3:	5b                   	pop    %ebx
 5b4:	5e                   	pop    %esi
 5b5:	5f                   	pop    %edi
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret
 5b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5bf:	00 
  write(fd, &c, 1);
 5c0:	83 ec 04             	sub    $0x4,%esp
 5c3:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5c6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5ca:	6a 01                	push   $0x1
 5cc:	52                   	push   %edx
 5cd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 5d0:	57                   	push   %edi
 5d1:	e8 24 fe ff ff       	call   3fa <write>
 5d6:	83 c4 0c             	add    $0xc,%esp
 5d9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5dc:	6a 01                	push   $0x1
 5de:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5e1:	52                   	push   %edx
 5e2:	57                   	push   %edi
 5e3:	e8 12 fe ff ff       	call   3fa <write>
        putc(fd, c);
 5e8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5eb:	31 d2                	xor    %edx,%edx
 5ed:	eb 8e                	jmp    57d <printf+0x4d>
 5ef:	90                   	nop
        printint(fd, *ap, 16, 0);
 5f0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5f3:	83 ec 0c             	sub    $0xc,%esp
 5f6:	b9 10 00 00 00       	mov    $0x10,%ecx
 5fb:	8b 13                	mov    (%ebx),%edx
 5fd:	6a 00                	push   $0x0
 5ff:	89 f8                	mov    %edi,%eax
        ap++;
 601:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 604:	e8 87 fe ff ff       	call   490 <printint>
        ap++;
 609:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 60c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60f:	31 d2                	xor    %edx,%edx
 611:	e9 67 ff ff ff       	jmp    57d <printf+0x4d>
        s = (char*)*ap;
 616:	8b 45 d0             	mov    -0x30(%ebp),%eax
 619:	8b 18                	mov    (%eax),%ebx
        ap++;
 61b:	83 c0 04             	add    $0x4,%eax
 61e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 621:	85 db                	test   %ebx,%ebx
 623:	0f 84 87 00 00 00    	je     6b0 <printf+0x180>
        while(*s != 0){
 629:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 62c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 62e:	84 c0                	test   %al,%al
 630:	0f 84 47 ff ff ff    	je     57d <printf+0x4d>
 636:	8d 55 e7             	lea    -0x19(%ebp),%edx
 639:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 63c:	89 de                	mov    %ebx,%esi
 63e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 640:	83 ec 04             	sub    $0x4,%esp
 643:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 646:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 649:	6a 01                	push   $0x1
 64b:	53                   	push   %ebx
 64c:	57                   	push   %edi
 64d:	e8 a8 fd ff ff       	call   3fa <write>
        while(*s != 0){
 652:	0f b6 06             	movzbl (%esi),%eax
 655:	83 c4 10             	add    $0x10,%esp
 658:	84 c0                	test   %al,%al
 65a:	75 e4                	jne    640 <printf+0x110>
      state = 0;
 65c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 65f:	31 d2                	xor    %edx,%edx
 661:	e9 17 ff ff ff       	jmp    57d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 666:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 669:	83 ec 0c             	sub    $0xc,%esp
 66c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 671:	8b 13                	mov    (%ebx),%edx
 673:	6a 01                	push   $0x1
 675:	eb 88                	jmp    5ff <printf+0xcf>
        putc(fd, *ap);
 677:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 67a:	83 ec 04             	sub    $0x4,%esp
 67d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 680:	8b 03                	mov    (%ebx),%eax
        ap++;
 682:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 685:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 688:	6a 01                	push   $0x1
 68a:	52                   	push   %edx
 68b:	57                   	push   %edi
 68c:	e8 69 fd ff ff       	call   3fa <write>
        ap++;
 691:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 694:	83 c4 10             	add    $0x10,%esp
      state = 0;
 697:	31 d2                	xor    %edx,%edx
 699:	e9 df fe ff ff       	jmp    57d <printf+0x4d>
 69e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
 6a3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6a6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6a9:	6a 01                	push   $0x1
 6ab:	e9 31 ff ff ff       	jmp    5e1 <printf+0xb1>
 6b0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 6b5:	bb 75 08 00 00       	mov    $0x875,%ebx
 6ba:	e9 77 ff ff ff       	jmp    636 <printf+0x106>
 6bf:	90                   	nop

000006c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c1:	a1 44 0c 00 00       	mov    0xc44,%eax
{
 6c6:	89 e5                	mov    %esp,%ebp
 6c8:	57                   	push   %edi
 6c9:	56                   	push   %esi
 6ca:	53                   	push   %ebx
 6cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6da:	39 c8                	cmp    %ecx,%eax
 6dc:	73 32                	jae    710 <free+0x50>
 6de:	39 d1                	cmp    %edx,%ecx
 6e0:	72 04                	jb     6e6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e2:	39 d0                	cmp    %edx,%eax
 6e4:	72 32                	jb     718 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ec:	39 fa                	cmp    %edi,%edx
 6ee:	74 30                	je     720 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6f3:	8b 50 04             	mov    0x4(%eax),%edx
 6f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6f9:	39 f1                	cmp    %esi,%ecx
 6fb:	74 3a                	je     737 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6fd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6ff:	5b                   	pop    %ebx
  freep = p;
 700:	a3 44 0c 00 00       	mov    %eax,0xc44
}
 705:	5e                   	pop    %esi
 706:	5f                   	pop    %edi
 707:	5d                   	pop    %ebp
 708:	c3                   	ret
 709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 710:	39 d0                	cmp    %edx,%eax
 712:	72 04                	jb     718 <free+0x58>
 714:	39 d1                	cmp    %edx,%ecx
 716:	72 ce                	jb     6e6 <free+0x26>
{
 718:	89 d0                	mov    %edx,%eax
 71a:	eb bc                	jmp    6d8 <free+0x18>
 71c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 720:	03 72 04             	add    0x4(%edx),%esi
 723:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 726:	8b 10                	mov    (%eax),%edx
 728:	8b 12                	mov    (%edx),%edx
 72a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 72d:	8b 50 04             	mov    0x4(%eax),%edx
 730:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 733:	39 f1                	cmp    %esi,%ecx
 735:	75 c6                	jne    6fd <free+0x3d>
    p->s.size += bp->s.size;
 737:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 73a:	a3 44 0c 00 00       	mov    %eax,0xc44
    p->s.size += bp->s.size;
 73f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 742:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 745:	89 08                	mov    %ecx,(%eax)
}
 747:	5b                   	pop    %ebx
 748:	5e                   	pop    %esi
 749:	5f                   	pop    %edi
 74a:	5d                   	pop    %ebp
 74b:	c3                   	ret
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000750 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	57                   	push   %edi
 754:	56                   	push   %esi
 755:	53                   	push   %ebx
 756:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 759:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 75c:	8b 15 44 0c 00 00    	mov    0xc44,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 762:	8d 78 07             	lea    0x7(%eax),%edi
 765:	c1 ef 03             	shr    $0x3,%edi
 768:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 76b:	85 d2                	test   %edx,%edx
 76d:	0f 84 8d 00 00 00    	je     800 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 773:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 775:	8b 48 04             	mov    0x4(%eax),%ecx
 778:	39 f9                	cmp    %edi,%ecx
 77a:	73 64                	jae    7e0 <malloc+0x90>
  if(nu < 4096)
 77c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 781:	39 df                	cmp    %ebx,%edi
 783:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 786:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 78d:	eb 0a                	jmp    799 <malloc+0x49>
 78f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 790:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 792:	8b 48 04             	mov    0x4(%eax),%ecx
 795:	39 f9                	cmp    %edi,%ecx
 797:	73 47                	jae    7e0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 799:	89 c2                	mov    %eax,%edx
 79b:	3b 05 44 0c 00 00    	cmp    0xc44,%eax
 7a1:	75 ed                	jne    790 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 7a3:	83 ec 0c             	sub    $0xc,%esp
 7a6:	56                   	push   %esi
 7a7:	e8 b6 fc ff ff       	call   462 <sbrk>
  if(p == (char*)-1)
 7ac:	83 c4 10             	add    $0x10,%esp
 7af:	83 f8 ff             	cmp    $0xffffffff,%eax
 7b2:	74 1c                	je     7d0 <malloc+0x80>
  hp->s.size = nu;
 7b4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7b7:	83 ec 0c             	sub    $0xc,%esp
 7ba:	83 c0 08             	add    $0x8,%eax
 7bd:	50                   	push   %eax
 7be:	e8 fd fe ff ff       	call   6c0 <free>
  return freep;
 7c3:	8b 15 44 0c 00 00    	mov    0xc44,%edx
      if((p = morecore(nunits)) == 0)
 7c9:	83 c4 10             	add    $0x10,%esp
 7cc:	85 d2                	test   %edx,%edx
 7ce:	75 c0                	jne    790 <malloc+0x40>
        return 0;
  }
}
 7d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7d3:	31 c0                	xor    %eax,%eax
}
 7d5:	5b                   	pop    %ebx
 7d6:	5e                   	pop    %esi
 7d7:	5f                   	pop    %edi
 7d8:	5d                   	pop    %ebp
 7d9:	c3                   	ret
 7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7e0:	39 cf                	cmp    %ecx,%edi
 7e2:	74 4c                	je     830 <malloc+0xe0>
        p->s.size -= nunits;
 7e4:	29 f9                	sub    %edi,%ecx
 7e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7ec:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 7ef:	89 15 44 0c 00 00    	mov    %edx,0xc44
}
 7f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7f8:	83 c0 08             	add    $0x8,%eax
}
 7fb:	5b                   	pop    %ebx
 7fc:	5e                   	pop    %esi
 7fd:	5f                   	pop    %edi
 7fe:	5d                   	pop    %ebp
 7ff:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 800:	c7 05 44 0c 00 00 48 	movl   $0xc48,0xc44
 807:	0c 00 00 
    base.s.size = 0;
 80a:	b8 48 0c 00 00       	mov    $0xc48,%eax
    base.s.ptr = freep = prevp = &base;
 80f:	c7 05 48 0c 00 00 48 	movl   $0xc48,0xc48
 816:	0c 00 00 
    base.s.size = 0;
 819:	c7 05 4c 0c 00 00 00 	movl   $0x0,0xc4c
 820:	00 00 00 
    if(p->s.size >= nunits){
 823:	e9 54 ff ff ff       	jmp    77c <malloc+0x2c>
 828:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 82f:	00 
        prevp->s.ptr = p->s.ptr;
 830:	8b 08                	mov    (%eax),%ecx
 832:	89 0a                	mov    %ecx,(%edx)
 834:	eb b9                	jmp    7ef <malloc+0x9f>
