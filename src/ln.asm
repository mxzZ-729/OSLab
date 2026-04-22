
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  if(argc != 3){
   f:	83 39 03             	cmpl   $0x3,(%ecx)
{
  12:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  15:	74 13                	je     2a <main+0x2a>
    printf(2, "Usage: ln old new\n");
  17:	52                   	push   %edx
  18:	52                   	push   %edx
  19:	68 f8 07 00 00       	push   $0x7f8
  1e:	6a 02                	push   $0x2
  20:	e8 cb 04 00 00       	call   4f0 <printf>
    exit();
  25:	e8 70 03 00 00       	call   39a <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2a:	50                   	push   %eax
  2b:	50                   	push   %eax
  2c:	ff 73 08             	push   0x8(%ebx)
  2f:	ff 73 04             	push   0x4(%ebx)
  32:	e8 c3 03 00 00       	call   3fa <link>
  37:	83 c4 10             	add    $0x10,%esp
  3a:	85 c0                	test   %eax,%eax
  3c:	78 05                	js     43 <main+0x43>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  3e:	e8 57 03 00 00       	call   39a <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  43:	ff 73 08             	push   0x8(%ebx)
  46:	ff 73 04             	push   0x4(%ebx)
  49:	68 0b 08 00 00       	push   $0x80b
  4e:	6a 02                	push   $0x2
  50:	e8 9b 04 00 00       	call   4f0 <printf>
  55:	83 c4 10             	add    $0x10,%esp
  58:	eb e4                	jmp    3e <main+0x3e>
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
  60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  61:	31 c0                	xor    %eax,%eax
{
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  81:	89 c8                	mov    %ecx,%eax
  83:	c9                   	leave
  84:	c3                   	ret
  85:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  8c:	00 
  8d:	8d 76 00             	lea    0x0(%esi),%esi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 55 08             	mov    0x8(%ebp),%edx
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9a:	0f b6 02             	movzbl (%edx),%eax
  9d:	84 c0                	test   %al,%al
  9f:	75 17                	jne    b8 <strcmp+0x28>
  a1:	eb 3a                	jmp    dd <strcmp+0x4d>
  a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  ac:	83 c2 01             	add    $0x1,%edx
  af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  b2:	84 c0                	test   %al,%al
  b4:	74 1a                	je     d0 <strcmp+0x40>
  b6:	89 d9                	mov    %ebx,%ecx
  b8:	0f b6 19             	movzbl (%ecx),%ebx
  bb:	38 c3                	cmp    %al,%bl
  bd:	74 e9                	je     a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  bf:	29 d8                	sub    %ebx,%eax
}
  c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c4:	c9                   	leave
  c5:	c3                   	ret
  c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  cd:	00 
  ce:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
  d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  d4:	31 c0                	xor    %eax,%eax
  d6:	29 d8                	sub    %ebx,%eax
}
  d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  db:	c9                   	leave
  dc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
  dd:	0f b6 19             	movzbl (%ecx),%ebx
  e0:	31 c0                	xor    %eax,%eax
  e2:	eb db                	jmp    bf <strcmp+0x2f>
  e4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  eb:	00 
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 3a 00             	cmpb   $0x0,(%edx)
  f9:	74 15                	je     110 <strlen+0x20>
  fb:	31 c0                	xor    %eax,%eax
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c0 01             	add    $0x1,%eax
 103:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 107:	89 c1                	mov    %eax,%ecx
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	89 c8                	mov    %ecx,%eax
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret
 10f:	90                   	nop
  for(n = 0; s[n]; n++)
 110:	31 c9                	xor    %ecx,%ecx
}
 112:	5d                   	pop    %ebp
 113:	89 c8                	mov    %ecx,%eax
 115:	c3                   	ret
 116:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 11d:	00 
 11e:	66 90                	xchg   %ax,%ax

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	8b 7d fc             	mov    -0x4(%ebp),%edi
 135:	89 d0                	mov    %edx,%eax
 137:	c9                   	leave
 138:	c3                   	ret
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	75 12                	jne    163 <strchr+0x23>
 151:	eb 1d                	jmp    170 <strchr+0x30>
 153:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 15c:	83 c0 01             	add    $0x1,%eax
 15f:	84 d2                	test   %dl,%dl
 161:	74 0d                	je     170 <strchr+0x30>
    if(*s == c)
 163:	38 d1                	cmp    %dl,%cl
 165:	75 f1                	jne    158 <strchr+0x18>
      return (char*)s;
  return 0;
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 170:	31 c0                	xor    %eax,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret
 174:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17b:	00 
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 185:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 188:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 189:	31 db                	xor    %ebx,%ebx
{
 18b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 18e:	eb 27                	jmp    1b7 <gets+0x37>
    cc = read(0, &c, 1);
 190:	83 ec 04             	sub    $0x4,%esp
 193:	6a 01                	push   $0x1
 195:	56                   	push   %esi
 196:	6a 00                	push   $0x0
 198:	e8 15 02 00 00       	call   3b2 <read>
    if(cc < 1)
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	85 c0                	test   %eax,%eax
 1a2:	7e 1d                	jle    1c1 <gets+0x41>
      break;
    buf[i++] = c;
 1a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a8:	8b 55 08             	mov    0x8(%ebp),%edx
 1ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1af:	3c 0a                	cmp    $0xa,%al
 1b1:	74 10                	je     1c3 <gets+0x43>
 1b3:	3c 0d                	cmp    $0xd,%al
 1b5:	74 0c                	je     1c3 <gets+0x43>
  for(i=0; i+1 < max; ){
 1b7:	89 df                	mov    %ebx,%edi
 1b9:	83 c3 01             	add    $0x1,%ebx
 1bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1bf:	7c cf                	jl     190 <gets+0x10>
 1c1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
 1c6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 1ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cd:	5b                   	pop    %ebx
 1ce:	5e                   	pop    %esi
 1cf:	5f                   	pop    %edi
 1d0:	5d                   	pop    %ebp
 1d1:	c3                   	ret
 1d2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1d9:	00 
 1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e5:	83 ec 08             	sub    $0x8,%esp
 1e8:	6a 00                	push   $0x0
 1ea:	ff 75 08             	push   0x8(%ebp)
 1ed:	e8 e8 01 00 00       	call   3da <open>
  if(fd < 0)
 1f2:	83 c4 10             	add    $0x10,%esp
 1f5:	85 c0                	test   %eax,%eax
 1f7:	78 27                	js     220 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1f9:	83 ec 08             	sub    $0x8,%esp
 1fc:	ff 75 0c             	push   0xc(%ebp)
 1ff:	89 c3                	mov    %eax,%ebx
 201:	50                   	push   %eax
 202:	e8 eb 01 00 00       	call   3f2 <fstat>
  close(fd);
 207:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 20a:	89 c6                	mov    %eax,%esi
  close(fd);
 20c:	e8 b1 01 00 00       	call   3c2 <close>
  return r;
 211:	83 c4 10             	add    $0x10,%esp
}
 214:	8d 65 f8             	lea    -0x8(%ebp),%esp
 217:	89 f0                	mov    %esi,%eax
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret
 21d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 220:	be ff ff ff ff       	mov    $0xffffffff,%esi
 225:	eb ed                	jmp    214 <stat+0x34>
 227:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 22e:	00 
 22f:	90                   	nop

00000230 <atoi>:

int
atoi(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	53                   	push   %ebx
 234:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 237:	0f be 02             	movsbl (%edx),%eax
 23a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 23d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 240:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 245:	77 1e                	ja     265 <atoi+0x35>
 247:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 24e:	00 
 24f:	90                   	nop
    n = n*10 + *s++ - '0';
 250:	83 c2 01             	add    $0x1,%edx
 253:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 256:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 25a:	0f be 02             	movsbl (%edx),%eax
 25d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 260:	80 fb 09             	cmp    $0x9,%bl
 263:	76 eb                	jbe    250 <atoi+0x20>
  return n;
}
 265:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 268:	89 c8                	mov    %ecx,%eax
 26a:	c9                   	leave
 26b:	c3                   	ret
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	8b 45 10             	mov    0x10(%ebp),%eax
 277:	8b 55 08             	mov    0x8(%ebp),%edx
 27a:	56                   	push   %esi
 27b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 27e:	85 c0                	test   %eax,%eax
 280:	7e 13                	jle    295 <memmove+0x25>
 282:	01 d0                	add    %edx,%eax
  dst = vdst;
 284:	89 d7                	mov    %edx,%edi
 286:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 28d:	00 
 28e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 290:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 291:	39 f8                	cmp    %edi,%eax
 293:	75 fb                	jne    290 <memmove+0x20>
  return vdst;
}
 295:	5e                   	pop    %esi
 296:	89 d0                	mov    %edx,%eax
 298:	5f                   	pop    %edi
 299:	5d                   	pop    %ebp
 29a:	c3                   	ret
 29b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000002a0 <thread_create>:

