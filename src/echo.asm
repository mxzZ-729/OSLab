
_echo:     file format elf32-i386


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
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 47                	jle    65 <main+0x65>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  1e:	8b 47 04             	mov    0x4(%edi),%eax
  21:	83 fe 02             	cmp    $0x2,%esi
  24:	74 2a                	je     50 <main+0x50>
  26:	bb 02 00 00 00       	mov    $0x2,%ebx
  2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  30:	68 08 08 00 00       	push   $0x808
  35:	83 c3 01             	add    $0x1,%ebx
  38:	50                   	push   %eax
  39:	68 0a 08 00 00       	push   $0x80a
  3e:	6a 01                	push   $0x1
  40:	e8 bb 04 00 00       	call   500 <printf>
  45:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  49:	83 c4 10             	add    $0x10,%esp
  4c:	39 de                	cmp    %ebx,%esi
  4e:	75 e0                	jne    30 <main+0x30>
  50:	68 0f 08 00 00       	push   $0x80f
  55:	50                   	push   %eax
  56:	68 0a 08 00 00       	push   $0x80a
  5b:	6a 01                	push   $0x1
  5d:	e8 9e 04 00 00       	call   500 <printf>
  62:	83 c4 10             	add    $0x10,%esp
  exit();
  65:	e8 40 03 00 00       	call   3aa <exit>
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
  70:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  71:	31 c0                	xor    %eax,%eax
{
  73:	89 e5                	mov    %esp,%ebp
  75:	53                   	push   %ebx
  76:	8b 4d 08             	mov    0x8(%ebp),%ecx
  79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  87:	83 c0 01             	add    $0x1,%eax
  8a:	84 d2                	test   %dl,%dl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  91:	89 c8                	mov    %ecx,%eax
  93:	c9                   	leave
  94:	c3                   	ret
  95:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  9c:	00 
  9d:	8d 76 00             	lea    0x0(%esi),%esi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 55 08             	mov    0x8(%ebp),%edx
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  aa:	0f b6 02             	movzbl (%edx),%eax
  ad:	84 c0                	test   %al,%al
  af:	75 17                	jne    c8 <strcmp+0x28>
  b1:	eb 3a                	jmp    ed <strcmp+0x4d>
  b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  bc:	83 c2 01             	add    $0x1,%edx
  bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  c2:	84 c0                	test   %al,%al
  c4:	74 1a                	je     e0 <strcmp+0x40>
  c6:	89 d9                	mov    %ebx,%ecx
  c8:	0f b6 19             	movzbl (%ecx),%ebx
  cb:	38 c3                	cmp    %al,%bl
  cd:	74 e9                	je     b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  cf:	29 d8                	sub    %ebx,%eax
}
  d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d4:	c9                   	leave
  d5:	c3                   	ret
  d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  dd:	00 
  de:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
  e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  e4:	31 c0                	xor    %eax,%eax
  e6:	29 d8                	sub    %ebx,%eax
}
  e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  eb:	c9                   	leave
  ec:	c3                   	ret
  return (uchar)*p - (uchar)*q;
  ed:	0f b6 19             	movzbl (%ecx),%ebx
  f0:	31 c0                	xor    %eax,%eax
  f2:	eb db                	jmp    cf <strcmp+0x2f>
  f4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  fb:	00 
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 3a 00             	cmpb   $0x0,(%edx)
 109:	74 15                	je     120 <strlen+0x20>
 10b:	31 c0                	xor    %eax,%eax
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c0 01             	add    $0x1,%eax
 113:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 117:	89 c1                	mov    %eax,%ecx
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	89 c8                	mov    %ecx,%eax
 11d:	5d                   	pop    %ebp
 11e:	c3                   	ret
 11f:	90                   	nop
  for(n = 0; s[n]; n++)
 120:	31 c9                	xor    %ecx,%ecx
}
 122:	5d                   	pop    %ebp
 123:	89 c8                	mov    %ecx,%eax
 125:	c3                   	ret
 126:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 12d:	00 
 12e:	66 90                	xchg   %ax,%ax

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	8b 7d fc             	mov    -0x4(%ebp),%edi
 145:	89 d0                	mov    %edx,%eax
 147:	c9                   	leave
 148:	c3                   	ret
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	75 12                	jne    173 <strchr+0x23>
 161:	eb 1d                	jmp    180 <strchr+0x30>
 163:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 168:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 16c:	83 c0 01             	add    $0x1,%eax
 16f:	84 d2                	test   %dl,%dl
 171:	74 0d                	je     180 <strchr+0x30>
    if(*s == c)
 173:	38 d1                	cmp    %dl,%cl
 175:	75 f1                	jne    168 <strchr+0x18>
      return (char*)s;
  return 0;
}
 177:	5d                   	pop    %ebp
 178:	c3                   	ret
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 180:	31 c0                	xor    %eax,%eax
}
 182:	5d                   	pop    %ebp
 183:	c3                   	ret
 184:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 18b:	00 
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 195:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 198:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 199:	31 db                	xor    %ebx,%ebx
{
 19b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 19e:	eb 27                	jmp    1c7 <gets+0x37>
    cc = read(0, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	6a 01                	push   $0x1
 1a5:	56                   	push   %esi
 1a6:	6a 00                	push   $0x0
 1a8:	e8 15 02 00 00       	call   3c2 <read>
    if(cc < 1)
 1ad:	83 c4 10             	add    $0x10,%esp
 1b0:	85 c0                	test   %eax,%eax
 1b2:	7e 1d                	jle    1d1 <gets+0x41>
      break;
    buf[i++] = c;
 1b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
 1bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1bf:	3c 0a                	cmp    $0xa,%al
 1c1:	74 10                	je     1d3 <gets+0x43>
 1c3:	3c 0d                	cmp    $0xd,%al
 1c5:	74 0c                	je     1d3 <gets+0x43>
  for(i=0; i+1 < max; ){
 1c7:	89 df                	mov    %ebx,%edi
 1c9:	83 c3 01             	add    $0x1,%ebx
 1cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1cf:	7c cf                	jl     1a0 <gets+0x10>
 1d1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 1da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1dd:	5b                   	pop    %ebx
 1de:	5e                   	pop    %esi
 1df:	5f                   	pop    %edi
 1e0:	5d                   	pop    %ebp
 1e1:	c3                   	ret
 1e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1e9:	00 
 1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	push   0x8(%ebp)
 1fd:	e8 e8 01 00 00       	call   3ea <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	push   0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 eb 01 00 00       	call   402 <fstat>
  close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
  close(fd);
 21c:	e8 b1 01 00 00       	call   3d2 <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23e:	00 
 23f:	90                   	nop

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 02             	movsbl (%edx),%eax
 24a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 24d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 250:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 255:	77 1e                	ja     275 <atoi+0x35>
 257:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 25e:	00 
 25f:	90                   	nop
    n = n*10 + *s++ - '0';
 260:	83 c2 01             	add    $0x1,%edx
 263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 266:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 26a:	0f be 02             	movsbl (%edx),%eax
 26d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 278:	89 c8                	mov    %ecx,%eax
 27a:	c9                   	leave
 27b:	c3                   	ret
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 45 10             	mov    0x10(%ebp),%eax
 287:	8b 55 08             	mov    0x8(%ebp),%edx
 28a:	56                   	push   %esi
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 c0                	test   %eax,%eax
 290:	7e 13                	jle    2a5 <memmove+0x25>
 292:	01 d0                	add    %edx,%eax
  dst = vdst;
 294:	89 d7                	mov    %edx,%edi
 296:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 29d:	00 
 29e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 2a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2a1:	39 f8                	cmp    %edi,%eax
 2a3:	75 fb                	jne    2a0 <memmove+0x20>
  return vdst;
}
 2a5:	5e                   	pop    %esi
 2a6:	89 d0                	mov    %edx,%eax
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret
 2ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000002b0 <thread_create>:

int
thread_create(void(*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	53                   	push   %ebx
 2b4:	83 ec 10             	sub    $0x10,%esp
  int pid;
  void *raw;
  void *stack;

  raw = malloc(PGSIZE * 2);
 2b7:	68 00 20 00 00       	push   $0x2000
 2bc:	e8 5f 04 00 00       	call   720 <malloc>
  if (raw == 0) {
 2c1:	83 c4 10             	add    $0x10,%esp
 2c4:	85 c0                	test   %eax,%eax
 2c6:	74 37                	je     2ff <thread_create+0x4f>
 2c8:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  stack = (void *)(((uint)raw + sizeof(void *) + PGSIZE - 1) & ~(PGSIZE - 1));
 2ca:	8d 80 03 10 00 00    	lea    0x1003(%eax),%eax
 2d0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  ((void **)stack)[-1] = raw;
 2d5:	89 58 fc             	mov    %ebx,-0x4(%eax)

  pid = clone(start_routine, arg1, arg2, stack);
 2d8:	50                   	push   %eax
 2d9:	ff 75 10             	push   0x10(%ebp)
 2dc:	ff 75 0c             	push   0xc(%ebp)
 2df:	ff 75 08             	push   0x8(%ebp)
 2e2:	e8 63 01 00 00       	call   44a <clone>
  if (pid < 0) {
 2e7:	83 c4 10             	add    $0x10,%esp
 2ea:	85 c0                	test   %eax,%eax
 2ec:	78 05                	js     2f3 <thread_create+0x43>
    free(raw);
    return -1;
  }
  return pid;
}
 2ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f1:	c9                   	leave
 2f2:	c3                   	ret
    free(raw);
 2f3:	83 ec 0c             	sub    $0xc,%esp
 2f6:	53                   	push   %ebx
 2f7:	e8 94 03 00 00       	call   690 <free>
    return -1;
 2fc:	83 c4 10             	add    $0x10,%esp
    return -1;
 2ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 304:	eb e8                	jmp    2ee <thread_create+0x3e>
 306:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 30d:	00 
 30e:	66 90                	xchg   %ax,%ax

00000310 <thread_join>:

int
thread_join(void) 
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	53                   	push   %ebx
  int pid;
  void *raw;
  void *stack;

  pid = join(&stack);
 314:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 317:	83 ec 20             	sub    $0x20,%esp
  pid = join(&stack);
 31a:	50                   	push   %eax
 31b:	e8 32 01 00 00       	call   452 <join>
  if (pid < 0) {
 320:	83 c4 10             	add    $0x10,%esp
 323:	85 c0                	test   %eax,%eax
 325:	78 21                	js     348 <thread_join+0x38>
 327:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  raw = ((void **)stack)[-1];
 329:	8b 45 f4             	mov    -0xc(%ebp),%eax
  free(raw);
 32c:	83 ec 0c             	sub    $0xc,%esp
 32f:	ff 70 fc             	push   -0x4(%eax)
 332:	e8 59 03 00 00       	call   690 <free>
  return pid;
 337:	83 c4 10             	add    $0x10,%esp
}
 33a:	89 d8                	mov    %ebx,%eax
 33c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 33f:	c9                   	leave
 340:	c3                   	ret
 341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 348:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 34d:	eb eb                	jmp    33a <thread_join+0x2a>
 34f:	90                   	nop

00000350 <lock_init>:
  return value;
}

void 
lock_init(lock_t *lock)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 356:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 35c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 363:	5d                   	pop    %ebp
 364:	c3                   	ret
 365:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 36c:	00 
 36d:	8d 76 00             	lea    0x0(%esi),%esi

00000370 <lock_acquire>:

void
lock_acquire(lock_t *lock)
{
 370:	55                   	push   %ebp
  asm volatile (
 371:	ba 01 00 00 00       	mov    $0x1,%edx
{
 376:	89 e5                	mov    %esp,%ebp
 378:	8b 4d 08             	mov    0x8(%ebp),%ecx
  asm volatile (
 37b:	f0 0f c1 11          	lock xadd %edx,(%ecx)
  int myturn = fetch_and_add(&lock->ticket, 1);
  while (myturn != lock->turn);
 37f:	90                   	nop
 380:	8b 41 04             	mov    0x4(%ecx),%eax
 383:	39 d0                	cmp    %edx,%eax
 385:	75 f9                	jne    380 <lock_acquire+0x10>
}
 387:	5d                   	pop    %ebp
 388:	c3                   	ret
 389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000390 <lock_release>:

void 
lock_release(lock_t *lock)
{
 390:	55                   	push   %ebp
  asm volatile (
 391:	b8 01 00 00 00       	mov    $0x1,%eax
{
 396:	89 e5                	mov    %esp,%ebp
 398:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile (
 39b:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  fetch_and_add(&lock->turn, 1);
 3a0:	5d                   	pop    %ebp
 3a1:	c3                   	ret

000003a2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3a2:	b8 01 00 00 00       	mov    $0x1,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret

000003aa <exit>:
SYSCALL(exit)
 3aa:	b8 02 00 00 00       	mov    $0x2,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret

000003b2 <wait>:
SYSCALL(wait)
 3b2:	b8 03 00 00 00       	mov    $0x3,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret

000003ba <pipe>:
SYSCALL(pipe)
 3ba:	b8 04 00 00 00       	mov    $0x4,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret

000003c2 <read>:
SYSCALL(read)
 3c2:	b8 05 00 00 00       	mov    $0x5,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret

000003ca <write>:
SYSCALL(write)
 3ca:	b8 10 00 00 00       	mov    $0x10,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret

000003d2 <close>:
SYSCALL(close)
 3d2:	b8 15 00 00 00       	mov    $0x15,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret

000003da <kill>:
SYSCALL(kill)
 3da:	b8 06 00 00 00       	mov    $0x6,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret

000003e2 <exec>:
SYSCALL(exec)
 3e2:	b8 07 00 00 00       	mov    $0x7,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret

000003ea <open>:
SYSCALL(open)
 3ea:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret

000003f2 <mknod>:
SYSCALL(mknod)
 3f2:	b8 11 00 00 00       	mov    $0x11,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret

000003fa <unlink>:
SYSCALL(unlink)
 3fa:	b8 12 00 00 00       	mov    $0x12,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret

00000402 <fstat>:
SYSCALL(fstat)
 402:	b8 08 00 00 00       	mov    $0x8,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret

0000040a <link>:
SYSCALL(link)
 40a:	b8 13 00 00 00       	mov    $0x13,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret

00000412 <mkdir>:
SYSCALL(mkdir)
 412:	b8 14 00 00 00       	mov    $0x14,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret

0000041a <chdir>:
SYSCALL(chdir)
 41a:	b8 09 00 00 00       	mov    $0x9,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret

00000422 <dup>:
SYSCALL(dup)
 422:	b8 0a 00 00 00       	mov    $0xa,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret

0000042a <getpid>:
SYSCALL(getpid)
 42a:	b8 0b 00 00 00       	mov    $0xb,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret

00000432 <sbrk>:
SYSCALL(sbrk)
 432:	b8 0c 00 00 00       	mov    $0xc,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret

0000043a <sleep>:
SYSCALL(sleep)
 43a:	b8 0d 00 00 00       	mov    $0xd,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret

00000442 <uptime>:
SYSCALL(uptime)
 442:	b8 0e 00 00 00       	mov    $0xe,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret

0000044a <clone>:
SYSCALL(clone)
 44a:	b8 16 00 00 00       	mov    $0x16,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret

00000452 <join>:
SYSCALL(join)
 452:	b8 17 00 00 00       	mov    $0x17,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret
 45a:	66 90                	xchg   %ax,%ax
 45c:	66 90                	xchg   %ax,%ax
 45e:	66 90                	xchg   %ax,%ax

00000460 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 468:	89 d1                	mov    %edx,%ecx
{
 46a:	83 ec 3c             	sub    $0x3c,%esp
 46d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 470:	85 d2                	test   %edx,%edx
 472:	0f 89 80 00 00 00    	jns    4f8 <printint+0x98>
 478:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 47c:	74 7a                	je     4f8 <printint+0x98>
    x = -xx;
 47e:	f7 d9                	neg    %ecx
    neg = 1;
 480:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 485:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 488:	31 f6                	xor    %esi,%esi
 48a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 490:	89 c8                	mov    %ecx,%eax
 492:	31 d2                	xor    %edx,%edx
 494:	89 f7                	mov    %esi,%edi
 496:	f7 f3                	div    %ebx
 498:	8d 76 01             	lea    0x1(%esi),%esi
 49b:	0f b6 92 70 08 00 00 	movzbl 0x870(%edx),%edx
 4a2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 4a6:	89 ca                	mov    %ecx,%edx
 4a8:	89 c1                	mov    %eax,%ecx
 4aa:	39 da                	cmp    %ebx,%edx
 4ac:	73 e2                	jae    490 <printint+0x30>
  if(neg)
 4ae:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4b1:	85 c0                	test   %eax,%eax
 4b3:	74 07                	je     4bc <printint+0x5c>
    buf[i++] = '-';
 4b5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 4ba:	89 f7                	mov    %esi,%edi
 4bc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 4bf:	8b 75 c0             	mov    -0x40(%ebp),%esi
 4c2:	01 df                	add    %ebx,%edi
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 4c8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 4cb:	83 ec 04             	sub    $0x4,%esp
 4ce:	88 45 d7             	mov    %al,-0x29(%ebp)
 4d1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 4d4:	6a 01                	push   $0x1
 4d6:	50                   	push   %eax
 4d7:	56                   	push   %esi
 4d8:	e8 ed fe ff ff       	call   3ca <write>
  while(--i >= 0)
 4dd:	89 f8                	mov    %edi,%eax
 4df:	83 c4 10             	add    $0x10,%esp
 4e2:	83 ef 01             	sub    $0x1,%edi
 4e5:	39 c3                	cmp    %eax,%ebx
 4e7:	75 df                	jne    4c8 <printint+0x68>
}
 4e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ec:	5b                   	pop    %ebx
 4ed:	5e                   	pop    %esi
 4ee:	5f                   	pop    %edi
 4ef:	5d                   	pop    %ebp
 4f0:	c3                   	ret
 4f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4f8:	31 c0                	xor    %eax,%eax
 4fa:	eb 89                	jmp    485 <printint+0x25>
 4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000500 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 509:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 50c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 50f:	0f b6 1e             	movzbl (%esi),%ebx
 512:	83 c6 01             	add    $0x1,%esi
 515:	84 db                	test   %bl,%bl
 517:	74 67                	je     580 <printf+0x80>
 519:	8d 4d 10             	lea    0x10(%ebp),%ecx
 51c:	31 d2                	xor    %edx,%edx
 51e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 521:	eb 34                	jmp    557 <printf+0x57>
 523:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 528:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 52b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 530:	83 f8 25             	cmp    $0x25,%eax
 533:	74 18                	je     54d <printf+0x4d>
  write(fd, &c, 1);
 535:	83 ec 04             	sub    $0x4,%esp
 538:	8d 45 e7             	lea    -0x19(%ebp),%eax
 53b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 53e:	6a 01                	push   $0x1
 540:	50                   	push   %eax
 541:	57                   	push   %edi
 542:	e8 83 fe ff ff       	call   3ca <write>
 547:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 54a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 54d:	0f b6 1e             	movzbl (%esi),%ebx
 550:	83 c6 01             	add    $0x1,%esi
 553:	84 db                	test   %bl,%bl
 555:	74 29                	je     580 <printf+0x80>
    c = fmt[i] & 0xff;
 557:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 55a:	85 d2                	test   %edx,%edx
 55c:	74 ca                	je     528 <printf+0x28>
      }
    } else if(state == '%'){
 55e:	83 fa 25             	cmp    $0x25,%edx
 561:	75 ea                	jne    54d <printf+0x4d>
      if(c == 'd'){
 563:	83 f8 25             	cmp    $0x25,%eax
 566:	0f 84 04 01 00 00    	je     670 <printf+0x170>
 56c:	83 e8 63             	sub    $0x63,%eax
 56f:	83 f8 15             	cmp    $0x15,%eax
 572:	77 1c                	ja     590 <printf+0x90>
 574:	ff 24 85 18 08 00 00 	jmp    *0x818(,%eax,4)
 57b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 580:	8d 65 f4             	lea    -0xc(%ebp),%esp
 583:	5b                   	pop    %ebx
 584:	5e                   	pop    %esi
 585:	5f                   	pop    %edi
 586:	5d                   	pop    %ebp
 587:	c3                   	ret
 588:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 58f:	00 
  write(fd, &c, 1);
 590:	83 ec 04             	sub    $0x4,%esp
 593:	8d 55 e7             	lea    -0x19(%ebp),%edx
 596:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 59a:	6a 01                	push   $0x1
 59c:	52                   	push   %edx
 59d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 5a0:	57                   	push   %edi
 5a1:	e8 24 fe ff ff       	call   3ca <write>
 5a6:	83 c4 0c             	add    $0xc,%esp
 5a9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5ac:	6a 01                	push   $0x1
 5ae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5b1:	52                   	push   %edx
 5b2:	57                   	push   %edi
 5b3:	e8 12 fe ff ff       	call   3ca <write>
        putc(fd, c);
 5b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5bb:	31 d2                	xor    %edx,%edx
 5bd:	eb 8e                	jmp    54d <printf+0x4d>
 5bf:	90                   	nop
        printint(fd, *ap, 16, 0);
 5c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5c3:	83 ec 0c             	sub    $0xc,%esp
 5c6:	b9 10 00 00 00       	mov    $0x10,%ecx
 5cb:	8b 13                	mov    (%ebx),%edx
 5cd:	6a 00                	push   $0x0
 5cf:	89 f8                	mov    %edi,%eax
        ap++;
 5d1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 5d4:	e8 87 fe ff ff       	call   460 <printint>
        ap++;
 5d9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5dc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5df:	31 d2                	xor    %edx,%edx
 5e1:	e9 67 ff ff ff       	jmp    54d <printf+0x4d>
        s = (char*)*ap;
 5e6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5e9:	8b 18                	mov    (%eax),%ebx
        ap++;
 5eb:	83 c0 04             	add    $0x4,%eax
 5ee:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5f1:	85 db                	test   %ebx,%ebx
 5f3:	0f 84 87 00 00 00    	je     680 <printf+0x180>
        while(*s != 0){
 5f9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 5fc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 5fe:	84 c0                	test   %al,%al
 600:	0f 84 47 ff ff ff    	je     54d <printf+0x4d>
 606:	8d 55 e7             	lea    -0x19(%ebp),%edx
 609:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 60c:	89 de                	mov    %ebx,%esi
 60e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 610:	83 ec 04             	sub    $0x4,%esp
 613:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 616:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 619:	6a 01                	push   $0x1
 61b:	53                   	push   %ebx
 61c:	57                   	push   %edi
 61d:	e8 a8 fd ff ff       	call   3ca <write>
        while(*s != 0){
 622:	0f b6 06             	movzbl (%esi),%eax
 625:	83 c4 10             	add    $0x10,%esp
 628:	84 c0                	test   %al,%al
 62a:	75 e4                	jne    610 <printf+0x110>
      state = 0;
 62c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 62f:	31 d2                	xor    %edx,%edx
 631:	e9 17 ff ff ff       	jmp    54d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 636:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 639:	83 ec 0c             	sub    $0xc,%esp
 63c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 641:	8b 13                	mov    (%ebx),%edx
 643:	6a 01                	push   $0x1
 645:	eb 88                	jmp    5cf <printf+0xcf>
        putc(fd, *ap);
 647:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 64a:	83 ec 04             	sub    $0x4,%esp
 64d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 650:	8b 03                	mov    (%ebx),%eax
        ap++;
 652:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 655:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 658:	6a 01                	push   $0x1
 65a:	52                   	push   %edx
 65b:	57                   	push   %edi
 65c:	e8 69 fd ff ff       	call   3ca <write>
        ap++;
 661:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 664:	83 c4 10             	add    $0x10,%esp
      state = 0;
 667:	31 d2                	xor    %edx,%edx
 669:	e9 df fe ff ff       	jmp    54d <printf+0x4d>
 66e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 670:	83 ec 04             	sub    $0x4,%esp
 673:	88 5d e7             	mov    %bl,-0x19(%ebp)
 676:	8d 55 e7             	lea    -0x19(%ebp),%edx
 679:	6a 01                	push   $0x1
 67b:	e9 31 ff ff ff       	jmp    5b1 <printf+0xb1>
 680:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 685:	bb 11 08 00 00       	mov    $0x811,%ebx
 68a:	e9 77 ff ff ff       	jmp    606 <printf+0x106>
 68f:	90                   	nop

00000690 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 690:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 691:	a1 c8 0b 00 00       	mov    0xbc8,%eax
{
 696:	89 e5                	mov    %esp,%ebp
 698:	57                   	push   %edi
 699:	56                   	push   %esi
 69a:	53                   	push   %ebx
 69b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 69e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6aa:	39 c8                	cmp    %ecx,%eax
 6ac:	73 32                	jae    6e0 <free+0x50>
 6ae:	39 d1                	cmp    %edx,%ecx
 6b0:	72 04                	jb     6b6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b2:	39 d0                	cmp    %edx,%eax
 6b4:	72 32                	jb     6e8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6b6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6b9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6bc:	39 fa                	cmp    %edi,%edx
 6be:	74 30                	je     6f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6c0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6c3:	8b 50 04             	mov    0x4(%eax),%edx
 6c6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6c9:	39 f1                	cmp    %esi,%ecx
 6cb:	74 3a                	je     707 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6cd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6cf:	5b                   	pop    %ebx
  freep = p;
 6d0:	a3 c8 0b 00 00       	mov    %eax,0xbc8
}
 6d5:	5e                   	pop    %esi
 6d6:	5f                   	pop    %edi
 6d7:	5d                   	pop    %ebp
 6d8:	c3                   	ret
 6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e0:	39 d0                	cmp    %edx,%eax
 6e2:	72 04                	jb     6e8 <free+0x58>
 6e4:	39 d1                	cmp    %edx,%ecx
 6e6:	72 ce                	jb     6b6 <free+0x26>
{
 6e8:	89 d0                	mov    %edx,%eax
 6ea:	eb bc                	jmp    6a8 <free+0x18>
 6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6f0:	03 72 04             	add    0x4(%edx),%esi
 6f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6f6:	8b 10                	mov    (%eax),%edx
 6f8:	8b 12                	mov    (%edx),%edx
 6fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6fd:	8b 50 04             	mov    0x4(%eax),%edx
 700:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 703:	39 f1                	cmp    %esi,%ecx
 705:	75 c6                	jne    6cd <free+0x3d>
    p->s.size += bp->s.size;
 707:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 70a:	a3 c8 0b 00 00       	mov    %eax,0xbc8
    p->s.size += bp->s.size;
 70f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 712:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 715:	89 08                	mov    %ecx,(%eax)
}
 717:	5b                   	pop    %ebx
 718:	5e                   	pop    %esi
 719:	5f                   	pop    %edi
 71a:	5d                   	pop    %ebp
 71b:	c3                   	ret
 71c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000720 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	53                   	push   %ebx
 726:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 729:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 72c:	8b 15 c8 0b 00 00    	mov    0xbc8,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 732:	8d 78 07             	lea    0x7(%eax),%edi
 735:	c1 ef 03             	shr    $0x3,%edi
 738:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 73b:	85 d2                	test   %edx,%edx
 73d:	0f 84 8d 00 00 00    	je     7d0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 743:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 745:	8b 48 04             	mov    0x4(%eax),%ecx
 748:	39 f9                	cmp    %edi,%ecx
 74a:	73 64                	jae    7b0 <malloc+0x90>
  if(nu < 4096)
 74c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 751:	39 df                	cmp    %ebx,%edi
 753:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 756:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 75d:	eb 0a                	jmp    769 <malloc+0x49>
 75f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 760:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 762:	8b 48 04             	mov    0x4(%eax),%ecx
 765:	39 f9                	cmp    %edi,%ecx
 767:	73 47                	jae    7b0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 769:	89 c2                	mov    %eax,%edx
 76b:	3b 05 c8 0b 00 00    	cmp    0xbc8,%eax
 771:	75 ed                	jne    760 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 773:	83 ec 0c             	sub    $0xc,%esp
 776:	56                   	push   %esi
 777:	e8 b6 fc ff ff       	call   432 <sbrk>
  if(p == (char*)-1)
 77c:	83 c4 10             	add    $0x10,%esp
 77f:	83 f8 ff             	cmp    $0xffffffff,%eax
 782:	74 1c                	je     7a0 <malloc+0x80>
  hp->s.size = nu;
 784:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 787:	83 ec 0c             	sub    $0xc,%esp
 78a:	83 c0 08             	add    $0x8,%eax
 78d:	50                   	push   %eax
 78e:	e8 fd fe ff ff       	call   690 <free>
  return freep;
 793:	8b 15 c8 0b 00 00    	mov    0xbc8,%edx
      if((p = morecore(nunits)) == 0)
 799:	83 c4 10             	add    $0x10,%esp
 79c:	85 d2                	test   %edx,%edx
 79e:	75 c0                	jne    760 <malloc+0x40>
        return 0;
  }
}
 7a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7a3:	31 c0                	xor    %eax,%eax
}
 7a5:	5b                   	pop    %ebx
 7a6:	5e                   	pop    %esi
 7a7:	5f                   	pop    %edi
 7a8:	5d                   	pop    %ebp
 7a9:	c3                   	ret
 7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7b0:	39 cf                	cmp    %ecx,%edi
 7b2:	74 4c                	je     800 <malloc+0xe0>
        p->s.size -= nunits;
 7b4:	29 f9                	sub    %edi,%ecx
 7b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7bc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 7bf:	89 15 c8 0b 00 00    	mov    %edx,0xbc8
}
 7c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7c8:	83 c0 08             	add    $0x8,%eax
}
 7cb:	5b                   	pop    %ebx
 7cc:	5e                   	pop    %esi
 7cd:	5f                   	pop    %edi
 7ce:	5d                   	pop    %ebp
 7cf:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 7d0:	c7 05 c8 0b 00 00 cc 	movl   $0xbcc,0xbc8
 7d7:	0b 00 00 
    base.s.size = 0;
 7da:	b8 cc 0b 00 00       	mov    $0xbcc,%eax
    base.s.ptr = freep = prevp = &base;
 7df:	c7 05 cc 0b 00 00 cc 	movl   $0xbcc,0xbcc
 7e6:	0b 00 00 
    base.s.size = 0;
 7e9:	c7 05 d0 0b 00 00 00 	movl   $0x0,0xbd0
 7f0:	00 00 00 
    if(p->s.size >= nunits){
 7f3:	e9 54 ff ff ff       	jmp    74c <malloc+0x2c>
 7f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7ff:	00 
        prevp->s.ptr = p->s.ptr;
 800:	8b 08                	mov    (%eax),%ecx
 802:	89 0a                	mov    %ecx,(%edx)
 804:	eb b9                	jmp    7bf <malloc+0x9f>
