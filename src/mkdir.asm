
_mkdir:     file format elf32-i386


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
   e:	bf 01 00 00 00       	mov    $0x1,%edi
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 59 04             	mov    0x4(%ecx),%ebx
  1c:	8b 31                	mov    (%ecx),%esi
  1e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
  21:	83 fe 01             	cmp    $0x1,%esi
  24:	7f 14                	jg     3a <main+0x3a>
  26:	eb 3a                	jmp    62 <main+0x62>
  28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  2f:	00 
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  30:	83 c7 01             	add    $0x1,%edi
  33:	83 c3 04             	add    $0x4,%ebx
  36:	39 fe                	cmp    %edi,%esi
  38:	74 23                	je     5d <main+0x5d>
    if(mkdir(argv[i]) < 0){
  3a:	83 ec 0c             	sub    $0xc,%esp
  3d:	ff 33                	push   (%ebx)
  3f:	e8 de 03 00 00       	call   422 <mkdir>
  44:	83 c4 10             	add    $0x10,%esp
  47:	85 c0                	test   %eax,%eax
  49:	79 e5                	jns    30 <main+0x30>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  4b:	50                   	push   %eax
  4c:	ff 33                	push   (%ebx)
  4e:	68 2f 08 00 00       	push   $0x82f
  53:	6a 02                	push   $0x2
  55:	e8 b6 04 00 00       	call   510 <printf>
      break;
  5a:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
  5d:	e8 58 03 00 00       	call   3ba <exit>
    printf(2, "Usage: mkdir files...\n");
  62:	52                   	push   %edx
  63:	52                   	push   %edx
  64:	68 18 08 00 00       	push   $0x818
  69:	6a 02                	push   $0x2
  6b:	e8 a0 04 00 00       	call   510 <printf>
    exit();
  70:	e8 45 03 00 00       	call   3ba <exit>
  75:	66 90                	xchg   %ax,%ax
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
  80:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  81:	31 c0                	xor    %eax,%eax
{
  83:	89 e5                	mov    %esp,%ebp
  85:	53                   	push   %ebx
  86:	8b 4d 08             	mov    0x8(%ebp),%ecx
  89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  90:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  94:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  97:	83 c0 01             	add    $0x1,%eax
  9a:	84 d2                	test   %dl,%dl
  9c:	75 f2                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  9e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  a1:	89 c8                	mov    %ecx,%eax
  a3:	c9                   	leave
  a4:	c3                   	ret
  a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  ac:	00 
  ad:	8d 76 00             	lea    0x0(%esi),%esi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	8b 55 08             	mov    0x8(%ebp),%edx
  b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ba:	0f b6 02             	movzbl (%edx),%eax
  bd:	84 c0                	test   %al,%al
  bf:	75 17                	jne    d8 <strcmp+0x28>
  c1:	eb 3a                	jmp    fd <strcmp+0x4d>
  c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  cc:	83 c2 01             	add    $0x1,%edx
  cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  d2:	84 c0                	test   %al,%al
  d4:	74 1a                	je     f0 <strcmp+0x40>
  d6:	89 d9                	mov    %ebx,%ecx
  d8:	0f b6 19             	movzbl (%ecx),%ebx
  db:	38 c3                	cmp    %al,%bl
  dd:	74 e9                	je     c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  df:	29 d8                	sub    %ebx,%eax
}
  e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  e4:	c9                   	leave
  e5:	c3                   	ret
  e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  ed:	00 
  ee:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
  f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  f4:	31 c0                	xor    %eax,%eax
  f6:	29 d8                	sub    %ebx,%eax
}
  f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  fb:	c9                   	leave
  fc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
  fd:	0f b6 19             	movzbl (%ecx),%ebx
 100:	31 c0                	xor    %eax,%eax
 102:	eb db                	jmp    df <strcmp+0x2f>
 104:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 10b:	00 
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000110 <strlen>:

