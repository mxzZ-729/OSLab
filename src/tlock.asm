
_tlock:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
        lock_release(&lock);
    }
    exit();
}

int main(void) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
    int n1 = 250, n2 = 250;
    int pid1, pid2;

    pid1 = thread_create(increment, &n1, &n2);
   f:	8d 7d e4             	lea    -0x1c(%ebp),%edi
  12:	8d 75 e0             	lea    -0x20(%ebp),%esi
int main(void) {
  15:	53                   	push   %ebx
  16:	51                   	push   %ecx
  17:	83 ec 1c             	sub    $0x1c,%esp
    int n1 = 250, n2 = 250;
  1a:	c7 45 e0 fa 00 00 00 	movl   $0xfa,-0x20(%ebp)
    pid1 = thread_create(increment, &n1, &n2);
  21:	57                   	push   %edi
  22:	56                   	push   %esi
  23:	68 90 00 00 00       	push   $0x90
    int n1 = 250, n2 = 250;
  28:	c7 45 e4 fa 00 00 00 	movl   $0xfa,-0x1c(%ebp)
    pid1 = thread_create(increment, &n1, &n2);
  2f:	e8 ec 02 00 00       	call   320 <thread_create>
    pid2 = thread_create(increment, &n1, &n2);
  34:	83 c4 0c             	add    $0xc,%esp
  37:	57                   	push   %edi
    pid1 = thread_create(increment, &n1, &n2);
  38:	89 c3                	mov    %eax,%ebx
    pid2 = thread_create(increment, &n1, &n2);
  3a:	56                   	push   %esi
  3b:	68 90 00 00 00       	push   $0x90
  40:	e8 db 02 00 00       	call   320 <thread_create>

    if (pid1 < 0 || pid2 < 0) {
  45:	83 c4 10             	add    $0x10,%esp
  48:	09 d8                	or     %ebx,%eax
  4a:	79 13                	jns    5f <main+0x5f>
        printf(1, "thread_create failed\n");
  4c:	50                   	push   %eax
  4d:	50                   	push   %eax
  4e:	68 78 08 00 00       	push   $0x878
  53:	6a 01                	push   $0x1
  55:	e8 16 05 00 00       	call   570 <printf>
        exit();
  5a:	e8 bb 03 00 00       	call   41a <exit>
    }

    thread_join();
  5f:	e8 1c 03 00 00       	call   380 <thread_join>
    thread_join();
  64:	e8 17 03 00 00       	call   380 <thread_join>

    printf(1, "counter=%d expeted=%d\n", counter, (n1 + n2) * 2);
  69:	8b 15 88 0c 00 00    	mov    0xc88,%edx
  6f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  72:	03 45 e0             	add    -0x20(%ebp),%eax
  75:	01 c0                	add    %eax,%eax
  77:	50                   	push   %eax
  78:	52                   	push   %edx
  79:	68 8e 08 00 00       	push   $0x88e
  7e:	6a 01                	push   $0x1
  80:	e8 eb 04 00 00       	call   570 <printf>
    exit();
  85:	e8 90 03 00 00       	call   41a <exit>
  8a:	66 90                	xchg   %ax,%ax
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <increment>:
void increment(void *arg1, void *arg2) {
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
    int n = *(int *)arg1 + *(int *)arg2;
  94:	8b 45 0c             	mov    0xc(%ebp),%eax
void increment(void *arg1, void *arg2) {
  97:	53                   	push   %ebx
    int n = *(int *)arg1 + *(int *)arg2;
  98:	8b 18                	mov    (%eax),%ebx
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	03 18                	add    (%eax),%ebx
    for (i = 0; i < n; i++) {
  9f:	85 db                	test   %ebx,%ebx
  a1:	7e 35                	jle    d8 <increment+0x48>
  a3:	31 f6                	xor    %esi,%esi
  a5:	8d 76 00             	lea    0x0(%esi),%esi
        lock_acquire(&lock);
  a8:	83 ec 0c             	sub    $0xc,%esp
    for (i = 0; i < n; i++) {
  ab:	83 c6 01             	add    $0x1,%esi
        lock_acquire(&lock);
  ae:	68 80 0c 00 00       	push   $0xc80
  b3:	e8 28 03 00 00       	call   3e0 <lock_acquire>
        counter++;
  b8:	a1 88 0c 00 00       	mov    0xc88,%eax
        lock_release(&lock);
  bd:	c7 04 24 80 0c 00 00 	movl   $0xc80,(%esp)
        counter++;
  c4:	83 c0 01             	add    $0x1,%eax
  c7:	a3 88 0c 00 00       	mov    %eax,0xc88
        lock_release(&lock);
  cc:	e8 2f 03 00 00       	call   400 <lock_release>
    for (i = 0; i < n; i++) {
  d1:	83 c4 10             	add    $0x10,%esp
  d4:	39 f3                	cmp    %esi,%ebx
  d6:	75 d0                	jne    a8 <increment+0x18>
    exit();
  d8:	e8 3d 03 00 00       	call   41a <exit>
  dd:	66 90                	xchg   %ax,%ax
  df:	90                   	nop

000000e0 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
  e0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  e1:	31 c0                	xor    %eax,%eax
{
  e3:	89 e5                	mov    %esp,%ebp
  e5:	53                   	push   %ebx
  e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  f7:	83 c0 01             	add    $0x1,%eax
  fa:	84 d2                	test   %dl,%dl
  fc:	75 f2                	jne    f0 <strcpy+0x10>
    ;
  return os;
}
  fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 101:	89 c8                	mov    %ecx,%eax
 103:	c9                   	leave
 104:	c3                   	ret
 105:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 10c:	00 
 10d:	8d 76 00             	lea    0x0(%esi),%esi

00000110 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	53                   	push   %ebx
 114:	8b 55 08             	mov    0x8(%ebp),%edx
 117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 11a:	0f b6 02             	movzbl (%edx),%eax
 11d:	84 c0                	test   %al,%al
 11f:	75 17                	jne    138 <strcmp+0x28>
 121:	eb 3a                	jmp    15d <strcmp+0x4d>
 123:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 128:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 12c:	83 c2 01             	add    $0x1,%edx
 12f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 132:	84 c0                	test   %al,%al
 134:	74 1a                	je     150 <strcmp+0x40>
 136:	89 d9                	mov    %ebx,%ecx
 138:	0f b6 19             	movzbl (%ecx),%ebx
 13b:	38 c3                	cmp    %al,%bl
 13d:	74 e9                	je     128 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 13f:	29 d8                	sub    %ebx,%eax
}
 141:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 144:	c9                   	leave
 145:	c3                   	ret
 146:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 14d:	00 
 14e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 150:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 154:	31 c0                	xor    %eax,%eax
 156:	29 d8                	sub    %ebx,%eax
}
 158:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 15b:	c9                   	leave
 15c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 15d:	0f b6 19             	movzbl (%ecx),%ebx
 160:	31 c0                	xor    %eax,%eax
 162:	eb db                	jmp    13f <strcmp+0x2f>
 164:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 16b:	00 
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000170 <strlen>:

uint
strlen(const char *s)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 176:	80 3a 00             	cmpb   $0x0,(%edx)
 179:	74 15                	je     190 <strlen+0x20>
 17b:	31 c0                	xor    %eax,%eax
 17d:	8d 76 00             	lea    0x0(%esi),%esi
 180:	83 c0 01             	add    $0x1,%eax
 183:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 187:	89 c1                	mov    %eax,%ecx
 189:	75 f5                	jne    180 <strlen+0x10>
    ;
  return n;
}
 18b:	89 c8                	mov    %ecx,%eax
 18d:	5d                   	pop    %ebp
 18e:	c3                   	ret
 18f:	90                   	nop
  for(n = 0; s[n]; n++)
 190:	31 c9                	xor    %ecx,%ecx
}
 192:	5d                   	pop    %ebp
 193:	89 c8                	mov    %ecx,%eax
 195:	c3                   	ret
 196:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 19d:	00 
 19e:	66 90                	xchg   %ax,%ax

000001a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ad:	89 d7                	mov    %edx,%edi
 1af:	fc                   	cld
 1b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1b5:	89 d0                	mov    %edx,%eax
 1b7:	c9                   	leave
 1b8:	c3                   	ret
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <strchr>:

char*
strchr(const char *s, char c)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
 1c6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ca:	0f b6 10             	movzbl (%eax),%edx
 1cd:	84 d2                	test   %dl,%dl
 1cf:	75 12                	jne    1e3 <strchr+0x23>
 1d1:	eb 1d                	jmp    1f0 <strchr+0x30>
 1d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 1d8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	84 d2                	test   %dl,%dl
 1e1:	74 0d                	je     1f0 <strchr+0x30>
    if(*s == c)
 1e3:	38 d1                	cmp    %dl,%cl
 1e5:	75 f1                	jne    1d8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1f0:	31 c0                	xor    %eax,%eax
}
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret
 1f4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1fb:	00 
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000200 <gets>:

char*
gets(char *buf, int max)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 205:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 208:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 209:	31 db                	xor    %ebx,%ebx
{
 20b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 20e:	eb 27                	jmp    237 <gets+0x37>
    cc = read(0, &c, 1);
 210:	83 ec 04             	sub    $0x4,%esp
 213:	6a 01                	push   $0x1
 215:	56                   	push   %esi
 216:	6a 00                	push   $0x0
 218:	e8 15 02 00 00       	call   432 <read>
    if(cc < 1)
 21d:	83 c4 10             	add    $0x10,%esp
 220:	85 c0                	test   %eax,%eax
 222:	7e 1d                	jle    241 <gets+0x41>
      break;
    buf[i++] = c;
 224:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 228:	8b 55 08             	mov    0x8(%ebp),%edx
 22b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 22f:	3c 0a                	cmp    $0xa,%al
 231:	74 10                	je     243 <gets+0x43>
 233:	3c 0d                	cmp    $0xd,%al
 235:	74 0c                	je     243 <gets+0x43>
  for(i=0; i+1 < max; ){
 237:	89 df                	mov    %ebx,%edi
 239:	83 c3 01             	add    $0x1,%ebx
 23c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 23f:	7c cf                	jl     210 <gets+0x10>
 241:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 243:	8b 45 08             	mov    0x8(%ebp),%eax
 246:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 24a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24d:	5b                   	pop    %ebx
 24e:	5e                   	pop    %esi
 24f:	5f                   	pop    %edi
 250:	5d                   	pop    %ebp
 251:	c3                   	ret
 252:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 259:	00 
 25a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000260 <stat>:

int
stat(const char *n, struct stat *st)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	56                   	push   %esi
 264:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 265:	83 ec 08             	sub    $0x8,%esp
 268:	6a 00                	push   $0x0
 26a:	ff 75 08             	push   0x8(%ebp)
 26d:	e8 e8 01 00 00       	call   45a <open>
  if(fd < 0)
 272:	83 c4 10             	add    $0x10,%esp
 275:	85 c0                	test   %eax,%eax
 277:	78 27                	js     2a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 279:	83 ec 08             	sub    $0x8,%esp
 27c:	ff 75 0c             	push   0xc(%ebp)
 27f:	89 c3                	mov    %eax,%ebx
 281:	50                   	push   %eax
 282:	e8 eb 01 00 00       	call   472 <fstat>
  close(fd);
 287:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 28a:	89 c6                	mov    %eax,%esi
  close(fd);
 28c:	e8 b1 01 00 00       	call   442 <close>
  return r;
 291:	83 c4 10             	add    $0x10,%esp
}
 294:	8d 65 f8             	lea    -0x8(%ebp),%esp
 297:	89 f0                	mov    %esi,%eax
 299:	5b                   	pop    %ebx
 29a:	5e                   	pop    %esi
 29b:	5d                   	pop    %ebp
 29c:	c3                   	ret
 29d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2a5:	eb ed                	jmp    294 <stat+0x34>
 2a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ae:	00 
 2af:	90                   	nop

000002b0 <atoi>:

int
atoi(const char *s)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	53                   	push   %ebx
 2b4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2b7:	0f be 02             	movsbl (%edx),%eax
 2ba:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2bd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2c0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2c5:	77 1e                	ja     2e5 <atoi+0x35>
 2c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ce:	00 
 2cf:	90                   	nop
    n = n*10 + *s++ - '0';
 2d0:	83 c2 01             	add    $0x1,%edx
 2d3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2d6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2da:	0f be 02             	movsbl (%edx),%eax
 2dd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2e0:	80 fb 09             	cmp    $0x9,%bl
 2e3:	76 eb                	jbe    2d0 <atoi+0x20>
  return n;
}
 2e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e8:	89 c8                	mov    %ecx,%eax
 2ea:	c9                   	leave
 2eb:	c3                   	ret
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	8b 45 10             	mov    0x10(%ebp),%eax
 2f7:	8b 55 08             	mov    0x8(%ebp),%edx
 2fa:	56                   	push   %esi
 2fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2fe:	85 c0                	test   %eax,%eax
 300:	7e 13                	jle    315 <memmove+0x25>
 302:	01 d0                	add    %edx,%eax
  dst = vdst;
 304:	89 d7                	mov    %edx,%edi
 306:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 30d:	00 
 30e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 310:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 311:	39 f8                	cmp    %edi,%eax
 313:	75 fb                	jne    310 <memmove+0x20>
  return vdst;
}
 315:	5e                   	pop    %esi
 316:	89 d0                	mov    %edx,%eax
 318:	5f                   	pop    %edi
 319:	5d                   	pop    %ebp
 31a:	c3                   	ret
 31b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000320 <thread_create>:

int
thread_create(void(*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	83 ec 10             	sub    $0x10,%esp
  int pid;
  void *raw;
  void *stack;

  raw = malloc(PGSIZE * 2);
 327:	68 00 20 00 00       	push   $0x2000
 32c:	e8 5f 04 00 00       	call   790 <malloc>
  if (raw == 0) {
 331:	83 c4 10             	add    $0x10,%esp
 334:	85 c0                	test   %eax,%eax
 336:	74 37                	je     36f <thread_create+0x4f>
 338:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  stack = (void *)(((uint)raw + sizeof(void *) + PGSIZE - 1) & ~(PGSIZE - 1));
 33a:	8d 80 03 10 00 00    	lea    0x1003(%eax),%eax
 340:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  ((void **)stack)[-1] = raw;
 345:	89 58 fc             	mov    %ebx,-0x4(%eax)

  pid = clone(start_routine, arg1, arg2, stack);
 348:	50                   	push   %eax
 349:	ff 75 10             	push   0x10(%ebp)
 34c:	ff 75 0c             	push   0xc(%ebp)
 34f:	ff 75 08             	push   0x8(%ebp)
 352:	e8 63 01 00 00       	call   4ba <clone>
  if (pid < 0) {
 357:	83 c4 10             	add    $0x10,%esp
 35a:	85 c0                	test   %eax,%eax
 35c:	78 05                	js     363 <thread_create+0x43>
    free(raw);
    return -1;
  }
  return pid;
}
 35e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 361:	c9                   	leave
 362:	c3                   	ret
    free(raw);
 363:	83 ec 0c             	sub    $0xc,%esp
 366:	53                   	push   %ebx
 367:	e8 94 03 00 00       	call   700 <free>
    return -1;
 36c:	83 c4 10             	add    $0x10,%esp
    return -1;
 36f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 374:	eb e8                	jmp    35e <thread_create+0x3e>
 376:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 37d:	00 
 37e:	66 90                	xchg   %ax,%ax

00000380 <thread_join>:

int
thread_join(void) 
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
  int pid;
  void *raw;
  void *stack;

  pid = join(&stack);
 384:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 387:	83 ec 20             	sub    $0x20,%esp
  pid = join(&stack);
 38a:	50                   	push   %eax
 38b:	e8 32 01 00 00       	call   4c2 <join>
  if (pid < 0) {
 390:	83 c4 10             	add    $0x10,%esp
 393:	85 c0                	test   %eax,%eax
 395:	78 21                	js     3b8 <thread_join+0x38>
 397:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  raw = ((void **)stack)[-1];
 399:	8b 45 f4             	mov    -0xc(%ebp),%eax
  free(raw);
 39c:	83 ec 0c             	sub    $0xc,%esp
 39f:	ff 70 fc             	push   -0x4(%eax)
 3a2:	e8 59 03 00 00       	call   700 <free>
  return pid;
 3a7:	83 c4 10             	add    $0x10,%esp
}
 3aa:	89 d8                	mov    %ebx,%eax
 3ac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3af:	c9                   	leave
 3b0:	c3                   	ret
 3b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 3b8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 3bd:	eb eb                	jmp    3aa <thread_join+0x2a>
 3bf:	90                   	nop

000003c0 <lock_init>:
  return value;
}

void 
lock_init(lock_t *lock)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 3c6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 3cc:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 3d3:	5d                   	pop    %ebp
 3d4:	c3                   	ret
 3d5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3dc:	00 
 3dd:	8d 76 00             	lea    0x0(%esi),%esi

000003e0 <lock_acquire>:

void
lock_acquire(lock_t *lock)
{
 3e0:	55                   	push   %ebp
  asm volatile (
 3e1:	ba 01 00 00 00       	mov    $0x1,%edx
{
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  asm volatile (
 3eb:	f0 0f c1 11          	lock xadd %edx,(%ecx)
  int myturn = fetch_and_add(&lock->ticket, 1);
  while (myturn != lock->turn);
 3ef:	90                   	nop
 3f0:	8b 41 04             	mov    0x4(%ecx),%eax
 3f3:	39 d0                	cmp    %edx,%eax
 3f5:	75 f9                	jne    3f0 <lock_acquire+0x10>
}
 3f7:	5d                   	pop    %ebp
 3f8:	c3                   	ret
 3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000400 <lock_release>:

void 
lock_release(lock_t *lock)
{
 400:	55                   	push   %ebp
  asm volatile (
 401:	b8 01 00 00 00       	mov    $0x1,%eax
{
 406:	89 e5                	mov    %esp,%ebp
 408:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile (
 40b:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  fetch_and_add(&lock->turn, 1);
 410:	5d                   	pop    %ebp
 411:	c3                   	ret

00000412 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 412:	b8 01 00 00 00       	mov    $0x1,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret

0000041a <exit>:
SYSCALL(exit)
 41a:	b8 02 00 00 00       	mov    $0x2,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret

00000422 <wait>:
SYSCALL(wait)
 422:	b8 03 00 00 00       	mov    $0x3,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret

0000042a <pipe>:
SYSCALL(pipe)
 42a:	b8 04 00 00 00       	mov    $0x4,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret

00000432 <read>:
SYSCALL(read)
 432:	b8 05 00 00 00       	mov    $0x5,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret

0000043a <write>:
SYSCALL(write)
 43a:	b8 10 00 00 00       	mov    $0x10,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret

00000442 <close>:
SYSCALL(close)
 442:	b8 15 00 00 00       	mov    $0x15,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret

0000044a <kill>:
SYSCALL(kill)
 44a:	b8 06 00 00 00       	mov    $0x6,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret

00000452 <exec>:
SYSCALL(exec)
 452:	b8 07 00 00 00       	mov    $0x7,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret

0000045a <open>:
SYSCALL(open)
 45a:	b8 0f 00 00 00       	mov    $0xf,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret

00000462 <mknod>:
SYSCALL(mknod)
 462:	b8 11 00 00 00       	mov    $0x11,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret

0000046a <unlink>:
SYSCALL(unlink)
 46a:	b8 12 00 00 00       	mov    $0x12,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret

00000472 <fstat>:
SYSCALL(fstat)
 472:	b8 08 00 00 00       	mov    $0x8,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret

0000047a <link>:
SYSCALL(link)
 47a:	b8 13 00 00 00       	mov    $0x13,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret

00000482 <mkdir>:
SYSCALL(mkdir)
 482:	b8 14 00 00 00       	mov    $0x14,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret

0000048a <chdir>:
SYSCALL(chdir)
 48a:	b8 09 00 00 00       	mov    $0x9,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret

00000492 <dup>:
SYSCALL(dup)
 492:	b8 0a 00 00 00       	mov    $0xa,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret

0000049a <getpid>:
SYSCALL(getpid)
 49a:	b8 0b 00 00 00       	mov    $0xb,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret

000004a2 <sbrk>:
SYSCALL(sbrk)
 4a2:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret

000004aa <sleep>:
SYSCALL(sleep)
 4aa:	b8 0d 00 00 00       	mov    $0xd,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret

000004b2 <uptime>:
SYSCALL(uptime)
 4b2:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret

000004ba <clone>:
SYSCALL(clone)
 4ba:	b8 16 00 00 00       	mov    $0x16,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret

000004c2 <join>:
SYSCALL(join)
 4c2:	b8 17 00 00 00       	mov    $0x17,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret
 4ca:	66 90                	xchg   %ax,%ax
 4cc:	66 90                	xchg   %ax,%ax
 4ce:	66 90                	xchg   %ax,%ax

000004d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4d8:	89 d1                	mov    %edx,%ecx
{
 4da:	83 ec 3c             	sub    $0x3c,%esp
 4dd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 4e0:	85 d2                	test   %edx,%edx
 4e2:	0f 89 80 00 00 00    	jns    568 <printint+0x98>
 4e8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4ec:	74 7a                	je     568 <printint+0x98>
    x = -xx;
 4ee:	f7 d9                	neg    %ecx
    neg = 1;
 4f0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 4f5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 4f8:	31 f6                	xor    %esi,%esi
 4fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 500:	89 c8                	mov    %ecx,%eax
 502:	31 d2                	xor    %edx,%edx
 504:	89 f7                	mov    %esi,%edi
 506:	f7 f3                	div    %ebx
 508:	8d 76 01             	lea    0x1(%esi),%esi
 50b:	0f b6 92 04 09 00 00 	movzbl 0x904(%edx),%edx
 512:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 516:	89 ca                	mov    %ecx,%edx
 518:	89 c1                	mov    %eax,%ecx
 51a:	39 da                	cmp    %ebx,%edx
 51c:	73 e2                	jae    500 <printint+0x30>
  if(neg)
 51e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 521:	85 c0                	test   %eax,%eax
 523:	74 07                	je     52c <printint+0x5c>
    buf[i++] = '-';
 525:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 52a:	89 f7                	mov    %esi,%edi
 52c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 52f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 532:	01 df                	add    %ebx,%edi
 534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 538:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 53b:	83 ec 04             	sub    $0x4,%esp
 53e:	88 45 d7             	mov    %al,-0x29(%ebp)
 541:	8d 45 d7             	lea    -0x29(%ebp),%eax
 544:	6a 01                	push   $0x1
 546:	50                   	push   %eax
 547:	56                   	push   %esi
 548:	e8 ed fe ff ff       	call   43a <write>
  while(--i >= 0)
 54d:	89 f8                	mov    %edi,%eax
 54f:	83 c4 10             	add    $0x10,%esp
 552:	83 ef 01             	sub    $0x1,%edi
 555:	39 c3                	cmp    %eax,%ebx
 557:	75 df                	jne    538 <printint+0x68>
}
 559:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55c:	5b                   	pop    %ebx
 55d:	5e                   	pop    %esi
 55e:	5f                   	pop    %edi
 55f:	5d                   	pop    %ebp
 560:	c3                   	ret
 561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 568:	31 c0                	xor    %eax,%eax
 56a:	eb 89                	jmp    4f5 <printint+0x25>
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000570 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 579:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 57c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 57f:	0f b6 1e             	movzbl (%esi),%ebx
 582:	83 c6 01             	add    $0x1,%esi
 585:	84 db                	test   %bl,%bl
 587:	74 67                	je     5f0 <printf+0x80>
 589:	8d 4d 10             	lea    0x10(%ebp),%ecx
 58c:	31 d2                	xor    %edx,%edx
 58e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 591:	eb 34                	jmp    5c7 <printf+0x57>
 593:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 598:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 59b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5a0:	83 f8 25             	cmp    $0x25,%eax
 5a3:	74 18                	je     5bd <printf+0x4d>
  write(fd, &c, 1);
 5a5:	83 ec 04             	sub    $0x4,%esp
 5a8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5ab:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5ae:	6a 01                	push   $0x1
 5b0:	50                   	push   %eax
 5b1:	57                   	push   %edi
 5b2:	e8 83 fe ff ff       	call   43a <write>
 5b7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5ba:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5bd:	0f b6 1e             	movzbl (%esi),%ebx
 5c0:	83 c6 01             	add    $0x1,%esi
 5c3:	84 db                	test   %bl,%bl
 5c5:	74 29                	je     5f0 <printf+0x80>
    c = fmt[i] & 0xff;
 5c7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5ca:	85 d2                	test   %edx,%edx
 5cc:	74 ca                	je     598 <printf+0x28>
      }
    } else if(state == '%'){
 5ce:	83 fa 25             	cmp    $0x25,%edx
 5d1:	75 ea                	jne    5bd <printf+0x4d>
      if(c == 'd'){
 5d3:	83 f8 25             	cmp    $0x25,%eax
 5d6:	0f 84 04 01 00 00    	je     6e0 <printf+0x170>
 5dc:	83 e8 63             	sub    $0x63,%eax
 5df:	83 f8 15             	cmp    $0x15,%eax
 5e2:	77 1c                	ja     600 <printf+0x90>
 5e4:	ff 24 85 ac 08 00 00 	jmp    *0x8ac(,%eax,4)
 5eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5f3:	5b                   	pop    %ebx
 5f4:	5e                   	pop    %esi
 5f5:	5f                   	pop    %edi
 5f6:	5d                   	pop    %ebp
 5f7:	c3                   	ret
 5f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5ff:	00 
  write(fd, &c, 1);
 600:	83 ec 04             	sub    $0x4,%esp
 603:	8d 55 e7             	lea    -0x19(%ebp),%edx
 606:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 60a:	6a 01                	push   $0x1
 60c:	52                   	push   %edx
 60d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 610:	57                   	push   %edi
 611:	e8 24 fe ff ff       	call   43a <write>
 616:	83 c4 0c             	add    $0xc,%esp
 619:	88 5d e7             	mov    %bl,-0x19(%ebp)
 61c:	6a 01                	push   $0x1
 61e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 621:	52                   	push   %edx
 622:	57                   	push   %edi
 623:	e8 12 fe ff ff       	call   43a <write>
        putc(fd, c);
 628:	83 c4 10             	add    $0x10,%esp
      state = 0;
 62b:	31 d2                	xor    %edx,%edx
 62d:	eb 8e                	jmp    5bd <printf+0x4d>
 62f:	90                   	nop
        printint(fd, *ap, 16, 0);
 630:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 633:	83 ec 0c             	sub    $0xc,%esp
 636:	b9 10 00 00 00       	mov    $0x10,%ecx
 63b:	8b 13                	mov    (%ebx),%edx
 63d:	6a 00                	push   $0x0
 63f:	89 f8                	mov    %edi,%eax
        ap++;
 641:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 644:	e8 87 fe ff ff       	call   4d0 <printint>
        ap++;
 649:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 64c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 64f:	31 d2                	xor    %edx,%edx
 651:	e9 67 ff ff ff       	jmp    5bd <printf+0x4d>
        s = (char*)*ap;
 656:	8b 45 d0             	mov    -0x30(%ebp),%eax
 659:	8b 18                	mov    (%eax),%ebx
        ap++;
 65b:	83 c0 04             	add    $0x4,%eax
 65e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 661:	85 db                	test   %ebx,%ebx
 663:	0f 84 87 00 00 00    	je     6f0 <printf+0x180>
        while(*s != 0){
 669:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 66c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 66e:	84 c0                	test   %al,%al
 670:	0f 84 47 ff ff ff    	je     5bd <printf+0x4d>
 676:	8d 55 e7             	lea    -0x19(%ebp),%edx
 679:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 67c:	89 de                	mov    %ebx,%esi
 67e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 680:	83 ec 04             	sub    $0x4,%esp
 683:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 686:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 689:	6a 01                	push   $0x1
 68b:	53                   	push   %ebx
 68c:	57                   	push   %edi
 68d:	e8 a8 fd ff ff       	call   43a <write>
        while(*s != 0){
 692:	0f b6 06             	movzbl (%esi),%eax
 695:	83 c4 10             	add    $0x10,%esp
 698:	84 c0                	test   %al,%al
 69a:	75 e4                	jne    680 <printf+0x110>
      state = 0;
 69c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 69f:	31 d2                	xor    %edx,%edx
 6a1:	e9 17 ff ff ff       	jmp    5bd <printf+0x4d>
        printint(fd, *ap, 10, 1);
 6a6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6a9:	83 ec 0c             	sub    $0xc,%esp
 6ac:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6b1:	8b 13                	mov    (%ebx),%edx
 6b3:	6a 01                	push   $0x1
 6b5:	eb 88                	jmp    63f <printf+0xcf>
        putc(fd, *ap);
 6b7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6ba:	83 ec 04             	sub    $0x4,%esp
 6bd:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 6c0:	8b 03                	mov    (%ebx),%eax
        ap++;
 6c2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 6c5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6c8:	6a 01                	push   $0x1
 6ca:	52                   	push   %edx
 6cb:	57                   	push   %edi
 6cc:	e8 69 fd ff ff       	call   43a <write>
        ap++;
 6d1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6d4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6d7:	31 d2                	xor    %edx,%edx
 6d9:	e9 df fe ff ff       	jmp    5bd <printf+0x4d>
 6de:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 6e0:	83 ec 04             	sub    $0x4,%esp
 6e3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6e6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6e9:	6a 01                	push   $0x1
 6eb:	e9 31 ff ff ff       	jmp    621 <printf+0xb1>
 6f0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 6f5:	bb a5 08 00 00       	mov    $0x8a5,%ebx
 6fa:	e9 77 ff ff ff       	jmp    676 <printf+0x106>
 6ff:	90                   	nop

00000700 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 700:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	a1 8c 0c 00 00       	mov    0xc8c,%eax
{
 706:	89 e5                	mov    %esp,%ebp
 708:	57                   	push   %edi
 709:	56                   	push   %esi
 70a:	53                   	push   %ebx
 70b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 70e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 718:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 71a:	39 c8                	cmp    %ecx,%eax
 71c:	73 32                	jae    750 <free+0x50>
 71e:	39 d1                	cmp    %edx,%ecx
 720:	72 04                	jb     726 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 722:	39 d0                	cmp    %edx,%eax
 724:	72 32                	jb     758 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 726:	8b 73 fc             	mov    -0x4(%ebx),%esi
 729:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 72c:	39 fa                	cmp    %edi,%edx
 72e:	74 30                	je     760 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 730:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 733:	8b 50 04             	mov    0x4(%eax),%edx
 736:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 739:	39 f1                	cmp    %esi,%ecx
 73b:	74 3a                	je     777 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 73d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 73f:	5b                   	pop    %ebx
  freep = p;
 740:	a3 8c 0c 00 00       	mov    %eax,0xc8c
}
 745:	5e                   	pop    %esi
 746:	5f                   	pop    %edi
 747:	5d                   	pop    %ebp
 748:	c3                   	ret
 749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 750:	39 d0                	cmp    %edx,%eax
 752:	72 04                	jb     758 <free+0x58>
 754:	39 d1                	cmp    %edx,%ecx
 756:	72 ce                	jb     726 <free+0x26>
{
 758:	89 d0                	mov    %edx,%eax
 75a:	eb bc                	jmp    718 <free+0x18>
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 760:	03 72 04             	add    0x4(%edx),%esi
 763:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 766:	8b 10                	mov    (%eax),%edx
 768:	8b 12                	mov    (%edx),%edx
 76a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 76d:	8b 50 04             	mov    0x4(%eax),%edx
 770:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 773:	39 f1                	cmp    %esi,%ecx
 775:	75 c6                	jne    73d <free+0x3d>
    p->s.size += bp->s.size;
 777:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 77a:	a3 8c 0c 00 00       	mov    %eax,0xc8c
    p->s.size += bp->s.size;
 77f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 782:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 785:	89 08                	mov    %ecx,(%eax)
}
 787:	5b                   	pop    %ebx
 788:	5e                   	pop    %esi
 789:	5f                   	pop    %edi
 78a:	5d                   	pop    %ebp
 78b:	c3                   	ret
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000790 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 799:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 79c:	8b 15 8c 0c 00 00    	mov    0xc8c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a2:	8d 78 07             	lea    0x7(%eax),%edi
 7a5:	c1 ef 03             	shr    $0x3,%edi
 7a8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7ab:	85 d2                	test   %edx,%edx
 7ad:	0f 84 8d 00 00 00    	je     840 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7b5:	8b 48 04             	mov    0x4(%eax),%ecx
 7b8:	39 f9                	cmp    %edi,%ecx
 7ba:	73 64                	jae    820 <malloc+0x90>
  if(nu < 4096)
 7bc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7c1:	39 df                	cmp    %ebx,%edi
 7c3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7c6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7cd:	eb 0a                	jmp    7d9 <malloc+0x49>
 7cf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7d2:	8b 48 04             	mov    0x4(%eax),%ecx
 7d5:	39 f9                	cmp    %edi,%ecx
 7d7:	73 47                	jae    820 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7d9:	89 c2                	mov    %eax,%edx
 7db:	3b 05 8c 0c 00 00    	cmp    0xc8c,%eax
 7e1:	75 ed                	jne    7d0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 7e3:	83 ec 0c             	sub    $0xc,%esp
 7e6:	56                   	push   %esi
 7e7:	e8 b6 fc ff ff       	call   4a2 <sbrk>
  if(p == (char*)-1)
 7ec:	83 c4 10             	add    $0x10,%esp
 7ef:	83 f8 ff             	cmp    $0xffffffff,%eax
 7f2:	74 1c                	je     810 <malloc+0x80>
  hp->s.size = nu;
 7f4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7f7:	83 ec 0c             	sub    $0xc,%esp
 7fa:	83 c0 08             	add    $0x8,%eax
 7fd:	50                   	push   %eax
 7fe:	e8 fd fe ff ff       	call   700 <free>
  return freep;
 803:	8b 15 8c 0c 00 00    	mov    0xc8c,%edx
      if((p = morecore(nunits)) == 0)
 809:	83 c4 10             	add    $0x10,%esp
 80c:	85 d2                	test   %edx,%edx
 80e:	75 c0                	jne    7d0 <malloc+0x40>
        return 0;
  }
}
 810:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 813:	31 c0                	xor    %eax,%eax
}
 815:	5b                   	pop    %ebx
 816:	5e                   	pop    %esi
 817:	5f                   	pop    %edi
 818:	5d                   	pop    %ebp
 819:	c3                   	ret
 81a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 820:	39 cf                	cmp    %ecx,%edi
 822:	74 4c                	je     870 <malloc+0xe0>
        p->s.size -= nunits;
 824:	29 f9                	sub    %edi,%ecx
 826:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 829:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 82c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 82f:	89 15 8c 0c 00 00    	mov    %edx,0xc8c
}
 835:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 838:	83 c0 08             	add    $0x8,%eax
}
 83b:	5b                   	pop    %ebx
 83c:	5e                   	pop    %esi
 83d:	5f                   	pop    %edi
 83e:	5d                   	pop    %ebp
 83f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 840:	c7 05 8c 0c 00 00 90 	movl   $0xc90,0xc8c
 847:	0c 00 00 
    base.s.size = 0;
 84a:	b8 90 0c 00 00       	mov    $0xc90,%eax
    base.s.ptr = freep = prevp = &base;
 84f:	c7 05 90 0c 00 00 90 	movl   $0xc90,0xc90
 856:	0c 00 00 
    base.s.size = 0;
 859:	c7 05 94 0c 00 00 00 	movl   $0x0,0xc94
 860:	00 00 00 
    if(p->s.size >= nunits){
 863:	e9 54 ff ff ff       	jmp    7bc <malloc+0x2c>
 868:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 86f:	00 
        prevp->s.ptr = p->s.ptr;
 870:	8b 08                	mov    (%eax),%ecx
 872:	89 0a                	mov    %ecx,(%edx)
 874:	eb b9                	jmp    82f <malloc+0x9f>
