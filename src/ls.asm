
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
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
   f:	53                   	push   %ebx
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 1f                	jle    42 <main+0x42>
  23:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  31:	e8 ca 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  36:	83 c4 10             	add    $0x10,%esp
  39:	39 de                	cmp    %ebx,%esi
  3b:	75 eb                	jne    28 <main+0x28>
  exit();
  3d:	e8 28 06 00 00       	call   66a <exit>
    ls(".");
  42:	83 ec 0c             	sub    $0xc,%esp
  45:	68 10 0b 00 00       	push   $0xb10
  4a:	e8 b1 00 00 00       	call   100 <ls>
    exit();
  4f:	e8 16 06 00 00       	call   66a <exit>
  54:	66 90                	xchg   %ax,%ax
  56:	66 90                	xchg   %ax,%ax
  58:	66 90                	xchg   %ax,%ax
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <fmtname>:
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  68:	83 ec 0c             	sub    $0xc,%esp
  6b:	56                   	push   %esi
  6c:	e8 4f 03 00 00       	call   3c0 <strlen>
  71:	83 c4 10             	add    $0x10,%esp
  74:	01 f0                	add    %esi,%eax
  76:	89 c3                	mov    %eax,%ebx
  78:	73 0f                	jae    89 <fmtname+0x29>
  7a:	eb 12                	jmp    8e <fmtname+0x2e>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 f0                	cmp    %esi,%eax
  85:	72 0a                	jb     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  p++;
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 26 03 00 00       	call   3c0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 15 03 00 00       	call   3c0 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 48 0f 00 00       	push   $0xf48
  b5:	e8 86 04 00 00       	call   540 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 fe 02 00 00       	call   3c0 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb 48 0f 00 00       	mov    $0xf48,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 ef 02 00 00       	call   3c0 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 48 0f 00 00       	add    $0xf48,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 07 03 00 00       	call   3f0 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret
  f5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  fc:	00 
  fd:	8d 76 00             	lea    0x0(%esi),%esi