uint
strlen(const char *s)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 116:	80 3a 00             	cmpb   $0x0,(%edx)
 119:	74 15                	je     130 <strlen+0x20>
 11b:	31 c0                	xor    %eax,%eax
 11d:	8d 76 00             	lea    0x0(%esi),%esi
 120:	83 c0 01             	add    $0x1,%eax
 123:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 127:	89 c1                	mov    %eax,%ecx
 129:	75 f5                	jne    120 <strlen+0x10>
    ;
  return n;
}
 12b:	89 c8                	mov    %ecx,%eax
 12d:	5d                   	pop    %ebp
 12e:	c3                   	ret
 12f:	90                   	nop
  for(n = 0; s[n]; n++)
 130:	31 c9                	xor    %ecx,%ecx
}
 132:	5d                   	pop    %ebp
 133:	89 c8                	mov    %ecx,%eax
 135:	c3                   	ret
 136:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 13d:	00 
 13e:	66 90                	xchg   %ax,%ax

00000140 <memset>:

void*
memset(void *dst, int c, uint n)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 147:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14a:	8b 45 0c             	mov    0xc(%ebp),%eax
 14d:	89 d7                	mov    %edx,%edi
 14f:	fc                   	cld
 150:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 152:	8b 7d fc             	mov    -0x4(%ebp),%edi
 155:	89 d0                	mov    %edx,%eax
 157:	c9                   	leave
 158:	c3                   	ret
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000160 <strchr>:

char*
strchr(const char *s, char c)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 16a:	0f b6 10             	movzbl (%eax),%edx
 16d:	84 d2                	test   %dl,%dl
 16f:	75 12                	jne    183 <strchr+0x23>
 171:	eb 1d                	jmp    190 <strchr+0x30>
 173:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 178:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 17c:	83 c0 01             	add    $0x1,%eax
 17f:	84 d2                	test   %dl,%dl
 181:	74 0d                	je     190 <strchr+0x30>
    if(*s == c)
 183:	38 d1                	cmp    %dl,%cl
 185:	75 f1                	jne    178 <strchr+0x18>
      return (char*)s;
  return 0;
}
 187:	5d                   	pop    %ebp
 188:	c3                   	ret
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 190:	31 c0                	xor    %eax,%eax
}
 192:	5d                   	pop    %ebp
 193:	c3                   	ret
 194:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 19b:	00 
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001a0 <gets>:

char*
gets(char *buf, int max)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1a5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 1a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1a9:	31 db                	xor    %ebx,%ebx
{
 1ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1ae:	eb 27                	jmp    1d7 <gets+0x37>
    cc = read(0, &c, 1);
 1b0:	83 ec 04             	sub    $0x4,%esp
 1b3:	6a 01                	push   $0x1
 1b5:	56                   	push   %esi
 1b6:	6a 00                	push   $0x0
 1b8:	e8 15 02 00 00       	call   3d2 <read>
    if(cc < 1)
 1bd:	83 c4 10             	add    $0x10,%esp
 1c0:	85 c0                	test   %eax,%eax
 1c2:	7e 1d                	jle    1e1 <gets+0x41>
      break;
    buf[i++] = c;
 1c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1c8:	8b 55 08             	mov    0x8(%ebp),%edx
 1cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1cf:	3c 0a                	cmp    $0xa,%al
 1d1:	74 10                	je     1e3 <gets+0x43>
 1d3:	3c 0d                	cmp    $0xd,%al
 1d5:	74 0c                	je     1e3 <gets+0x43>
  for(i=0; i+1 < max; ){
 1d7:	89 df                	mov    %ebx,%edi
 1d9:	83 c3 01             	add    $0x1,%ebx
 1dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1df:	7c cf                	jl     1b0 <gets+0x10>
 1e1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 1ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ed:	5b                   	pop    %ebx
 1ee:	5e                   	pop    %esi
 1ef:	5f                   	pop    %edi
 1f0:	5d                   	pop    %ebp
 1f1:	c3                   	ret
 1f2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1f9:	00 
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 205:	83 ec 08             	sub    $0x8,%esp
 208:	6a 00                	push   $0x0
 20a:	ff 75 08             	push   0x8(%ebp)
 20d:	e8 e8 01 00 00       	call   3fa <open>
  if(fd < 0)
 212:	83 c4 10             	add    $0x10,%esp
 215:	85 c0                	test   %eax,%eax
 217:	78 27                	js     240 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 219:	83 ec 08             	sub    $0x8,%esp
 21c:	ff 75 0c             	push   0xc(%ebp)
 21f:	89 c3                	mov    %eax,%ebx
 221:	50                   	push   %eax
 222:	e8 eb 01 00 00       	call   412 <fstat>
  close(fd);
 227:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 22a:	89 c6                	mov    %eax,%esi
  close(fd);
 22c:	e8 b1 01 00 00       	call   3e2 <close>
  return r;
 231:	83 c4 10             	add    $0x10,%esp
}
 234:	8d 65 f8             	lea    -0x8(%ebp),%esp
 237:	89 f0                	mov    %esi,%eax
 239:	5b                   	pop    %ebx
 23a:	5e                   	pop    %esi
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret
 23d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 240:	be ff ff ff ff       	mov    $0xffffffff,%esi
 245:	eb ed                	jmp    234 <stat+0x34>
 247:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 24e:	00 
 24f:	90                   	nop

00000250 <atoi>:

int
atoi(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 257:	0f be 02             	movsbl (%edx),%eax
 25a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 25d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 260:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 265:	77 1e                	ja     285 <atoi+0x35>
 267:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 26e:	00 
 26f:	90                   	nop
    n = n*10 + *s++ - '0';
 270:	83 c2 01             	add    $0x1,%edx
 273:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 276:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 27a:	0f be 02             	movsbl (%edx),%eax
 27d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x20>
  return n;
}
 285:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 288:	89 c8                	mov    %ecx,%eax
 28a:	c9                   	leave
 28b:	c3                   	ret
 28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	8b 45 10             	mov    0x10(%ebp),%eax
 297:	8b 55 08             	mov    0x8(%ebp),%edx
 29a:	56                   	push   %esi
 29b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 29e:	85 c0                	test   %eax,%eax
 2a0:	7e 13                	jle    2b5 <memmove+0x25>
 2a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2a4:	89 d7                	mov    %edx,%edi
 2a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ad:	00 
 2ae:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 2b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2b1:	39 f8                	cmp    %edi,%eax
 2b3:	75 fb                	jne    2b0 <memmove+0x20>
  return vdst;
}
 2b5:	5e                   	pop    %esi
 2b6:	89 d0                	mov    %edx,%eax
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret
 2bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000002c0 <thread_create>:

