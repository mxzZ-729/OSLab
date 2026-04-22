
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

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
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7f 28                	jg     51 <main+0x51>
  29:	eb 54                	jmp    7f <main+0x7f>
  2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  30:	83 ec 08             	sub    $0x8,%esp
  33:	ff 33                	push   (%ebx)
  for(i = 1; i < argc; i++){
  35:	83 c6 01             	add    $0x1,%esi
  38:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  3b:	50                   	push   %eax
  3c:	e8 5f 00 00 00       	call   a0 <wc>
    close(fd);
  41:	89 3c 24             	mov    %edi,(%esp)
  44:	e8 99 04 00 00       	call   4e2 <close>
  for(i = 1; i < argc; i++){
  49:	83 c4 10             	add    $0x10,%esp
  4c:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  4f:	74 29                	je     7a <main+0x7a>
    if((fd = open(argv[i], 0)) < 0){
  51:	83 ec 08             	sub    $0x8,%esp
  54:	6a 00                	push   $0x0
  56:	ff 33                	push   (%ebx)
  58:	e8 9d 04 00 00       	call   4fa <open>
  5d:	83 c4 10             	add    $0x10,%esp
  60:	89 c7                	mov    %eax,%edi
  62:	85 c0                	test   %eax,%eax
  64:	79 ca                	jns    30 <main+0x30>
      printf(1, "wc: cannot open %s\n", argv[i]);
  66:	50                   	push   %eax
  67:	ff 33                	push   (%ebx)
  69:	68 3b 09 00 00       	push   $0x93b
  6e:	6a 01                	push   $0x1
  70:	e8 9b 05 00 00       	call   610 <printf>
      exit();
  75:	e8 40 04 00 00       	call   4ba <exit>
  }
  exit();
  7a:	e8 3b 04 00 00       	call   4ba <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 2d 09 00 00       	push   $0x92d
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 28 04 00 00       	call   4ba <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  l = w = c = 0;
  a1:	31 d2                	xor    %edx,%edx
{
  a3:	89 e5                	mov    %esp,%ebp
  a5:	57                   	push   %edi
  a6:	56                   	push   %esi
  inword = 0;
  a7:	31 f6                	xor    %esi,%esi
{
  a9:	53                   	push   %ebx
  l = w = c = 0;
  aa:	31 db                	xor    %ebx,%ebx
{
  ac:	83 ec 1c             	sub    $0x1c,%esp
  l = w = c = 0;
  af:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  b6:	89 55 dc             	mov    %edx,-0x24(%ebp)
  b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 40 0d 00 00       	push   $0xd40
  cd:	ff 75 08             	push   0x8(%ebp)
  d0:	e8 fd 03 00 00       	call   4d2 <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	89 c1                	mov    %eax,%ecx
  da:	85 c0                	test   %eax,%eax
  dc:	7e 62                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  de:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  e1:	31 ff                	xor    %edi,%edi
  e3:	eb 0d                	jmp    f2 <wc+0x52>
  e5:	8d 76 00             	lea    0x0(%esi),%esi
        inword = 0;
  e8:	31 f6                	xor    %esi,%esi
    for(i=0; i<n; i++){
  ea:	83 c7 01             	add    $0x1,%edi
  ed:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  f0:	74 3e                	je     130 <wc+0x90>
      if(buf[i] == '\n')
  f2:	0f be 87 40 0d 00 00 	movsbl 0xd40(%edi),%eax
        l++;
  f9:	31 c9                	xor    %ecx,%ecx
  fb:	3c 0a                	cmp    $0xa,%al
  fd:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 100:	83 ec 08             	sub    $0x8,%esp
 103:	50                   	push   %eax
        l++;
 104:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 106:	68 18 09 00 00       	push   $0x918
 10b:	e8 50 01 00 00       	call   260 <strchr>
 110:	83 c4 10             	add    $0x10,%esp
 113:	85 c0                	test   %eax,%eax
 115:	75 d1                	jne    e8 <wc+0x48>
      else if(!inword){
 117:	85 f6                	test   %esi,%esi
 119:	75 cf                	jne    ea <wc+0x4a>
        w++;
 11b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 11f:	be 01 00 00 00       	mov    $0x1,%esi
    for(i=0; i<n; i++){
 124:	83 c7 01             	add    $0x1,%edi
 127:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
 12a:	75 c6                	jne    f2 <wc+0x52>
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 130:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 133:	01 4d dc             	add    %ecx,-0x24(%ebp)
 136:	eb 88                	jmp    c0 <wc+0x20>
 138:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 13f:	00 
  if(n < 0){
 140:	8b 55 dc             	mov    -0x24(%ebp),%edx
 143:	75 22                	jne    167 <wc+0xc7>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 145:	83 ec 08             	sub    $0x8,%esp
 148:	ff 75 0c             	push   0xc(%ebp)
 14b:	52                   	push   %edx
 14c:	ff 75 e0             	push   -0x20(%ebp)
 14f:	53                   	push   %ebx
 150:	68 2e 09 00 00       	push   $0x92e
 155:	6a 01                	push   $0x1
 157:	e8 b4 04 00 00       	call   610 <printf>
}
 15c:	83 c4 20             	add    $0x20,%esp
 15f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 162:	5b                   	pop    %ebx
 163:	5e                   	pop    %esi
 164:	5f                   	pop    %edi
 165:	5d                   	pop    %ebp
 166:	c3                   	ret
    printf(1, "wc: read error\n");
 167:	50                   	push   %eax
 168:	50                   	push   %eax
 169:	68 1e 09 00 00       	push   $0x91e
 16e:	6a 01                	push   $0x1
 170:	e8 9b 04 00 00       	call   610 <printf>
    exit();
 175:	e8 40 03 00 00       	call   4ba <exit>
 17a:	66 90                	xchg   %ax,%ax
 17c:	66 90                	xchg   %ax,%ax
 17e:	66 90                	xchg   %ax,%ax

00000180 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 181:	31 c0                	xor    %eax,%eax
{
 183:	89 e5                	mov    %esp,%ebp
 185:	53                   	push   %ebx
 186:	8b 4d 08             	mov    0x8(%ebp),%ecx
 189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 197:	83 c0 01             	add    $0x1,%eax
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 19e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a1:	89 c8                	mov    %ecx,%eax
 1a3:	c9                   	leave
 1a4:	c3                   	ret
 1a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ac:	00 
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ba:	0f b6 02             	movzbl (%edx),%eax
 1bd:	84 c0                	test   %al,%al
 1bf:	75 17                	jne    1d8 <strcmp+0x28>
 1c1:	eb 3a                	jmp    1fd <strcmp+0x4d>
 1c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 1c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1cc:	83 c2 01             	add    $0x1,%edx
 1cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1d2:	84 c0                	test   %al,%al
 1d4:	74 1a                	je     1f0 <strcmp+0x40>
 1d6:	89 d9                	mov    %ebx,%ecx
 1d8:	0f b6 19             	movzbl (%ecx),%ebx
 1db:	38 c3                	cmp    %al,%bl
 1dd:	74 e9                	je     1c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1df:	29 d8                	sub    %ebx,%eax
}
 1e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e4:	c9                   	leave
 1e5:	c3                   	ret
 1e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ed:	00 
 1ee:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 1f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1f4:	31 c0                	xor    %eax,%eax
 1f6:	29 d8                	sub    %ebx,%eax
}
 1f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fb:	c9                   	leave
 1fc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 1fd:	0f b6 19             	movzbl (%ecx),%ebx
 200:	31 c0                	xor    %eax,%eax
 202:	eb db                	jmp    1df <strcmp+0x2f>
 204:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 20b:	00 
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 216:	80 3a 00             	cmpb   $0x0,(%edx)
 219:	74 15                	je     230 <strlen+0x20>
 21b:	31 c0                	xor    %eax,%eax
 21d:	8d 76 00             	lea    0x0(%esi),%esi
 220:	83 c0 01             	add    $0x1,%eax
 223:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 227:	89 c1                	mov    %eax,%ecx
 229:	75 f5                	jne    220 <strlen+0x10>
    ;
  return n;
}
 22b:	89 c8                	mov    %ecx,%eax
 22d:	5d                   	pop    %ebp
 22e:	c3                   	ret
 22f:	90                   	nop
  for(n = 0; s[n]; n++)
 230:	31 c9                	xor    %ecx,%ecx
}
 232:	5d                   	pop    %ebp
 233:	89 c8                	mov    %ecx,%eax
 235:	c3                   	ret
 236:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23d:	00 
 23e:	66 90                	xchg   %ax,%ax

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 247:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 d7                	mov    %edx,%edi
 24f:	fc                   	cld
 250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 252:	8b 7d fc             	mov    -0x4(%ebp),%edi
 255:	89 d0                	mov    %edx,%eax
 257:	c9                   	leave
 258:	c3                   	ret
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26a:	0f b6 10             	movzbl (%eax),%edx
 26d:	84 d2                	test   %dl,%dl
 26f:	75 12                	jne    283 <strchr+0x23>
 271:	eb 1d                	jmp    290 <strchr+0x30>
 273:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 278:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 27c:	83 c0 01             	add    $0x1,%eax
 27f:	84 d2                	test   %dl,%dl
 281:	74 0d                	je     290 <strchr+0x30>
    if(*s == c)
 283:	38 d1                	cmp    %dl,%cl
 285:	75 f1                	jne    278 <strchr+0x18>
      return (char*)s;
  return 0;
}
 287:	5d                   	pop    %ebp
 288:	c3                   	ret
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 290:	31 c0                	xor    %eax,%eax
}
 292:	5d                   	pop    %ebp
 293:	c3                   	ret
 294:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 29b:	00 
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2a5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 2a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2a9:	31 db                	xor    %ebx,%ebx
{
 2ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2ae:	eb 27                	jmp    2d7 <gets+0x37>
    cc = read(0, &c, 1);
 2b0:	83 ec 04             	sub    $0x4,%esp
 2b3:	6a 01                	push   $0x1
 2b5:	56                   	push   %esi
 2b6:	6a 00                	push   $0x0
 2b8:	e8 15 02 00 00       	call   4d2 <read>
    if(cc < 1)
 2bd:	83 c4 10             	add    $0x10,%esp
 2c0:	85 c0                	test   %eax,%eax
 2c2:	7e 1d                	jle    2e1 <gets+0x41>
      break;
    buf[i++] = c;
 2c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c8:	8b 55 08             	mov    0x8(%ebp),%edx
 2cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2cf:	3c 0a                	cmp    $0xa,%al
 2d1:	74 10                	je     2e3 <gets+0x43>
 2d3:	3c 0d                	cmp    $0xd,%al
 2d5:	74 0c                	je     2e3 <gets+0x43>
  for(i=0; i+1 < max; ){
 2d7:	89 df                	mov    %ebx,%edi
 2d9:	83 c3 01             	add    $0x1,%ebx
 2dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2df:	7c cf                	jl     2b0 <gets+0x10>
 2e1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 2ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ed:	5b                   	pop    %ebx
 2ee:	5e                   	pop    %esi
 2ef:	5f                   	pop    %edi
 2f0:	5d                   	pop    %ebp
 2f1:	c3                   	ret
 2f2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2f9:	00 
 2fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000300 <stat>:

int
stat(const char *n, struct stat *st)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	56                   	push   %esi
 304:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 305:	83 ec 08             	sub    $0x8,%esp
 308:	6a 00                	push   $0x0
 30a:	ff 75 08             	push   0x8(%ebp)
 30d:	e8 e8 01 00 00       	call   4fa <open>
  if(fd < 0)
 312:	83 c4 10             	add    $0x10,%esp
 315:	85 c0                	test   %eax,%eax
 317:	78 27                	js     340 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	ff 75 0c             	push   0xc(%ebp)
 31f:	89 c3                	mov    %eax,%ebx
 321:	50                   	push   %eax
 322:	e8 eb 01 00 00       	call   512 <fstat>
  close(fd);
 327:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 32a:	89 c6                	mov    %eax,%esi
  close(fd);
 32c:	e8 b1 01 00 00       	call   4e2 <close>
  return r;
 331:	83 c4 10             	add    $0x10,%esp
}
 334:	8d 65 f8             	lea    -0x8(%ebp),%esp
 337:	89 f0                	mov    %esi,%eax
 339:	5b                   	pop    %ebx
 33a:	5e                   	pop    %esi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret
 33d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 340:	be ff ff ff ff       	mov    $0xffffffff,%esi
 345:	eb ed                	jmp    334 <stat+0x34>
 347:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 34e:	00 
 34f:	90                   	nop

00000350 <atoi>:

int
atoi(const char *s)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	53                   	push   %ebx
 354:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 357:	0f be 02             	movsbl (%edx),%eax
 35a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 35d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 360:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 365:	77 1e                	ja     385 <atoi+0x35>
 367:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 36e:	00 
 36f:	90                   	nop
    n = n*10 + *s++ - '0';
 370:	83 c2 01             	add    $0x1,%edx
 373:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 376:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 37a:	0f be 02             	movsbl (%edx),%eax
 37d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 380:	80 fb 09             	cmp    $0x9,%bl
 383:	76 eb                	jbe    370 <atoi+0x20>
  return n;
}
 385:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 388:	89 c8                	mov    %ecx,%eax
 38a:	c9                   	leave
 38b:	c3                   	ret
 38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000390 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	8b 45 10             	mov    0x10(%ebp),%eax
 397:	8b 55 08             	mov    0x8(%ebp),%edx
 39a:	56                   	push   %esi
 39b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 39e:	85 c0                	test   %eax,%eax
 3a0:	7e 13                	jle    3b5 <memmove+0x25>
 3a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3a4:	89 d7                	mov    %edx,%edi
 3a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ad:	00 
 3ae:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 3b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3b1:	39 f8                	cmp    %edi,%eax
 3b3:	75 fb                	jne    3b0 <memmove+0x20>
  return vdst;
}
 3b5:	5e                   	pop    %esi
 3b6:	89 d0                	mov    %edx,%eax
 3b8:	5f                   	pop    %edi
 3b9:	5d                   	pop    %ebp
 3ba:	c3                   	ret
 3bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000003c0 <thread_create>:

int
thread_create(void(*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	53                   	push   %ebx
 3c4:	83 ec 10             	sub    $0x10,%esp
  int pid;
  void *raw;
  void *stack;

  raw = malloc(PGSIZE * 2);
 3c7:	68 00 20 00 00       	push   $0x2000
 3cc:	e8 5f 04 00 00       	call   830 <malloc>
  if (raw == 0) {
 3d1:	83 c4 10             	add    $0x10,%esp
 3d4:	85 c0                	test   %eax,%eax
 3d6:	74 37                	je     40f <thread_create+0x4f>
 3d8:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  stack = (void *)(((uint)raw + sizeof(void *) + PGSIZE - 1) & ~(PGSIZE - 1));
 3da:	8d 80 03 10 00 00    	lea    0x1003(%eax),%eax
 3e0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  ((void **)stack)[-1] = raw;
 3e5:	89 58 fc             	mov    %ebx,-0x4(%eax)

  pid = clone(start_routine, arg1, arg2, stack);
 3e8:	50                   	push   %eax
 3e9:	ff 75 10             	push   0x10(%ebp)
 3ec:	ff 75 0c             	push   0xc(%ebp)
 3ef:	ff 75 08             	push   0x8(%ebp)
 3f2:	e8 63 01 00 00       	call   55a <clone>
  if (pid < 0) {
 3f7:	83 c4 10             	add    $0x10,%esp
 3fa:	85 c0                	test   %eax,%eax
 3fc:	78 05                	js     403 <thread_create+0x43>
    free(raw);
    return -1;
  }
  return pid;
}
 3fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 401:	c9                   	leave
 402:	c3                   	ret
    free(raw);
 403:	83 ec 0c             	sub    $0xc,%esp
 406:	53                   	push   %ebx
 407:	e8 94 03 00 00       	call   7a0 <free>
    return -1;
 40c:	83 c4 10             	add    $0x10,%esp
    return -1;
 40f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 414:	eb e8                	jmp    3fe <thread_create+0x3e>
 416:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 41d:	00 
 41e:	66 90                	xchg   %ax,%ax

00000420 <thread_join>:

int
thread_join(void) 
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	53                   	push   %ebx
  int pid;
  void *raw;
  void *stack;

  pid = join(&stack);
 424:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 427:	83 ec 20             	sub    $0x20,%esp
  pid = join(&stack);
 42a:	50                   	push   %eax
 42b:	e8 32 01 00 00       	call   562 <join>
  if (pid < 0) {
 430:	83 c4 10             	add    $0x10,%esp
 433:	85 c0                	test   %eax,%eax
 435:	78 21                	js     458 <thread_join+0x38>
 437:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  raw = ((void **)stack)[-1];
 439:	8b 45 f4             	mov    -0xc(%ebp),%eax
  free(raw);
 43c:	83 ec 0c             	sub    $0xc,%esp
 43f:	ff 70 fc             	push   -0x4(%eax)
 442:	e8 59 03 00 00       	call   7a0 <free>
  return pid;
 447:	83 c4 10             	add    $0x10,%esp
}
 44a:	89 d8                	mov    %ebx,%eax
 44c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 44f:	c9                   	leave
 450:	c3                   	ret
 451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 458:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 45d:	eb eb                	jmp    44a <thread_join+0x2a>
 45f:	90                   	nop

00000460 <lock_init>:
  return value;
}

void 
lock_init(lock_t *lock)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 466:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 46c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 473:	5d                   	pop    %ebp
 474:	c3                   	ret
 475:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 47c:	00 
 47d:	8d 76 00             	lea    0x0(%esi),%esi

00000480 <lock_acquire>:

void
lock_acquire(lock_t *lock)
{
 480:	55                   	push   %ebp
  asm volatile (
 481:	ba 01 00 00 00       	mov    $0x1,%edx
{
 486:	89 e5                	mov    %esp,%ebp
 488:	8b 4d 08             	mov    0x8(%ebp),%ecx
  asm volatile (
 48b:	f0 0f c1 11          	lock xadd %edx,(%ecx)
  int myturn = fetch_and_add(&lock->ticket, 1);
  while (myturn != lock->turn);
 48f:	90                   	nop
 490:	8b 41 04             	mov    0x4(%ecx),%eax
 493:	39 d0                	cmp    %edx,%eax
 495:	75 f9                	jne    490 <lock_acquire+0x10>
}
 497:	5d                   	pop    %ebp
 498:	c3                   	ret
 499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004a0 <lock_release>:

void 
lock_release(lock_t *lock)
{
 4a0:	55                   	push   %ebp
  asm volatile (
 4a1:	b8 01 00 00 00       	mov    $0x1,%eax
{
 4a6:	89 e5                	mov    %esp,%ebp
 4a8:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile (
 4ab:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  fetch_and_add(&lock->turn, 1);
 4b0:	5d                   	pop    %ebp
 4b1:	c3                   	ret

000004b2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4b2:	b8 01 00 00 00       	mov    $0x1,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret

000004ba <exit>:
SYSCALL(exit)
 4ba:	b8 02 00 00 00       	mov    $0x2,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret

000004c2 <wait>:
SYSCALL(wait)
 4c2:	b8 03 00 00 00       	mov    $0x3,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret

000004ca <pipe>:
SYSCALL(pipe)
 4ca:	b8 04 00 00 00       	mov    $0x4,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret

000004d2 <read>:
SYSCALL(read)
 4d2:	b8 05 00 00 00       	mov    $0x5,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret

000004da <write>:
SYSCALL(write)
 4da:	b8 10 00 00 00       	mov    $0x10,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret

000004e2 <close>:
SYSCALL(close)
 4e2:	b8 15 00 00 00       	mov    $0x15,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret

000004ea <kill>:
SYSCALL(kill)
 4ea:	b8 06 00 00 00       	mov    $0x6,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret

000004f2 <exec>:
SYSCALL(exec)
 4f2:	b8 07 00 00 00       	mov    $0x7,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret

000004fa <open>:
SYSCALL(open)
 4fa:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret

00000502 <mknod>:
SYSCALL(mknod)
 502:	b8 11 00 00 00       	mov    $0x11,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret

0000050a <unlink>:
SYSCALL(unlink)
 50a:	b8 12 00 00 00       	mov    $0x12,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret

00000512 <fstat>:
SYSCALL(fstat)
 512:	b8 08 00 00 00       	mov    $0x8,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret

0000051a <link>:
SYSCALL(link)
 51a:	b8 13 00 00 00       	mov    $0x13,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret

00000522 <mkdir>:
SYSCALL(mkdir)
 522:	b8 14 00 00 00       	mov    $0x14,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret

0000052a <chdir>:
SYSCALL(chdir)
 52a:	b8 09 00 00 00       	mov    $0x9,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret

00000532 <dup>:
SYSCALL(dup)
 532:	b8 0a 00 00 00       	mov    $0xa,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret

0000053a <getpid>:
SYSCALL(getpid)
 53a:	b8 0b 00 00 00       	mov    $0xb,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret

00000542 <sbrk>:
SYSCALL(sbrk)
 542:	b8 0c 00 00 00       	mov    $0xc,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret

0000054a <sleep>:
SYSCALL(sleep)
 54a:	b8 0d 00 00 00       	mov    $0xd,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret

00000552 <uptime>:
SYSCALL(uptime)
 552:	b8 0e 00 00 00       	mov    $0xe,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret

0000055a <clone>:
SYSCALL(clone)
 55a:	b8 16 00 00 00       	mov    $0x16,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret

00000562 <join>:
SYSCALL(join)
 562:	b8 17 00 00 00       	mov    $0x17,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret
 56a:	66 90                	xchg   %ax,%ax
 56c:	66 90                	xchg   %ax,%ax
 56e:	66 90                	xchg   %ax,%ax

00000570 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 578:	89 d1                	mov    %edx,%ecx
{
 57a:	83 ec 3c             	sub    $0x3c,%esp
 57d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 580:	85 d2                	test   %edx,%edx
 582:	0f 89 80 00 00 00    	jns    608 <printint+0x98>
 588:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 58c:	74 7a                	je     608 <printint+0x98>
    x = -xx;
 58e:	f7 d9                	neg    %ecx
    neg = 1;
 590:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 595:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 598:	31 f6                	xor    %esi,%esi
 59a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5a0:	89 c8                	mov    %ecx,%eax
 5a2:	31 d2                	xor    %edx,%edx
 5a4:	89 f7                	mov    %esi,%edi
 5a6:	f7 f3                	div    %ebx
 5a8:	8d 76 01             	lea    0x1(%esi),%esi
 5ab:	0f b6 92 b0 09 00 00 	movzbl 0x9b0(%edx),%edx
 5b2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 5b6:	89 ca                	mov    %ecx,%edx
 5b8:	89 c1                	mov    %eax,%ecx
 5ba:	39 da                	cmp    %ebx,%edx
 5bc:	73 e2                	jae    5a0 <printint+0x30>
  if(neg)
 5be:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 5c1:	85 c0                	test   %eax,%eax
 5c3:	74 07                	je     5cc <printint+0x5c>
    buf[i++] = '-';
 5c5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 5ca:	89 f7                	mov    %esi,%edi
 5cc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 5cf:	8b 75 c0             	mov    -0x40(%ebp),%esi
 5d2:	01 df                	add    %ebx,%edi
 5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 5d8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 5db:	83 ec 04             	sub    $0x4,%esp
 5de:	88 45 d7             	mov    %al,-0x29(%ebp)
 5e1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 5e4:	6a 01                	push   $0x1
 5e6:	50                   	push   %eax
 5e7:	56                   	push   %esi
 5e8:	e8 ed fe ff ff       	call   4da <write>
  while(--i >= 0)
 5ed:	89 f8                	mov    %edi,%eax
 5ef:	83 c4 10             	add    $0x10,%esp
 5f2:	83 ef 01             	sub    $0x1,%edi
 5f5:	39 c3                	cmp    %eax,%ebx
 5f7:	75 df                	jne    5d8 <printint+0x68>
}
 5f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5fc:	5b                   	pop    %ebx
 5fd:	5e                   	pop    %esi
 5fe:	5f                   	pop    %edi
 5ff:	5d                   	pop    %ebp
 600:	c3                   	ret
 601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 608:	31 c0                	xor    %eax,%eax
 60a:	eb 89                	jmp    595 <printint+0x25>
 60c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000610 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	56                   	push   %esi
 615:	53                   	push   %ebx
 616:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 619:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 61c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 61f:	0f b6 1e             	movzbl (%esi),%ebx
 622:	83 c6 01             	add    $0x1,%esi
 625:	84 db                	test   %bl,%bl
 627:	74 67                	je     690 <printf+0x80>
 629:	8d 4d 10             	lea    0x10(%ebp),%ecx
 62c:	31 d2                	xor    %edx,%edx
 62e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 631:	eb 34                	jmp    667 <printf+0x57>
 633:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 638:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 63b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 640:	83 f8 25             	cmp    $0x25,%eax
 643:	74 18                	je     65d <printf+0x4d>
  write(fd, &c, 1);
 645:	83 ec 04             	sub    $0x4,%esp
 648:	8d 45 e7             	lea    -0x19(%ebp),%eax
 64b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 64e:	6a 01                	push   $0x1
 650:	50                   	push   %eax
 651:	57                   	push   %edi
 652:	e8 83 fe ff ff       	call   4da <write>
 657:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 65a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 65d:	0f b6 1e             	movzbl (%esi),%ebx
 660:	83 c6 01             	add    $0x1,%esi
 663:	84 db                	test   %bl,%bl
 665:	74 29                	je     690 <printf+0x80>
    c = fmt[i] & 0xff;
 667:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 66a:	85 d2                	test   %edx,%edx
 66c:	74 ca                	je     638 <printf+0x28>
      }
    } else if(state == '%'){
 66e:	83 fa 25             	cmp    $0x25,%edx
 671:	75 ea                	jne    65d <printf+0x4d>
      if(c == 'd'){
 673:	83 f8 25             	cmp    $0x25,%eax
 676:	0f 84 04 01 00 00    	je     780 <printf+0x170>
 67c:	83 e8 63             	sub    $0x63,%eax
 67f:	83 f8 15             	cmp    $0x15,%eax
 682:	77 1c                	ja     6a0 <printf+0x90>
 684:	ff 24 85 58 09 00 00 	jmp    *0x958(,%eax,4)
 68b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 690:	8d 65 f4             	lea    -0xc(%ebp),%esp
 693:	5b                   	pop    %ebx
 694:	5e                   	pop    %esi
 695:	5f                   	pop    %edi
 696:	5d                   	pop    %ebp
 697:	c3                   	ret
 698:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 69f:	00 
  write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
 6a3:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6a6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6aa:	6a 01                	push   $0x1
 6ac:	52                   	push   %edx
 6ad:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 6b0:	57                   	push   %edi
 6b1:	e8 24 fe ff ff       	call   4da <write>
 6b6:	83 c4 0c             	add    $0xc,%esp
 6b9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6bc:	6a 01                	push   $0x1
 6be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 6c1:	52                   	push   %edx
 6c2:	57                   	push   %edi
 6c3:	e8 12 fe ff ff       	call   4da <write>
        putc(fd, c);
 6c8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6cb:	31 d2                	xor    %edx,%edx
 6cd:	eb 8e                	jmp    65d <printf+0x4d>
 6cf:	90                   	nop
        printint(fd, *ap, 16, 0);
 6d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6d3:	83 ec 0c             	sub    $0xc,%esp
 6d6:	b9 10 00 00 00       	mov    $0x10,%ecx
 6db:	8b 13                	mov    (%ebx),%edx
 6dd:	6a 00                	push   $0x0
 6df:	89 f8                	mov    %edi,%eax
        ap++;
 6e1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 6e4:	e8 87 fe ff ff       	call   570 <printint>
        ap++;
 6e9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6ec:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ef:	31 d2                	xor    %edx,%edx
 6f1:	e9 67 ff ff ff       	jmp    65d <printf+0x4d>
        s = (char*)*ap;
 6f6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6f9:	8b 18                	mov    (%eax),%ebx
        ap++;
 6fb:	83 c0 04             	add    $0x4,%eax
 6fe:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 701:	85 db                	test   %ebx,%ebx
 703:	0f 84 87 00 00 00    	je     790 <printf+0x180>
        while(*s != 0){
 709:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 70c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 70e:	84 c0                	test   %al,%al
 710:	0f 84 47 ff ff ff    	je     65d <printf+0x4d>
 716:	8d 55 e7             	lea    -0x19(%ebp),%edx
 719:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 71c:	89 de                	mov    %ebx,%esi
 71e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 720:	83 ec 04             	sub    $0x4,%esp
 723:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 726:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 729:	6a 01                	push   $0x1
 72b:	53                   	push   %ebx
 72c:	57                   	push   %edi
 72d:	e8 a8 fd ff ff       	call   4da <write>
        while(*s != 0){
 732:	0f b6 06             	movzbl (%esi),%eax
 735:	83 c4 10             	add    $0x10,%esp
 738:	84 c0                	test   %al,%al
 73a:	75 e4                	jne    720 <printf+0x110>
      state = 0;
 73c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 73f:	31 d2                	xor    %edx,%edx
 741:	e9 17 ff ff ff       	jmp    65d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 746:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 749:	83 ec 0c             	sub    $0xc,%esp
 74c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 751:	8b 13                	mov    (%ebx),%edx
 753:	6a 01                	push   $0x1
 755:	eb 88                	jmp    6df <printf+0xcf>
        putc(fd, *ap);
 757:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 75a:	83 ec 04             	sub    $0x4,%esp
 75d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 760:	8b 03                	mov    (%ebx),%eax
        ap++;
 762:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 765:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 768:	6a 01                	push   $0x1
 76a:	52                   	push   %edx
 76b:	57                   	push   %edi
 76c:	e8 69 fd ff ff       	call   4da <write>
        ap++;
 771:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 774:	83 c4 10             	add    $0x10,%esp
      state = 0;
 777:	31 d2                	xor    %edx,%edx
 779:	e9 df fe ff ff       	jmp    65d <printf+0x4d>
 77e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 780:	83 ec 04             	sub    $0x4,%esp
 783:	88 5d e7             	mov    %bl,-0x19(%ebp)
 786:	8d 55 e7             	lea    -0x19(%ebp),%edx
 789:	6a 01                	push   $0x1
 78b:	e9 31 ff ff ff       	jmp    6c1 <printf+0xb1>
 790:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 795:	bb 4f 09 00 00       	mov    $0x94f,%ebx
 79a:	e9 77 ff ff ff       	jmp    716 <printf+0x106>
 79f:	90                   	nop

000007a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a1:	a1 40 0f 00 00       	mov    0xf40,%eax
{
 7a6:	89 e5                	mov    %esp,%ebp
 7a8:	57                   	push   %edi
 7a9:	56                   	push   %esi
 7aa:	53                   	push   %ebx
 7ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ba:	39 c8                	cmp    %ecx,%eax
 7bc:	73 32                	jae    7f0 <free+0x50>
 7be:	39 d1                	cmp    %edx,%ecx
 7c0:	72 04                	jb     7c6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c2:	39 d0                	cmp    %edx,%eax
 7c4:	72 32                	jb     7f8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7c6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7c9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7cc:	39 fa                	cmp    %edi,%edx
 7ce:	74 30                	je     800 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7d3:	8b 50 04             	mov    0x4(%eax),%edx
 7d6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d9:	39 f1                	cmp    %esi,%ecx
 7db:	74 3a                	je     817 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7dd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7df:	5b                   	pop    %ebx
  freep = p;
 7e0:	a3 40 0f 00 00       	mov    %eax,0xf40
}
 7e5:	5e                   	pop    %esi
 7e6:	5f                   	pop    %edi
 7e7:	5d                   	pop    %ebp
 7e8:	c3                   	ret
 7e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f0:	39 d0                	cmp    %edx,%eax
 7f2:	72 04                	jb     7f8 <free+0x58>
 7f4:	39 d1                	cmp    %edx,%ecx
 7f6:	72 ce                	jb     7c6 <free+0x26>
{
 7f8:	89 d0                	mov    %edx,%eax
 7fa:	eb bc                	jmp    7b8 <free+0x18>
 7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 800:	03 72 04             	add    0x4(%edx),%esi
 803:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 806:	8b 10                	mov    (%eax),%edx
 808:	8b 12                	mov    (%edx),%edx
 80a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 80d:	8b 50 04             	mov    0x4(%eax),%edx
 810:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 813:	39 f1                	cmp    %esi,%ecx
 815:	75 c6                	jne    7dd <free+0x3d>
    p->s.size += bp->s.size;
 817:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 81a:	a3 40 0f 00 00       	mov    %eax,0xf40
    p->s.size += bp->s.size;
 81f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 822:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 825:	89 08                	mov    %ecx,(%eax)
}
 827:	5b                   	pop    %ebx
 828:	5e                   	pop    %esi
 829:	5f                   	pop    %edi
 82a:	5d                   	pop    %ebp
 82b:	c3                   	ret
 82c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000830 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	57                   	push   %edi
 834:	56                   	push   %esi
 835:	53                   	push   %ebx
 836:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 839:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 83c:	8b 15 40 0f 00 00    	mov    0xf40,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 842:	8d 78 07             	lea    0x7(%eax),%edi
 845:	c1 ef 03             	shr    $0x3,%edi
 848:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 84b:	85 d2                	test   %edx,%edx
 84d:	0f 84 8d 00 00 00    	je     8e0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 853:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 855:	8b 48 04             	mov    0x4(%eax),%ecx
 858:	39 f9                	cmp    %edi,%ecx
 85a:	73 64                	jae    8c0 <malloc+0x90>
  if(nu < 4096)
 85c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 861:	39 df                	cmp    %ebx,%edi
 863:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 866:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 86d:	eb 0a                	jmp    879 <malloc+0x49>
 86f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 870:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 872:	8b 48 04             	mov    0x4(%eax),%ecx
 875:	39 f9                	cmp    %edi,%ecx
 877:	73 47                	jae    8c0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 879:	89 c2                	mov    %eax,%edx
 87b:	3b 05 40 0f 00 00    	cmp    0xf40,%eax
 881:	75 ed                	jne    870 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 883:	83 ec 0c             	sub    $0xc,%esp
 886:	56                   	push   %esi
 887:	e8 b6 fc ff ff       	call   542 <sbrk>
  if(p == (char*)-1)
 88c:	83 c4 10             	add    $0x10,%esp
 88f:	83 f8 ff             	cmp    $0xffffffff,%eax
 892:	74 1c                	je     8b0 <malloc+0x80>
  hp->s.size = nu;
 894:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 897:	83 ec 0c             	sub    $0xc,%esp
 89a:	83 c0 08             	add    $0x8,%eax
 89d:	50                   	push   %eax
 89e:	e8 fd fe ff ff       	call   7a0 <free>
  return freep;
 8a3:	8b 15 40 0f 00 00    	mov    0xf40,%edx
      if((p = morecore(nunits)) == 0)
 8a9:	83 c4 10             	add    $0x10,%esp
 8ac:	85 d2                	test   %edx,%edx
 8ae:	75 c0                	jne    870 <malloc+0x40>
        return 0;
  }
}
 8b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8b3:	31 c0                	xor    %eax,%eax
}
 8b5:	5b                   	pop    %ebx
 8b6:	5e                   	pop    %esi
 8b7:	5f                   	pop    %edi
 8b8:	5d                   	pop    %ebp
 8b9:	c3                   	ret
 8ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8c0:	39 cf                	cmp    %ecx,%edi
 8c2:	74 4c                	je     910 <malloc+0xe0>
        p->s.size -= nunits;
 8c4:	29 f9                	sub    %edi,%ecx
 8c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8cc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 8cf:	89 15 40 0f 00 00    	mov    %edx,0xf40
}
 8d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8d8:	83 c0 08             	add    $0x8,%eax
}
 8db:	5b                   	pop    %ebx
 8dc:	5e                   	pop    %esi
 8dd:	5f                   	pop    %edi
 8de:	5d                   	pop    %ebp
 8df:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 8e0:	c7 05 40 0f 00 00 44 	movl   $0xf44,0xf40
 8e7:	0f 00 00 
    base.s.size = 0;
 8ea:	b8 44 0f 00 00       	mov    $0xf44,%eax
    base.s.ptr = freep = prevp = &base;
 8ef:	c7 05 44 0f 00 00 44 	movl   $0xf44,0xf44
 8f6:	0f 00 00 
    base.s.size = 0;
 8f9:	c7 05 48 0f 00 00 00 	movl   $0x0,0xf48
 900:	00 00 00 
    if(p->s.size >= nunits){
 903:	e9 54 ff ff ff       	jmp    85c <malloc+0x2c>
 908:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 90f:	00 
        prevp->s.ptr = p->s.ptr;
 910:	8b 08                	mov    (%eax),%ecx
 912:	89 0a                	mov    %ecx,(%edx)
 914:	eb b9                	jmp    8cf <malloc+0x9f>