00000100 <ls>:
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	56                   	push   %esi
 105:	53                   	push   %ebx
 106:	81 ec 64 02 00 00    	sub    $0x264,%esp
 10c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 10f:	6a 00                	push   $0x0
 111:	57                   	push   %edi
 112:	e8 93 05 00 00       	call   6aa <open>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	0f 88 8e 01 00 00    	js     2b0 <ls+0x1b0>
  if(fstat(fd, &st) < 0){
 122:	83 ec 08             	sub    $0x8,%esp
 125:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12b:	89 c3                	mov    %eax,%ebx
 12d:	56                   	push   %esi
 12e:	50                   	push   %eax
 12f:	e8 8e 05 00 00       	call   6c2 <fstat>
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	0f 88 b1 01 00 00    	js     2f0 <ls+0x1f0>
  switch(st.type){
 13f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 146:	66 83 f8 01          	cmp    $0x1,%ax
 14a:	74 54                	je     1a0 <ls+0xa0>
 14c:	66 83 f8 02          	cmp    $0x2,%ax
 150:	75 37                	jne    189 <ls+0x89>
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 152:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 158:	83 ec 0c             	sub    $0xc,%esp
 15b:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 161:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 167:	57                   	push   %edi
 168:	e8 f3 fe ff ff       	call   60 <fmtname>
 16d:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 173:	59                   	pop    %ecx
 174:	5f                   	pop    %edi
 175:	52                   	push   %edx
 176:	56                   	push   %esi
 177:	6a 02                	push   $0x2
 179:	50                   	push   %eax
 17a:	68 f0 0a 00 00       	push   $0xaf0
 17f:	6a 01                	push   $0x1
 181:	e8 3a 06 00 00       	call   7c0 <printf>
    break;
 186:	83 c4 20             	add    $0x20,%esp
  close(fd);
 189:	83 ec 0c             	sub    $0xc,%esp
 18c:	53                   	push   %ebx
 18d:	e8 00 05 00 00       	call   692 <close>
 192:	83 c4 10             	add    $0x10,%esp
}
 195:	8d 65 f4             	lea    -0xc(%ebp),%esp
 198:	5b                   	pop    %ebx
 199:	5e                   	pop    %esi
 19a:	5f                   	pop    %edi
 19b:	5d                   	pop    %ebp
 19c:	c3                   	ret
 19d:	8d 76 00             	lea    0x0(%esi),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1a0:	83 ec 0c             	sub    $0xc,%esp
 1a3:	57                   	push   %edi
 1a4:	e8 17 02 00 00       	call   3c0 <strlen>
 1a9:	83 c4 10             	add    $0x10,%esp
 1ac:	83 c0 10             	add    $0x10,%eax
 1af:	3d 00 02 00 00       	cmp    $0x200,%eax
 1b4:	0f 87 16 01 00 00    	ja     2d0 <ls+0x1d0>
    strcpy(buf, path);
 1ba:	83 ec 08             	sub    $0x8,%esp
 1bd:	57                   	push   %edi
 1be:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1c4:	57                   	push   %edi
 1c5:	e8 66 01 00 00       	call   330 <strcpy>
    p = buf+strlen(buf);
 1ca:	89 3c 24             	mov    %edi,(%esp)
 1cd:	e8 ee 01 00 00       	call   3c0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1d2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1d5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1d7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1da:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1e0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1e6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f0:	83 ec 04             	sub    $0x4,%esp
 1f3:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 1f9:	6a 10                	push   $0x10
 1fb:	50                   	push   %eax
 1fc:	53                   	push   %ebx
 1fd:	e8 80 04 00 00       	call   682 <read>
 202:	83 c4 10             	add    $0x10,%esp
 205:	83 f8 10             	cmp    $0x10,%eax
 208:	0f 85 7b ff ff ff    	jne    189 <ls+0x89>
      if(de.inum == 0)
 20e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 215:	00 
 216:	74 d8                	je     1f0 <ls+0xf0>
      memmove(p, de.name, DIRSIZ);
 218:	83 ec 04             	sub    $0x4,%esp
 21b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 221:	6a 0e                	push   $0xe
 223:	50                   	push   %eax
 224:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
 22a:	e8 11 03 00 00       	call   540 <memmove>
      p[DIRSIZ] = 0;
 22f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 235:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 239:	58                   	pop    %eax
 23a:	5a                   	pop    %edx
 23b:	56                   	push   %esi
 23c:	57                   	push   %edi
 23d:	e8 6e 02 00 00       	call   4b0 <stat>
 242:	83 c4 10             	add    $0x10,%esp
 245:	85 c0                	test   %eax,%eax
 247:	0f 88 cb 00 00 00    	js     318 <ls+0x218>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 24d:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 253:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 259:	83 ec 0c             	sub    $0xc,%esp
 25c:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 263:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 269:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 26f:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 275:	57                   	push   %edi
 276:	e8 e5 fd ff ff       	call   60 <fmtname>
 27b:	5a                   	pop    %edx
 27c:	59                   	pop    %ecx
 27d:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 283:	51                   	push   %ecx
 284:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 28a:	52                   	push   %edx
 28b:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 291:	50                   	push   %eax
 292:	68 f0 0a 00 00       	push   $0xaf0
 297:	6a 01                	push   $0x1
 299:	e8 22 05 00 00       	call   7c0 <printf>
 29e:	83 c4 20             	add    $0x20,%esp
 2a1:	e9 4a ff ff ff       	jmp    1f0 <ls+0xf0>
 2a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ad:	00 
 2ae:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot open %s\n", path);
 2b0:	83 ec 04             	sub    $0x4,%esp
 2b3:	57                   	push   %edi
 2b4:	68 c8 0a 00 00       	push   $0xac8
 2b9:	6a 02                	push   $0x2
 2bb:	e8 00 05 00 00       	call   7c0 <printf>
    return;
 2c0:	83 c4 10             	add    $0x10,%esp
}
 2c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2c6:	5b                   	pop    %ebx
 2c7:	5e                   	pop    %esi
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret
 2cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      printf(1, "ls: path too long\n");
 2d0:	83 ec 08             	sub    $0x8,%esp
 2d3:	68 fd 0a 00 00       	push   $0xafd
 2d8:	6a 01                	push   $0x1
 2da:	e8 e1 04 00 00       	call   7c0 <printf>
      break;
 2df:	83 c4 10             	add    $0x10,%esp
 2e2:	e9 a2 fe ff ff       	jmp    189 <ls+0x89>
 2e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ee:	00 
 2ef:	90                   	nop
    printf(2, "ls: cannot stat %s\n", path);
 2f0:	83 ec 04             	sub    $0x4,%esp
 2f3:	57                   	push   %edi
 2f4:	68 dc 0a 00 00       	push   $0xadc
 2f9:	6a 02                	push   $0x2
 2fb:	e8 c0 04 00 00       	call   7c0 <printf>
    close(fd);
 300:	89 1c 24             	mov    %ebx,(%esp)
 303:	e8 8a 03 00 00       	call   692 <close>
    return;
 308:	83 c4 10             	add    $0x10,%esp
}
 30b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30e:	5b                   	pop    %ebx
 30f:	5e                   	pop    %esi
 310:	5f                   	pop    %edi
 311:	5d                   	pop    %ebp
 312:	c3                   	ret
 313:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(1, "ls: cannot stat %s\n", buf);
 318:	83 ec 04             	sub    $0x4,%esp
 31b:	57                   	push   %edi
 31c:	68 dc 0a 00 00       	push   $0xadc
 321:	6a 01                	push   $0x1
 323:	e8 98 04 00 00       	call   7c0 <printf>
        continue;
 328:	83 c4 10             	add    $0x10,%esp
 32b:	e9 c0 fe ff ff       	jmp    1f0 <ls+0xf0>

00000330 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 330:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 331:	31 c0                	xor    %eax,%eax
{
 333:	89 e5                	mov    %esp,%ebp
 335:	53                   	push   %ebx
 336:	8b 4d 08             	mov    0x8(%ebp),%ecx
 339:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 340:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 344:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 347:	83 c0 01             	add    $0x1,%eax
 34a:	84 d2                	test   %dl,%dl
 34c:	75 f2                	jne    340 <strcpy+0x10>
    ;
  return os;
}
 34e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 351:	89 c8                	mov    %ecx,%eax
 353:	c9                   	leave
 354:	c3                   	ret
 355:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 35c:	00 
 35d:	8d 76 00             	lea    0x0(%esi),%esi