int
thread_create(void(*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	83 ec 10             	sub    $0x10,%esp
  int pid;
  void *raw;
  void *stack;

  raw = malloc(PGSIZE * 2);
 2c7:	68 00 20 00 00       	push   $0x2000
 2cc:	e8 5f 04 00 00       	call   730 <malloc>
  if (raw == 0) {
 2d1:	83 c4 10             	add    $0x10,%esp
 2d4:	85 c0                	test   %eax,%eax
 2d6:	74 37                	je     30f <thread_create+0x4f>
 2d8:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  stack = (void *)(((uint)raw + sizeof(void *) + PGSIZE - 1) & ~(PGSIZE - 1));
 2da:	8d 80 03 10 00 00    	lea    0x1003(%eax),%eax
 2e0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  ((void **)stack)[-1] = raw;
 2e5:	89 58 fc             	mov    %ebx,-0x4(%eax)

  pid = clone(start_routine, arg1, arg2, stack);
 2e8:	50                   	push   %eax
 2e9:	ff 75 10             	push   0x10(%ebp)
 2ec:	ff 75 0c             	push   0xc(%ebp)
 2ef:	ff 75 08             	push   0x8(%ebp)
 2f2:	e8 63 01 00 00       	call   45a <clone>
  if (pid < 0) {
 2f7:	83 c4 10             	add    $0x10,%esp
 2fa:	85 c0                	test   %eax,%eax
 2fc:	78 05                	js     303 <thread_create+0x43>
    free(raw);
    return -1;
  }
  return pid;
}
 2fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 301:	c9                   	leave
 302:	c3                   	ret
    free(raw);
 303:	83 ec 0c             	sub    $0xc,%esp
 306:	53                   	push   %ebx
 307:	e8 94 03 00 00       	call   6a0 <free>
    return -1;
 30c:	83 c4 10             	add    $0x10,%esp
    return -1;
 30f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 314:	eb e8                	jmp    2fe <thread_create+0x3e>
 316:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 31d:	00 
 31e:	66 90                	xchg   %ax,%ax

00000320 <thread_join>:

int
thread_join(void) 
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
  int pid;
  void *raw;
  void *stack;

  pid = join(&stack);
 324:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 327:	83 ec 20             	sub    $0x20,%esp
  pid = join(&stack);
 32a:	50                   	push   %eax
 32b:	e8 32 01 00 00       	call   462 <join>
  if (pid < 0) {
 330:	83 c4 10             	add    $0x10,%esp
 333:	85 c0                	test   %eax,%eax
 335:	78 21                	js     358 <thread_join+0x38>
 337:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  raw = ((void **)stack)[-1];
 339:	8b 45 f4             	mov    -0xc(%ebp),%eax
  free(raw);
 33c:	83 ec 0c             	sub    $0xc,%esp
 33f:	ff 70 fc             	push   -0x4(%eax)
 342:	e8 59 03 00 00       	call   6a0 <free>
  return pid;
 347:	83 c4 10             	add    $0x10,%esp
}
 34a:	89 d8                	mov    %ebx,%eax
 34c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 34f:	c9                   	leave
 350:	c3                   	ret
 351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 358:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 35d:	eb eb                	jmp    34a <thread_join+0x2a>
 35f:	90                   	nop

00000360 <lock_init>:
  return value;
}

void 
lock_init(lock_t *lock)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 366:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 36c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 373:	5d                   	pop    %ebp
 374:	c3                   	ret
 375:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 37c:	00 
 37d:	8d 76 00             	lea    0x0(%esi),%esi

00000380 <lock_acquire>:

void
lock_acquire(lock_t *lock)
{
 380:	55                   	push   %ebp
  asm volatile (
 381:	ba 01 00 00 00       	mov    $0x1,%edx
{
 386:	89 e5                	mov    %esp,%ebp
 388:	8b 4d 08             	mov    0x8(%ebp),%ecx
  asm volatile (
 38b:	f0 0f c1 11          	lock xadd %edx,(%ecx)
  int myturn = fetch_and_add(&lock->ticket, 1);
  while (myturn != lock->turn);
 38f:	90                   	nop
 390:	8b 41 04             	mov    0x4(%ecx),%eax
 393:	39 d0                	cmp    %edx,%eax
 395:	75 f9                	jne    390 <lock_acquire+0x10>
}
 397:	5d                   	pop    %ebp
 398:	c3                   	ret
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003a0 <lock_release>:

void 
lock_release(lock_t *lock)
{
 3a0:	55                   	push   %ebp
  asm volatile (
 3a1:	b8 01 00 00 00       	mov    $0x1,%eax
{
 3a6:	89 e5                	mov    %esp,%ebp
 3a8:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile (
 3ab:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  fetch_and_add(&lock->turn, 1);
 3b0:	5d                   	pop    %ebp
 3b1:	c3                   	ret

000003b2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3b2:	b8 01 00 00 00       	mov    $0x1,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret

000003ba <exit>:
SYSCALL(exit)
 3ba:	b8 02 00 00 00       	mov    $0x2,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret

000003c2 <wait>:
SYSCALL(wait)
 3c2:	b8 03 00 00 00       	mov    $0x3,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret

000003ca <pipe>:
SYSCALL(pipe)
 3ca:	b8 04 00 00 00       	mov    $0x4,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret

000003d2 <read>:
SYSCALL(read)
 3d2:	b8 05 00 00 00       	mov    $0x5,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret

000003da <write>:
SYSCALL(write)
 3da:	b8 10 00 00 00       	mov    $0x10,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret

000003e2 <close>:
SYSCALL(close)
 3e2:	b8 15 00 00 00       	mov    $0x15,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret

000003ea <kill>:
SYSCALL(kill)
 3ea:	b8 06 00 00 00       	mov    $0x6,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret

000003f2 <exec>:
SYSCALL(exec)
 3f2:	b8 07 00 00 00       	mov    $0x7,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret

000003fa <open>:
SYSCALL(open)
 3fa:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret

00000402 <mknod>:
SYSCALL(mknod)
 402:	b8 11 00 00 00       	mov    $0x11,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret

0000040a <unlink>:
SYSCALL(unlink)
 40a:	b8 12 00 00 00       	mov    $0x12,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret

00000412 <fstat>:
SYSCALL(fstat)
 412:	b8 08 00 00 00       	mov    $0x8,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret

0000041a <link>:
SYSCALL(link)
 41a:	b8 13 00 00 00       	mov    $0x13,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret

00000422 <mkdir>:
SYSCALL(mkdir)
 422:	b8 14 00 00 00       	mov    $0x14,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret

0000042a <chdir>:
SYSCALL(chdir)
 42a:	b8 09 00 00 00       	mov    $0x9,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret

00000432 <dup>:
SYSCALL(dup)
 432:	b8 0a 00 00 00       	mov    $0xa,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret

0000043a <getpid>:
SYSCALL(getpid)
 43a:	b8 0b 00 00 00       	mov    $0xb,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret

00000442 <sbrk>:
SYSCALL(sbrk)
 442:	b8 0c 00 00 00       	mov    $0xc,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret

0000044a <sleep>:
SYSCALL(sleep)
 44a:	b8 0d 00 00 00       	mov    $0xd,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret

00000452 <uptime>:
SYSCALL(uptime)
 452:	b8 0e 00 00 00       	mov    $0xe,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret

0000045a <clone>:
SYSCALL(clone)
 45a:	b8 16 00 00 00       	mov    $0x16,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret

00000462 <join>:
SYSCALL(join)
 462:	b8 17 00 00 00       	mov    $0x17,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret
 46a:	66 90                	xchg   %ax,%ax
 46c:	66 90                	xchg   %ax,%ax
 46e:	66 90                	xchg   %ax,%ax

00000470 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	56                   	push   %esi
 475:	53                   	push   %ebx
 476:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 478:	89 d1                	mov    %edx,%ecx
{
 47a:	83 ec 3c             	sub    $0x3c,%esp
 47d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 480:	85 d2                	test   %edx,%edx
 482:	0f 89 80 00 00 00    	jns    508 <printint+0x98>
 488:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 48c:	74 7a                	je     508 <printint+0x98>
    x = -xx;
 48e:	f7 d9                	neg    %ecx
    neg = 1;
 490:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 495:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 498:	31 f6                	xor    %esi,%esi
 49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4a0:	89 c8                	mov    %ecx,%eax
 4a2:	31 d2                	xor    %edx,%edx
 4a4:	89 f7                	mov    %esi,%edi
 4a6:	f7 f3                	div    %ebx
 4a8:	8d 76 01             	lea    0x1(%esi),%esi
 4ab:	0f b6 92 ac 08 00 00 	movzbl 0x8ac(%edx),%edx
 4b2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 4b6:	89 ca                	mov    %ecx,%edx
 4b8:	89 c1                	mov    %eax,%ecx
 4ba:	39 da                	cmp    %ebx,%edx
 4bc:	73 e2                	jae    4a0 <printint+0x30>
  if(neg)
 4be:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4c1:	85 c0                	test   %eax,%eax
 4c3:	74 07                	je     4cc <printint+0x5c>
    buf[i++] = '-';
 4c5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 4ca:	89 f7                	mov    %esi,%edi
 4cc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 4cf:	8b 75 c0             	mov    -0x40(%ebp),%esi
 4d2:	01 df                	add    %ebx,%edi
 4d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 4d8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 4db:	83 ec 04             	sub    $0x4,%esp
 4de:	88 45 d7             	mov    %al,-0x29(%ebp)
 4e1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 4e4:	6a 01                	push   $0x1
 4e6:	50                   	push   %eax
 4e7:	56                   	push   %esi
 4e8:	e8 ed fe ff ff       	call   3da <write>
  while(--i >= 0)
 4ed:	89 f8                	mov    %edi,%eax
 4ef:	83 c4 10             	add    $0x10,%esp
 4f2:	83 ef 01             	sub    $0x1,%edi
 4f5:	39 c3                	cmp    %eax,%ebx
 4f7:	75 df                	jne    4d8 <printint+0x68>
}
 4f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4fc:	5b                   	pop    %ebx
 4fd:	5e                   	pop    %esi
 4fe:	5f                   	pop    %edi
 4ff:	5d                   	pop    %ebp
 500:	c3                   	ret
 501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 508:	31 c0                	xor    %eax,%eax
 50a:	eb 89                	jmp    495 <printint+0x25>
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000510 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
 516:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 519:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 51c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 51f:	0f b6 1e             	movzbl (%esi),%ebx
 522:	83 c6 01             	add    $0x1,%esi
 525:	84 db                	test   %bl,%bl
 527:	74 67                	je     590 <printf+0x80>
 529:	8d 4d 10             	lea    0x10(%ebp),%ecx
 52c:	31 d2                	xor    %edx,%edx
 52e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 531:	eb 34                	jmp    567 <printf+0x57>
 533:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 538:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 53b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 540:	83 f8 25             	cmp    $0x25,%eax
 543:	74 18                	je     55d <printf+0x4d>
  write(fd, &c, 1);
 545:	83 ec 04             	sub    $0x4,%esp
 548:	8d 45 e7             	lea    -0x19(%ebp),%eax
 54b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 54e:	6a 01                	push   $0x1
 550:	50                   	push   %eax
 551:	57                   	push   %edi
 552:	e8 83 fe ff ff       	call   3da <write>
 557:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 55a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 55d:	0f b6 1e             	movzbl (%esi),%ebx
 560:	83 c6 01             	add    $0x1,%esi
 563:	84 db                	test   %bl,%bl
 565:	74 29                	je     590 <printf+0x80>
    c = fmt[i] & 0xff;
 567:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 56a:	85 d2                	test   %edx,%edx
 56c:	74 ca                	je     538 <printf+0x28>
      }
    } else if(state == '%'){
 56e:	83 fa 25             	cmp    $0x25,%edx
 571:	75 ea                	jne    55d <printf+0x4d>
      if(c == 'd'){
 573:	83 f8 25             	cmp    $0x25,%eax
 576:	0f 84 04 01 00 00    	je     680 <printf+0x170>
 57c:	83 e8 63             	sub    $0x63,%eax
 57f:	83 f8 15             	cmp    $0x15,%eax
 582:	77 1c                	ja     5a0 <printf+0x90>
 584:	ff 24 85 54 08 00 00 	jmp    *0x854(,%eax,4)
 58b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 590:	8d 65 f4             	lea    -0xc(%ebp),%esp
 593:	5b                   	pop    %ebx
 594:	5e                   	pop    %esi
 595:	5f                   	pop    %edi
 596:	5d                   	pop    %ebp
 597:	c3                   	ret
 598:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 59f:	00 
  write(fd, &c, 1);
 5a0:	83 ec 04             	sub    $0x4,%esp
 5a3:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5a6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5aa:	6a 01                	push   $0x1
 5ac:	52                   	push   %edx
 5ad:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 5b0:	57                   	push   %edi
 5b1:	e8 24 fe ff ff       	call   3da <write>
 5b6:	83 c4 0c             	add    $0xc,%esp
 5b9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5bc:	6a 01                	push   $0x1
 5be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5c1:	52                   	push   %edx
 5c2:	57                   	push   %edi
 5c3:	e8 12 fe ff ff       	call   3da <write>
        putc(fd, c);
 5c8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5cb:	31 d2                	xor    %edx,%edx
 5cd:	eb 8e                	jmp    55d <printf+0x4d>
 5cf:	90                   	nop
        printint(fd, *ap, 16, 0);
 5d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5d3:	83 ec 0c             	sub    $0xc,%esp
 5d6:	b9 10 00 00 00       	mov    $0x10,%ecx
 5db:	8b 13                	mov    (%ebx),%edx
 5dd:	6a 00                	push   $0x0
 5df:	89 f8                	mov    %edi,%eax
        ap++;
 5e1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 5e4:	e8 87 fe ff ff       	call   470 <printint>
        ap++;
 5e9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5ec:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5ef:	31 d2                	xor    %edx,%edx
 5f1:	e9 67 ff ff ff       	jmp    55d <printf+0x4d>
        s = (char*)*ap;
 5f6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5f9:	8b 18                	mov    (%eax),%ebx
        ap++;
 5fb:	83 c0 04             	add    $0x4,%eax
 5fe:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 601:	85 db                	test   %ebx,%ebx
 603:	0f 84 87 00 00 00    	je     690 <printf+0x180>
        while(*s != 0){
 609:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 60c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 60e:	84 c0                	test   %al,%al
 610:	0f 84 47 ff ff ff    	je     55d <printf+0x4d>
 616:	8d 55 e7             	lea    -0x19(%ebp),%edx
 619:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 61c:	89 de                	mov    %ebx,%esi
 61e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 620:	83 ec 04             	sub    $0x4,%esp
 623:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 626:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 629:	6a 01                	push   $0x1
 62b:	53                   	push   %ebx
 62c:	57                   	push   %edi
 62d:	e8 a8 fd ff ff       	call   3da <write>
        while(*s != 0){
 632:	0f b6 06             	movzbl (%esi),%eax
 635:	83 c4 10             	add    $0x10,%esp
 638:	84 c0                	test   %al,%al
 63a:	75 e4                	jne    620 <printf+0x110>
      state = 0;
 63c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 63f:	31 d2                	xor    %edx,%edx
 641:	e9 17 ff ff ff       	jmp    55d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 646:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 649:	83 ec 0c             	sub    $0xc,%esp
 64c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 651:	8b 13                	mov    (%ebx),%edx
 653:	6a 01                	push   $0x1
 655:	eb 88                	jmp    5df <printf+0xcf>
        putc(fd, *ap);
 657:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 65a:	83 ec 04             	sub    $0x4,%esp
 65d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 660:	8b 03                	mov    (%ebx),%eax
        ap++;
 662:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 665:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 668:	6a 01                	push   $0x1
 66a:	52                   	push   %edx
 66b:	57                   	push   %edi
 66c:	e8 69 fd ff ff       	call   3da <write>
        ap++;
 671:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 674:	83 c4 10             	add    $0x10,%esp
      state = 0;
 677:	31 d2                	xor    %edx,%edx
 679:	e9 df fe ff ff       	jmp    55d <printf+0x4d>
 67e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 680:	83 ec 04             	sub    $0x4,%esp
 683:	88 5d e7             	mov    %bl,-0x19(%ebp)
 686:	8d 55 e7             	lea    -0x19(%ebp),%edx
 689:	6a 01                	push   $0x1
 68b:	e9 31 ff ff ff       	jmp    5c1 <printf+0xb1>
 690:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 695:	bb 4b 08 00 00       	mov    $0x84b,%ebx
 69a:	e9 77 ff ff ff       	jmp    616 <printf+0x106>
 69f:	90                   	nop

000006a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a1:	a1 08 0c 00 00       	mov    0xc08,%eax
{
 6a6:	89 e5                	mov    %esp,%ebp
 6a8:	57                   	push   %edi
 6a9:	56                   	push   %esi
 6aa:	53                   	push   %ebx
 6ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ba:	39 c8                	cmp    %ecx,%eax
 6bc:	73 32                	jae    6f0 <free+0x50>
 6be:	39 d1                	cmp    %edx,%ecx
 6c0:	72 04                	jb     6c6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c2:	39 d0                	cmp    %edx,%eax
 6c4:	72 32                	jb     6f8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6c6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6c9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6cc:	39 fa                	cmp    %edi,%edx
 6ce:	74 30                	je     700 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6d3:	8b 50 04             	mov    0x4(%eax),%edx
 6d6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6d9:	39 f1                	cmp    %esi,%ecx
 6db:	74 3a                	je     717 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6dd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6df:	5b                   	pop    %ebx
  freep = p;
 6e0:	a3 08 0c 00 00       	mov    %eax,0xc08
}
 6e5:	5e                   	pop    %esi
 6e6:	5f                   	pop    %edi
 6e7:	5d                   	pop    %ebp
 6e8:	c3                   	ret
 6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f0:	39 d0                	cmp    %edx,%eax
 6f2:	72 04                	jb     6f8 <free+0x58>
 6f4:	39 d1                	cmp    %edx,%ecx
 6f6:	72 ce                	jb     6c6 <free+0x26>
{
 6f8:	89 d0                	mov    %edx,%eax
 6fa:	eb bc                	jmp    6b8 <free+0x18>
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 700:	03 72 04             	add    0x4(%edx),%esi
 703:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 706:	8b 10                	mov    (%eax),%edx
 708:	8b 12                	mov    (%edx),%edx
 70a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 70d:	8b 50 04             	mov    0x4(%eax),%edx
 710:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 713:	39 f1                	cmp    %esi,%ecx
 715:	75 c6                	jne    6dd <free+0x3d>
    p->s.size += bp->s.size;
 717:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 71a:	a3 08 0c 00 00       	mov    %eax,0xc08
    p->s.size += bp->s.size;
 71f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 722:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 725:	89 08                	mov    %ecx,(%eax)
}
 727:	5b                   	pop    %ebx
 728:	5e                   	pop    %esi
 729:	5f                   	pop    %edi
 72a:	5d                   	pop    %ebp
 72b:	c3                   	ret
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000730 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 739:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 73c:	8b 15 08 0c 00 00    	mov    0xc08,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 742:	8d 78 07             	lea    0x7(%eax),%edi
 745:	c1 ef 03             	shr    $0x3,%edi
 748:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 74b:	85 d2                	test   %edx,%edx
 74d:	0f 84 8d 00 00 00    	je     7e0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 753:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 755:	8b 48 04             	mov    0x4(%eax),%ecx
 758:	39 f9                	cmp    %edi,%ecx
 75a:	73 64                	jae    7c0 <malloc+0x90>
  if(nu < 4096)
 75c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 761:	39 df                	cmp    %ebx,%edi
 763:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 766:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 76d:	eb 0a                	jmp    779 <malloc+0x49>
 76f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 770:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 772:	8b 48 04             	mov    0x4(%eax),%ecx
 775:	39 f9                	cmp    %edi,%ecx
 777:	73 47                	jae    7c0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 779:	89 c2                	mov    %eax,%edx
 77b:	3b 05 08 0c 00 00    	cmp    0xc08,%eax
 781:	75 ed                	jne    770 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 783:	83 ec 0c             	sub    $0xc,%esp
 786:	56                   	push   %esi
 787:	e8 b6 fc ff ff       	call   442 <sbrk>
  if(p == (char*)-1)
 78c:	83 c4 10             	add    $0x10,%esp
 78f:	83 f8 ff             	cmp    $0xffffffff,%eax
 792:	74 1c                	je     7b0 <malloc+0x80>
  hp->s.size = nu;
 794:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 797:	83 ec 0c             	sub    $0xc,%esp
 79a:	83 c0 08             	add    $0x8,%eax
 79d:	50                   	push   %eax
 79e:	e8 fd fe ff ff       	call   6a0 <free>
  return freep;
 7a3:	8b 15 08 0c 00 00    	mov    0xc08,%edx
      if((p = morecore(nunits)) == 0)
 7a9:	83 c4 10             	add    $0x10,%esp
 7ac:	85 d2                	test   %edx,%edx
 7ae:	75 c0                	jne    770 <malloc+0x40>
        return 0;
  }
}
 7b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7b3:	31 c0                	xor    %eax,%eax
}
 7b5:	5b                   	pop    %ebx
 7b6:	5e                   	pop    %esi
 7b7:	5f                   	pop    %edi
 7b8:	5d                   	pop    %ebp
 7b9:	c3                   	ret
 7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7c0:	39 cf                	cmp    %ecx,%edi
 7c2:	74 4c                	je     810 <malloc+0xe0>
        p->s.size -= nunits;
 7c4:	29 f9                	sub    %edi,%ecx
 7c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7cc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 7cf:	89 15 08 0c 00 00    	mov    %edx,0xc08
}
 7d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7d8:	83 c0 08             	add    $0x8,%eax
}
 7db:	5b                   	pop    %ebx
 7dc:	5e                   	pop    %esi
 7dd:	5f                   	pop    %edi
 7de:	5d                   	pop    %ebp
 7df:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 7e0:	c7 05 08 0c 00 00 0c 	movl   $0xc0c,0xc08
 7e7:	0c 00 00 
    base.s.size = 0;
 7ea:	b8 0c 0c 00 00       	mov    $0xc0c,%eax
    base.s.ptr = freep = prevp = &base;
 7ef:	c7 05 0c 0c 00 00 0c 	movl   $0xc0c,0xc0c
 7f6:	0c 00 00 
    base.s.size = 0;
 7f9:	c7 05 10 0c 00 00 00 	movl   $0x0,0xc10
 800:	00 00 00 
    if(p->s.size >= nunits){
 803:	e9 54 ff ff ff       	jmp    75c <malloc+0x2c>
 808:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 80f:	00 
        prevp->s.ptr = p->s.ptr;
 810:	8b 08                	mov    (%eax),%ecx
 812:	89 0a                	mov    %ecx,(%edx)
 814:	eb b9                	jmp    7cf <malloc+0x9f>
