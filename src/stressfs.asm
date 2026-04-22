
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   7:	b8 30 00 00 00       	mov    $0x30,%eax
{
   c:	ff 71 fc             	push   -0x4(%ecx)
   f:	55                   	push   %ebp
  10:	89 e5                	mov    %esp,%ebp
  12:	57                   	push   %edi
  13:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  14:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  1a:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
  1b:	31 db                	xor    %ebx,%ebx
{
  1d:	51                   	push   %ecx
  1e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  24:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
  2b:	68 b8 08 00 00       	push   $0x8b8
  30:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  32:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  39:	74 72 65 
  3c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  43:	73 66 73 
  printf(1, "stressfs starting\n");
  46:	e8 65 05 00 00       	call   5b0 <printf>
  memset(data, 'a', sizeof(data));
  4b:	83 c4 0c             	add    $0xc,%esp
  4e:	68 00 02 00 00       	push   $0x200
  53:	6a 61                	push   $0x61
  55:	56                   	push   %esi
  56:	e8 85 01 00 00       	call   1e0 <memset>
  5b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  5e:	e8 ef 03 00 00       	call   452 <fork>
  63:	85 c0                	test   %eax,%eax
  65:	7f 08                	jg     6f <main+0x6f>
  for(i = 0; i < 4; i++)
  67:	83 c3 01             	add    $0x1,%ebx
  6a:	83 fb 04             	cmp    $0x4,%ebx
  6d:	75 ef                	jne    5e <main+0x5e>
      break;

  printf(1, "write %d\n", i);
  6f:	83 ec 04             	sub    $0x4,%esp
  72:	53                   	push   %ebx
  73:	68 cb 08 00 00       	push   $0x8cb
  78:	6a 01                	push   $0x1
  7a:	e8 31 05 00 00       	call   5b0 <printf>

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  7f:	5f                   	pop    %edi
  80:	58                   	pop    %eax
  81:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  87:	68 02 02 00 00       	push   $0x202
  8c:	50                   	push   %eax
  path[8] += i;
  8d:	00 9d e6 fd ff ff    	add    %bl,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  93:	bb 14 00 00 00       	mov    $0x14,%ebx
  98:	e8 fd 03 00 00       	call   49a <open>
  9d:	83 c4 10             	add    $0x10,%esp
  a0:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  a8:	83 ec 04             	sub    $0x4,%esp
  ab:	68 00 02 00 00       	push   $0x200
  b0:	56                   	push   %esi
  b1:	57                   	push   %edi
  b2:	e8 c3 03 00 00       	call   47a <write>
  for(i = 0; i < 20; i++)
  b7:	83 c4 10             	add    $0x10,%esp
  ba:	83 eb 01             	sub    $0x1,%ebx
  bd:	75 e9                	jne    a8 <main+0xa8>
  close(fd);
  bf:	83 ec 0c             	sub    $0xc,%esp
  c2:	57                   	push   %edi
  c3:	e8 ba 03 00 00       	call   482 <close>

  printf(1, "read\n");
  c8:	58                   	pop    %eax
  c9:	5a                   	pop    %edx
  ca:	68 d5 08 00 00       	push   $0x8d5
  cf:	6a 01                	push   $0x1
  d1:	e8 da 04 00 00       	call   5b0 <printf>

  fd = open(path, O_RDONLY);
  d6:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  dc:	59                   	pop    %ecx
  dd:	5b                   	pop    %ebx
  de:	6a 00                	push   $0x0
  e0:	bb 14 00 00 00       	mov    $0x14,%ebx
  e5:	50                   	push   %eax
  e6:	e8 af 03 00 00       	call   49a <open>
  eb:	83 c4 10             	add    $0x10,%esp
  ee:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
  f0:	83 ec 04             	sub    $0x4,%esp
  f3:	68 00 02 00 00       	push   $0x200
  f8:	56                   	push   %esi
  f9:	57                   	push   %edi
  fa:	e8 73 03 00 00       	call   472 <read>
  for (i = 0; i < 20; i++)
  ff:	83 c4 10             	add    $0x10,%esp
 102:	83 eb 01             	sub    $0x1,%ebx
 105:	75 e9                	jne    f0 <main+0xf0>
  close(fd);
 107:	83 ec 0c             	sub    $0xc,%esp
 10a:	57                   	push   %edi
 10b:	e8 72 03 00 00       	call   482 <close>

  wait();
 110:	e8 4d 03 00 00       	call   462 <wait>

  exit();
 115:	e8 40 03 00 00       	call   45a <exit>
 11a:	66 90                	xchg   %ax,%ax
 11c:	66 90                	xchg   %ax,%ax
 11e:	66 90                	xchg   %ax,%ax

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
 36c:	e8 5f 04 00 00       	call   7d0 <malloc>
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
 3a7:	e8 94 03 00 00       	call   740 <free>
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
 3e2:	e8 59 03 00 00       	call   740 <free>
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

00000510 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
 516:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 518:	89 d1                	mov    %edx,%ecx
{
 51a:	83 ec 3c             	sub    $0x3c,%esp
 51d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 520:	85 d2                	test   %edx,%edx
 522:	0f 89 80 00 00 00    	jns    5a8 <printint+0x98>
 528:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 52c:	74 7a                	je     5a8 <printint+0x98>
    x = -xx;
 52e:	f7 d9                	neg    %ecx
    neg = 1;
 530:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 535:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 538:	31 f6                	xor    %esi,%esi
 53a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 540:	89 c8                	mov    %ecx,%eax
 542:	31 d2                	xor    %edx,%edx
 544:	89 f7                	mov    %esi,%edi
 546:	f7 f3                	div    %ebx
 548:	8d 76 01             	lea    0x1(%esi),%esi
 54b:	0f b6 92 3c 09 00 00 	movzbl 0x93c(%edx),%edx
 552:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 556:	89 ca                	mov    %ecx,%edx
 558:	89 c1                	mov    %eax,%ecx
 55a:	39 da                	cmp    %ebx,%edx
 55c:	73 e2                	jae    540 <printint+0x30>
  if(neg)
 55e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 561:	85 c0                	test   %eax,%eax
 563:	74 07                	je     56c <printint+0x5c>
    buf[i++] = '-';
 565:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 56a:	89 f7                	mov    %esi,%edi
 56c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 56f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 572:	01 df                	add    %ebx,%edi
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 578:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 57b:	83 ec 04             	sub    $0x4,%esp
 57e:	88 45 d7             	mov    %al,-0x29(%ebp)
 581:	8d 45 d7             	lea    -0x29(%ebp),%eax
 584:	6a 01                	push   $0x1
 586:	50                   	push   %eax
 587:	56                   	push   %esi
 588:	e8 ed fe ff ff       	call   47a <write>
  while(--i >= 0)
 58d:	89 f8                	mov    %edi,%eax
 58f:	83 c4 10             	add    $0x10,%esp
 592:	83 ef 01             	sub    $0x1,%edi
 595:	39 c3                	cmp    %eax,%ebx
 597:	75 df                	jne    578 <printint+0x68>
}
 599:	8d 65 f4             	lea    -0xc(%ebp),%esp
 59c:	5b                   	pop    %ebx
 59d:	5e                   	pop    %esi
 59e:	5f                   	pop    %edi
 59f:	5d                   	pop    %ebp
 5a0:	c3                   	ret
 5a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5a8:	31 c0                	xor    %eax,%eax
 5aa:	eb 89                	jmp    535 <printint+0x25>
 5ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	57                   	push   %edi
 5b4:	56                   	push   %esi
 5b5:	53                   	push   %ebx
 5b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5b9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 5bc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 5bf:	0f b6 1e             	movzbl (%esi),%ebx
 5c2:	83 c6 01             	add    $0x1,%esi
 5c5:	84 db                	test   %bl,%bl
 5c7:	74 67                	je     630 <printf+0x80>
 5c9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 5cc:	31 d2                	xor    %edx,%edx
 5ce:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 5d1:	eb 34                	jmp    607 <printf+0x57>
 5d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 5d8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5db:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5e0:	83 f8 25             	cmp    $0x25,%eax
 5e3:	74 18                	je     5fd <printf+0x4d>
  write(fd, &c, 1);
 5e5:	83 ec 04             	sub    $0x4,%esp
 5e8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5eb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5ee:	6a 01                	push   $0x1
 5f0:	50                   	push   %eax
 5f1:	57                   	push   %edi
 5f2:	e8 83 fe ff ff       	call   47a <write>
 5f7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5fa:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5fd:	0f b6 1e             	movzbl (%esi),%ebx
 600:	83 c6 01             	add    $0x1,%esi
 603:	84 db                	test   %bl,%bl
 605:	74 29                	je     630 <printf+0x80>
    c = fmt[i] & 0xff;
 607:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 60a:	85 d2                	test   %edx,%edx
 60c:	74 ca                	je     5d8 <printf+0x28>
      }
    } else if(state == '%'){
 60e:	83 fa 25             	cmp    $0x25,%edx
 611:	75 ea                	jne    5fd <printf+0x4d>
      if(c == 'd'){
 613:	83 f8 25             	cmp    $0x25,%eax
 616:	0f 84 04 01 00 00    	je     720 <printf+0x170>
 61c:	83 e8 63             	sub    $0x63,%eax
 61f:	83 f8 15             	cmp    $0x15,%eax
 622:	77 1c                	ja     640 <printf+0x90>
 624:	ff 24 85 e4 08 00 00 	jmp    *0x8e4(,%eax,4)
 62b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 630:	8d 65 f4             	lea    -0xc(%ebp),%esp
 633:	5b                   	pop    %ebx
 634:	5e                   	pop    %esi
 635:	5f                   	pop    %edi
 636:	5d                   	pop    %ebp
 637:	c3                   	ret
 638:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 63f:	00 
  write(fd, &c, 1);
 640:	83 ec 04             	sub    $0x4,%esp
 643:	8d 55 e7             	lea    -0x19(%ebp),%edx
 646:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 64a:	6a 01                	push   $0x1
 64c:	52                   	push   %edx
 64d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 650:	57                   	push   %edi
 651:	e8 24 fe ff ff       	call   47a <write>
 656:	83 c4 0c             	add    $0xc,%esp
 659:	88 5d e7             	mov    %bl,-0x19(%ebp)
 65c:	6a 01                	push   $0x1
 65e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 661:	52                   	push   %edx
 662:	57                   	push   %edi
 663:	e8 12 fe ff ff       	call   47a <write>
        putc(fd, c);
 668:	83 c4 10             	add    $0x10,%esp
      state = 0;
 66b:	31 d2                	xor    %edx,%edx
 66d:	eb 8e                	jmp    5fd <printf+0x4d>
 66f:	90                   	nop
        printint(fd, *ap, 16, 0);
 670:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 673:	83 ec 0c             	sub    $0xc,%esp
 676:	b9 10 00 00 00       	mov    $0x10,%ecx
 67b:	8b 13                	mov    (%ebx),%edx
 67d:	6a 00                	push   $0x0
 67f:	89 f8                	mov    %edi,%eax
        ap++;
 681:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 684:	e8 87 fe ff ff       	call   510 <printint>
        ap++;
 689:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 68c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 68f:	31 d2                	xor    %edx,%edx
 691:	e9 67 ff ff ff       	jmp    5fd <printf+0x4d>
        s = (char*)*ap;
 696:	8b 45 d0             	mov    -0x30(%ebp),%eax
 699:	8b 18                	mov    (%eax),%ebx
        ap++;
 69b:	83 c0 04             	add    $0x4,%eax
 69e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6a1:	85 db                	test   %ebx,%ebx
 6a3:	0f 84 87 00 00 00    	je     730 <printf+0x180>
        while(*s != 0){
 6a9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 6ac:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 6ae:	84 c0                	test   %al,%al
 6b0:	0f 84 47 ff ff ff    	je     5fd <printf+0x4d>
 6b6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6b9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6bc:	89 de                	mov    %ebx,%esi
 6be:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 6c0:	83 ec 04             	sub    $0x4,%esp
 6c3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 6c6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6c9:	6a 01                	push   $0x1
 6cb:	53                   	push   %ebx
 6cc:	57                   	push   %edi
 6cd:	e8 a8 fd ff ff       	call   47a <write>
        while(*s != 0){
 6d2:	0f b6 06             	movzbl (%esi),%eax
 6d5:	83 c4 10             	add    $0x10,%esp
 6d8:	84 c0                	test   %al,%al
 6da:	75 e4                	jne    6c0 <printf+0x110>
      state = 0;
 6dc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 6df:	31 d2                	xor    %edx,%edx
 6e1:	e9 17 ff ff ff       	jmp    5fd <printf+0x4d>
        printint(fd, *ap, 10, 1);
 6e6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6e9:	83 ec 0c             	sub    $0xc,%esp
 6ec:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6f1:	8b 13                	mov    (%ebx),%edx
 6f3:	6a 01                	push   $0x1
 6f5:	eb 88                	jmp    67f <printf+0xcf>
        putc(fd, *ap);
 6f7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6fa:	83 ec 04             	sub    $0x4,%esp
 6fd:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 700:	8b 03                	mov    (%ebx),%eax
        ap++;
 702:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 705:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 708:	6a 01                	push   $0x1
 70a:	52                   	push   %edx
 70b:	57                   	push   %edi
 70c:	e8 69 fd ff ff       	call   47a <write>
        ap++;
 711:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 714:	83 c4 10             	add    $0x10,%esp
      state = 0;
 717:	31 d2                	xor    %edx,%edx
 719:	e9 df fe ff ff       	jmp    5fd <printf+0x4d>
 71e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 720:	83 ec 04             	sub    $0x4,%esp
 723:	88 5d e7             	mov    %bl,-0x19(%ebp)
 726:	8d 55 e7             	lea    -0x19(%ebp),%edx
 729:	6a 01                	push   $0x1
 72b:	e9 31 ff ff ff       	jmp    661 <printf+0xb1>
 730:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 735:	bb db 08 00 00       	mov    $0x8db,%ebx
 73a:	e9 77 ff ff ff       	jmp    6b6 <printf+0x106>
 73f:	90                   	nop

00000740 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 740:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	a1 98 0c 00 00       	mov    0xc98,%eax
{
 746:	89 e5                	mov    %esp,%ebp
 748:	57                   	push   %edi
 749:	56                   	push   %esi
 74a:	53                   	push   %ebx
 74b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 74e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 758:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 75a:	39 c8                	cmp    %ecx,%eax
 75c:	73 32                	jae    790 <free+0x50>
 75e:	39 d1                	cmp    %edx,%ecx
 760:	72 04                	jb     766 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 762:	39 d0                	cmp    %edx,%eax
 764:	72 32                	jb     798 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 766:	8b 73 fc             	mov    -0x4(%ebx),%esi
 769:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 76c:	39 fa                	cmp    %edi,%edx
 76e:	74 30                	je     7a0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 770:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 773:	8b 50 04             	mov    0x4(%eax),%edx
 776:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 779:	39 f1                	cmp    %esi,%ecx
 77b:	74 3a                	je     7b7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 77d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 77f:	5b                   	pop    %ebx
  freep = p;
 780:	a3 98 0c 00 00       	mov    %eax,0xc98
}
 785:	5e                   	pop    %esi
 786:	5f                   	pop    %edi
 787:	5d                   	pop    %ebp
 788:	c3                   	ret
 789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 790:	39 d0                	cmp    %edx,%eax
 792:	72 04                	jb     798 <free+0x58>
 794:	39 d1                	cmp    %edx,%ecx
 796:	72 ce                	jb     766 <free+0x26>
{
 798:	89 d0                	mov    %edx,%eax
 79a:	eb bc                	jmp    758 <free+0x18>
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7a0:	03 72 04             	add    0x4(%edx),%esi
 7a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a6:	8b 10                	mov    (%eax),%edx
 7a8:	8b 12                	mov    (%edx),%edx
 7aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ad:	8b 50 04             	mov    0x4(%eax),%edx
 7b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7b3:	39 f1                	cmp    %esi,%ecx
 7b5:	75 c6                	jne    77d <free+0x3d>
    p->s.size += bp->s.size;
 7b7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7ba:	a3 98 0c 00 00       	mov    %eax,0xc98
    p->s.size += bp->s.size;
 7bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7c2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7c5:	89 08                	mov    %ecx,(%eax)
}
 7c7:	5b                   	pop    %ebx
 7c8:	5e                   	pop    %esi
 7c9:	5f                   	pop    %edi
 7ca:	5d                   	pop    %ebp
 7cb:	c3                   	ret
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
 7d4:	56                   	push   %esi
 7d5:	53                   	push   %ebx
 7d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7dc:	8b 15 98 0c 00 00    	mov    0xc98,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e2:	8d 78 07             	lea    0x7(%eax),%edi
 7e5:	c1 ef 03             	shr    $0x3,%edi
 7e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7eb:	85 d2                	test   %edx,%edx
 7ed:	0f 84 8d 00 00 00    	je     880 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7f5:	8b 48 04             	mov    0x4(%eax),%ecx
 7f8:	39 f9                	cmp    %edi,%ecx
 7fa:	73 64                	jae    860 <malloc+0x90>
  if(nu < 4096)
 7fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 801:	39 df                	cmp    %ebx,%edi
 803:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 806:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 80d:	eb 0a                	jmp    819 <malloc+0x49>
 80f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 810:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 812:	8b 48 04             	mov    0x4(%eax),%ecx
 815:	39 f9                	cmp    %edi,%ecx
 817:	73 47                	jae    860 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 819:	89 c2                	mov    %eax,%edx
 81b:	3b 05 98 0c 00 00    	cmp    0xc98,%eax
 821:	75 ed                	jne    810 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 823:	83 ec 0c             	sub    $0xc,%esp
 826:	56                   	push   %esi
 827:	e8 b6 fc ff ff       	call   4e2 <sbrk>
  if(p == (char*)-1)
 82c:	83 c4 10             	add    $0x10,%esp
 82f:	83 f8 ff             	cmp    $0xffffffff,%eax
 832:	74 1c                	je     850 <malloc+0x80>
  hp->s.size = nu;
 834:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 837:	83 ec 0c             	sub    $0xc,%esp
 83a:	83 c0 08             	add    $0x8,%eax
 83d:	50                   	push   %eax
 83e:	e8 fd fe ff ff       	call   740 <free>
  return freep;
 843:	8b 15 98 0c 00 00    	mov    0xc98,%edx
      if((p = morecore(nunits)) == 0)
 849:	83 c4 10             	add    $0x10,%esp
 84c:	85 d2                	test   %edx,%edx
 84e:	75 c0                	jne    810 <malloc+0x40>
        return 0;
  }
}
 850:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 853:	31 c0                	xor    %eax,%eax
}
 855:	5b                   	pop    %ebx
 856:	5e                   	pop    %esi
 857:	5f                   	pop    %edi
 858:	5d                   	pop    %ebp
 859:	c3                   	ret
 85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 860:	39 cf                	cmp    %ecx,%edi
 862:	74 4c                	je     8b0 <malloc+0xe0>
        p->s.size -= nunits;
 864:	29 f9                	sub    %edi,%ecx
 866:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 869:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 86c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 86f:	89 15 98 0c 00 00    	mov    %edx,0xc98
}
 875:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 878:	83 c0 08             	add    $0x8,%eax
}
 87b:	5b                   	pop    %ebx
 87c:	5e                   	pop    %esi
 87d:	5f                   	pop    %edi
 87e:	5d                   	pop    %ebp
 87f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 880:	c7 05 98 0c 00 00 9c 	movl   $0xc9c,0xc98
 887:	0c 00 00 
    base.s.size = 0;
 88a:	b8 9c 0c 00 00       	mov    $0xc9c,%eax
    base.s.ptr = freep = prevp = &base;
 88f:	c7 05 9c 0c 00 00 9c 	movl   $0xc9c,0xc9c
 896:	0c 00 00 
    base.s.size = 0;
 899:	c7 05 a0 0c 00 00 00 	movl   $0x0,0xca0
 8a0:	00 00 00 
    if(p->s.size >= nunits){
 8a3:	e9 54 ff ff ff       	jmp    7fc <malloc+0x2c>
 8a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8af:	00 
        prevp->s.ptr = p->s.ptr;
 8b0:	8b 08                	mov    (%eax),%ecx
 8b2:	89 0a                	mov    %ecx,(%edx)
 8b4:	eb b9                	jmp    86f <malloc+0x9f>