00000360 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
 367:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 36a:	0f b6 02             	movzbl (%edx),%eax
 36d:	84 c0                	test   %al,%al
 36f:	75 17                	jne    388 <strcmp+0x28>
 371:	eb 3a                	jmp    3ad <strcmp+0x4d>
 373:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 378:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 37c:	83 c2 01             	add    $0x1,%edx
 37f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 382:	84 c0                	test   %al,%al
 384:	74 1a                	je     3a0 <strcmp+0x40>
 386:	89 d9                	mov    %ebx,%ecx
 388:	0f b6 19             	movzbl (%ecx),%ebx
 38b:	38 c3                	cmp    %al,%bl
 38d:	74 e9                	je     378 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 38f:	29 d8                	sub    %ebx,%eax
}
 391:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 394:	c9                   	leave
 395:	c3                   	ret
 396:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 39d:	00 
 39e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 3a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3a4:	31 c0                	xor    %eax,%eax
 3a6:	29 d8                	sub    %ebx,%eax
}
 3a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3ab:	c9                   	leave
 3ac:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 3ad:	0f b6 19             	movzbl (%ecx),%ebx
 3b0:	31 c0                	xor    %eax,%eax
 3b2:	eb db                	jmp    38f <strcmp+0x2f>
 3b4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3bb:	00 
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <strlen>:

uint
strlen(const char *s)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3c6:	80 3a 00             	cmpb   $0x0,(%edx)
 3c9:	74 15                	je     3e0 <strlen+0x20>
 3cb:	31 c0                	xor    %eax,%eax
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
 3d0:	83 c0 01             	add    $0x1,%eax
 3d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3d7:	89 c1                	mov    %eax,%ecx
 3d9:	75 f5                	jne    3d0 <strlen+0x10>
    ;
  return n;
}
 3db:	89 c8                	mov    %ecx,%eax
 3dd:	5d                   	pop    %ebp
 3de:	c3                   	ret
 3df:	90                   	nop
  for(n = 0; s[n]; n++)
 3e0:	31 c9                	xor    %ecx,%ecx
}
 3e2:	5d                   	pop    %ebp
 3e3:	89 c8                	mov    %ecx,%eax
 3e5:	c3                   	ret
 3e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ed:	00 
 3ee:	66 90                	xchg   %ax,%ax

000003f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fd:	89 d7                	mov    %edx,%edi
 3ff:	fc                   	cld
 400:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 402:	8b 7d fc             	mov    -0x4(%ebp),%edi
 405:	89 d0                	mov    %edx,%eax
 407:	c9                   	leave
 408:	c3                   	ret
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000410 <strchr>:

char*
strchr(const char *s, char c)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	8b 45 08             	mov    0x8(%ebp),%eax
 416:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 41a:	0f b6 10             	movzbl (%eax),%edx
 41d:	84 d2                	test   %dl,%dl
 41f:	75 12                	jne    433 <strchr+0x23>
 421:	eb 1d                	jmp    440 <strchr+0x30>
 423:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 428:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 42c:	83 c0 01             	add    $0x1,%eax
 42f:	84 d2                	test   %dl,%dl
 431:	74 0d                	je     440 <strchr+0x30>
    if(*s == c)
 433:	38 d1                	cmp    %dl,%cl
 435:	75 f1                	jne    428 <strchr+0x18>
      return (char*)s;
  return 0;
}
 437:	5d                   	pop    %ebp
 438:	c3                   	ret
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 440:	31 c0                	xor    %eax,%eax
}
 442:	5d                   	pop    %ebp
 443:	c3                   	ret
 444:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 44b:	00 
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000450 <gets>:

char*
gets(char *buf, int max)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 455:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 458:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 459:	31 db                	xor    %ebx,%ebx
{
 45b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 45e:	eb 27                	jmp    487 <gets+0x37>
    cc = read(0, &c, 1);
 460:	83 ec 04             	sub    $0x4,%esp
 463:	6a 01                	push   $0x1
 465:	56                   	push   %esi
 466:	6a 00                	push   $0x0
 468:	e8 15 02 00 00       	call   682 <read>
    if(cc < 1)
 46d:	83 c4 10             	add    $0x10,%esp
 470:	85 c0                	test   %eax,%eax
 472:	7e 1d                	jle    491 <gets+0x41>
      break;
    buf[i++] = c;
 474:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 478:	8b 55 08             	mov    0x8(%ebp),%edx
 47b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 47f:	3c 0a                	cmp    $0xa,%al
 481:	74 10                	je     493 <gets+0x43>
 483:	3c 0d                	cmp    $0xd,%al
 485:	74 0c                	je     493 <gets+0x43>
  for(i=0; i+1 < max; ){
 487:	89 df                	mov    %ebx,%edi
 489:	83 c3 01             	add    $0x1,%ebx
 48c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 48f:	7c cf                	jl     460 <gets+0x10>
 491:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 493:	8b 45 08             	mov    0x8(%ebp),%eax
 496:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 49a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 49d:	5b                   	pop    %ebx
 49e:	5e                   	pop    %esi
 49f:	5f                   	pop    %edi
 4a0:	5d                   	pop    %ebp
 4a1:	c3                   	ret
 4a2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4a9:	00 
 4aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	56                   	push   %esi
 4b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b5:	83 ec 08             	sub    $0x8,%esp
 4b8:	6a 00                	push   $0x0
 4ba:	ff 75 08             	push   0x8(%ebp)
 4bd:	e8 e8 01 00 00       	call   6aa <open>
  if(fd < 0)
 4c2:	83 c4 10             	add    $0x10,%esp
 4c5:	85 c0                	test   %eax,%eax
 4c7:	78 27                	js     4f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4c9:	83 ec 08             	sub    $0x8,%esp
 4cc:	ff 75 0c             	push   0xc(%ebp)
 4cf:	89 c3                	mov    %eax,%ebx
 4d1:	50                   	push   %eax
 4d2:	e8 eb 01 00 00       	call   6c2 <fstat>
  close(fd);
 4d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4da:	89 c6                	mov    %eax,%esi
  close(fd);
 4dc:	e8 b1 01 00 00       	call   692 <close>
  return r;
 4e1:	83 c4 10             	add    $0x10,%esp
}
 4e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4e7:	89 f0                	mov    %esi,%eax
 4e9:	5b                   	pop    %ebx
 4ea:	5e                   	pop    %esi
 4eb:	5d                   	pop    %ebp
 4ec:	c3                   	ret
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 4f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4f5:	eb ed                	jmp    4e4 <stat+0x34>
 4f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4fe:	00 
 4ff:	90                   	nop

00000500 <atoi>:

int
atoi(const char *s)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	53                   	push   %ebx
 504:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 507:	0f be 02             	movsbl (%edx),%eax
 50a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 50d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 510:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 515:	77 1e                	ja     535 <atoi+0x35>
 517:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 51e:	00 
 51f:	90                   	nop
    n = n*10 + *s++ - '0';
 520:	83 c2 01             	add    $0x1,%edx
 523:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 526:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 52a:	0f be 02             	movsbl (%edx),%eax
 52d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 530:	80 fb 09             	cmp    $0x9,%bl
 533:	76 eb                	jbe    520 <atoi+0x20>
  return n;
}
 535:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 538:	89 c8                	mov    %ecx,%eax
 53a:	c9                   	leave
 53b:	c3                   	ret
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000540 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	8b 45 10             	mov    0x10(%ebp),%eax
 547:	8b 55 08             	mov    0x8(%ebp),%edx
 54a:	56                   	push   %esi
 54b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 54e:	85 c0                	test   %eax,%eax
 550:	7e 13                	jle    565 <memmove+0x25>
 552:	01 d0                	add    %edx,%eax
  dst = vdst;
 554:	89 d7                	mov    %edx,%edi
 556:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 55d:	00 
 55e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 560:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 561:	39 f8                	cmp    %edi,%eax
 563:	75 fb                	jne    560 <memmove+0x20>
  return vdst;
}
 565:	5e                   	pop    %esi
 566:	89 d0                	mov    %edx,%eax
 568:	5f                   	pop    %edi
 569:	5d                   	pop    %ebp
 56a:	c3                   	ret
 56b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000570 <thread_create>:

int
thread_create(void(*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	53                   	push   %ebx
 574:	83 ec 10             	sub    $0x10,%esp
  int pid;
  void *raw;
  void *stack;

  raw = malloc(PGSIZE * 2);
 577:	68 00 20 00 00       	push   $0x2000
 57c:	e8 5f 04 00 00       	call   9e0 <malloc>
  if (raw == 0) {
 581:	83 c4 10             	add    $0x10,%esp
 584:	85 c0                	test   %eax,%eax
 586:	74 37                	je     5bf <thread_create+0x4f>
 588:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  stack = (void *)(((uint)raw + sizeof(void *) + PGSIZE - 1) & ~(PGSIZE - 1));
 58a:	8d 80 03 10 00 00    	lea    0x1003(%eax),%eax
 590:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  ((void **)stack)[-1] = raw;
 595:	89 58 fc             	mov    %ebx,-0x4(%eax)

  pid = clone(start_routine, arg1, arg2, stack);
 598:	50                   	push   %eax
 599:	ff 75 10             	push   0x10(%ebp)
 59c:	ff 75 0c             	push   0xc(%ebp)
 59f:	ff 75 08             	push   0x8(%ebp)
 5a2:	e8 63 01 00 00       	call   70a <clone>
  if (pid < 0) {
 5a7:	83 c4 10             	add    $0x10,%esp
 5aa:	85 c0                	test   %eax,%eax
 5ac:	78 05                	js     5b3 <thread_create+0x43>
    free(raw);
    return -1;
  }
  return pid;
}
 5ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5b1:	c9                   	leave
 5b2:	c3                   	ret
    free(raw);
 5b3:	83 ec 0c             	sub    $0xc,%esp
 5b6:	53                   	push   %ebx
 5b7:	e8 94 03 00 00       	call   950 <free>
    return -1;
 5bc:	83 c4 10             	add    $0x10,%esp
    return -1;
 5bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 5c4:	eb e8                	jmp    5ae <thread_create+0x3e>
 5c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5cd:	00 
 5ce:	66 90                	xchg   %ax,%ax

000005d0 <thread_join>:

int
thread_join(void) 
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	53                   	push   %ebx
  int pid;
  void *raw;
  void *stack;

  pid = join(&stack);
 5d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 5d7:	83 ec 20             	sub    $0x20,%esp
  pid = join(&stack);
 5da:	50                   	push   %eax
 5db:	e8 32 01 00 00       	call   712 <join>
  if (pid < 0) {
 5e0:	83 c4 10             	add    $0x10,%esp
 5e3:	85 c0                	test   %eax,%eax
 5e5:	78 21                	js     608 <thread_join+0x38>
 5e7:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  raw = ((void **)stack)[-1];
 5e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  free(raw);
 5ec:	83 ec 0c             	sub    $0xc,%esp
 5ef:	ff 70 fc             	push   -0x4(%eax)
 5f2:	e8 59 03 00 00       	call   950 <free>
  return pid;
 5f7:	83 c4 10             	add    $0x10,%esp
}
 5fa:	89 d8                	mov    %ebx,%eax
 5fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5ff:	c9                   	leave
 600:	c3                   	ret
 601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 608:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 60d:	eb eb                	jmp    5fa <thread_join+0x2a>
 60f:	90                   	nop

00000610 <lock_init>:
  return value;
}

void 
lock_init(lock_t *lock)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 616:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 61c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 623:	5d                   	pop    %ebp
 624:	c3                   	ret
 625:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 62c:	00 
 62d:	8d 76 00             	lea    0x0(%esi),%esi

00000630 <lock_acquire>:

void
lock_acquire(lock_t *lock)
{
 630:	55                   	push   %ebp
  asm volatile (
 631:	ba 01 00 00 00       	mov    $0x1,%edx
{
 636:	89 e5                	mov    %esp,%ebp
 638:	8b 4d 08             	mov    0x8(%ebp),%ecx
  asm volatile (
 63b:	f0 0f c1 11          	lock xadd %edx,(%ecx)
  int myturn = fetch_and_add(&lock->ticket, 1);
  while (myturn != lock->turn);
 63f:	90                   	nop
 640:	8b 41 04             	mov    0x4(%ecx),%eax
 643:	39 d0                	cmp    %edx,%eax
 645:	75 f9                	jne    640 <lock_acquire+0x10>
}
 647:	5d                   	pop    %ebp
 648:	c3                   	ret
 649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000650 <lock_release>:

void 
lock_release(lock_t *lock)
{
 650:	55                   	push   %ebp
  asm volatile (
 651:	b8 01 00 00 00       	mov    $0x1,%eax
{
 656:	89 e5                	mov    %esp,%ebp
 658:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile (
 65b:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  fetch_and_add(&lock->turn, 1);
 660:	5d                   	pop    %ebp
 661:	c3                   	ret

00000662 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 662:	b8 01 00 00 00       	mov    $0x1,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret

0000066a <exit>:
SYSCALL(exit)
 66a:	b8 02 00 00 00       	mov    $0x2,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret

00000672 <wait>:
SYSCALL(wait)
 672:	b8 03 00 00 00       	mov    $0x3,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret

0000067a <pipe>:
SYSCALL(pipe)
 67a:	b8 04 00 00 00       	mov    $0x4,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret

00000682 <read>:
SYSCALL(read)
 682:	b8 05 00 00 00       	mov    $0x5,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret

0000068a <write>:
SYSCALL(write)
 68a:	b8 10 00 00 00       	mov    $0x10,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret

00000692 <close>:
SYSCALL(close)
 692:	b8 15 00 00 00       	mov    $0x15,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret

0000069a <kill>:
SYSCALL(kill)
 69a:	b8 06 00 00 00       	mov    $0x6,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret

000006a2 <exec>:
SYSCALL(exec)
 6a2:	b8 07 00 00 00       	mov    $0x7,%eax
 6a7:	cd 40                	int    $0x40
 6a9:	c3                   	ret

000006aa <open>:
SYSCALL(open)
 6aa:	b8 0f 00 00 00       	mov    $0xf,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret

000006b2 <mknod>:
SYSCALL(mknod)
 6b2:	b8 11 00 00 00       	mov    $0x11,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret

000006ba <unlink>:
SYSCALL(unlink)
 6ba:	b8 12 00 00 00       	mov    $0x12,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret

000006c2 <fstat>:
SYSCALL(fstat)
 6c2:	b8 08 00 00 00       	mov    $0x8,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret

000006ca <link>:
SYSCALL(link)
 6ca:	b8 13 00 00 00       	mov    $0x13,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret

000006d2 <mkdir>:
SYSCALL(mkdir)
 6d2:	b8 14 00 00 00       	mov    $0x14,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret

000006da <chdir>:
SYSCALL(chdir)
 6da:	b8 09 00 00 00       	mov    $0x9,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret

000006e2 <dup>:
SYSCALL(dup)
 6e2:	b8 0a 00 00 00       	mov    $0xa,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret

000006ea <getpid>:
SYSCALL(getpid)
 6ea:	b8 0b 00 00 00       	mov    $0xb,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret

000006f2 <sbrk>:
SYSCALL(sbrk)
 6f2:	b8 0c 00 00 00       	mov    $0xc,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret

000006fa <sleep>:
SYSCALL(sleep)
 6fa:	b8 0d 00 00 00       	mov    $0xd,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret

00000702 <uptime>:
SYSCALL(uptime)
 702:	b8 0e 00 00 00       	mov    $0xe,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret

0000070a <clone>:
SYSCALL(clone)
 70a:	b8 16 00 00 00       	mov    $0x16,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret

00000712 <join>:
SYSCALL(join)
 712:	b8 17 00 00 00       	mov    $0x17,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret
 71a:	66 90                	xchg   %ax,%ax
 71c:	66 90                	xchg   %ax,%ax
 71e:	66 90                	xchg   %ax,%ax

00000720 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	53                   	push   %ebx
 726:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 728:	89 d1                	mov    %edx,%ecx
{
 72a:	83 ec 3c             	sub    $0x3c,%esp
 72d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 730:	85 d2                	test   %edx,%edx
 732:	0f 89 80 00 00 00    	jns    7b8 <printint+0x98>
 738:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 73c:	74 7a                	je     7b8 <printint+0x98>
    x = -xx;
 73e:	f7 d9                	neg    %ecx
    neg = 1;
 740:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 745:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 748:	31 f6                	xor    %esi,%esi
 74a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 750:	89 c8                	mov    %ecx,%eax
 752:	31 d2                	xor    %edx,%edx
 754:	89 f7                	mov    %esi,%edi
 756:	f7 f3                	div    %ebx
 758:	8d 76 01             	lea    0x1(%esi),%esi
 75b:	0f b6 92 74 0b 00 00 	movzbl 0xb74(%edx),%edx
 762:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 766:	89 ca                	mov    %ecx,%edx
 768:	89 c1                	mov    %eax,%ecx
 76a:	39 da                	cmp    %ebx,%edx
 76c:	73 e2                	jae    750 <printint+0x30>
  if(neg)
 76e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 771:	85 c0                	test   %eax,%eax
 773:	74 07                	je     77c <printint+0x5c>
    buf[i++] = '-';
 775:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 77a:	89 f7                	mov    %esi,%edi
 77c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 77f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 782:	01 df                	add    %ebx,%edi
 784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 788:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 78b:	83 ec 04             	sub    $0x4,%esp
 78e:	88 45 d7             	mov    %al,-0x29(%ebp)
 791:	8d 45 d7             	lea    -0x29(%ebp),%eax
 794:	6a 01                	push   $0x1
 796:	50                   	push   %eax
 797:	56                   	push   %esi
 798:	e8 ed fe ff ff       	call   68a <write>
  while(--i >= 0)
 79d:	89 f8                	mov    %edi,%eax
 79f:	83 c4 10             	add    $0x10,%esp
 7a2:	83 ef 01             	sub    $0x1,%edi
 7a5:	39 c3                	cmp    %eax,%ebx
 7a7:	75 df                	jne    788 <printint+0x68>
}
 7a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7ac:	5b                   	pop    %ebx
 7ad:	5e                   	pop    %esi
 7ae:	5f                   	pop    %edi
 7af:	5d                   	pop    %ebp
 7b0:	c3                   	ret
 7b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 7b8:	31 c0                	xor    %eax,%eax
 7ba:	eb 89                	jmp    745 <printint+0x25>
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7c9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 7cc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 7cf:	0f b6 1e             	movzbl (%esi),%ebx
 7d2:	83 c6 01             	add    $0x1,%esi
 7d5:	84 db                	test   %bl,%bl
 7d7:	74 67                	je     840 <printf+0x80>
 7d9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 7dc:	31 d2                	xor    %edx,%edx
 7de:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 7e1:	eb 34                	jmp    817 <printf+0x57>
 7e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 7e8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7eb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 7f0:	83 f8 25             	cmp    $0x25,%eax
 7f3:	74 18                	je     80d <printf+0x4d>
  write(fd, &c, 1);
 7f5:	83 ec 04             	sub    $0x4,%esp
 7f8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 7fb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 7fe:	6a 01                	push   $0x1
 800:	50                   	push   %eax
 801:	57                   	push   %edi
 802:	e8 83 fe ff ff       	call   68a <write>
 807:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 80a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 80d:	0f b6 1e             	movzbl (%esi),%ebx
 810:	83 c6 01             	add    $0x1,%esi
 813:	84 db                	test   %bl,%bl
 815:	74 29                	je     840 <printf+0x80>
    c = fmt[i] & 0xff;
 817:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 81a:	85 d2                	test   %edx,%edx
 81c:	74 ca                	je     7e8 <printf+0x28>
      }
    } else if(state == '%'){
 81e:	83 fa 25             	cmp    $0x25,%edx
 821:	75 ea                	jne    80d <printf+0x4d>
      if(c == 'd'){
 823:	83 f8 25             	cmp    $0x25,%eax
 826:	0f 84 04 01 00 00    	je     930 <printf+0x170>
 82c:	83 e8 63             	sub    $0x63,%eax
 82f:	83 f8 15             	cmp    $0x15,%eax
 832:	77 1c                	ja     850 <printf+0x90>
 834:	ff 24 85 1c 0b 00 00 	jmp    *0xb1c(,%eax,4)
 83b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 840:	8d 65 f4             	lea    -0xc(%ebp),%esp
 843:	5b                   	pop    %ebx
 844:	5e                   	pop    %esi
 845:	5f                   	pop    %edi
 846:	5d                   	pop    %ebp
 847:	c3                   	ret
 848:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 84f:	00 
  write(fd, &c, 1);
 850:	83 ec 04             	sub    $0x4,%esp
 853:	8d 55 e7             	lea    -0x19(%ebp),%edx
 856:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 85a:	6a 01                	push   $0x1
 85c:	52                   	push   %edx
 85d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 860:	57                   	push   %edi
 861:	e8 24 fe ff ff       	call   68a <write>
 866:	83 c4 0c             	add    $0xc,%esp
 869:	88 5d e7             	mov    %bl,-0x19(%ebp)
 86c:	6a 01                	push   $0x1
 86e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 871:	52                   	push   %edx
 872:	57                   	push   %edi
 873:	e8 12 fe ff ff       	call   68a <write>
        putc(fd, c);
 878:	83 c4 10             	add    $0x10,%esp
      state = 0;
 87b:	31 d2                	xor    %edx,%edx
 87d:	eb 8e                	jmp    80d <printf+0x4d>
 87f:	90                   	nop
        printint(fd, *ap, 16, 0);
 880:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 883:	83 ec 0c             	sub    $0xc,%esp
 886:	b9 10 00 00 00       	mov    $0x10,%ecx
 88b:	8b 13                	mov    (%ebx),%edx
 88d:	6a 00                	push   $0x0
 88f:	89 f8                	mov    %edi,%eax
        ap++;
 891:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 894:	e8 87 fe ff ff       	call   720 <printint>
        ap++;
 899:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 89c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 89f:	31 d2                	xor    %edx,%edx
 8a1:	e9 67 ff ff ff       	jmp    80d <printf+0x4d>
        s = (char*)*ap;
 8a6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8a9:	8b 18                	mov    (%eax),%ebx
        ap++;
 8ab:	83 c0 04             	add    $0x4,%eax
 8ae:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8b1:	85 db                	test   %ebx,%ebx
 8b3:	0f 84 87 00 00 00    	je     940 <printf+0x180>
        while(*s != 0){
 8b9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 8bc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 8be:	84 c0                	test   %al,%al
 8c0:	0f 84 47 ff ff ff    	je     80d <printf+0x4d>
 8c6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 8c9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 8cc:	89 de                	mov    %ebx,%esi
 8ce:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 8d0:	83 ec 04             	sub    $0x4,%esp
 8d3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 8d6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 8d9:	6a 01                	push   $0x1
 8db:	53                   	push   %ebx
 8dc:	57                   	push   %edi
 8dd:	e8 a8 fd ff ff       	call   68a <write>
        while(*s != 0){
 8e2:	0f b6 06             	movzbl (%esi),%eax
 8e5:	83 c4 10             	add    $0x10,%esp
 8e8:	84 c0                	test   %al,%al
 8ea:	75 e4                	jne    8d0 <printf+0x110>
      state = 0;
 8ec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 8ef:	31 d2                	xor    %edx,%edx
 8f1:	e9 17 ff ff ff       	jmp    80d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 8f6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 8f9:	83 ec 0c             	sub    $0xc,%esp
 8fc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 901:	8b 13                	mov    (%ebx),%edx
 903:	6a 01                	push   $0x1
 905:	eb 88                	jmp    88f <printf+0xcf>
        putc(fd, *ap);
 907:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 90a:	83 ec 04             	sub    $0x4,%esp
 90d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 910:	8b 03                	mov    (%ebx),%eax
        ap++;
 912:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 915:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 918:	6a 01                	push   $0x1
 91a:	52                   	push   %edx
 91b:	57                   	push   %edi
 91c:	e8 69 fd ff ff       	call   68a <write>
        ap++;
 921:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 924:	83 c4 10             	add    $0x10,%esp
      state = 0;
 927:	31 d2                	xor    %edx,%edx
 929:	e9 df fe ff ff       	jmp    80d <printf+0x4d>
 92e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 930:	83 ec 04             	sub    $0x4,%esp
 933:	88 5d e7             	mov    %bl,-0x19(%ebp)
 936:	8d 55 e7             	lea    -0x19(%ebp),%edx
 939:	6a 01                	push   $0x1
 93b:	e9 31 ff ff ff       	jmp    871 <printf+0xb1>
 940:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 945:	bb 12 0b 00 00       	mov    $0xb12,%ebx
 94a:	e9 77 ff ff ff       	jmp    8c6 <printf+0x106>
 94f:	90                   	nop

00000950 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 950:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 951:	a1 58 0f 00 00       	mov    0xf58,%eax
{
 956:	89 e5                	mov    %esp,%ebp
 958:	57                   	push   %edi
 959:	56                   	push   %esi
 95a:	53                   	push   %ebx
 95b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 95e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 961:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 968:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 96a:	39 c8                	cmp    %ecx,%eax
 96c:	73 32                	jae    9a0 <free+0x50>
 96e:	39 d1                	cmp    %edx,%ecx
 970:	72 04                	jb     976 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 972:	39 d0                	cmp    %edx,%eax
 974:	72 32                	jb     9a8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 976:	8b 73 fc             	mov    -0x4(%ebx),%esi
 979:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 97c:	39 fa                	cmp    %edi,%edx
 97e:	74 30                	je     9b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 980:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 983:	8b 50 04             	mov    0x4(%eax),%edx
 986:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 989:	39 f1                	cmp    %esi,%ecx
 98b:	74 3a                	je     9c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 98d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 98f:	5b                   	pop    %ebx
  freep = p;
 990:	a3 58 0f 00 00       	mov    %eax,0xf58
}
 995:	5e                   	pop    %esi
 996:	5f                   	pop    %edi
 997:	5d                   	pop    %ebp
 998:	c3                   	ret
 999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a0:	39 d0                	cmp    %edx,%eax
 9a2:	72 04                	jb     9a8 <free+0x58>
 9a4:	39 d1                	cmp    %edx,%ecx
 9a6:	72 ce                	jb     976 <free+0x26>
{
 9a8:	89 d0                	mov    %edx,%eax
 9aa:	eb bc                	jmp    968 <free+0x18>
 9ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 9b0:	03 72 04             	add    0x4(%edx),%esi
 9b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9b6:	8b 10                	mov    (%eax),%edx
 9b8:	8b 12                	mov    (%edx),%edx
 9ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9bd:	8b 50 04             	mov    0x4(%eax),%edx
 9c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9c3:	39 f1                	cmp    %esi,%ecx
 9c5:	75 c6                	jne    98d <free+0x3d>
    p->s.size += bp->s.size;
 9c7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 9ca:	a3 58 0f 00 00       	mov    %eax,0xf58
    p->s.size += bp->s.size;
 9cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9d2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9d5:	89 08                	mov    %ecx,(%eax)
}
 9d7:	5b                   	pop    %ebx
 9d8:	5e                   	pop    %esi
 9d9:	5f                   	pop    %edi
 9da:	5d                   	pop    %ebp
 9db:	c3                   	ret
 9dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
 9e3:	57                   	push   %edi
 9e4:	56                   	push   %esi
 9e5:	53                   	push   %ebx
 9e6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9ec:	8b 15 58 0f 00 00    	mov    0xf58,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9f2:	8d 78 07             	lea    0x7(%eax),%edi
 9f5:	c1 ef 03             	shr    $0x3,%edi
 9f8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 9fb:	85 d2                	test   %edx,%edx
 9fd:	0f 84 8d 00 00 00    	je     a90 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a03:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a05:	8b 48 04             	mov    0x4(%eax),%ecx
 a08:	39 f9                	cmp    %edi,%ecx
 a0a:	73 64                	jae    a70 <malloc+0x90>
  if(nu < 4096)
 a0c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a11:	39 df                	cmp    %ebx,%edi
 a13:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 a16:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 a1d:	eb 0a                	jmp    a29 <malloc+0x49>
 a1f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a20:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a22:	8b 48 04             	mov    0x4(%eax),%ecx
 a25:	39 f9                	cmp    %edi,%ecx
 a27:	73 47                	jae    a70 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a29:	89 c2                	mov    %eax,%edx
 a2b:	3b 05 58 0f 00 00    	cmp    0xf58,%eax
 a31:	75 ed                	jne    a20 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 a33:	83 ec 0c             	sub    $0xc,%esp
 a36:	56                   	push   %esi
 a37:	e8 b6 fc ff ff       	call   6f2 <sbrk>
  if(p == (char*)-1)
 a3c:	83 c4 10             	add    $0x10,%esp
 a3f:	83 f8 ff             	cmp    $0xffffffff,%eax
 a42:	74 1c                	je     a60 <malloc+0x80>
  hp->s.size = nu;
 a44:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a47:	83 ec 0c             	sub    $0xc,%esp
 a4a:	83 c0 08             	add    $0x8,%eax
 a4d:	50                   	push   %eax
 a4e:	e8 fd fe ff ff       	call   950 <free>
  return freep;
 a53:	8b 15 58 0f 00 00    	mov    0xf58,%edx
      if((p = morecore(nunits)) == 0)
 a59:	83 c4 10             	add    $0x10,%esp
 a5c:	85 d2                	test   %edx,%edx
 a5e:	75 c0                	jne    a20 <malloc+0x40>
        return 0;
  }
}
 a60:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a63:	31 c0                	xor    %eax,%eax
}
 a65:	5b                   	pop    %ebx
 a66:	5e                   	pop    %esi
 a67:	5f                   	pop    %edi
 a68:	5d                   	pop    %ebp
 a69:	c3                   	ret
 a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a70:	39 cf                	cmp    %ecx,%edi
 a72:	74 4c                	je     ac0 <malloc+0xe0>
        p->s.size -= nunits;
 a74:	29 f9                	sub    %edi,%ecx
 a76:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a79:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a7c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 a7f:	89 15 58 0f 00 00    	mov    %edx,0xf58
}
 a85:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a88:	83 c0 08             	add    $0x8,%eax
}
 a8b:	5b                   	pop    %ebx
 a8c:	5e                   	pop    %esi
 a8d:	5f                   	pop    %edi
 a8e:	5d                   	pop    %ebp
 a8f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 a90:	c7 05 58 0f 00 00 5c 	movl   $0xf5c,0xf58
 a97:	0f 00 00 
    base.s.size = 0;
 a9a:	b8 5c 0f 00 00       	mov    $0xf5c,%eax
    base.s.ptr = freep = prevp = &base;
 a9f:	c7 05 5c 0f 00 00 5c 	movl   $0xf5c,0xf5c
 aa6:	0f 00 00 
    base.s.size = 0;
 aa9:	c7 05 60 0f 00 00 00 	movl   $0x0,0xf60
 ab0:	00 00 00 
    if(p->s.size >= nunits){
 ab3:	e9 54 ff ff ff       	jmp    a0c <malloc+0x2c>
 ab8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 abf:	00 
        prevp->s.ptr = p->s.ptr;
 ac0:	8b 08                	mov    (%eax),%ecx
 ac2:	89 0a                	mov    %ecx,(%edx)
 ac4:	eb b9                	jmp    a7f <malloc+0x9f>
