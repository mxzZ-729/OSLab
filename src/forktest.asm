
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
   6:	e8 35 00 00 00       	call   40 <forktest>
  exit();
   b:	e8 4a 04 00 00       	call   45a <exit>

00000010 <printf>:
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	53                   	push   %ebx
  14:	83 ec 10             	sub    $0x10,%esp
  17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  1a:	53                   	push   %ebx
  1b:	e8 90 01 00 00       	call   1b0 <strlen>
  20:	83 c4 0c             	add    $0xc,%esp
  23:	50                   	push   %eax
  24:	53                   	push   %ebx
  25:	ff 75 08             	push   0x8(%ebp)
  28:	e8 4d 04 00 00       	call   47a <write>
}
  2d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  30:	83 c4 10             	add    $0x10,%esp
  33:	c9                   	leave
  34:	c3                   	ret
  35:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  3c:	00 
  3d:	8d 76 00             	lea    0x0(%esi),%esi

00000040 <forktest>:
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	53                   	push   %ebx
  for(n=0; n<N; n++){
  44:	31 db                	xor    %ebx,%ebx
{
  46:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
  49:	68 88 06 00 00       	push   $0x688
  4e:	e8 5d 01 00 00       	call   1b0 <strlen>
  53:	83 c4 0c             	add    $0xc,%esp
  56:	50                   	push   %eax
  57:	68 88 06 00 00       	push   $0x688
  5c:	6a 01                	push   $0x1
  5e:	e8 17 04 00 00       	call   47a <write>
  63:	83 c4 10             	add    $0x10,%esp
  66:	eb 19                	jmp    81 <forktest+0x41>
  68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  6f:	00 
    if(pid == 0)
  70:	74 58                	je     ca <forktest+0x8a>
  for(n=0; n<N; n++){
  72:	83 c3 01             	add    $0x1,%ebx
  75:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  7b:	0f 84 83 00 00 00    	je     104 <forktest+0xc4>
    pid = fork();
  81:	e8 cc 03 00 00       	call   452 <fork>
    if(pid < 0)
  86:	85 c0                	test   %eax,%eax
  88:	79 e6                	jns    70 <forktest+0x30>
  for(; n > 0; n--){
  8a:	85 db                	test   %ebx,%ebx
  8c:	74 10                	je     9e <forktest+0x5e>
  8e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  90:	e8 cd 03 00 00       	call   462 <wait>
  95:	85 c0                	test   %eax,%eax
  97:	78 36                	js     cf <forktest+0x8f>
  for(; n > 0; n--){
  99:	83 eb 01             	sub    $0x1,%ebx
  9c:	75 f2                	jne    90 <forktest+0x50>
  if(wait() != -1){
  9e:	e8 bf 03 00 00       	call   462 <wait>
  a3:	83 f8 ff             	cmp    $0xffffffff,%eax
  a6:	75 49                	jne    f1 <forktest+0xb1>
  write(fd, s, strlen(s));
  a8:	83 ec 0c             	sub    $0xc,%esp
  ab:	68 ba 06 00 00       	push   $0x6ba
  b0:	e8 fb 00 00 00       	call   1b0 <strlen>
  b5:	83 c4 0c             	add    $0xc,%esp
  b8:	50                   	push   %eax
  b9:	68 ba 06 00 00       	push   $0x6ba
  be:	6a 01                	push   $0x1
  c0:	e8 b5 03 00 00       	call   47a <write>
}
  c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c8:	c9                   	leave
  c9:	c3                   	ret
      exit();
  ca:	e8 8b 03 00 00       	call   45a <exit>
  write(fd, s, strlen(s));
  cf:	83 ec 0c             	sub    $0xc,%esp
  d2:	68 93 06 00 00       	push   $0x693
  d7:	e8 d4 00 00 00       	call   1b0 <strlen>
  dc:	83 c4 0c             	add    $0xc,%esp
  df:	50                   	push   %eax
  e0:	68 93 06 00 00       	push   $0x693
  e5:	6a 01                	push   $0x1
  e7:	e8 8e 03 00 00       	call   47a <write>
      exit();
  ec:	e8 69 03 00 00       	call   45a <exit>
    printf(1, "wait got too many\n");
  f1:	52                   	push   %edx
  f2:	52                   	push   %edx
  f3:	68 a7 06 00 00       	push   $0x6a7
  f8:	6a 01                	push   $0x1
  fa:	e8 11 ff ff ff       	call   10 <printf>
    exit();
  ff:	e8 56 03 00 00       	call   45a <exit>
    printf(1, "fork claimed to work N times!\n", N);
 104:	50                   	push   %eax
 105:	68 e8 03 00 00       	push   $0x3e8
 10a:	68 c8 06 00 00       	push   $0x6c8
 10f:	6a 01                	push   $0x1
 111:	e8 fa fe ff ff       	call   10 <printf>
    exit();
 116:	e8 3f 03 00 00       	call   45a <exit>
 11b:	66 90                	xchg   %ax,%ax
 11d:	66 90                	xchg   %ax,%ax
 11f:	90                   	nop

00000120 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 120:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 121:	31 c0                	xor    %eax,%eax
{
 123:	89 e5                	mov    %esp,%ebp
 125:	53                   	push   %ebx
 126:	8b 4d 08             	mov    0x8(%ebp),%ecx
 129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 130:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 134:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 137:	83 c0 01             	add    $0x1,%eax
 13a:	84 d2                	test   %dl,%dl
 13c:	75 f2                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 13e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 141:	89 c8                	mov    %ecx,%eax
 143:	c9                   	leave
 144:	c3                   	ret
 145:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 14c:	00 
 14d:	8d 76 00             	lea    0x0(%esi),%esi

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 55 08             	mov    0x8(%ebp),%edx
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 15a:	0f b6 02             	movzbl (%edx),%eax
 15d:	84 c0                	test   %al,%al
 15f:	75 17                	jne    178 <strcmp+0x28>
 161:	eb 3a                	jmp    19d <strcmp+0x4d>
 163:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 168:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 16c:	83 c2 01             	add    $0x1,%edx
 16f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 172:	84 c0                	test   %al,%al
 174:	74 1a                	je     190 <strcmp+0x40>
 176:	89 d9                	mov    %ebx,%ecx
 178:	0f b6 19             	movzbl (%ecx),%ebx
 17b:	38 c3                	cmp    %al,%bl
 17d:	74 e9                	je     168 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 17f:	29 d8                	sub    %ebx,%eax
}
 181:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 184:	c9                   	leave
 185:	c3                   	ret
 186:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 18d:	00 
 18e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 190:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 194:	31 c0                	xor    %eax,%eax
 196:	29 d8                	sub    %ebx,%eax
}
 198:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 19b:	c9                   	leave
 19c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 19d:	0f b6 19             	movzbl (%ecx),%ebx
 1a0:	31 c0                	xor    %eax,%eax
 1a2:	eb db                	jmp    17f <strcmp+0x2f>
 1a4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ab:	00 
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <strlen>:

uint
strlen(const char *s)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1b6:	80 3a 00             	cmpb   $0x0,(%edx)
 1b9:	74 15                	je     1d0 <strlen+0x20>
 1bb:	31 c0                	xor    %eax,%eax
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	83 c0 01             	add    $0x1,%eax
 1c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1c7:	89 c1                	mov    %eax,%ecx
 1c9:	75 f5                	jne    1c0 <strlen+0x10>
    ;
  return n;
}
 1cb:	89 c8                	mov    %ecx,%eax
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret
 1cf:	90                   	nop
  for(n = 0; s[n]; n++)
 1d0:	31 c9                	xor    %ecx,%ecx
}
 1d2:	5d                   	pop    %ebp
 1d3:	89 c8                	mov    %ecx,%eax
 1d5:	c3                   	ret
 1d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1dd:	00 
 1de:	66 90                	xchg   %ax,%ax

000001e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ed:	89 d7                	mov    %edx,%edi
 1ef:	fc                   	cld
 1f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1f2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1f5:	89 d0                	mov    %edx,%eax
 1f7:	c9                   	leave
 1f8:	c3                   	ret
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000200 <strchr>:

char*
strchr(const char *s, char c)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 20a:	0f b6 10             	movzbl (%eax),%edx
 20d:	84 d2                	test   %dl,%dl
 20f:	75 12                	jne    223 <strchr+0x23>
 211:	eb 1d                	jmp    230 <strchr+0x30>
 213:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 218:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 21c:	83 c0 01             	add    $0x1,%eax
 21f:	84 d2                	test   %dl,%dl
 221:	74 0d                	je     230 <strchr+0x30>
    if(*s == c)
 223:	38 d1                	cmp    %dl,%cl
 225:	75 f1                	jne    218 <strchr+0x18>
      return (char*)s;
  return 0;
}
 227:	5d                   	pop    %ebp
 228:	c3                   	ret
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 230:	31 c0                	xor    %eax,%eax
}
 232:	5d                   	pop    %ebp
 233:	c3                   	ret
 234:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23b:	00 
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000240 <gets>:

char*
gets(char *buf, int max)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 245:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 248:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 249:	31 db                	xor    %ebx,%ebx
{
 24b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 24e:	eb 27                	jmp    277 <gets+0x37>
    cc = read(0, &c, 1);
 250:	83 ec 04             	sub    $0x4,%esp
 253:	6a 01                	push   $0x1
 255:	56                   	push   %esi
 256:	6a 00                	push   $0x0
 258:	e8 15 02 00 00       	call   472 <read>
    if(cc < 1)
 25d:	83 c4 10             	add    $0x10,%esp
 260:	85 c0                	test   %eax,%eax
 262:	7e 1d                	jle    281 <gets+0x41>
      break;
    buf[i++] = c;
 264:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 268:	8b 55 08             	mov    0x8(%ebp),%edx
 26b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 26f:	3c 0a                	cmp    $0xa,%al
 271:	74 10                	je     283 <gets+0x43>
 273:	3c 0d                	cmp    $0xd,%al
 275:	74 0c                	je     283 <gets+0x43>
  for(i=0; i+1 < max; ){
 277:	89 df                	mov    %ebx,%edi
 279:	83 c3 01             	add    $0x1,%ebx
 27c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 27f:	7c cf                	jl     250 <gets+0x10>
 281:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 28a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 28d:	5b                   	pop    %ebx
 28e:	5e                   	pop    %esi
 28f:	5f                   	pop    %edi
 290:	5d                   	pop    %ebp
 291:	c3                   	ret
 292:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 299:	00 
 29a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a5:	83 ec 08             	sub    $0x8,%esp
 2a8:	6a 00                	push   $0x0
 2aa:	ff 75 08             	push   0x8(%ebp)
 2ad:	e8 e8 01 00 00       	call   49a <open>
  if(fd < 0)
 2b2:	83 c4 10             	add    $0x10,%esp
 2b5:	85 c0                	test   %eax,%eax
 2b7:	78 27                	js     2e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	ff 75 0c             	push   0xc(%ebp)
 2bf:	89 c3                	mov    %eax,%ebx
 2c1:	50                   	push   %eax
 2c2:	e8 eb 01 00 00       	call   4b2 <fstat>
  close(fd);
 2c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ca:	89 c6                	mov    %eax,%esi
  close(fd);
 2cc:	e8 b1 01 00 00       	call   482 <close>
  return r;
 2d1:	83 c4 10             	add    $0x10,%esp
}
 2d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2d7:	89 f0                	mov    %esi,%eax
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2e5:	eb ed                	jmp    2d4 <stat+0x34>
 2e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ee:	00 
 2ef:	90                   	nop

000002f0 <atoi>:

int
atoi(const char *s)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f7:	0f be 02             	movsbl (%edx),%eax
 2fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 300:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 305:	77 1e                	ja     325 <atoi+0x35>
 307:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 30e:	00 
 30f:	90                   	nop
    n = n*10 + *s++ - '0';
 310:	83 c2 01             	add    $0x1,%edx
 313:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 316:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 31a:	0f be 02             	movsbl (%edx),%eax
 31d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 320:	80 fb 09             	cmp    $0x9,%bl
 323:	76 eb                	jbe    310 <atoi+0x20>
  return n;
}
 325:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 328:	89 c8                	mov    %ecx,%eax
 32a:	c9                   	leave
 32b:	c3                   	ret
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	8b 45 10             	mov    0x10(%ebp),%eax
 337:	8b 55 08             	mov    0x8(%ebp),%edx
 33a:	56                   	push   %esi
 33b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 33e:	85 c0                	test   %eax,%eax
 340:	7e 13                	jle    355 <memmove+0x25>
 342:	01 d0                	add    %edx,%eax
  dst = vdst;
 344:	89 d7                	mov    %edx,%edi
 346:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 34d:	00 
 34e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 350:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 351:	39 f8                	cmp    %edi,%eax
 353:	75 fb                	jne    350 <memmove+0x20>
  return vdst;
}
 355:	5e                   	pop    %esi
 356:	89 d0                	mov    %edx,%eax
 358:	5f                   	pop    %edi
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret
 35b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000360 <thread_create>:

int
thread_create(void(*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	83 ec 10             	sub    $0x10,%esp
  int pid;
  void *raw;
  void *stack;

  raw = malloc(PGSIZE * 2);
 367:	68 00 20 00 00       	push   $0x2000
 36c:	e8 2f 02 00 00       	call   5a0 <malloc>
  if (raw == 0) {
 371:	83 c4 10             	add    $0x10,%esp
 374:	85 c0                	test   %eax,%eax
 376:	74 37                	je     3af <thread_create+0x4f>
 378:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  stack = (void *)(((uint)raw + sizeof(void *) + PGSIZE - 1) & ~(PGSIZE - 1));
 37a:	8d 80 03 10 00 00    	lea    0x1003(%eax),%eax
 380:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  ((void **)stack)[-1] = raw;
 385:	89 58 fc             	mov    %ebx,-0x4(%eax)

  pid = clone(start_routine, arg1, arg2, stack);
 388:	50                   	push   %eax
 389:	ff 75 10             	push   0x10(%ebp)
 38c:	ff 75 0c             	push   0xc(%ebp)
 38f:	ff 75 08             	push   0x8(%ebp)
 392:	e8 63 01 00 00       	call   4fa <clone>
  if (pid < 0) {
 397:	83 c4 10             	add    $0x10,%esp
 39a:	85 c0                	test   %eax,%eax
 39c:	78 05                	js     3a3 <thread_create+0x43>
    free(raw);
    return -1;
  }
  return pid;
}
 39e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a1:	c9                   	leave
 3a2:	c3                   	ret
    free(raw);
 3a3:	83 ec 0c             	sub    $0xc,%esp
 3a6:	53                   	push   %ebx
 3a7:	e8 64 01 00 00       	call   510 <free>
    return -1;
 3ac:	83 c4 10             	add    $0x10,%esp
    return -1;
 3af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3b4:	eb e8                	jmp    39e <thread_create+0x3e>
 3b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3bd:	00 
 3be:	66 90                	xchg   %ax,%ax

000003c0 <thread_join>:

int
thread_join(void) 
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	53                   	push   %ebx
  int pid;
  void *raw;
  void *stack;

  pid = join(&stack);
 3c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 3c7:	83 ec 20             	sub    $0x20,%esp
  pid = join(&stack);
 3ca:	50                   	push   %eax
 3cb:	e8 32 01 00 00       	call   502 <join>
  if (pid < 0) {
 3d0:	83 c4 10             	add    $0x10,%esp
 3d3:	85 c0                	test   %eax,%eax
 3d5:	78 21                	js     3f8 <thread_join+0x38>
 3d7:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  raw = ((void **)stack)[-1];
 3d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  free(raw);
 3dc:	83 ec 0c             	sub    $0xc,%esp
 3df:	ff 70 fc             	push   -0x4(%eax)
 3e2:	e8 29 01 00 00       	call   510 <free>
  return pid;
 3e7:	83 c4 10             	add    $0x10,%esp
}
 3ea:	89 d8                	mov    %ebx,%eax
 3ec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3ef:	c9                   	leave
 3f0:	c3                   	ret
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 3f8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 3fd:	eb eb                	jmp    3ea <thread_join+0x2a>
 3ff:	90                   	nop

00000400 <lock_init>:
  return value;
}

void 
lock_init(lock_t *lock)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 406:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 40c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 413:	5d                   	pop    %ebp
 414:	c3                   	ret
 415:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 41c:	00 
 41d:	8d 76 00             	lea    0x0(%esi),%esi

00000420 <lock_acquire>:

void
lock_acquire(lock_t *lock)
{
 420:	55                   	push   %ebp
  asm volatile (
 421:	ba 01 00 00 00       	mov    $0x1,%edx
{
 426:	89 e5                	mov    %esp,%ebp
 428:	8b 4d 08             	mov    0x8(%ebp),%ecx
  asm volatile (
 42b:	f0 0f c1 11          	lock xadd %edx,(%ecx)
  int myturn = fetch_and_add(&lock->ticket, 1);
  while (myturn != lock->turn);
 42f:	90                   	nop
 430:	8b 41 04             	mov    0x4(%ecx),%eax
 433:	39 d0                	cmp    %edx,%eax
 435:	75 f9                	jne    430 <lock_acquire+0x10>
}
 437:	5d                   	pop    %ebp
 438:	c3                   	ret
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000440 <lock_release>:

void 
lock_release(lock_t *lock)
{
 440:	55                   	push   %ebp
  asm volatile (
 441:	b8 01 00 00 00       	mov    $0x1,%eax
{
 446:	89 e5                	mov    %esp,%ebp
 448:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile (
 44b:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  fetch_and_add(&lock->turn, 1);
 450:	5d                   	pop    %ebp
 451:	c3                   	ret

00000452 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 452:	b8 01 00 00 00       	mov    $0x1,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret

0000045a <exit>:
SYSCALL(exit)
 45a:	b8 02 00 00 00       	mov    $0x2,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret

00000462 <wait>:
SYSCALL(wait)
 462:	b8 03 00 00 00       	mov    $0x3,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret

0000046a <pipe>:
SYSCALL(pipe)
 46a:	b8 04 00 00 00       	mov    $0x4,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret

00000472 <read>:
SYSCALL(read)
 472:	b8 05 00 00 00       	mov    $0x5,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret

0000047a <write>:
SYSCALL(write)
 47a:	b8 10 00 00 00       	mov    $0x10,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret

00000482 <close>:
SYSCALL(close)
 482:	b8 15 00 00 00       	mov    $0x15,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret

0000048a <kill>:
SYSCALL(kill)
 48a:	b8 06 00 00 00       	mov    $0x6,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret

00000492 <exec>:
SYSCALL(exec)
 492:	b8 07 00 00 00       	mov    $0x7,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret

0000049a <open>:
SYSCALL(open)
 49a:	b8 0f 00 00 00       	mov    $0xf,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret

000004a2 <mknod>:
SYSCALL(mknod)
 4a2:	b8 11 00 00 00       	mov    $0x11,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret

000004aa <unlink>:
SYSCALL(unlink)
 4aa:	b8 12 00 00 00       	mov    $0x12,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret

000004b2 <fstat>:
SYSCALL(fstat)
 4b2:	b8 08 00 00 00       	mov    $0x8,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret

000004ba <link>:
SYSCALL(link)
 4ba:	b8 13 00 00 00       	mov    $0x13,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret

000004c2 <mkdir>:
SYSCALL(mkdir)
 4c2:	b8 14 00 00 00       	mov    $0x14,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret

000004ca <chdir>:
SYSCALL(chdir)
 4ca:	b8 09 00 00 00       	mov    $0x9,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret

000004d2 <dup>:
SYSCALL(dup)
 4d2:	b8 0a 00 00 00       	mov    $0xa,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret

000004da <getpid>:
SYSCALL(getpid)
 4da:	b8 0b 00 00 00       	mov    $0xb,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret

000004e2 <sbrk>:
SYSCALL(sbrk)
 4e2:	b8 0c 00 00 00       	mov    $0xc,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret

000004ea <sleep>:
SYSCALL(sleep)
 4ea:	b8 0d 00 00 00       	mov    $0xd,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret

000004f2 <uptime>:
SYSCALL(uptime)
 4f2:	b8 0e 00 00 00       	mov    $0xe,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret

000004fa <clone>:
SYSCALL(clone)
 4fa:	b8 16 00 00 00       	mov    $0x16,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret

00000502 <join>:
SYSCALL(join)
 502:	b8 17 00 00 00       	mov    $0x17,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret
 50a:	66 90                	xchg   %ax,%ax
 50c:	66 90                	xchg   %ax,%ax
 50e:	66 90                	xchg   %ax,%ax

00000510 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 510:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 511:	a1 04 0a 00 00       	mov    0xa04,%eax
{
 516:	89 e5                	mov    %esp,%ebp
 518:	57                   	push   %edi
 519:	56                   	push   %esi
 51a:	53                   	push   %ebx
 51b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 51e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 528:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 52a:	39 c8                	cmp    %ecx,%eax
 52c:	73 32                	jae    560 <free+0x50>
 52e:	39 d1                	cmp    %edx,%ecx
 530:	72 04                	jb     536 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 532:	39 d0                	cmp    %edx,%eax
 534:	72 32                	jb     568 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 536:	8b 73 fc             	mov    -0x4(%ebx),%esi
 539:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 53c:	39 fa                	cmp    %edi,%edx
 53e:	74 30                	je     570 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 540:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 543:	8b 50 04             	mov    0x4(%eax),%edx
 546:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 549:	39 f1                	cmp    %esi,%ecx
 54b:	74 3a                	je     587 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 54d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 54f:	5b                   	pop    %ebx
  freep = p;
 550:	a3 04 0a 00 00       	mov    %eax,0xa04
}
 555:	5e                   	pop    %esi
 556:	5f                   	pop    %edi
 557:	5d                   	pop    %ebp
 558:	c3                   	ret
 559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 560:	39 d0                	cmp    %edx,%eax
 562:	72 04                	jb     568 <free+0x58>
 564:	39 d1                	cmp    %edx,%ecx
 566:	72 ce                	jb     536 <free+0x26>
{
 568:	89 d0                	mov    %edx,%eax
 56a:	eb bc                	jmp    528 <free+0x18>
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 570:	03 72 04             	add    0x4(%edx),%esi
 573:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 576:	8b 10                	mov    (%eax),%edx
 578:	8b 12                	mov    (%edx),%edx
 57a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 57d:	8b 50 04             	mov    0x4(%eax),%edx
 580:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 583:	39 f1                	cmp    %esi,%ecx
 585:	75 c6                	jne    54d <free+0x3d>
    p->s.size += bp->s.size;
 587:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 58a:	a3 04 0a 00 00       	mov    %eax,0xa04
    p->s.size += bp->s.size;
 58f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 592:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 595:	89 08                	mov    %ecx,(%eax)
}
 597:	5b                   	pop    %ebx
 598:	5e                   	pop    %esi
 599:	5f                   	pop    %edi
 59a:	5d                   	pop    %ebp
 59b:	c3                   	ret
 59c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 5ac:	8b 15 04 0a 00 00    	mov    0xa04,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5b2:	8d 78 07             	lea    0x7(%eax),%edi
 5b5:	c1 ef 03             	shr    $0x3,%edi
 5b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 5bb:	85 d2                	test   %edx,%edx
 5bd:	0f 84 8d 00 00 00    	je     650 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5c3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 5c5:	8b 48 04             	mov    0x4(%eax),%ecx
 5c8:	39 f9                	cmp    %edi,%ecx
 5ca:	73 64                	jae    630 <malloc+0x90>
  if(nu < 4096)
 5cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 5d1:	39 df                	cmp    %ebx,%edi
 5d3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 5d6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 5dd:	eb 0a                	jmp    5e9 <malloc+0x49>
 5df:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 5e2:	8b 48 04             	mov    0x4(%eax),%ecx
 5e5:	39 f9                	cmp    %edi,%ecx
 5e7:	73 47                	jae    630 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 5e9:	89 c2                	mov    %eax,%edx
 5eb:	3b 05 04 0a 00 00    	cmp    0xa04,%eax
 5f1:	75 ed                	jne    5e0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 5f3:	83 ec 0c             	sub    $0xc,%esp
 5f6:	56                   	push   %esi
 5f7:	e8 e6 fe ff ff       	call   4e2 <sbrk>
  if(p == (char*)-1)
 5fc:	83 c4 10             	add    $0x10,%esp
 5ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 602:	74 1c                	je     620 <malloc+0x80>
  hp->s.size = nu;
 604:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 607:	83 ec 0c             	sub    $0xc,%esp
 60a:	83 c0 08             	add    $0x8,%eax
 60d:	50                   	push   %eax
 60e:	e8 fd fe ff ff       	call   510 <free>
  return freep;
 613:	8b 15 04 0a 00 00    	mov    0xa04,%edx
      if((p = morecore(nunits)) == 0)
 619:	83 c4 10             	add    $0x10,%esp
 61c:	85 d2                	test   %edx,%edx
 61e:	75 c0                	jne    5e0 <malloc+0x40>
        return 0;
  }
}
 620:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 623:	31 c0                	xor    %eax,%eax
}
 625:	5b                   	pop    %ebx
 626:	5e                   	pop    %esi
 627:	5f                   	pop    %edi
 628:	5d                   	pop    %ebp
 629:	c3                   	ret
 62a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 630:	39 cf                	cmp    %ecx,%edi
 632:	74 4c                	je     680 <malloc+0xe0>
        p->s.size -= nunits;
 634:	29 f9                	sub    %edi,%ecx
 636:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 639:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 63c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 63f:	89 15 04 0a 00 00    	mov    %edx,0xa04
}
 645:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 648:	83 c0 08             	add    $0x8,%eax
}
 64b:	5b                   	pop    %ebx
 64c:	5e                   	pop    %esi
 64d:	5f                   	pop    %edi
 64e:	5d                   	pop    %ebp
 64f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 650:	c7 05 04 0a 00 00 08 	movl   $0xa08,0xa04
 657:	0a 00 00 
    base.s.size = 0;
 65a:	b8 08 0a 00 00       	mov    $0xa08,%eax
    base.s.ptr = freep = prevp = &base;
 65f:	c7 05 08 0a 00 00 08 	movl   $0xa08,0xa08
 666:	0a 00 00 
    base.s.size = 0;
 669:	c7 05 0c 0a 00 00 00 	movl   $0x0,0xa0c
 670:	00 00 00 
    if(p->s.size >= nunits){
 673:	e9 54 ff ff ff       	jmp    5cc <malloc+0x2c>
 678:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 67f:	00 
        prevp->s.ptr = p->s.ptr;
 680:	8b 08                	mov    (%eax),%ecx
 682:	89 0a                	mov    %ecx,(%edx)
 684:	eb b9                	jmp    63f <malloc+0x9f>
