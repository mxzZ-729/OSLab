
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 88 08 00 00       	push   $0x888
  19:	e8 4c 04 00 00       	call   46a <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 6f 04 00 00       	call   4a2 <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 63 04 00 00       	call   4a2 <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 90 08 00 00       	push   $0x890
  50:	6a 01                	push   $0x1
  52:	e8 29 05 00 00       	call   580 <printf>
    pid = fork();
  57:	e8 c6 03 00 00       	call   422 <fork>
    if(pid < 0){
  5c:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  5f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  61:	85 c0                	test   %eax,%eax
  63:	78 2c                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  65:	74 3d                	je     a4 <main+0xa4>
  67:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  6e:	00 
  6f:	90                   	nop
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 bd 03 00 00       	call   432 <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 cf 08 00 00       	push   $0x8cf
  85:	6a 01                	push   $0x1
  87:	e8 f4 04 00 00       	call   580 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 a3 08 00 00       	push   $0x8a3
  98:	6a 01                	push   $0x1
  9a:	e8 e1 04 00 00       	call   580 <printf>
      exit();
  9f:	e8 86 03 00 00       	call   42a <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 88 0c 00 00       	push   $0xc88
  ab:	68 b6 08 00 00       	push   $0x8b6
  b0:	e8 ad 03 00 00       	call   462 <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 b9 08 00 00       	push   $0x8b9
  bc:	6a 01                	push   $0x1
  be:	e8 bd 04 00 00       	call   580 <printf>
      exit();
  c3:	e8 62 03 00 00       	call   42a <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 88 08 00 00       	push   $0x888
  d2:	e8 9b 03 00 00       	call   472 <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 88 08 00 00       	push   $0x888
  e0:	e8 85 03 00 00       	call   46a <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
  f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f1:	31 c0                	xor    %eax,%eax
{
  f3:	89 e5                	mov    %esp,%ebp
  f5:	53                   	push   %ebx
  f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 111:	89 c8                	mov    %ecx,%eax
 113:	c9                   	leave
 114:	c3                   	ret
 115:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 11c:	00 
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 55 08             	mov    0x8(%ebp),%edx
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 12a:	0f b6 02             	movzbl (%edx),%eax
 12d:	84 c0                	test   %al,%al
 12f:	75 17                	jne    148 <strcmp+0x28>
 131:	eb 3a                	jmp    16d <strcmp+0x4d>
 133:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 138:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 13c:	83 c2 01             	add    $0x1,%edx
 13f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 142:	84 c0                	test   %al,%al
 144:	74 1a                	je     160 <strcmp+0x40>
 146:	89 d9                	mov    %ebx,%ecx
 148:	0f b6 19             	movzbl (%ecx),%ebx
 14b:	38 c3                	cmp    %al,%bl
 14d:	74 e9                	je     138 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 14f:	29 d8                	sub    %ebx,%eax
}
 151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 154:	c9                   	leave
 155:	c3                   	ret
 156:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 15d:	00 
 15e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 164:	31 c0                	xor    %eax,%eax
 166:	29 d8                	sub    %ebx,%eax
}
 168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 16b:	c9                   	leave
 16c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 16d:	0f b6 19             	movzbl (%ecx),%ebx
 170:	31 c0                	xor    %eax,%eax
 172:	eb db                	jmp    14f <strcmp+0x2f>
 174:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17b:	00 
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000180 <strlen>:

uint
strlen(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 3a 00             	cmpb   $0x0,(%edx)
 189:	74 15                	je     1a0 <strlen+0x20>
 18b:	31 c0                	xor    %eax,%eax
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c0 01             	add    $0x1,%eax
 193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 197:	89 c1                	mov    %eax,%ecx
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	89 c8                	mov    %ecx,%eax
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret
 19f:	90                   	nop
  for(n = 0; s[n]; n++)
 1a0:	31 c9                	xor    %ecx,%ecx
}
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret
 1a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ad:	00 
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1c5:	89 d0                	mov    %edx,%eax
 1c7:	c9                   	leave
 1c8:	c3                   	ret
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	75 12                	jne    1f3 <strchr+0x23>
 1e1:	eb 1d                	jmp    200 <strchr+0x30>
 1e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 1e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1ec:	83 c0 01             	add    $0x1,%eax
 1ef:	84 d2                	test   %dl,%dl
 1f1:	74 0d                	je     200 <strchr+0x30>
    if(*s == c)
 1f3:	38 d1                	cmp    %dl,%cl
 1f5:	75 f1                	jne    1e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 200:	31 c0                	xor    %eax,%eax
}
 202:	5d                   	pop    %ebp
 203:	c3                   	ret
 204:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 20b:	00 
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 215:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 218:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 219:	31 db                	xor    %ebx,%ebx
{
 21b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 21e:	eb 27                	jmp    247 <gets+0x37>
    cc = read(0, &c, 1);
 220:	83 ec 04             	sub    $0x4,%esp
 223:	6a 01                	push   $0x1
 225:	56                   	push   %esi
 226:	6a 00                	push   $0x0
 228:	e8 15 02 00 00       	call   442 <read>
    if(cc < 1)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 1d                	jle    251 <gets+0x41>
      break;
    buf[i++] = c;
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	8b 55 08             	mov    0x8(%ebp),%edx
 23b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 23f:	3c 0a                	cmp    $0xa,%al
 241:	74 10                	je     253 <gets+0x43>
 243:	3c 0d                	cmp    $0xd,%al
 245:	74 0c                	je     253 <gets+0x43>
  for(i=0; i+1 < max; ){
 247:	89 df                	mov    %ebx,%edi
 249:	83 c3 01             	add    $0x1,%ebx
 24c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 24f:	7c cf                	jl     220 <gets+0x10>
 251:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 25a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25d:	5b                   	pop    %ebx
 25e:	5e                   	pop    %esi
 25f:	5f                   	pop    %edi
 260:	5d                   	pop    %ebp
 261:	c3                   	ret
 262:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 269:	00 
 26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000270 <stat>:

int
stat(const char *n, struct stat *st)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	ff 75 08             	push   0x8(%ebp)
 27d:	e8 e8 01 00 00       	call   46a <open>
  if(fd < 0)
 282:	83 c4 10             	add    $0x10,%esp
 285:	85 c0                	test   %eax,%eax
 287:	78 27                	js     2b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 289:	83 ec 08             	sub    $0x8,%esp
 28c:	ff 75 0c             	push   0xc(%ebp)
 28f:	89 c3                	mov    %eax,%ebx
 291:	50                   	push   %eax
 292:	e8 eb 01 00 00       	call   482 <fstat>
  close(fd);
 297:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 29a:	89 c6                	mov    %eax,%esi
  close(fd);
 29c:	e8 b1 01 00 00       	call   452 <close>
  return r;
 2a1:	83 c4 10             	add    $0x10,%esp
}
 2a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a7:	89 f0                	mov    %esi,%eax
 2a9:	5b                   	pop    %ebx
 2aa:	5e                   	pop    %esi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2b5:	eb ed                	jmp    2a4 <stat+0x34>
 2b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2be:	00 
 2bf:	90                   	nop

000002c0 <atoi>:

int
atoi(const char *s)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c7:	0f be 02             	movsbl (%edx),%eax
 2ca:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2cd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2d5:	77 1e                	ja     2f5 <atoi+0x35>
 2d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2de:	00 
 2df:	90                   	nop
    n = n*10 + *s++ - '0';
 2e0:	83 c2 01             	add    $0x1,%edx
 2e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ea:	0f be 02             	movsbl (%edx),%eax
 2ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2f0:	80 fb 09             	cmp    $0x9,%bl
 2f3:	76 eb                	jbe    2e0 <atoi+0x20>
  return n;
}
 2f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f8:	89 c8                	mov    %ecx,%eax
 2fa:	c9                   	leave
 2fb:	c3                   	ret
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000300 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	8b 45 10             	mov    0x10(%ebp),%eax
 307:	8b 55 08             	mov    0x8(%ebp),%edx
 30a:	56                   	push   %esi
 30b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 30e:	85 c0                	test   %eax,%eax
 310:	7e 13                	jle    325 <memmove+0x25>
 312:	01 d0                	add    %edx,%eax
  dst = vdst;
 314:	89 d7                	mov    %edx,%edi
 316:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 31d:	00 
 31e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 320:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 321:	39 f8                	cmp    %edi,%eax
 323:	75 fb                	jne    320 <memmove+0x20>
  return vdst;
}
 325:	5e                   	pop    %esi
 326:	89 d0                	mov    %edx,%eax
 328:	5f                   	pop    %edi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret
 32b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000330 <thread_create>:

int
thread_create(void(*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	83 ec 10             	sub    $0x10,%esp
  int pid;
  void *raw;
  void *stack;

  raw = malloc(PGSIZE * 2);
 337:	68 00 20 00 00       	push   $0x2000
 33c:	e8 5f 04 00 00       	call   7a0 <malloc>
  if (raw == 0) {
 341:	83 c4 10             	add    $0x10,%esp
 344:	85 c0                	test   %eax,%eax
 346:	74 37                	je     37f <thread_create+0x4f>
 348:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  stack = (void *)(((uint)raw + sizeof(void *) + PGSIZE - 1) & ~(PGSIZE - 1));
 34a:	8d 80 03 10 00 00    	lea    0x1003(%eax),%eax
 350:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  ((void **)stack)[-1] = raw;
 355:	89 58 fc             	mov    %ebx,-0x4(%eax)

  pid = clone(start_routine, arg1, arg2, stack);
 358:	50                   	push   %eax
 359:	ff 75 10             	push   0x10(%ebp)
 35c:	ff 75 0c             	push   0xc(%ebp)
 35f:	ff 75 08             	push   0x8(%ebp)
 362:	e8 63 01 00 00       	call   4ca <clone>
  if (pid < 0) {
 367:	83 c4 10             	add    $0x10,%esp
 36a:	85 c0                	test   %eax,%eax
 36c:	78 05                	js     373 <thread_create+0x43>
    free(raw);
    return -1;
  }
  return pid;
}
 36e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 371:	c9                   	leave
 372:	c3                   	ret
    free(raw);
 373:	83 ec 0c             	sub    $0xc,%esp
 376:	53                   	push   %ebx
 377:	e8 94 03 00 00       	call   710 <free>
    return -1;
 37c:	83 c4 10             	add    $0x10,%esp
    return -1;
 37f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 384:	eb e8                	jmp    36e <thread_create+0x3e>
 386:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 38d:	00 
 38e:	66 90                	xchg   %ax,%ax

00000390 <thread_join>:

int
thread_join(void) 
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	53                   	push   %ebx
  int pid;
  void *raw;
  void *stack;

  pid = join(&stack);
 394:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 397:	83 ec 20             	sub    $0x20,%esp
  pid = join(&stack);
 39a:	50                   	push   %eax
 39b:	e8 32 01 00 00       	call   4d2 <join>
  if (pid < 0) {
 3a0:	83 c4 10             	add    $0x10,%esp
 3a3:	85 c0                	test   %eax,%eax
 3a5:	78 21                	js     3c8 <thread_join+0x38>
 3a7:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  raw = ((void **)stack)[-1];
 3a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  free(raw);
 3ac:	83 ec 0c             	sub    $0xc,%esp
 3af:	ff 70 fc             	push   -0x4(%eax)
 3b2:	e8 59 03 00 00       	call   710 <free>
  return pid;
 3b7:	83 c4 10             	add    $0x10,%esp
}
 3ba:	89 d8                	mov    %ebx,%eax
 3bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3bf:	c9                   	leave
 3c0:	c3                   	ret
 3c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 3c8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 3cd:	eb eb                	jmp    3ba <thread_join+0x2a>
 3cf:	90                   	nop

000003d0 <lock_init>:
  return value;
}

void 
lock_init(lock_t *lock)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 3d6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 3dc:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret
 3e5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ec:	00 
 3ed:	8d 76 00             	lea    0x0(%esi),%esi

000003f0 <lock_acquire>:

void
lock_acquire(lock_t *lock)
{
 3f0:	55                   	push   %ebp
  asm volatile (
 3f1:	ba 01 00 00 00       	mov    $0x1,%edx
{
 3f6:	89 e5                	mov    %esp,%ebp
 3f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  asm volatile (
 3fb:	f0 0f c1 11          	lock xadd %edx,(%ecx)
  int myturn = fetch_and_add(&lock->ticket, 1);
  while (myturn != lock->turn);
 3ff:	90                   	nop
 400:	8b 41 04             	mov    0x4(%ecx),%eax
 403:	39 d0                	cmp    %edx,%eax
 405:	75 f9                	jne    400 <lock_acquire+0x10>
}
 407:	5d                   	pop    %ebp
 408:	c3                   	ret
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000410 <lock_release>:

void 
lock_release(lock_t *lock)
{
 410:	55                   	push   %ebp
  asm volatile (
 411:	b8 01 00 00 00       	mov    $0x1,%eax
{
 416:	89 e5                	mov    %esp,%ebp
 418:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile (
 41b:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  fetch_and_add(&lock->turn, 1);
 420:	5d                   	pop    %ebp
 421:	c3                   	ret

00000422 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 422:	b8 01 00 00 00       	mov    $0x1,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret

0000042a <exit>:
SYSCALL(exit)
 42a:	b8 02 00 00 00       	mov    $0x2,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret

00000432 <wait>:
SYSCALL(wait)
 432:	b8 03 00 00 00       	mov    $0x3,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret

0000043a <pipe>:
SYSCALL(pipe)
 43a:	b8 04 00 00 00       	mov    $0x4,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret

00000442 <read>:
SYSCALL(read)
 442:	b8 05 00 00 00       	mov    $0x5,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret

0000044a <write>:
SYSCALL(write)
 44a:	b8 10 00 00 00       	mov    $0x10,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret

00000452 <close>:
SYSCALL(close)
 452:	b8 15 00 00 00       	mov    $0x15,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret

0000045a <kill>:
SYSCALL(kill)
 45a:	b8 06 00 00 00       	mov    $0x6,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret

00000462 <exec>:
SYSCALL(exec)
 462:	b8 07 00 00 00       	mov    $0x7,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret

0000046a <open>:
SYSCALL(open)
 46a:	b8 0f 00 00 00       	mov    $0xf,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret

00000472 <mknod>:
SYSCALL(mknod)
 472:	b8 11 00 00 00       	mov    $0x11,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret

0000047a <unlink>:
SYSCALL(unlink)
 47a:	b8 12 00 00 00       	mov    $0x12,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret

00000482 <fstat>:
SYSCALL(fstat)
 482:	b8 08 00 00 00       	mov    $0x8,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret

0000048a <link>:
SYSCALL(link)
 48a:	b8 13 00 00 00       	mov    $0x13,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret

00000492 <mkdir>:
SYSCALL(mkdir)
 492:	b8 14 00 00 00       	mov    $0x14,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret

0000049a <chdir>:
SYSCALL(chdir)
 49a:	b8 09 00 00 00       	mov    $0x9,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret

000004a2 <dup>:
SYSCALL(dup)
 4a2:	b8 0a 00 00 00       	mov    $0xa,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret

000004aa <getpid>:
SYSCALL(getpid)
 4aa:	b8 0b 00 00 00       	mov    $0xb,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret

000004b2 <sbrk>:
SYSCALL(sbrk)
 4b2:	b8 0c 00 00 00       	mov    $0xc,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret

000004ba <sleep>:
SYSCALL(sleep)
 4ba:	b8 0d 00 00 00       	mov    $0xd,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret

000004c2 <uptime>:
SYSCALL(uptime)
 4c2:	b8 0e 00 00 00       	mov    $0xe,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret

000004ca <clone>:
SYSCALL(clone)
 4ca:	b8 16 00 00 00       	mov    $0x16,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret

000004d2 <join>:
SYSCALL(join)
 4d2:	b8 17 00 00 00       	mov    $0x17,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret
 4da:	66 90                	xchg   %ax,%ax
 4dc:	66 90                	xchg   %ax,%ax
 4de:	66 90                	xchg   %ax,%ax

000004e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4e8:	89 d1                	mov    %edx,%ecx
{
 4ea:	83 ec 3c             	sub    $0x3c,%esp
 4ed:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 4f0:	85 d2                	test   %edx,%edx
 4f2:	0f 89 80 00 00 00    	jns    578 <printint+0x98>
 4f8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4fc:	74 7a                	je     578 <printint+0x98>
    x = -xx;
 4fe:	f7 d9                	neg    %ecx
    neg = 1;
 500:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 505:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 508:	31 f6                	xor    %esi,%esi
 50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 510:	89 c8                	mov    %ecx,%eax
 512:	31 d2                	xor    %edx,%edx
 514:	89 f7                	mov    %esi,%edi
 516:	f7 f3                	div    %ebx
 518:	8d 76 01             	lea    0x1(%esi),%esi
 51b:	0f b6 92 38 09 00 00 	movzbl 0x938(%edx),%edx
 522:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 526:	89 ca                	mov    %ecx,%edx
 528:	89 c1                	mov    %eax,%ecx
 52a:	39 da                	cmp    %ebx,%edx
 52c:	73 e2                	jae    510 <printint+0x30>
  if(neg)
 52e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 531:	85 c0                	test   %eax,%eax
 533:	74 07                	je     53c <printint+0x5c>
    buf[i++] = '-';
 535:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 53a:	89 f7                	mov    %esi,%edi
 53c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 53f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 542:	01 df                	add    %ebx,%edi
 544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 548:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 54b:	83 ec 04             	sub    $0x4,%esp
 54e:	88 45 d7             	mov    %al,-0x29(%ebp)
 551:	8d 45 d7             	lea    -0x29(%ebp),%eax
 554:	6a 01                	push   $0x1
 556:	50                   	push   %eax
 557:	56                   	push   %esi
 558:	e8 ed fe ff ff       	call   44a <write>
  while(--i >= 0)
 55d:	89 f8                	mov    %edi,%eax
 55f:	83 c4 10             	add    $0x10,%esp
 562:	83 ef 01             	sub    $0x1,%edi
 565:	39 c3                	cmp    %eax,%ebx
 567:	75 df                	jne    548 <printint+0x68>
}
 569:	8d 65 f4             	lea    -0xc(%ebp),%esp
 56c:	5b                   	pop    %ebx
 56d:	5e                   	pop    %esi
 56e:	5f                   	pop    %edi
 56f:	5d                   	pop    %ebp
 570:	c3                   	ret
 571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 578:	31 c0                	xor    %eax,%eax
 57a:	eb 89                	jmp    505 <printint+0x25>
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000580 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
 584:	56                   	push   %esi
 585:	53                   	push   %ebx
 586:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 589:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 58c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 58f:	0f b6 1e             	movzbl (%esi),%ebx
 592:	83 c6 01             	add    $0x1,%esi
 595:	84 db                	test   %bl,%bl
 597:	74 67                	je     600 <printf+0x80>
 599:	8d 4d 10             	lea    0x10(%ebp),%ecx
 59c:	31 d2                	xor    %edx,%edx
 59e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 5a1:	eb 34                	jmp    5d7 <printf+0x57>
 5a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 5a8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5ab:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5b0:	83 f8 25             	cmp    $0x25,%eax
 5b3:	74 18                	je     5cd <printf+0x4d>
  write(fd, &c, 1);
 5b5:	83 ec 04             	sub    $0x4,%esp
 5b8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5bb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5be:	6a 01                	push   $0x1
 5c0:	50                   	push   %eax
 5c1:	57                   	push   %edi
 5c2:	e8 83 fe ff ff       	call   44a <write>
 5c7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5ca:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5cd:	0f b6 1e             	movzbl (%esi),%ebx
 5d0:	83 c6 01             	add    $0x1,%esi
 5d3:	84 db                	test   %bl,%bl
 5d5:	74 29                	je     600 <printf+0x80>
    c = fmt[i] & 0xff;
 5d7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5da:	85 d2                	test   %edx,%edx
 5dc:	74 ca                	je     5a8 <printf+0x28>
      }
    } else if(state == '%'){
 5de:	83 fa 25             	cmp    $0x25,%edx
 5e1:	75 ea                	jne    5cd <printf+0x4d>
      if(c == 'd'){
 5e3:	83 f8 25             	cmp    $0x25,%eax
 5e6:	0f 84 04 01 00 00    	je     6f0 <printf+0x170>
 5ec:	83 e8 63             	sub    $0x63,%eax
 5ef:	83 f8 15             	cmp    $0x15,%eax
 5f2:	77 1c                	ja     610 <printf+0x90>
 5f4:	ff 24 85 e0 08 00 00 	jmp    *0x8e0(,%eax,4)
 5fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 600:	8d 65 f4             	lea    -0xc(%ebp),%esp
 603:	5b                   	pop    %ebx
 604:	5e                   	pop    %esi
 605:	5f                   	pop    %edi
 606:	5d                   	pop    %ebp
 607:	c3                   	ret
 608:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 60f:	00 
  write(fd, &c, 1);
 610:	83 ec 04             	sub    $0x4,%esp
 613:	8d 55 e7             	lea    -0x19(%ebp),%edx
 616:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 61a:	6a 01                	push   $0x1
 61c:	52                   	push   %edx
 61d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 620:	57                   	push   %edi
 621:	e8 24 fe ff ff       	call   44a <write>
 626:	83 c4 0c             	add    $0xc,%esp
 629:	88 5d e7             	mov    %bl,-0x19(%ebp)
 62c:	6a 01                	push   $0x1
 62e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 631:	52                   	push   %edx
 632:	57                   	push   %edi
 633:	e8 12 fe ff ff       	call   44a <write>
        putc(fd, c);
 638:	83 c4 10             	add    $0x10,%esp
      state = 0;
 63b:	31 d2                	xor    %edx,%edx
 63d:	eb 8e                	jmp    5cd <printf+0x4d>
 63f:	90                   	nop
        printint(fd, *ap, 16, 0);
 640:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 643:	83 ec 0c             	sub    $0xc,%esp
 646:	b9 10 00 00 00       	mov    $0x10,%ecx
 64b:	8b 13                	mov    (%ebx),%edx
 64d:	6a 00                	push   $0x0
 64f:	89 f8                	mov    %edi,%eax
        ap++;
 651:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 654:	e8 87 fe ff ff       	call   4e0 <printint>
        ap++;
 659:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 65c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 65f:	31 d2                	xor    %edx,%edx
 661:	e9 67 ff ff ff       	jmp    5cd <printf+0x4d>
        s = (char*)*ap;
 666:	8b 45 d0             	mov    -0x30(%ebp),%eax
 669:	8b 18                	mov    (%eax),%ebx
        ap++;
 66b:	83 c0 04             	add    $0x4,%eax
 66e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 671:	85 db                	test   %ebx,%ebx
 673:	0f 84 87 00 00 00    	je     700 <printf+0x180>
        while(*s != 0){
 679:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 67c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 67e:	84 c0                	test   %al,%al
 680:	0f 84 47 ff ff ff    	je     5cd <printf+0x4d>
 686:	8d 55 e7             	lea    -0x19(%ebp),%edx
 689:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 68c:	89 de                	mov    %ebx,%esi
 68e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 690:	83 ec 04             	sub    $0x4,%esp
 693:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 696:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 699:	6a 01                	push   $0x1
 69b:	53                   	push   %ebx
 69c:	57                   	push   %edi
 69d:	e8 a8 fd ff ff       	call   44a <write>
        while(*s != 0){
 6a2:	0f b6 06             	movzbl (%esi),%eax
 6a5:	83 c4 10             	add    $0x10,%esp
 6a8:	84 c0                	test   %al,%al
 6aa:	75 e4                	jne    690 <printf+0x110>
      state = 0;
 6ac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 6af:	31 d2                	xor    %edx,%edx
 6b1:	e9 17 ff ff ff       	jmp    5cd <printf+0x4d>
        printint(fd, *ap, 10, 1);
 6b6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6b9:	83 ec 0c             	sub    $0xc,%esp
 6bc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6c1:	8b 13                	mov    (%ebx),%edx
 6c3:	6a 01                	push   $0x1
 6c5:	eb 88                	jmp    64f <printf+0xcf>
        putc(fd, *ap);
 6c7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6ca:	83 ec 04             	sub    $0x4,%esp
 6cd:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 6d0:	8b 03                	mov    (%ebx),%eax
        ap++;
 6d2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 6d5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6d8:	6a 01                	push   $0x1
 6da:	52                   	push   %edx
 6db:	57                   	push   %edi
 6dc:	e8 69 fd ff ff       	call   44a <write>
        ap++;
 6e1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6e4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6e7:	31 d2                	xor    %edx,%edx
 6e9:	e9 df fe ff ff       	jmp    5cd <printf+0x4d>
 6ee:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 6f0:	83 ec 04             	sub    $0x4,%esp
 6f3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6f6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6f9:	6a 01                	push   $0x1
 6fb:	e9 31 ff ff ff       	jmp    631 <printf+0xb1>
 700:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 705:	bb d8 08 00 00       	mov    $0x8d8,%ebx
 70a:	e9 77 ff ff ff       	jmp    686 <printf+0x106>
 70f:	90                   	nop

00000710 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 710:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	a1 90 0c 00 00       	mov    0xc90,%eax
{
 716:	89 e5                	mov    %esp,%ebp
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	53                   	push   %ebx
 71b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 71e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 728:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 72a:	39 c8                	cmp    %ecx,%eax
 72c:	73 32                	jae    760 <free+0x50>
 72e:	39 d1                	cmp    %edx,%ecx
 730:	72 04                	jb     736 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 732:	39 d0                	cmp    %edx,%eax
 734:	72 32                	jb     768 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 736:	8b 73 fc             	mov    -0x4(%ebx),%esi
 739:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 73c:	39 fa                	cmp    %edi,%edx
 73e:	74 30                	je     770 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 740:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 743:	8b 50 04             	mov    0x4(%eax),%edx
 746:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 749:	39 f1                	cmp    %esi,%ecx
 74b:	74 3a                	je     787 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 74d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 74f:	5b                   	pop    %ebx
  freep = p;
 750:	a3 90 0c 00 00       	mov    %eax,0xc90
}
 755:	5e                   	pop    %esi
 756:	5f                   	pop    %edi
 757:	5d                   	pop    %ebp
 758:	c3                   	ret
 759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 760:	39 d0                	cmp    %edx,%eax
 762:	72 04                	jb     768 <free+0x58>
 764:	39 d1                	cmp    %edx,%ecx
 766:	72 ce                	jb     736 <free+0x26>
{
 768:	89 d0                	mov    %edx,%eax
 76a:	eb bc                	jmp    728 <free+0x18>
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 770:	03 72 04             	add    0x4(%edx),%esi
 773:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 776:	8b 10                	mov    (%eax),%edx
 778:	8b 12                	mov    (%edx),%edx
 77a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 77d:	8b 50 04             	mov    0x4(%eax),%edx
 780:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 783:	39 f1                	cmp    %esi,%ecx
 785:	75 c6                	jne    74d <free+0x3d>
    p->s.size += bp->s.size;
 787:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 78a:	a3 90 0c 00 00       	mov    %eax,0xc90
    p->s.size += bp->s.size;
 78f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 792:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 795:	89 08                	mov    %ecx,(%eax)
}
 797:	5b                   	pop    %ebx
 798:	5e                   	pop    %esi
 799:	5f                   	pop    %edi
 79a:	5d                   	pop    %ebp
 79b:	c3                   	ret
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ac:	8b 15 90 0c 00 00    	mov    0xc90,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b2:	8d 78 07             	lea    0x7(%eax),%edi
 7b5:	c1 ef 03             	shr    $0x3,%edi
 7b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7bb:	85 d2                	test   %edx,%edx
 7bd:	0f 84 8d 00 00 00    	je     850 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7c5:	8b 48 04             	mov    0x4(%eax),%ecx
 7c8:	39 f9                	cmp    %edi,%ecx
 7ca:	73 64                	jae    830 <malloc+0x90>
  if(nu < 4096)
 7cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7d1:	39 df                	cmp    %ebx,%edi
 7d3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7d6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7dd:	eb 0a                	jmp    7e9 <malloc+0x49>
 7df:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7e2:	8b 48 04             	mov    0x4(%eax),%ecx
 7e5:	39 f9                	cmp    %edi,%ecx
 7e7:	73 47                	jae    830 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7e9:	89 c2                	mov    %eax,%edx
 7eb:	3b 05 90 0c 00 00    	cmp    0xc90,%eax
 7f1:	75 ed                	jne    7e0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 7f3:	83 ec 0c             	sub    $0xc,%esp
 7f6:	56                   	push   %esi
 7f7:	e8 b6 fc ff ff       	call   4b2 <sbrk>
  if(p == (char*)-1)
 7fc:	83 c4 10             	add    $0x10,%esp
 7ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 802:	74 1c                	je     820 <malloc+0x80>
  hp->s.size = nu;
 804:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 807:	83 ec 0c             	sub    $0xc,%esp
 80a:	83 c0 08             	add    $0x8,%eax
 80d:	50                   	push   %eax
 80e:	e8 fd fe ff ff       	call   710 <free>
  return freep;
 813:	8b 15 90 0c 00 00    	mov    0xc90,%edx
      if((p = morecore(nunits)) == 0)
 819:	83 c4 10             	add    $0x10,%esp
 81c:	85 d2                	test   %edx,%edx
 81e:	75 c0                	jne    7e0 <malloc+0x40>
        return 0;
  }
}
 820:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 823:	31 c0                	xor    %eax,%eax
}
 825:	5b                   	pop    %ebx
 826:	5e                   	pop    %esi
 827:	5f                   	pop    %edi
 828:	5d                   	pop    %ebp
 829:	c3                   	ret
 82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 830:	39 cf                	cmp    %ecx,%edi
 832:	74 4c                	je     880 <malloc+0xe0>
        p->s.size -= nunits;
 834:	29 f9                	sub    %edi,%ecx
 836:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 839:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 83c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 83f:	89 15 90 0c 00 00    	mov    %edx,0xc90
}
 845:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 848:	83 c0 08             	add    $0x8,%eax
}
 84b:	5b                   	pop    %ebx
 84c:	5e                   	pop    %esi
 84d:	5f                   	pop    %edi
 84e:	5d                   	pop    %ebp
 84f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 850:	c7 05 90 0c 00 00 94 	movl   $0xc94,0xc90
 857:	0c 00 00 
    base.s.size = 0;
 85a:	b8 94 0c 00 00       	mov    $0xc94,%eax
    base.s.ptr = freep = prevp = &base;
 85f:	c7 05 94 0c 00 00 94 	movl   $0xc94,0xc94
 866:	0c 00 00 
    base.s.size = 0;
 869:	c7 05 98 0c 00 00 00 	movl   $0x0,0xc98
 870:	00 00 00 
    if(p->s.size >= nunits){
 873:	e9 54 ff ff ff       	jmp    7cc <malloc+0x2c>
 878:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 87f:	00 
        prevp->s.ptr = p->s.ptr;
 880:	8b 08                	mov    (%eax),%ecx
 882:	89 0a                	mov    %ecx,(%edx)
 884:	eb b9                	jmp    83f <malloc+0x9f>