int
thread_create(void(*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	53                   	push   %ebx
 2a4:	83 ec 10             	sub    $0x10,%esp
  int pid;
  void *raw;
  void *stack;

  raw = malloc(PGSIZE * 2);
 2a7:	68 00 20 00 00       	push   $0x2000
 2ac:	e8 5f 04 00 00       	call   710 <malloc>
  if (raw == 0) {
 2b1:	83 c4 10             	add    $0x10,%esp
 2b4:	85 c0                	test   %eax,%eax
 2b6:	74 37                	je     2ef <thread_create+0x4f>
 2b8:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  stack = (void *)(((uint)raw + sizeof(void *) + PGSIZE - 1) & ~(PGSIZE - 1));
 2ba:	8d 80 03 10 00 00    	lea    0x1003(%eax),%eax
 2c0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  ((void **)stack)[-1] = raw;
 2c5:	89 58 fc             	mov    %ebx,-0x4(%eax)

  pid = clone(start_routine, arg1, arg2, stack);
 2c8:	50                   	push   %eax
 2c9:	ff 75 10             	push   0x10(%ebp)
 2cc:	ff 75 0c             	push   0xc(%ebp)
 2cf:	ff 75 08             	push   0x8(%ebp)
 2d2:	e8 63 01 00 00       	call   43a <clone>
  if (pid < 0) {
 2d7:	83 c4 10             	add    $0x10,%esp
 2da:	85 c0                	test   %eax,%eax
 2dc:	78 05                	js     2e3 <thread_create+0x43>
    free(raw);
    return -1;
  }
  return pid;
}
 2de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e1:	c9                   	leave
 2e2:	c3                   	ret
    free(raw);
 2e3:	83 ec 0c             	sub    $0xc,%esp
 2e6:	53                   	push   %ebx
 2e7:	e8 94 03 00 00       	call   680 <free>
    return -1;
 2ec:	83 c4 10             	add    $0x10,%esp
    return -1;
 2ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2f4:	eb e8                	jmp    2de <thread_create+0x3e>
 2f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2fd:	00 
 2fe:	66 90                	xchg   %ax,%ax

00000300 <thread_join>:

int
thread_join(void) 
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	53                   	push   %ebx
  int pid;
  void *raw;
  void *stack;

  pid = join(&stack);
 304:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 307:	83 ec 20             	sub    $0x20,%esp
  pid = join(&stack);
 30a:	50                   	push   %eax
 30b:	e8 32 01 00 00       	call   442 <join>
  if (pid < 0) {
 310:	83 c4 10             	add    $0x10,%esp
 313:	85 c0                	test   %eax,%eax
 315:	78 21                	js     338 <thread_join+0x38>
 317:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  raw = ((void **)stack)[-1];
 319:	8b 45 f4             	mov    -0xc(%ebp),%eax
  free(raw);
 31c:	83 ec 0c             	sub    $0xc,%esp
 31f:	ff 70 fc             	push   -0x4(%eax)
 322:	e8 59 03 00 00       	call   680 <free>
  return pid;
 327:	83 c4 10             	add    $0x10,%esp
}
 32a:	89 d8                	mov    %ebx,%eax
 32c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 32f:	c9                   	leave
 330:	c3                   	ret
 331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 338:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 33d:	eb eb                	jmp    32a <thread_join+0x2a>
 33f:	90                   	nop

00000340 <lock_init>:
  return value;
}

void 
lock_init(lock_t *lock)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 346:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 34c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 353:	5d                   	pop    %ebp
 354:	c3                   	ret
 355:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 35c:	00 
 35d:	8d 76 00             	lea    0x0(%esi),%esi

00000360 <lock_acquire>:

void
lock_acquire(lock_t *lock)
{
 360:	55                   	push   %ebp
  asm volatile (
 361:	ba 01 00 00 00       	mov    $0x1,%edx
{
 366:	89 e5                	mov    %esp,%ebp
 368:	8b 4d 08             	mov    0x8(%ebp),%ecx
  asm volatile (
 36b:	f0 0f c1 11          	lock xadd %edx,(%ecx)
  int myturn = fetch_and_add(&lock->ticket, 1);
  while (myturn != lock->turn);
 36f:	90                   	nop
 370:	8b 41 04             	mov    0x4(%ecx),%eax
 373:	39 d0                	cmp    %edx,%eax
 375:	75 f9                	jne    370 <lock_acquire+0x10>
}
 377:	5d                   	pop    %ebp
 378:	c3                   	ret
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000380 <lock_release>:

void 
lock_release(lock_t *lock)
{
 380:	55                   	push   %ebp
  asm volatile (
 381:	b8 01 00 00 00       	mov    $0x1,%eax
{
 386:	89 e5                	mov    %esp,%ebp
 388:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile (
 38b:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  fetch_and_add(&lock->turn, 1);
 390:	5d                   	pop    %ebp
 391:	c3                   	ret

00000392 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 392:	b8 01 00 00 00       	mov    $0x1,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret

0000039a <exit>:
SYSCALL(exit)
 39a:	b8 02 00 00 00       	mov    $0x2,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret

000003a2 <wait>:
SYSCALL(wait)
 3a2:	b8 03 00 00 00       	mov    $0x3,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret

000003aa <pipe>:
SYSCALL(pipe)
 3aa:	b8 04 00 00 00       	mov    $0x4,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret

000003b2 <read>:
SYSCALL(read)
 3b2:	b8 05 00 00 00       	mov    $0x5,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret

000003ba <write>:
SYSCALL(write)
 3ba:	b8 10 00 00 00       	mov    $0x10,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret

000003c2 <close>:
SYSCALL(close)
 3c2:	b8 15 00 00 00       	mov    $0x15,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret

000003ca <kill>:
SYSCALL(kill)
 3ca:	b8 06 00 00 00       	mov    $0x6,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret

000003d2 <exec>:
SYSCALL(exec)
 3d2:	b8 07 00 00 00       	mov    $0x7,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret

000003da <open>:
SYSCALL(open)
 3da:	b8 0f 00 00 00       	mov    $0xf,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret

000003e2 <mknod>:
SYSCALL(mknod)
 3e2:	b8 11 00 00 00       	mov    $0x11,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret

000003ea <unlink>:
SYSCALL(unlink)
 3ea:	b8 12 00 00 00       	mov    $0x12,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret

000003f2 <fstat>:
SYSCALL(fstat)
 3f2:	b8 08 00 00 00       	mov    $0x8,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret

000003fa <link>:
SYSCALL(link)
 3fa:	b8 13 00 00 00       	mov    $0x13,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret

00000402 <mkdir>:
SYSCALL(mkdir)
 402:	b8 14 00 00 00       	mov    $0x14,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret

0000040a <chdir>:
SYSCALL(chdir)
 40a:	b8 09 00 00 00       	mov    $0x9,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret

00000412 <dup>:
SYSCALL(dup)
 412:	b8 0a 00 00 00       	mov    $0xa,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret

0000041a <getpid>:
SYSCALL(getpid)
 41a:	b8 0b 00 00 00       	mov    $0xb,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret

00000422 <sbrk>:
SYSCALL(sbrk)
 422:	b8 0c 00 00 00       	mov    $0xc,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret

0000042a <sleep>:
SYSCALL(sleep)
 42a:	b8 0d 00 00 00       	mov    $0xd,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret

00000432 <uptime>:
SYSCALL(uptime)
 432:	b8 0e 00 00 00       	mov    $0xe,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret

0000043a <clone>:
SYSCALL(clone)
 43a:	b8 16 00 00 00       	mov    $0x16,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret

00000442 <join>:
SYSCALL(join)
 442:	b8 17 00 00 00       	mov    $0x17,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret
 44a:	66 90                	xchg   %ax,%ax
 44c:	66 90                	xchg   %ax,%ax
 44e:	66 90                	xchg   %ax,%ax

00000450 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 458:	89 d1                	mov    %edx,%ecx
{
 45a:	83 ec 3c             	sub    $0x3c,%esp
 45d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 460:	85 d2                	test   %edx,%edx
 462:	0f 89 80 00 00 00    	jns    4e8 <printint+0x98>
 468:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 46c:	74 7a                	je     4e8 <printint+0x98>
    x = -xx;
 46e:	f7 d9                	neg    %ecx
    neg = 1;
 470:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 475:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 478:	31 f6                	xor    %esi,%esi
 47a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 480:	89 c8                	mov    %ecx,%eax
 482:	31 d2                	xor    %edx,%edx
 484:	89 f7                	mov    %esi,%edi
 486:	f7 f3                	div    %ebx
 488:	8d 76 01             	lea    0x1(%esi),%esi
 48b:	0f b6 92 80 08 00 00 	movzbl 0x880(%edx),%edx
 492:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 496:	89 ca                	mov    %ecx,%edx
 498:	89 c1                	mov    %eax,%ecx
 49a:	39 da                	cmp    %ebx,%edx
 49c:	73 e2                	jae    480 <printint+0x30>
  if(neg)
 49e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4a1:	85 c0                	test   %eax,%eax
 4a3:	74 07                	je     4ac <printint+0x5c>
    buf[i++] = '-';
 4a5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 4aa:	89 f7                	mov    %esi,%edi
 4ac:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 4af:	8b 75 c0             	mov    -0x40(%ebp),%esi
 4b2:	01 df                	add    %ebx,%edi
 4b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 4b8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 4bb:	83 ec 04             	sub    $0x4,%esp
 4be:	88 45 d7             	mov    %al,-0x29(%ebp)
 4c1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 4c4:	6a 01                	push   $0x1
 4c6:	50                   	push   %eax
 4c7:	56                   	push   %esi
 4c8:	e8 ed fe ff ff       	call   3ba <write>
  while(--i >= 0)
 4cd:	89 f8                	mov    %edi,%eax
 4cf:	83 c4 10             	add    $0x10,%esp
 4d2:	83 ef 01             	sub    $0x1,%edi
 4d5:	39 c3                	cmp    %eax,%ebx
 4d7:	75 df                	jne    4b8 <printint+0x68>
}
 4d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4dc:	5b                   	pop    %ebx
 4dd:	5e                   	pop    %esi
 4de:	5f                   	pop    %edi
 4df:	5d                   	pop    %ebp
 4e0:	c3                   	ret
 4e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4e8:	31 c0                	xor    %eax,%eax
 4ea:	eb 89                	jmp    475 <printint+0x25>
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4f9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 4fc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 4ff:	0f b6 1e             	movzbl (%esi),%ebx
 502:	83 c6 01             	add    $0x1,%esi
 505:	84 db                	test   %bl,%bl
 507:	74 67                	je     570 <printf+0x80>
 509:	8d 4d 10             	lea    0x10(%ebp),%ecx
 50c:	31 d2                	xor    %edx,%edx
 50e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 511:	eb 34                	jmp    547 <printf+0x57>
 513:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 518:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 51b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 520:	83 f8 25             	cmp    $0x25,%eax
 523:	74 18                	je     53d <printf+0x4d>
  write(fd, &c, 1);
 525:	83 ec 04             	sub    $0x4,%esp
 528:	8d 45 e7             	lea    -0x19(%ebp),%eax
 52b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 52e:	6a 01                	push   $0x1
 530:	50                   	push   %eax
 531:	57                   	push   %edi
 532:	e8 83 fe ff ff       	call   3ba <write>
 537:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 53a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 53d:	0f b6 1e             	movzbl (%esi),%ebx
 540:	83 c6 01             	add    $0x1,%esi
 543:	84 db                	test   %bl,%bl
 545:	74 29                	je     570 <printf+0x80>
    c = fmt[i] & 0xff;
 547:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 54a:	85 d2                	test   %edx,%edx
 54c:	74 ca                	je     518 <printf+0x28>
      }
    } else if(state == '%'){
 54e:	83 fa 25             	cmp    $0x25,%edx
 551:	75 ea                	jne    53d <printf+0x4d>
      if(c == 'd'){
 553:	83 f8 25             	cmp    $0x25,%eax
 556:	0f 84 04 01 00 00    	je     660 <printf+0x170>
 55c:	83 e8 63             	sub    $0x63,%eax
 55f:	83 f8 15             	cmp    $0x15,%eax
 562:	77 1c                	ja     580 <printf+0x90>
 564:	ff 24 85 28 08 00 00 	jmp    *0x828(,%eax,4)
 56b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 570:	8d 65 f4             	lea    -0xc(%ebp),%esp
 573:	5b                   	pop    %ebx
 574:	5e                   	pop    %esi
 575:	5f                   	pop    %edi
 576:	5d                   	pop    %ebp
 577:	c3                   	ret
 578:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 57f:	00 
  write(fd, &c, 1);
 580:	83 ec 04             	sub    $0x4,%esp
 583:	8d 55 e7             	lea    -0x19(%ebp),%edx
 586:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 58a:	6a 01                	push   $0x1
 58c:	52                   	push   %edx
 58d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 590:	57                   	push   %edi
 591:	e8 24 fe ff ff       	call   3ba <write>
 596:	83 c4 0c             	add    $0xc,%esp
 599:	88 5d e7             	mov    %bl,-0x19(%ebp)
 59c:	6a 01                	push   $0x1
 59e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5a1:	52                   	push   %edx
 5a2:	57                   	push   %edi
 5a3:	e8 12 fe ff ff       	call   3ba <write>
        putc(fd, c);
 5a8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5ab:	31 d2                	xor    %edx,%edx
 5ad:	eb 8e                	jmp    53d <printf+0x4d>
 5af:	90                   	nop
        printint(fd, *ap, 16, 0);
 5b0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5b3:	83 ec 0c             	sub    $0xc,%esp
 5b6:	b9 10 00 00 00       	mov    $0x10,%ecx
 5bb:	8b 13                	mov    (%ebx),%edx
 5bd:	6a 00                	push   $0x0
 5bf:	89 f8                	mov    %edi,%eax
        ap++;
 5c1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 5c4:	e8 87 fe ff ff       	call   450 <printint>
        ap++;
 5c9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5cc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5cf:	31 d2                	xor    %edx,%edx
 5d1:	e9 67 ff ff ff       	jmp    53d <printf+0x4d>
        s = (char*)*ap;
 5d6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5d9:	8b 18                	mov    (%eax),%ebx
        ap++;
 5db:	83 c0 04             	add    $0x4,%eax
 5de:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5e1:	85 db                	test   %ebx,%ebx
 5e3:	0f 84 87 00 00 00    	je     670 <printf+0x180>
        while(*s != 0){
 5e9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 5ec:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 5ee:	84 c0                	test   %al,%al
 5f0:	0f 84 47 ff ff ff    	je     53d <printf+0x4d>
 5f6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5f9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5fc:	89 de                	mov    %ebx,%esi
 5fe:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 600:	83 ec 04             	sub    $0x4,%esp
 603:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 606:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 609:	6a 01                	push   $0x1
 60b:	53                   	push   %ebx
 60c:	57                   	push   %edi
 60d:	e8 a8 fd ff ff       	call   3ba <write>
        while(*s != 0){
 612:	0f b6 06             	movzbl (%esi),%eax
 615:	83 c4 10             	add    $0x10,%esp
 618:	84 c0                	test   %al,%al
 61a:	75 e4                	jne    600 <printf+0x110>
      state = 0;
 61c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 61f:	31 d2                	xor    %edx,%edx
 621:	e9 17 ff ff ff       	jmp    53d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 626:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 629:	83 ec 0c             	sub    $0xc,%esp
 62c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 631:	8b 13                	mov    (%ebx),%edx
 633:	6a 01                	push   $0x1
 635:	eb 88                	jmp    5bf <printf+0xcf>
        putc(fd, *ap);
 637:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 63a:	83 ec 04             	sub    $0x4,%esp
 63d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 640:	8b 03                	mov    (%ebx),%eax
        ap++;
 642:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 645:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 648:	6a 01                	push   $0x1
 64a:	52                   	push   %edx
 64b:	57                   	push   %edi
 64c:	e8 69 fd ff ff       	call   3ba <write>
        ap++;
 651:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 654:	83 c4 10             	add    $0x10,%esp
      state = 0;
 657:	31 d2                	xor    %edx,%edx
 659:	e9 df fe ff ff       	jmp    53d <printf+0x4d>
 65e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 660:	83 ec 04             	sub    $0x4,%esp
 663:	88 5d e7             	mov    %bl,-0x19(%ebp)
 666:	8d 55 e7             	lea    -0x19(%ebp),%edx
 669:	6a 01                	push   $0x1
 66b:	e9 31 ff ff ff       	jmp    5a1 <printf+0xb1>
 670:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 675:	bb 1f 08 00 00       	mov    $0x81f,%ebx
 67a:	e9 77 ff ff ff       	jmp    5f6 <printf+0x106>
 67f:	90                   	nop

00000680 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 680:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 681:	a1 d0 0b 00 00       	mov    0xbd0,%eax
{
 686:	89 e5                	mov    %esp,%ebp
 688:	57                   	push   %edi
 689:	56                   	push   %esi
 68a:	53                   	push   %ebx
 68b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 68e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 698:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 69a:	39 c8                	cmp    %ecx,%eax
 69c:	73 32                	jae    6d0 <free+0x50>
 69e:	39 d1                	cmp    %edx,%ecx
 6a0:	72 04                	jb     6a6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a2:	39 d0                	cmp    %edx,%eax
 6a4:	72 32                	jb     6d8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6a9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ac:	39 fa                	cmp    %edi,%edx
 6ae:	74 30                	je     6e0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6b0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6b3:	8b 50 04             	mov    0x4(%eax),%edx
 6b6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6b9:	39 f1                	cmp    %esi,%ecx
 6bb:	74 3a                	je     6f7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6bd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6bf:	5b                   	pop    %ebx
  freep = p;
 6c0:	a3 d0 0b 00 00       	mov    %eax,0xbd0
}
 6c5:	5e                   	pop    %esi
 6c6:	5f                   	pop    %edi
 6c7:	5d                   	pop    %ebp
 6c8:	c3                   	ret
 6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d0:	39 d0                	cmp    %edx,%eax
 6d2:	72 04                	jb     6d8 <free+0x58>
 6d4:	39 d1                	cmp    %edx,%ecx
 6d6:	72 ce                	jb     6a6 <free+0x26>
{
 6d8:	89 d0                	mov    %edx,%eax
 6da:	eb bc                	jmp    698 <free+0x18>
 6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6e0:	03 72 04             	add    0x4(%edx),%esi
 6e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6e6:	8b 10                	mov    (%eax),%edx
 6e8:	8b 12                	mov    (%edx),%edx
 6ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6ed:	8b 50 04             	mov    0x4(%eax),%edx
 6f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6f3:	39 f1                	cmp    %esi,%ecx
 6f5:	75 c6                	jne    6bd <free+0x3d>
    p->s.size += bp->s.size;
 6f7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 6fa:	a3 d0 0b 00 00       	mov    %eax,0xbd0
    p->s.size += bp->s.size;
 6ff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 702:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 705:	89 08                	mov    %ecx,(%eax)
}
 707:	5b                   	pop    %ebx
 708:	5e                   	pop    %esi
 709:	5f                   	pop    %edi
 70a:	5d                   	pop    %ebp
 70b:	c3                   	ret
 70c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000710 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	57                   	push   %edi
 714:	56                   	push   %esi
 715:	53                   	push   %ebx
 716:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 719:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 71c:	8b 15 d0 0b 00 00    	mov    0xbd0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 722:	8d 78 07             	lea    0x7(%eax),%edi
 725:	c1 ef 03             	shr    $0x3,%edi
 728:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 72b:	85 d2                	test   %edx,%edx
 72d:	0f 84 8d 00 00 00    	je     7c0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 733:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 735:	8b 48 04             	mov    0x4(%eax),%ecx
 738:	39 f9                	cmp    %edi,%ecx
 73a:	73 64                	jae    7a0 <malloc+0x90>
  if(nu < 4096)
 73c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 741:	39 df                	cmp    %ebx,%edi
 743:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 746:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 74d:	eb 0a                	jmp    759 <malloc+0x49>
 74f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 750:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 752:	8b 48 04             	mov    0x4(%eax),%ecx
 755:	39 f9                	cmp    %edi,%ecx
 757:	73 47                	jae    7a0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 759:	89 c2                	mov    %eax,%edx
 75b:	3b 05 d0 0b 00 00    	cmp    0xbd0,%eax
 761:	75 ed                	jne    750 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 763:	83 ec 0c             	sub    $0xc,%esp
 766:	56                   	push   %esi
 767:	e8 b6 fc ff ff       	call   422 <sbrk>
  if(p == (char*)-1)
 76c:	83 c4 10             	add    $0x10,%esp
 76f:	83 f8 ff             	cmp    $0xffffffff,%eax
 772:	74 1c                	je     790 <malloc+0x80>
  hp->s.size = nu;
 774:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 777:	83 ec 0c             	sub    $0xc,%esp
 77a:	83 c0 08             	add    $0x8,%eax
 77d:	50                   	push   %eax
 77e:	e8 fd fe ff ff       	call   680 <free>
  return freep;
 783:	8b 15 d0 0b 00 00    	mov    0xbd0,%edx
      if((p = morecore(nunits)) == 0)
 789:	83 c4 10             	add    $0x10,%esp
 78c:	85 d2                	test   %edx,%edx
 78e:	75 c0                	jne    750 <malloc+0x40>
        return 0;
  }
}
 790:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 793:	31 c0                	xor    %eax,%eax
}
 795:	5b                   	pop    %ebx
 796:	5e                   	pop    %esi
 797:	5f                   	pop    %edi
 798:	5d                   	pop    %ebp
 799:	c3                   	ret
 79a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7a0:	39 cf                	cmp    %ecx,%edi
 7a2:	74 4c                	je     7f0 <malloc+0xe0>
        p->s.size -= nunits;
 7a4:	29 f9                	sub    %edi,%ecx
 7a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7ac:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 7af:	89 15 d0 0b 00 00    	mov    %edx,0xbd0
}
 7b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7b8:	83 c0 08             	add    $0x8,%eax
}
 7bb:	5b                   	pop    %ebx
 7bc:	5e                   	pop    %esi
 7bd:	5f                   	pop    %edi
 7be:	5d                   	pop    %ebp
 7bf:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 7c0:	c7 05 d0 0b 00 00 d4 	movl   $0xbd4,0xbd0
 7c7:	0b 00 00 
    base.s.size = 0;
 7ca:	b8 d4 0b 00 00       	mov    $0xbd4,%eax
    base.s.ptr = freep = prevp = &base;
 7cf:	c7 05 d4 0b 00 00 d4 	movl   $0xbd4,0xbd4
 7d6:	0b 00 00 
    base.s.size = 0;
 7d9:	c7 05 d8 0b 00 00 00 	movl   $0x0,0xbd8
 7e0:	00 00 00 
    if(p->s.size >= nunits){
 7e3:	e9 54 ff ff ff       	jmp    73c <malloc+0x2c>
 7e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7ef:	00 
        prevp->s.ptr = p->s.ptr;
 7f0:	8b 08                	mov    (%eax),%ecx
 7f2:	89 0a                	mov    %ecx,(%edx)
 7f4:	eb b9                	jmp    7af <malloc+0x9f>
