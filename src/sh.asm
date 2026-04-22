
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 96 00 00 00    	jg     b7 <main+0xb7>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 09 14 00 00       	push   $0x1409
      2b:	e8 1a 0f 00 00       	call   f4a <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 2e                	jmp    67 <main+0x67>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d 42 1b 00 00 20 	cmpb   $0x20,0x1b42
      47:	0f 84 8d 00 00 00    	je     da <main+0xda>
      4d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 ad 0e 00 00       	call   f02 <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	0f 84 c1 00 00 00    	je     11f <main+0x11f>
    if(fork1() == 0)
      5e:	85 c0                	test   %eax,%eax
      60:	74 63                	je     c5 <main+0xc5>
    wait();
      62:	e8 ab 0e 00 00       	call   f12 <wait>
  printf(2, "$ ");
      67:	83 ec 08             	sub    $0x8,%esp
      6a:	68 68 13 00 00       	push   $0x1368
      6f:	6a 02                	push   $0x2
      71:	e8 ea 0f 00 00       	call   1060 <printf>
  memset(buf, 0, nbuf);
      76:	83 c4 0c             	add    $0xc,%esp
      79:	6a 64                	push   $0x64
      7b:	6a 00                	push   $0x0
      7d:	68 40 1b 00 00       	push   $0x1b40
      82:	e8 09 0c 00 00       	call   c90 <memset>
  gets(buf, nbuf);
      87:	58                   	pop    %eax
      88:	5a                   	pop    %edx
      89:	6a 64                	push   $0x64
      8b:	68 40 1b 00 00       	push   $0x1b40
      90:	e8 5b 0c 00 00       	call   cf0 <gets>
  if(buf[0] == 0) // EOF
      95:	0f b6 05 40 1b 00 00 	movzbl 0x1b40,%eax
      9c:	83 c4 10             	add    $0x10,%esp
      9f:	84 c0                	test   %al,%al
      a1:	74 0f                	je     b2 <main+0xb2>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      a3:	3c 63                	cmp    $0x63,%al
      a5:	75 a9                	jne    50 <main+0x50>
      a7:	80 3d 41 1b 00 00 64 	cmpb   $0x64,0x1b41
      ae:	75 a0                	jne    50 <main+0x50>
      b0:	eb 8e                	jmp    40 <main+0x40>
  exit();
      b2:	e8 53 0e 00 00       	call   f0a <exit>
      close(fd);
      b7:	83 ec 0c             	sub    $0xc,%esp
      ba:	50                   	push   %eax
      bb:	e8 72 0e 00 00       	call   f32 <close>
      break;
      c0:	83 c4 10             	add    $0x10,%esp
      c3:	eb a2                	jmp    67 <main+0x67>
      runcmd(parsecmd(buf));
      c5:	83 ec 0c             	sub    $0xc,%esp
      c8:	68 40 1b 00 00       	push   $0x1b40
      cd:	e8 8e 0a 00 00       	call   b60 <parsecmd>
      d2:	89 04 24             	mov    %eax,(%esp)
      d5:	e8 d6 00 00 00       	call   1b0 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      da:	83 ec 0c             	sub    $0xc,%esp
      dd:	68 40 1b 00 00       	push   $0x1b40
      e2:	e8 79 0b 00 00       	call   c60 <strlen>
      if(chdir(buf+3) < 0)
      e7:	c7 04 24 43 1b 00 00 	movl   $0x1b43,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      ee:	c6 80 3f 1b 00 00 00 	movb   $0x0,0x1b3f(%eax)
      if(chdir(buf+3) < 0)
      f5:	e8 80 0e 00 00       	call   f7a <chdir>
      fa:	83 c4 10             	add    $0x10,%esp
      fd:	85 c0                	test   %eax,%eax
      ff:	0f 89 62 ff ff ff    	jns    67 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
     105:	51                   	push   %ecx
     106:	68 43 1b 00 00       	push   $0x1b43
     10b:	68 11 14 00 00       	push   $0x1411
     110:	6a 02                	push   $0x2
     112:	e8 49 0f 00 00       	call   1060 <printf>
     117:	83 c4 10             	add    $0x10,%esp
     11a:	e9 48 ff ff ff       	jmp    67 <main+0x67>
    panic("fork");
     11f:	83 ec 0c             	sub    $0xc,%esp
     122:	68 6b 13 00 00       	push   $0x136b
     127:	e8 44 00 00 00       	call   170 <panic>
     12c:	66 90                	xchg   %ax,%ax
     12e:	66 90                	xchg   %ax,%ax

00000130 <getcmd>:
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	56                   	push   %esi
     134:	53                   	push   %ebx
     135:	8b 5d 08             	mov    0x8(%ebp),%ebx
     138:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     13b:	83 ec 08             	sub    $0x8,%esp
     13e:	68 68 13 00 00       	push   $0x1368
     143:	6a 02                	push   $0x2
     145:	e8 16 0f 00 00       	call   1060 <printf>
  memset(buf, 0, nbuf);
     14a:	83 c4 0c             	add    $0xc,%esp
     14d:	56                   	push   %esi
     14e:	6a 00                	push   $0x0
     150:	53                   	push   %ebx
     151:	e8 3a 0b 00 00       	call   c90 <memset>
  gets(buf, nbuf);
     156:	58                   	pop    %eax
     157:	5a                   	pop    %edx
     158:	56                   	push   %esi
     159:	53                   	push   %ebx
     15a:	e8 91 0b 00 00       	call   cf0 <gets>
  if(buf[0] == 0) // EOF
     15f:	83 c4 10             	add    $0x10,%esp
     162:	80 3b 01             	cmpb   $0x1,(%ebx)
     165:	19 c0                	sbb    %eax,%eax
}
     167:	8d 65 f8             	lea    -0x8(%ebp),%esp
     16a:	5b                   	pop    %ebx
     16b:	5e                   	pop    %esi
     16c:	5d                   	pop    %ebp
     16d:	c3                   	ret
     16e:	66 90                	xchg   %ax,%ax

00000170 <panic>:
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     176:	ff 75 08             	push   0x8(%ebp)
     179:	68 05 14 00 00       	push   $0x1405
     17e:	6a 02                	push   $0x2
     180:	e8 db 0e 00 00       	call   1060 <printf>
  exit();
     185:	e8 80 0d 00 00       	call   f0a <exit>
     18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <fork1>:
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     196:	e8 67 0d 00 00       	call   f02 <fork>
  if(pid == -1)
     19b:	83 f8 ff             	cmp    $0xffffffff,%eax
     19e:	74 02                	je     1a2 <fork1+0x12>
  return pid;
}
     1a0:	c9                   	leave
     1a1:	c3                   	ret
    panic("fork");
     1a2:	83 ec 0c             	sub    $0xc,%esp
     1a5:	68 6b 13 00 00       	push   $0x136b
     1aa:	e8 c1 ff ff ff       	call   170 <panic>
     1af:	90                   	nop

000001b0 <runcmd>:
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	53                   	push   %ebx
     1b4:	83 ec 14             	sub    $0x14,%esp
     1b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     1ba:	85 db                	test   %ebx,%ebx
     1bc:	74 42                	je     200 <runcmd+0x50>
  switch(cmd->type){
     1be:	83 3b 05             	cmpl   $0x5,(%ebx)
     1c1:	0f 87 e3 00 00 00    	ja     2aa <runcmd+0xfa>
     1c7:	8b 03                	mov    (%ebx),%eax
     1c9:	ff 24 85 28 14 00 00 	jmp    *0x1428(,%eax,4)
    if(ecmd->argv[0] == 0)
     1d0:	8b 43 04             	mov    0x4(%ebx),%eax
     1d3:	85 c0                	test   %eax,%eax
     1d5:	74 29                	je     200 <runcmd+0x50>
    exec(ecmd->argv[0], ecmd->argv);
     1d7:	8d 53 04             	lea    0x4(%ebx),%edx
     1da:	51                   	push   %ecx
     1db:	51                   	push   %ecx
     1dc:	52                   	push   %edx
     1dd:	50                   	push   %eax
     1de:	e8 5f 0d 00 00       	call   f42 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     1e3:	83 c4 0c             	add    $0xc,%esp
     1e6:	ff 73 04             	push   0x4(%ebx)
     1e9:	68 77 13 00 00       	push   $0x1377
     1ee:	6a 02                	push   $0x2
     1f0:	e8 6b 0e 00 00       	call   1060 <printf>
    break;
     1f5:	83 c4 10             	add    $0x10,%esp
     1f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     1ff:	00 
    exit();
     200:	e8 05 0d 00 00       	call   f0a <exit>
    if(fork1() == 0)
     205:	e8 86 ff ff ff       	call   190 <fork1>
     20a:	85 c0                	test   %eax,%eax
     20c:	75 f2                	jne    200 <runcmd+0x50>
     20e:	e9 8c 00 00 00       	jmp    29f <runcmd+0xef>
    if(pipe(p) < 0)
     213:	83 ec 0c             	sub    $0xc,%esp
     216:	8d 45 f0             	lea    -0x10(%ebp),%eax
     219:	50                   	push   %eax
     21a:	e8 fb 0c 00 00       	call   f1a <pipe>
     21f:	83 c4 10             	add    $0x10,%esp
     222:	85 c0                	test   %eax,%eax
     224:	0f 88 a2 00 00 00    	js     2cc <runcmd+0x11c>
    if(fork1() == 0){
     22a:	e8 61 ff ff ff       	call   190 <fork1>
     22f:	85 c0                	test   %eax,%eax
     231:	0f 84 a2 00 00 00    	je     2d9 <runcmd+0x129>
    if(fork1() == 0){
     237:	e8 54 ff ff ff       	call   190 <fork1>
     23c:	85 c0                	test   %eax,%eax
     23e:	0f 84 c3 00 00 00    	je     307 <runcmd+0x157>
    close(p[0]);
     244:	83 ec 0c             	sub    $0xc,%esp
     247:	ff 75 f0             	push   -0x10(%ebp)
     24a:	e8 e3 0c 00 00       	call   f32 <close>
    close(p[1]);
     24f:	58                   	pop    %eax
     250:	ff 75 f4             	push   -0xc(%ebp)
     253:	e8 da 0c 00 00       	call   f32 <close>
    wait();
     258:	e8 b5 0c 00 00       	call   f12 <wait>
    wait();
     25d:	e8 b0 0c 00 00       	call   f12 <wait>
    break;
     262:	83 c4 10             	add    $0x10,%esp
     265:	eb 99                	jmp    200 <runcmd+0x50>
    if(fork1() == 0)
     267:	e8 24 ff ff ff       	call   190 <fork1>
     26c:	85 c0                	test   %eax,%eax
     26e:	74 2f                	je     29f <runcmd+0xef>
    wait();
     270:	e8 9d 0c 00 00       	call   f12 <wait>
    runcmd(lcmd->right);
     275:	83 ec 0c             	sub    $0xc,%esp
     278:	ff 73 08             	push   0x8(%ebx)
     27b:	e8 30 ff ff ff       	call   1b0 <runcmd>
    close(rcmd->fd);
     280:	83 ec 0c             	sub    $0xc,%esp
     283:	ff 73 14             	push   0x14(%ebx)
     286:	e8 a7 0c 00 00       	call   f32 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     28b:	58                   	pop    %eax
     28c:	5a                   	pop    %edx
     28d:	ff 73 10             	push   0x10(%ebx)
     290:	ff 73 08             	push   0x8(%ebx)
     293:	e8 b2 0c 00 00       	call   f4a <open>
     298:	83 c4 10             	add    $0x10,%esp
     29b:	85 c0                	test   %eax,%eax
     29d:	78 18                	js     2b7 <runcmd+0x107>
      runcmd(bcmd->cmd);
     29f:	83 ec 0c             	sub    $0xc,%esp
     2a2:	ff 73 04             	push   0x4(%ebx)
     2a5:	e8 06 ff ff ff       	call   1b0 <runcmd>
    panic("runcmd");
     2aa:	83 ec 0c             	sub    $0xc,%esp
     2ad:	68 70 13 00 00       	push   $0x1370
     2b2:	e8 b9 fe ff ff       	call   170 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     2b7:	51                   	push   %ecx
     2b8:	ff 73 08             	push   0x8(%ebx)
     2bb:	68 87 13 00 00       	push   $0x1387
     2c0:	6a 02                	push   $0x2
     2c2:	e8 99 0d 00 00       	call   1060 <printf>
      exit();
     2c7:	e8 3e 0c 00 00       	call   f0a <exit>
      panic("pipe");
     2cc:	83 ec 0c             	sub    $0xc,%esp
     2cf:	68 97 13 00 00       	push   $0x1397
     2d4:	e8 97 fe ff ff       	call   170 <panic>
      close(1);
     2d9:	83 ec 0c             	sub    $0xc,%esp
     2dc:	6a 01                	push   $0x1
     2de:	e8 4f 0c 00 00       	call   f32 <close>
      dup(p[1]);
     2e3:	58                   	pop    %eax
     2e4:	ff 75 f4             	push   -0xc(%ebp)
     2e7:	e8 96 0c 00 00       	call   f82 <dup>
      close(p[0]);
     2ec:	58                   	pop    %eax
     2ed:	ff 75 f0             	push   -0x10(%ebp)
     2f0:	e8 3d 0c 00 00       	call   f32 <close>
      close(p[1]);
     2f5:	58                   	pop    %eax
     2f6:	ff 75 f4             	push   -0xc(%ebp)
     2f9:	e8 34 0c 00 00       	call   f32 <close>
      runcmd(pcmd->left);
     2fe:	5a                   	pop    %edx
     2ff:	ff 73 04             	push   0x4(%ebx)
     302:	e8 a9 fe ff ff       	call   1b0 <runcmd>
      close(0);
     307:	83 ec 0c             	sub    $0xc,%esp
     30a:	6a 00                	push   $0x0
     30c:	e8 21 0c 00 00       	call   f32 <close>
      dup(p[0]);
     311:	5a                   	pop    %edx
     312:	ff 75 f0             	push   -0x10(%ebp)
     315:	e8 68 0c 00 00       	call   f82 <dup>
      close(p[0]);
     31a:	59                   	pop    %ecx
     31b:	ff 75 f0             	push   -0x10(%ebp)
     31e:	e8 0f 0c 00 00       	call   f32 <close>
      close(p[1]);
     323:	58                   	pop    %eax
     324:	ff 75 f4             	push   -0xc(%ebp)
     327:	e8 06 0c 00 00       	call   f32 <close>
      runcmd(pcmd->right);
     32c:	58                   	pop    %eax
     32d:	ff 73 08             	push   0x8(%ebx)
     330:	e8 7b fe ff ff       	call   1b0 <runcmd>
     335:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     33c:	00 
     33d:	8d 76 00             	lea    0x0(%esi),%esi

00000340 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	53                   	push   %ebx
     344:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     347:	6a 54                	push   $0x54
     349:	e8 32 0f 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     34e:	83 c4 0c             	add    $0xc,%esp
     351:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     353:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     355:	6a 00                	push   $0x0
     357:	50                   	push   %eax
     358:	e8 33 09 00 00       	call   c90 <memset>
  cmd->type = EXEC;
     35d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     363:	89 d8                	mov    %ebx,%eax
     365:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     368:	c9                   	leave
     369:	c3                   	ret
     36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     370:	55                   	push   %ebp
     371:	89 e5                	mov    %esp,%ebp
     373:	53                   	push   %ebx
     374:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     377:	6a 18                	push   $0x18
     379:	e8 02 0f 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     37e:	83 c4 0c             	add    $0xc,%esp
     381:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     383:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     385:	6a 00                	push   $0x0
     387:	50                   	push   %eax
     388:	e8 03 09 00 00       	call   c90 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     38d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     390:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     396:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     399:	8b 45 0c             	mov    0xc(%ebp),%eax
     39c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     39f:	8b 45 10             	mov    0x10(%ebp),%eax
     3a2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3a5:	8b 45 14             	mov    0x14(%ebp),%eax
     3a8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3ab:	8b 45 18             	mov    0x18(%ebp),%eax
     3ae:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3b1:	89 d8                	mov    %ebx,%eax
     3b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3b6:	c9                   	leave
     3b7:	c3                   	ret
     3b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     3bf:	00 

000003c0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	53                   	push   %ebx
     3c4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c7:	6a 0c                	push   $0xc
     3c9:	e8 b2 0e 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ce:	83 c4 0c             	add    $0xc,%esp
     3d1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3d3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3d5:	6a 00                	push   $0x0
     3d7:	50                   	push   %eax
     3d8:	e8 b3 08 00 00       	call   c90 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3dd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     3e0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3e6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3e9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ec:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3ef:	89 d8                	mov    %ebx,%eax
     3f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3f4:	c9                   	leave
     3f5:	c3                   	ret
     3f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     3fd:	00 
     3fe:	66 90                	xchg   %ax,%ax

00000400 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	53                   	push   %ebx
     404:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     407:	6a 0c                	push   $0xc
     409:	e8 72 0e 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     40e:	83 c4 0c             	add    $0xc,%esp
     411:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     413:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     415:	6a 00                	push   $0x0
     417:	50                   	push   %eax
     418:	e8 73 08 00 00       	call   c90 <memset>
  cmd->type = LIST;
  cmd->left = left;
     41d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     420:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     426:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     429:	8b 45 0c             	mov    0xc(%ebp),%eax
     42c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     42f:	89 d8                	mov    %ebx,%eax
     431:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     434:	c9                   	leave
     435:	c3                   	ret
     436:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     43d:	00 
     43e:	66 90                	xchg   %ax,%ax

00000440 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	53                   	push   %ebx
     444:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     447:	6a 08                	push   $0x8
     449:	e8 32 0e 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     44e:	83 c4 0c             	add    $0xc,%esp
     451:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     453:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     455:	6a 00                	push   $0x0
     457:	50                   	push   %eax
     458:	e8 33 08 00 00       	call   c90 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     45d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     460:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     466:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     469:	89 d8                	mov    %ebx,%eax
     46b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     46e:	c9                   	leave
     46f:	c3                   	ret

00000470 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     470:	55                   	push   %ebp
     471:	89 e5                	mov    %esp,%ebp
     473:	57                   	push   %edi
     474:	56                   	push   %esi
     475:	53                   	push   %ebx
     476:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     479:	8b 45 08             	mov    0x8(%ebp),%eax
{
     47c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     47f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     482:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     484:	39 df                	cmp    %ebx,%edi
     486:	72 0f                	jb     497 <gettoken+0x27>
     488:	eb 25                	jmp    4af <gettoken+0x3f>
     48a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     490:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     493:	39 fb                	cmp    %edi,%ebx
     495:	74 18                	je     4af <gettoken+0x3f>
     497:	0f be 07             	movsbl (%edi),%eax
     49a:	83 ec 08             	sub    $0x8,%esp
     49d:	50                   	push   %eax
     49e:	68 30 1b 00 00       	push   $0x1b30
     4a3:	e8 08 08 00 00       	call   cb0 <strchr>
     4a8:	83 c4 10             	add    $0x10,%esp
     4ab:	85 c0                	test   %eax,%eax
     4ad:	75 e1                	jne    490 <gettoken+0x20>
  if(q)
     4af:	85 f6                	test   %esi,%esi
     4b1:	74 02                	je     4b5 <gettoken+0x45>
    *q = s;
     4b3:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     4b5:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     4b8:	3c 3c                	cmp    $0x3c,%al
     4ba:	0f 8f c8 00 00 00    	jg     588 <gettoken+0x118>
     4c0:	3c 3a                	cmp    $0x3a,%al
     4c2:	7f 5a                	jg     51e <gettoken+0xae>
     4c4:	84 c0                	test   %al,%al
     4c6:	75 48                	jne    510 <gettoken+0xa0>
     4c8:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4ca:	8b 4d 14             	mov    0x14(%ebp),%ecx
     4cd:	85 c9                	test   %ecx,%ecx
     4cf:	74 05                	je     4d6 <gettoken+0x66>
    *eq = s;
     4d1:	8b 45 14             	mov    0x14(%ebp),%eax
     4d4:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4d6:	39 df                	cmp    %ebx,%edi
     4d8:	72 0d                	jb     4e7 <gettoken+0x77>
     4da:	eb 23                	jmp    4ff <gettoken+0x8f>
     4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
     4e0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     4e3:	39 fb                	cmp    %edi,%ebx
     4e5:	74 18                	je     4ff <gettoken+0x8f>
     4e7:	0f be 07             	movsbl (%edi),%eax
     4ea:	83 ec 08             	sub    $0x8,%esp
     4ed:	50                   	push   %eax
     4ee:	68 30 1b 00 00       	push   $0x1b30
     4f3:	e8 b8 07 00 00       	call   cb0 <strchr>
     4f8:	83 c4 10             	add    $0x10,%esp
     4fb:	85 c0                	test   %eax,%eax
     4fd:	75 e1                	jne    4e0 <gettoken+0x70>
  *ps = s;
     4ff:	8b 45 08             	mov    0x8(%ebp),%eax
     502:	89 38                	mov    %edi,(%eax)
  return ret;
}
     504:	8d 65 f4             	lea    -0xc(%ebp),%esp
     507:	89 f0                	mov    %esi,%eax
     509:	5b                   	pop    %ebx
     50a:	5e                   	pop    %esi
     50b:	5f                   	pop    %edi
     50c:	5d                   	pop    %ebp
     50d:	c3                   	ret
     50e:	66 90                	xchg   %ax,%ax
  switch(*s){
     510:	78 22                	js     534 <gettoken+0xc4>
     512:	3c 26                	cmp    $0x26,%al
     514:	74 08                	je     51e <gettoken+0xae>
     516:	8d 48 d8             	lea    -0x28(%eax),%ecx
     519:	80 f9 01             	cmp    $0x1,%cl
     51c:	77 16                	ja     534 <gettoken+0xc4>
  ret = *s;
     51e:	0f be f0             	movsbl %al,%esi
    s++;
     521:	83 c7 01             	add    $0x1,%edi
    break;
     524:	eb a4                	jmp    4ca <gettoken+0x5a>
     526:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     52d:	00 
     52e:	66 90                	xchg   %ax,%ax
  switch(*s){
     530:	3c 7c                	cmp    $0x7c,%al
     532:	74 ea                	je     51e <gettoken+0xae>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     534:	39 df                	cmp    %ebx,%edi
     536:	72 27                	jb     55f <gettoken+0xef>
     538:	e9 87 00 00 00       	jmp    5c4 <gettoken+0x154>
     53d:	8d 76 00             	lea    0x0(%esi),%esi
     540:	0f be 07             	movsbl (%edi),%eax
     543:	83 ec 08             	sub    $0x8,%esp
     546:	50                   	push   %eax
     547:	68 28 1b 00 00       	push   $0x1b28
     54c:	e8 5f 07 00 00       	call   cb0 <strchr>
     551:	83 c4 10             	add    $0x10,%esp
     554:	85 c0                	test   %eax,%eax
     556:	75 1f                	jne    577 <gettoken+0x107>
      s++;
     558:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     55b:	39 fb                	cmp    %edi,%ebx
     55d:	74 4d                	je     5ac <gettoken+0x13c>
     55f:	0f be 07             	movsbl (%edi),%eax
     562:	83 ec 08             	sub    $0x8,%esp
     565:	50                   	push   %eax
     566:	68 30 1b 00 00       	push   $0x1b30
     56b:	e8 40 07 00 00       	call   cb0 <strchr>
     570:	83 c4 10             	add    $0x10,%esp
     573:	85 c0                	test   %eax,%eax
     575:	74 c9                	je     540 <gettoken+0xd0>
    ret = 'a';
     577:	be 61 00 00 00       	mov    $0x61,%esi
     57c:	e9 49 ff ff ff       	jmp    4ca <gettoken+0x5a>
     581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     588:	3c 3e                	cmp    $0x3e,%al
     58a:	75 a4                	jne    530 <gettoken+0xc0>
    if(*s == '>'){
     58c:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     590:	74 0d                	je     59f <gettoken+0x12f>
    s++;
     592:	83 c7 01             	add    $0x1,%edi
  ret = *s;
     595:	be 3e 00 00 00       	mov    $0x3e,%esi
     59a:	e9 2b ff ff ff       	jmp    4ca <gettoken+0x5a>
      s++;
     59f:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     5a2:	be 2b 00 00 00       	mov    $0x2b,%esi
     5a7:	e9 1e ff ff ff       	jmp    4ca <gettoken+0x5a>
  if(eq)
     5ac:	8b 45 14             	mov    0x14(%ebp),%eax
     5af:	85 c0                	test   %eax,%eax
     5b1:	74 05                	je     5b8 <gettoken+0x148>
    *eq = s;
     5b3:	8b 45 14             	mov    0x14(%ebp),%eax
     5b6:	89 18                	mov    %ebx,(%eax)
  while(s < es && strchr(whitespace, *s))
     5b8:	89 df                	mov    %ebx,%edi
    ret = 'a';
     5ba:	be 61 00 00 00       	mov    $0x61,%esi
     5bf:	e9 3b ff ff ff       	jmp    4ff <gettoken+0x8f>
  if(eq)
     5c4:	8b 55 14             	mov    0x14(%ebp),%edx
     5c7:	85 d2                	test   %edx,%edx
     5c9:	74 ef                	je     5ba <gettoken+0x14a>
    *eq = s;
     5cb:	8b 45 14             	mov    0x14(%ebp),%eax
     5ce:	89 38                	mov    %edi,(%eax)
  while(s < es && strchr(whitespace, *s))
     5d0:	eb e8                	jmp    5ba <gettoken+0x14a>
     5d2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     5d9:	00 
     5da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005e0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     5e0:	55                   	push   %ebp
     5e1:	89 e5                	mov    %esp,%ebp
     5e3:	57                   	push   %edi
     5e4:	56                   	push   %esi
     5e5:	53                   	push   %ebx
     5e6:	83 ec 0c             	sub    $0xc,%esp
     5e9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5ec:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     5ef:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     5f1:	39 f3                	cmp    %esi,%ebx
     5f3:	72 12                	jb     607 <peek+0x27>
     5f5:	eb 28                	jmp    61f <peek+0x3f>
     5f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     5fe:	00 
     5ff:	90                   	nop
    s++;
     600:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     603:	39 de                	cmp    %ebx,%esi
     605:	74 18                	je     61f <peek+0x3f>
     607:	0f be 03             	movsbl (%ebx),%eax
     60a:	83 ec 08             	sub    $0x8,%esp
     60d:	50                   	push   %eax
     60e:	68 30 1b 00 00       	push   $0x1b30
     613:	e8 98 06 00 00       	call   cb0 <strchr>
     618:	83 c4 10             	add    $0x10,%esp
     61b:	85 c0                	test   %eax,%eax
     61d:	75 e1                	jne    600 <peek+0x20>
  *ps = s;
     61f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     621:	0f be 03             	movsbl (%ebx),%eax
     624:	31 d2                	xor    %edx,%edx
     626:	84 c0                	test   %al,%al
     628:	75 0e                	jne    638 <peek+0x58>
}
     62a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     62d:	89 d0                	mov    %edx,%eax
     62f:	5b                   	pop    %ebx
     630:	5e                   	pop    %esi
     631:	5f                   	pop    %edi
     632:	5d                   	pop    %ebp
     633:	c3                   	ret
     634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     638:	83 ec 08             	sub    $0x8,%esp
     63b:	50                   	push   %eax
     63c:	ff 75 10             	push   0x10(%ebp)
     63f:	e8 6c 06 00 00       	call   cb0 <strchr>
     644:	83 c4 10             	add    $0x10,%esp
     647:	31 d2                	xor    %edx,%edx
     649:	85 c0                	test   %eax,%eax
     64b:	0f 95 c2             	setne  %dl
}
     64e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     651:	5b                   	pop    %ebx
     652:	89 d0                	mov    %edx,%eax
     654:	5e                   	pop    %esi
     655:	5f                   	pop    %edi
     656:	5d                   	pop    %ebp
     657:	c3                   	ret
     658:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     65f:	00 

00000660 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	57                   	push   %edi
     664:	56                   	push   %esi
     665:	53                   	push   %ebx
     666:	83 ec 2c             	sub    $0x2c,%esp
     669:	8b 75 0c             	mov    0xc(%ebp),%esi
     66c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     66f:	90                   	nop
     670:	83 ec 04             	sub    $0x4,%esp
     673:	68 b9 13 00 00       	push   $0x13b9
     678:	53                   	push   %ebx
     679:	56                   	push   %esi
     67a:	e8 61 ff ff ff       	call   5e0 <peek>
     67f:	83 c4 10             	add    $0x10,%esp
     682:	85 c0                	test   %eax,%eax
     684:	0f 84 f6 00 00 00    	je     780 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     68a:	6a 00                	push   $0x0
     68c:	6a 00                	push   $0x0
     68e:	53                   	push   %ebx
     68f:	56                   	push   %esi
     690:	e8 db fd ff ff       	call   470 <gettoken>
     695:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     697:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     69a:	50                   	push   %eax
     69b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     69e:	50                   	push   %eax
     69f:	53                   	push   %ebx
     6a0:	56                   	push   %esi
     6a1:	e8 ca fd ff ff       	call   470 <gettoken>
     6a6:	83 c4 20             	add    $0x20,%esp
     6a9:	83 f8 61             	cmp    $0x61,%eax
     6ac:	0f 85 d9 00 00 00    	jne    78b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     6b2:	83 ff 3c             	cmp    $0x3c,%edi
     6b5:	74 69                	je     720 <parseredirs+0xc0>
     6b7:	83 ff 3e             	cmp    $0x3e,%edi
     6ba:	74 05                	je     6c1 <parseredirs+0x61>
     6bc:	83 ff 2b             	cmp    $0x2b,%edi
     6bf:	75 af                	jne    670 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6c1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6c4:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     6c7:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6ca:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6cd:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6d0:	6a 18                	push   $0x18
     6d2:	e8 a9 0b 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6d7:	83 c4 0c             	add    $0xc,%esp
     6da:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6dc:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     6de:	6a 00                	push   $0x0
     6e0:	50                   	push   %eax
     6e1:	e8 aa 05 00 00       	call   c90 <memset>
  cmd->type = REDIR;
     6e6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     6ec:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     6ef:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     6f2:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     6f5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     6f8:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     6fb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     6fe:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     705:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     708:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     70f:	89 7d 08             	mov    %edi,0x8(%ebp)
      break;
     712:	e9 59 ff ff ff       	jmp    670 <parseredirs+0x10>
     717:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     71e:	00 
     71f:	90                   	nop
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     720:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     723:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     726:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     729:	89 55 d0             	mov    %edx,-0x30(%ebp)
     72c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     72f:	6a 18                	push   $0x18
     731:	e8 4a 0b 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     736:	83 c4 0c             	add    $0xc,%esp
     739:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     73b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     73d:	6a 00                	push   $0x0
     73f:	50                   	push   %eax
     740:	e8 4b 05 00 00       	call   c90 <memset>
  cmd->cmd = subcmd;
     745:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     748:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     74b:	83 c4 10             	add    $0x10,%esp
  cmd->efile = efile;
     74e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     751:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     757:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     75a:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     75d:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     760:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     767:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     76e:	89 7d 08             	mov    %edi,0x8(%ebp)
      break;
     771:	e9 fa fe ff ff       	jmp    670 <parseredirs+0x10>
     776:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     77d:	00 
     77e:	66 90                	xchg   %ax,%ax
    }
  }
  return cmd;
}
     780:	8b 45 08             	mov    0x8(%ebp),%eax
     783:	8d 65 f4             	lea    -0xc(%ebp),%esp
     786:	5b                   	pop    %ebx
     787:	5e                   	pop    %esi
     788:	5f                   	pop    %edi
     789:	5d                   	pop    %ebp
     78a:	c3                   	ret
      panic("missing file for redirection");
     78b:	83 ec 0c             	sub    $0xc,%esp
     78e:	68 9c 13 00 00       	push   $0x139c
     793:	e8 d8 f9 ff ff       	call   170 <panic>
     798:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     79f:	00 

000007a0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     7a0:	55                   	push   %ebp
     7a1:	89 e5                	mov    %esp,%ebp
     7a3:	57                   	push   %edi
     7a4:	56                   	push   %esi
     7a5:	53                   	push   %ebx
     7a6:	83 ec 30             	sub    $0x30,%esp
     7a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     7ac:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     7af:	68 bc 13 00 00       	push   $0x13bc
     7b4:	56                   	push   %esi
     7b5:	53                   	push   %ebx
     7b6:	e8 25 fe ff ff       	call   5e0 <peek>
     7bb:	83 c4 10             	add    $0x10,%esp
     7be:	85 c0                	test   %eax,%eax
     7c0:	0f 85 aa 00 00 00    	jne    870 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     7c6:	83 ec 0c             	sub    $0xc,%esp
     7c9:	89 c7                	mov    %eax,%edi
     7cb:	6a 54                	push   $0x54
     7cd:	e8 ae 0a 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     7d2:	83 c4 0c             	add    $0xc,%esp
     7d5:	6a 54                	push   $0x54
     7d7:	6a 00                	push   $0x0
     7d9:	89 45 d0             	mov    %eax,-0x30(%ebp)
     7dc:	50                   	push   %eax
     7dd:	e8 ae 04 00 00       	call   c90 <memset>
  cmd->type = EXEC;
     7e2:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7e5:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     7e8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     7ee:	56                   	push   %esi
     7ef:	53                   	push   %ebx
     7f0:	50                   	push   %eax
     7f1:	e8 6a fe ff ff       	call   660 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     7f6:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     7f9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7fc:	eb 15                	jmp    813 <parseexec+0x73>
     7fe:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     800:	83 ec 04             	sub    $0x4,%esp
     803:	56                   	push   %esi
     804:	53                   	push   %ebx
     805:	ff 75 d4             	push   -0x2c(%ebp)
     808:	e8 53 fe ff ff       	call   660 <parseredirs>
     80d:	83 c4 10             	add    $0x10,%esp
     810:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     813:	83 ec 04             	sub    $0x4,%esp
     816:	68 d3 13 00 00       	push   $0x13d3
     81b:	56                   	push   %esi
     81c:	53                   	push   %ebx
     81d:	e8 be fd ff ff       	call   5e0 <peek>
     822:	83 c4 10             	add    $0x10,%esp
     825:	85 c0                	test   %eax,%eax
     827:	75 5f                	jne    888 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     829:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     82c:	50                   	push   %eax
     82d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     830:	50                   	push   %eax
     831:	56                   	push   %esi
     832:	53                   	push   %ebx
     833:	e8 38 fc ff ff       	call   470 <gettoken>
     838:	83 c4 10             	add    $0x10,%esp
     83b:	85 c0                	test   %eax,%eax
     83d:	74 49                	je     888 <parseexec+0xe8>
    if(tok != 'a')
     83f:	83 f8 61             	cmp    $0x61,%eax
     842:	75 62                	jne    8a6 <parseexec+0x106>
    cmd->argv[argc] = q;
     844:	8b 45 e0             	mov    -0x20(%ebp),%eax
     847:	8b 55 d0             	mov    -0x30(%ebp),%edx
     84a:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
    cmd->eargv[argc] = eq;
     84e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     851:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
    argc++;
     855:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARGS)
     858:	83 ff 0a             	cmp    $0xa,%edi
     85b:	75 a3                	jne    800 <parseexec+0x60>
      panic("too many args");
     85d:	83 ec 0c             	sub    $0xc,%esp
     860:	68 c5 13 00 00       	push   $0x13c5
     865:	e8 06 f9 ff ff       	call   170 <panic>
     86a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     870:	89 75 0c             	mov    %esi,0xc(%ebp)
     873:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     876:	8d 65 f4             	lea    -0xc(%ebp),%esp
     879:	5b                   	pop    %ebx
     87a:	5e                   	pop    %esi
     87b:	5f                   	pop    %edi
     87c:	5d                   	pop    %ebp
    return parseblock(ps, es);
     87d:	e9 ae 01 00 00       	jmp    a30 <parseblock>
     882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     888:	8b 45 d0             	mov    -0x30(%ebp),%eax
     88b:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     892:	00 
  cmd->eargv[argc] = 0;
     893:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     89a:	00 
}
     89b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     89e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8a1:	5b                   	pop    %ebx
     8a2:	5e                   	pop    %esi
     8a3:	5f                   	pop    %edi
     8a4:	5d                   	pop    %ebp
     8a5:	c3                   	ret
      panic("syntax");
     8a6:	83 ec 0c             	sub    $0xc,%esp
     8a9:	68 be 13 00 00       	push   $0x13be
     8ae:	e8 bd f8 ff ff       	call   170 <panic>
     8b3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     8ba:	00 
     8bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000008c0 <parsepipe>:
{
     8c0:	55                   	push   %ebp
     8c1:	89 e5                	mov    %esp,%ebp
     8c3:	57                   	push   %edi
     8c4:	56                   	push   %esi
     8c5:	53                   	push   %ebx
     8c6:	83 ec 14             	sub    $0x14,%esp
     8c9:	8b 75 08             	mov    0x8(%ebp),%esi
     8cc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     8cf:	57                   	push   %edi
     8d0:	56                   	push   %esi
     8d1:	e8 ca fe ff ff       	call   7a0 <parseexec>
  if(peek(ps, es, "|")){
     8d6:	83 c4 0c             	add    $0xc,%esp
     8d9:	68 d8 13 00 00       	push   $0x13d8
  cmd = parseexec(ps, es);
     8de:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     8e0:	57                   	push   %edi
     8e1:	56                   	push   %esi
     8e2:	e8 f9 fc ff ff       	call   5e0 <peek>
     8e7:	83 c4 10             	add    $0x10,%esp
     8ea:	85 c0                	test   %eax,%eax
     8ec:	75 12                	jne    900 <parsepipe+0x40>
}
     8ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8f1:	89 d8                	mov    %ebx,%eax
     8f3:	5b                   	pop    %ebx
     8f4:	5e                   	pop    %esi
     8f5:	5f                   	pop    %edi
     8f6:	5d                   	pop    %ebp
     8f7:	c3                   	ret
     8f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     8ff:	00 
    gettoken(ps, es, 0, 0);
     900:	6a 00                	push   $0x0
     902:	6a 00                	push   $0x0
     904:	57                   	push   %edi
     905:	56                   	push   %esi
     906:	e8 65 fb ff ff       	call   470 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     90b:	58                   	pop    %eax
     90c:	5a                   	pop    %edx
     90d:	57                   	push   %edi
     90e:	56                   	push   %esi
     90f:	e8 ac ff ff ff       	call   8c0 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     914:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     91b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     91d:	e8 5e 09 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     922:	83 c4 0c             	add    $0xc,%esp
     925:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     927:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     929:	6a 00                	push   $0x0
     92b:	50                   	push   %eax
     92c:	e8 5f 03 00 00       	call   c90 <memset>
  cmd->left = left;
     931:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     934:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     937:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     939:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     93f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     941:	89 7e 08             	mov    %edi,0x8(%esi)
}
     944:	8d 65 f4             	lea    -0xc(%ebp),%esp
     947:	5b                   	pop    %ebx
     948:	5e                   	pop    %esi
     949:	5f                   	pop    %edi
     94a:	5d                   	pop    %ebp
     94b:	c3                   	ret
     94c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000950 <parseline>:
{
     950:	55                   	push   %ebp
     951:	89 e5                	mov    %esp,%ebp
     953:	57                   	push   %edi
     954:	56                   	push   %esi
     955:	53                   	push   %ebx
     956:	83 ec 24             	sub    $0x24,%esp
     959:	8b 75 08             	mov    0x8(%ebp),%esi
     95c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     95f:	57                   	push   %edi
     960:	56                   	push   %esi
     961:	e8 5a ff ff ff       	call   8c0 <parsepipe>
  while(peek(ps, es, "&")){
     966:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     969:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     96b:	eb 3b                	jmp    9a8 <parseline+0x58>
     96d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     970:	6a 00                	push   $0x0
     972:	6a 00                	push   $0x0
     974:	57                   	push   %edi
     975:	56                   	push   %esi
     976:	e8 f5 fa ff ff       	call   470 <gettoken>
  cmd = malloc(sizeof(*cmd));
     97b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     982:	e8 f9 08 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     987:	83 c4 0c             	add    $0xc,%esp
     98a:	6a 08                	push   $0x8
     98c:	6a 00                	push   $0x0
     98e:	50                   	push   %eax
     98f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     992:	e8 f9 02 00 00       	call   c90 <memset>
  cmd->type = BACK;
     997:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     99a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     99d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     9a3:	89 5a 04             	mov    %ebx,0x4(%edx)
    cmd = backcmd(cmd);
     9a6:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     9a8:	83 ec 04             	sub    $0x4,%esp
     9ab:	68 da 13 00 00       	push   $0x13da
     9b0:	57                   	push   %edi
     9b1:	56                   	push   %esi
     9b2:	e8 29 fc ff ff       	call   5e0 <peek>
     9b7:	83 c4 10             	add    $0x10,%esp
     9ba:	85 c0                	test   %eax,%eax
     9bc:	75 b2                	jne    970 <parseline+0x20>
  if(peek(ps, es, ";")){
     9be:	83 ec 04             	sub    $0x4,%esp
     9c1:	68 d6 13 00 00       	push   $0x13d6
     9c6:	57                   	push   %edi
     9c7:	56                   	push   %esi
     9c8:	e8 13 fc ff ff       	call   5e0 <peek>
     9cd:	83 c4 10             	add    $0x10,%esp
     9d0:	85 c0                	test   %eax,%eax
     9d2:	75 0c                	jne    9e0 <parseline+0x90>
}
     9d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9d7:	89 d8                	mov    %ebx,%eax
     9d9:	5b                   	pop    %ebx
     9da:	5e                   	pop    %esi
     9db:	5f                   	pop    %edi
     9dc:	5d                   	pop    %ebp
     9dd:	c3                   	ret
     9de:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     9e0:	6a 00                	push   $0x0
     9e2:	6a 00                	push   $0x0
     9e4:	57                   	push   %edi
     9e5:	56                   	push   %esi
     9e6:	e8 85 fa ff ff       	call   470 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9eb:	58                   	pop    %eax
     9ec:	5a                   	pop    %edx
     9ed:	57                   	push   %edi
     9ee:	56                   	push   %esi
     9ef:	e8 5c ff ff ff       	call   950 <parseline>
  cmd = malloc(sizeof(*cmd));
     9f4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     9fb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     9fd:	e8 7e 08 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     a02:	83 c4 0c             	add    $0xc,%esp
     a05:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     a07:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     a09:	6a 00                	push   $0x0
     a0b:	50                   	push   %eax
     a0c:	e8 7f 02 00 00       	call   c90 <memset>
  cmd->left = left;
     a11:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     a14:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
     a17:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     a19:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     a1f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     a21:	89 7e 08             	mov    %edi,0x8(%esi)
}
     a24:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a27:	5b                   	pop    %ebx
     a28:	5e                   	pop    %esi
     a29:	5f                   	pop    %edi
     a2a:	5d                   	pop    %ebp
     a2b:	c3                   	ret
     a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a30 <parseblock>:
{
     a30:	55                   	push   %ebp
     a31:	89 e5                	mov    %esp,%ebp
     a33:	57                   	push   %edi
     a34:	56                   	push   %esi
     a35:	53                   	push   %ebx
     a36:	83 ec 10             	sub    $0x10,%esp
     a39:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a3c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     a3f:	68 bc 13 00 00       	push   $0x13bc
     a44:	56                   	push   %esi
     a45:	53                   	push   %ebx
     a46:	e8 95 fb ff ff       	call   5e0 <peek>
     a4b:	83 c4 10             	add    $0x10,%esp
     a4e:	85 c0                	test   %eax,%eax
     a50:	74 4a                	je     a9c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     a52:	6a 00                	push   $0x0
     a54:	6a 00                	push   $0x0
     a56:	56                   	push   %esi
     a57:	53                   	push   %ebx
     a58:	e8 13 fa ff ff       	call   470 <gettoken>
  cmd = parseline(ps, es);
     a5d:	58                   	pop    %eax
     a5e:	5a                   	pop    %edx
     a5f:	56                   	push   %esi
     a60:	53                   	push   %ebx
     a61:	e8 ea fe ff ff       	call   950 <parseline>
  if(!peek(ps, es, ")"))
     a66:	83 c4 0c             	add    $0xc,%esp
     a69:	68 f8 13 00 00       	push   $0x13f8
  cmd = parseline(ps, es);
     a6e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a70:	56                   	push   %esi
     a71:	53                   	push   %ebx
     a72:	e8 69 fb ff ff       	call   5e0 <peek>
     a77:	83 c4 10             	add    $0x10,%esp
     a7a:	85 c0                	test   %eax,%eax
     a7c:	74 2b                	je     aa9 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     a7e:	6a 00                	push   $0x0
     a80:	6a 00                	push   $0x0
     a82:	56                   	push   %esi
     a83:	53                   	push   %ebx
     a84:	e8 e7 f9 ff ff       	call   470 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a89:	83 c4 0c             	add    $0xc,%esp
     a8c:	56                   	push   %esi
     a8d:	53                   	push   %ebx
     a8e:	57                   	push   %edi
     a8f:	e8 cc fb ff ff       	call   660 <parseredirs>
}
     a94:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a97:	5b                   	pop    %ebx
     a98:	5e                   	pop    %esi
     a99:	5f                   	pop    %edi
     a9a:	5d                   	pop    %ebp
     a9b:	c3                   	ret
    panic("parseblock");
     a9c:	83 ec 0c             	sub    $0xc,%esp
     a9f:	68 dc 13 00 00       	push   $0x13dc
     aa4:	e8 c7 f6 ff ff       	call   170 <panic>
    panic("syntax - missing )");
     aa9:	83 ec 0c             	sub    $0xc,%esp
     aac:	68 e7 13 00 00       	push   $0x13e7
     ab1:	e8 ba f6 ff ff       	call   170 <panic>
     ab6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     abd:	00 
     abe:	66 90                	xchg   %ax,%ax

00000ac0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     ac0:	55                   	push   %ebp
     ac1:	89 e5                	mov    %esp,%ebp
     ac3:	53                   	push   %ebx
     ac4:	83 ec 04             	sub    $0x4,%esp
     ac7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     aca:	85 db                	test   %ebx,%ebx
     acc:	74 29                	je     af7 <nulterminate+0x37>
    return 0;

  switch(cmd->type){
     ace:	83 3b 05             	cmpl   $0x5,(%ebx)
     ad1:	77 24                	ja     af7 <nulterminate+0x37>
     ad3:	8b 03                	mov    (%ebx),%eax
     ad5:	ff 24 85 40 14 00 00 	jmp    *0x1440(,%eax,4)
     adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     ae0:	83 ec 0c             	sub    $0xc,%esp
     ae3:	ff 73 04             	push   0x4(%ebx)
     ae6:	e8 d5 ff ff ff       	call   ac0 <nulterminate>
    nulterminate(lcmd->right);
     aeb:	58                   	pop    %eax
     aec:	ff 73 08             	push   0x8(%ebx)
     aef:	e8 cc ff ff ff       	call   ac0 <nulterminate>
    break;
     af4:	83 c4 10             	add    $0x10,%esp
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     af7:	89 d8                	mov    %ebx,%eax
     af9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     afc:	c9                   	leave
     afd:	c3                   	ret
     afe:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     b00:	83 ec 0c             	sub    $0xc,%esp
     b03:	ff 73 04             	push   0x4(%ebx)
     b06:	e8 b5 ff ff ff       	call   ac0 <nulterminate>
}
     b0b:	89 d8                	mov    %ebx,%eax
    break;
     b0d:	83 c4 10             	add    $0x10,%esp
}
     b10:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b13:	c9                   	leave
     b14:	c3                   	ret
     b15:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     b18:	8b 4b 04             	mov    0x4(%ebx),%ecx
     b1b:	85 c9                	test   %ecx,%ecx
     b1d:	74 d8                	je     af7 <nulterminate+0x37>
     b1f:	8d 43 08             	lea    0x8(%ebx),%eax
     b22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     b28:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     b2b:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     b2e:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     b31:	8b 50 fc             	mov    -0x4(%eax),%edx
     b34:	85 d2                	test   %edx,%edx
     b36:	75 f0                	jne    b28 <nulterminate+0x68>
}
     b38:	89 d8                	mov    %ebx,%eax
     b3a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b3d:	c9                   	leave
     b3e:	c3                   	ret
     b3f:	90                   	nop
    nulterminate(rcmd->cmd);
     b40:	83 ec 0c             	sub    $0xc,%esp
     b43:	ff 73 04             	push   0x4(%ebx)
     b46:	e8 75 ff ff ff       	call   ac0 <nulterminate>
    *rcmd->efile = 0;
     b4b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     b4e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     b51:	c6 00 00             	movb   $0x0,(%eax)
}
     b54:	89 d8                	mov    %ebx,%eax
     b56:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b59:	c9                   	leave
     b5a:	c3                   	ret
     b5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000b60 <parsecmd>:
{
     b60:	55                   	push   %ebp
     b61:	89 e5                	mov    %esp,%ebp
     b63:	57                   	push   %edi
     b64:	56                   	push   %esi
  cmd = parseline(&s, es);
     b65:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     b68:	53                   	push   %ebx
     b69:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     b6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b6f:	53                   	push   %ebx
     b70:	e8 eb 00 00 00       	call   c60 <strlen>
  cmd = parseline(&s, es);
     b75:	59                   	pop    %ecx
     b76:	5e                   	pop    %esi
  es = s + strlen(s);
     b77:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b79:	53                   	push   %ebx
     b7a:	57                   	push   %edi
     b7b:	e8 d0 fd ff ff       	call   950 <parseline>
  peek(&s, es, "");
     b80:	83 c4 0c             	add    $0xc,%esp
     b83:	68 86 13 00 00       	push   $0x1386
  cmd = parseline(&s, es);
     b88:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b8a:	53                   	push   %ebx
     b8b:	57                   	push   %edi
     b8c:	e8 4f fa ff ff       	call   5e0 <peek>
  if(s != es){
     b91:	8b 45 08             	mov    0x8(%ebp),%eax
     b94:	83 c4 10             	add    $0x10,%esp
     b97:	39 d8                	cmp    %ebx,%eax
     b99:	75 13                	jne    bae <parsecmd+0x4e>
  nulterminate(cmd);
     b9b:	83 ec 0c             	sub    $0xc,%esp
     b9e:	56                   	push   %esi
     b9f:	e8 1c ff ff ff       	call   ac0 <nulterminate>
}
     ba4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ba7:	89 f0                	mov    %esi,%eax
     ba9:	5b                   	pop    %ebx
     baa:	5e                   	pop    %esi
     bab:	5f                   	pop    %edi
     bac:	5d                   	pop    %ebp
     bad:	c3                   	ret
    printf(2, "leftovers: %s\n", s);
     bae:	52                   	push   %edx
     baf:	50                   	push   %eax
     bb0:	68 fa 13 00 00       	push   $0x13fa
     bb5:	6a 02                	push   $0x2
     bb7:	e8 a4 04 00 00       	call   1060 <printf>
    panic("syntax");
     bbc:	c7 04 24 be 13 00 00 	movl   $0x13be,(%esp)
     bc3:	e8 a8 f5 ff ff       	call   170 <panic>
     bc8:	66 90                	xchg   %ax,%ax
     bca:	66 90                	xchg   %ax,%ax
     bcc:	66 90                	xchg   %ax,%ax
     bce:	66 90                	xchg   %ax,%ax

00000bd0 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
     bd0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     bd1:	31 c0                	xor    %eax,%eax
{
     bd3:	89 e5                	mov    %esp,%ebp
     bd5:	53                   	push   %ebx
     bd6:	8b 4d 08             	mov    0x8(%ebp),%ecx
     bd9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     be0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     be4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     be7:	83 c0 01             	add    $0x1,%eax
     bea:	84 d2                	test   %dl,%dl
     bec:	75 f2                	jne    be0 <strcpy+0x10>
    ;
  return os;
}
     bee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bf1:	89 c8                	mov    %ecx,%eax
     bf3:	c9                   	leave
     bf4:	c3                   	ret
     bf5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     bfc:	00 
     bfd:	8d 76 00             	lea    0x0(%esi),%esi

00000c00 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	53                   	push   %ebx
     c04:	8b 55 08             	mov    0x8(%ebp),%edx
     c07:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     c0a:	0f b6 02             	movzbl (%edx),%eax
     c0d:	84 c0                	test   %al,%al
     c0f:	75 17                	jne    c28 <strcmp+0x28>
     c11:	eb 3a                	jmp    c4d <strcmp+0x4d>
     c13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     c18:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     c1c:	83 c2 01             	add    $0x1,%edx
     c1f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     c22:	84 c0                	test   %al,%al
     c24:	74 1a                	je     c40 <strcmp+0x40>
     c26:	89 d9                	mov    %ebx,%ecx
     c28:	0f b6 19             	movzbl (%ecx),%ebx
     c2b:	38 c3                	cmp    %al,%bl
     c2d:	74 e9                	je     c18 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     c2f:	29 d8                	sub    %ebx,%eax
}
     c31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c34:	c9                   	leave
     c35:	c3                   	ret
     c36:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c3d:	00 
     c3e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
     c40:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     c44:	31 c0                	xor    %eax,%eax
     c46:	29 d8                	sub    %ebx,%eax
}
     c48:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c4b:	c9                   	leave
     c4c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     c4d:	0f b6 19             	movzbl (%ecx),%ebx
     c50:	31 c0                	xor    %eax,%eax
     c52:	eb db                	jmp    c2f <strcmp+0x2f>
     c54:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c5b:	00 
     c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c60 <strlen>:

uint
strlen(const char *s)
{
     c60:	55                   	push   %ebp
     c61:	89 e5                	mov    %esp,%ebp
     c63:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     c66:	80 3a 00             	cmpb   $0x0,(%edx)
     c69:	74 15                	je     c80 <strlen+0x20>
     c6b:	31 c0                	xor    %eax,%eax
     c6d:	8d 76 00             	lea    0x0(%esi),%esi
     c70:	83 c0 01             	add    $0x1,%eax
     c73:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     c77:	89 c1                	mov    %eax,%ecx
     c79:	75 f5                	jne    c70 <strlen+0x10>
    ;
  return n;
}
     c7b:	89 c8                	mov    %ecx,%eax
     c7d:	5d                   	pop    %ebp
     c7e:	c3                   	ret
     c7f:	90                   	nop
  for(n = 0; s[n]; n++)
     c80:	31 c9                	xor    %ecx,%ecx
}
     c82:	5d                   	pop    %ebp
     c83:	89 c8                	mov    %ecx,%eax
     c85:	c3                   	ret
     c86:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c8d:	00 
     c8e:	66 90                	xchg   %ax,%ax

00000c90 <memset>:

void*
memset(void *dst, int c, uint n)
{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	57                   	push   %edi
     c94:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     c97:	8b 4d 10             	mov    0x10(%ebp),%ecx
     c9a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c9d:	89 d7                	mov    %edx,%edi
     c9f:	fc                   	cld
     ca0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     ca2:	8b 7d fc             	mov    -0x4(%ebp),%edi
     ca5:	89 d0                	mov    %edx,%eax
     ca7:	c9                   	leave
     ca8:	c3                   	ret
     ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cb0 <strchr>:

char*
strchr(const char *s, char c)
{
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	8b 45 08             	mov    0x8(%ebp),%eax
     cb6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     cba:	0f b6 10             	movzbl (%eax),%edx
     cbd:	84 d2                	test   %dl,%dl
     cbf:	75 12                	jne    cd3 <strchr+0x23>
     cc1:	eb 1d                	jmp    ce0 <strchr+0x30>
     cc3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     cc8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     ccc:	83 c0 01             	add    $0x1,%eax
     ccf:	84 d2                	test   %dl,%dl
     cd1:	74 0d                	je     ce0 <strchr+0x30>
    if(*s == c)
     cd3:	38 d1                	cmp    %dl,%cl
     cd5:	75 f1                	jne    cc8 <strchr+0x18>
      return (char*)s;
  return 0;
}
     cd7:	5d                   	pop    %ebp
     cd8:	c3                   	ret
     cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     ce0:	31 c0                	xor    %eax,%eax
}
     ce2:	5d                   	pop    %ebp
     ce3:	c3                   	ret
     ce4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     ceb:	00 
     cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000cf0 <gets>:

char*
gets(char *buf, int max)
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	57                   	push   %edi
     cf4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     cf5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
     cf8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     cf9:	31 db                	xor    %ebx,%ebx
{
     cfb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     cfe:	eb 27                	jmp    d27 <gets+0x37>
    cc = read(0, &c, 1);
     d00:	83 ec 04             	sub    $0x4,%esp
     d03:	6a 01                	push   $0x1
     d05:	56                   	push   %esi
     d06:	6a 00                	push   $0x0
     d08:	e8 15 02 00 00       	call   f22 <read>
    if(cc < 1)
     d0d:	83 c4 10             	add    $0x10,%esp
     d10:	85 c0                	test   %eax,%eax
     d12:	7e 1d                	jle    d31 <gets+0x41>
      break;
    buf[i++] = c;
     d14:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     d18:	8b 55 08             	mov    0x8(%ebp),%edx
     d1b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     d1f:	3c 0a                	cmp    $0xa,%al
     d21:	74 10                	je     d33 <gets+0x43>
     d23:	3c 0d                	cmp    $0xd,%al
     d25:	74 0c                	je     d33 <gets+0x43>
  for(i=0; i+1 < max; ){
     d27:	89 df                	mov    %ebx,%edi
     d29:	83 c3 01             	add    $0x1,%ebx
     d2c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d2f:	7c cf                	jl     d00 <gets+0x10>
     d31:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
     d33:	8b 45 08             	mov    0x8(%ebp),%eax
     d36:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     d3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d3d:	5b                   	pop    %ebx
     d3e:	5e                   	pop    %esi
     d3f:	5f                   	pop    %edi
     d40:	5d                   	pop    %ebp
     d41:	c3                   	ret
     d42:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     d49:	00 
     d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000d50 <stat>:

int
stat(const char *n, struct stat *st)
{
     d50:	55                   	push   %ebp
     d51:	89 e5                	mov    %esp,%ebp
     d53:	56                   	push   %esi
     d54:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d55:	83 ec 08             	sub    $0x8,%esp
     d58:	6a 00                	push   $0x0
     d5a:	ff 75 08             	push   0x8(%ebp)
     d5d:	e8 e8 01 00 00       	call   f4a <open>
  if(fd < 0)
     d62:	83 c4 10             	add    $0x10,%esp
     d65:	85 c0                	test   %eax,%eax
     d67:	78 27                	js     d90 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     d69:	83 ec 08             	sub    $0x8,%esp
     d6c:	ff 75 0c             	push   0xc(%ebp)
     d6f:	89 c3                	mov    %eax,%ebx
     d71:	50                   	push   %eax
     d72:	e8 eb 01 00 00       	call   f62 <fstat>
  close(fd);
     d77:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     d7a:	89 c6                	mov    %eax,%esi
  close(fd);
     d7c:	e8 b1 01 00 00       	call   f32 <close>
  return r;
     d81:	83 c4 10             	add    $0x10,%esp
}
     d84:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d87:	89 f0                	mov    %esi,%eax
     d89:	5b                   	pop    %ebx
     d8a:	5e                   	pop    %esi
     d8b:	5d                   	pop    %ebp
     d8c:	c3                   	ret
     d8d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     d90:	be ff ff ff ff       	mov    $0xffffffff,%esi
     d95:	eb ed                	jmp    d84 <stat+0x34>
     d97:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     d9e:	00 
     d9f:	90                   	nop

00000da0 <atoi>:

int
atoi(const char *s)
{
     da0:	55                   	push   %ebp
     da1:	89 e5                	mov    %esp,%ebp
     da3:	53                   	push   %ebx
     da4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     da7:	0f be 02             	movsbl (%edx),%eax
     daa:	8d 48 d0             	lea    -0x30(%eax),%ecx
     dad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     db0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     db5:	77 1e                	ja     dd5 <atoi+0x35>
     db7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     dbe:	00 
     dbf:	90                   	nop
    n = n*10 + *s++ - '0';
     dc0:	83 c2 01             	add    $0x1,%edx
     dc3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     dc6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     dca:	0f be 02             	movsbl (%edx),%eax
     dcd:	8d 58 d0             	lea    -0x30(%eax),%ebx
     dd0:	80 fb 09             	cmp    $0x9,%bl
     dd3:	76 eb                	jbe    dc0 <atoi+0x20>
  return n;
}
     dd5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     dd8:	89 c8                	mov    %ecx,%eax
     dda:	c9                   	leave
     ddb:	c3                   	ret
     ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000de0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     de0:	55                   	push   %ebp
     de1:	89 e5                	mov    %esp,%ebp
     de3:	57                   	push   %edi
     de4:	8b 45 10             	mov    0x10(%ebp),%eax
     de7:	8b 55 08             	mov    0x8(%ebp),%edx
     dea:	56                   	push   %esi
     deb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     dee:	85 c0                	test   %eax,%eax
     df0:	7e 13                	jle    e05 <memmove+0x25>
     df2:	01 d0                	add    %edx,%eax
  dst = vdst;
     df4:	89 d7                	mov    %edx,%edi
     df6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     dfd:	00 
     dfe:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
     e00:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     e01:	39 f8                	cmp    %edi,%eax
     e03:	75 fb                	jne    e00 <memmove+0x20>
  return vdst;
}
     e05:	5e                   	pop    %esi
     e06:	89 d0                	mov    %edx,%eax
     e08:	5f                   	pop    %edi
     e09:	5d                   	pop    %ebp
     e0a:	c3                   	ret
     e0b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000e10 <thread_create>:

int
thread_create(void(*start_routine)(void *, void *), void *arg1, void *arg2) 
{
     e10:	55                   	push   %ebp
     e11:	89 e5                	mov    %esp,%ebp
     e13:	53                   	push   %ebx
     e14:	83 ec 10             	sub    $0x10,%esp
  int pid;
  void *raw;
  void *stack;

  raw = malloc(PGSIZE * 2);
     e17:	68 00 20 00 00       	push   $0x2000
     e1c:	e8 5f 04 00 00       	call   1280 <malloc>
  if (raw == 0) {
     e21:	83 c4 10             	add    $0x10,%esp
     e24:	85 c0                	test   %eax,%eax
     e26:	74 37                	je     e5f <thread_create+0x4f>
     e28:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  stack = (void *)(((uint)raw + sizeof(void *) + PGSIZE - 1) & ~(PGSIZE - 1));
     e2a:	8d 80 03 10 00 00    	lea    0x1003(%eax),%eax
     e30:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  ((void **)stack)[-1] = raw;
     e35:	89 58 fc             	mov    %ebx,-0x4(%eax)

  pid = clone(start_routine, arg1, arg2, stack);
     e38:	50                   	push   %eax
     e39:	ff 75 10             	push   0x10(%ebp)
     e3c:	ff 75 0c             	push   0xc(%ebp)
     e3f:	ff 75 08             	push   0x8(%ebp)
     e42:	e8 63 01 00 00       	call   faa <clone>
  if (pid < 0) {
     e47:	83 c4 10             	add    $0x10,%esp
     e4a:	85 c0                	test   %eax,%eax
     e4c:	78 05                	js     e53 <thread_create+0x43>
    free(raw);
    return -1;
  }
  return pid;
}
     e4e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e51:	c9                   	leave
     e52:	c3                   	ret
    free(raw);
     e53:	83 ec 0c             	sub    $0xc,%esp
     e56:	53                   	push   %ebx
     e57:	e8 94 03 00 00       	call   11f0 <free>
    return -1;
     e5c:	83 c4 10             	add    $0x10,%esp
    return -1;
     e5f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     e64:	eb e8                	jmp    e4e <thread_create+0x3e>
     e66:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e6d:	00 
     e6e:	66 90                	xchg   %ax,%ax

00000e70 <thread_join>:

int
thread_join(void) 
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	53                   	push   %ebx
  int pid;
  void *raw;
  void *stack;

  pid = join(&stack);
     e74:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
     e77:	83 ec 20             	sub    $0x20,%esp
  pid = join(&stack);
     e7a:	50                   	push   %eax
     e7b:	e8 32 01 00 00       	call   fb2 <join>
  if (pid < 0) {
     e80:	83 c4 10             	add    $0x10,%esp
     e83:	85 c0                	test   %eax,%eax
     e85:	78 21                	js     ea8 <thread_join+0x38>
     e87:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  raw = ((void **)stack)[-1];
     e89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  free(raw);
     e8c:	83 ec 0c             	sub    $0xc,%esp
     e8f:	ff 70 fc             	push   -0x4(%eax)
     e92:	e8 59 03 00 00       	call   11f0 <free>
  return pid;
     e97:	83 c4 10             	add    $0x10,%esp
}
     e9a:	89 d8                	mov    %ebx,%eax
     e9c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e9f:	c9                   	leave
     ea0:	c3                   	ret
     ea1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     ea8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
     ead:	eb eb                	jmp    e9a <thread_join+0x2a>
     eaf:	90                   	nop

00000eb0 <lock_init>:
  return value;
}

void 
lock_init(lock_t *lock)
{
     eb0:	55                   	push   %ebp
     eb1:	89 e5                	mov    %esp,%ebp
     eb3:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
     eb6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
     ebc:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
     ec3:	5d                   	pop    %ebp
     ec4:	c3                   	ret
     ec5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     ecc:	00 
     ecd:	8d 76 00             	lea    0x0(%esi),%esi

00000ed0 <lock_acquire>:

void
lock_acquire(lock_t *lock)
{
     ed0:	55                   	push   %ebp
  asm volatile (
     ed1:	ba 01 00 00 00       	mov    $0x1,%edx
{
     ed6:	89 e5                	mov    %esp,%ebp
     ed8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  asm volatile (
     edb:	f0 0f c1 11          	lock xadd %edx,(%ecx)
  int myturn = fetch_and_add(&lock->ticket, 1);
  while (myturn != lock->turn);
     edf:	90                   	nop
     ee0:	8b 41 04             	mov    0x4(%ecx),%eax
     ee3:	39 d0                	cmp    %edx,%eax
     ee5:	75 f9                	jne    ee0 <lock_acquire+0x10>
}
     ee7:	5d                   	pop    %ebp
     ee8:	c3                   	ret
     ee9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ef0 <lock_release>:

void 
lock_release(lock_t *lock)
{
     ef0:	55                   	push   %ebp
  asm volatile (
     ef1:	b8 01 00 00 00       	mov    $0x1,%eax
{
     ef6:	89 e5                	mov    %esp,%ebp
     ef8:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile (
     efb:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  fetch_and_add(&lock->turn, 1);
     f00:	5d                   	pop    %ebp
     f01:	c3                   	ret

00000f02 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     f02:	b8 01 00 00 00       	mov    $0x1,%eax
     f07:	cd 40                	int    $0x40
     f09:	c3                   	ret

00000f0a <exit>:
SYSCALL(exit)
     f0a:	b8 02 00 00 00       	mov    $0x2,%eax
     f0f:	cd 40                	int    $0x40
     f11:	c3                   	ret

00000f12 <wait>:
SYSCALL(wait)
     f12:	b8 03 00 00 00       	mov    $0x3,%eax
     f17:	cd 40                	int    $0x40
     f19:	c3                   	ret

00000f1a <pipe>:
SYSCALL(pipe)
     f1a:	b8 04 00 00 00       	mov    $0x4,%eax
     f1f:	cd 40                	int    $0x40
     f21:	c3                   	ret

00000f22 <read>:
SYSCALL(read)
     f22:	b8 05 00 00 00       	mov    $0x5,%eax
     f27:	cd 40                	int    $0x40
     f29:	c3                   	ret

00000f2a <write>:
SYSCALL(write)
     f2a:	b8 10 00 00 00       	mov    $0x10,%eax
     f2f:	cd 40                	int    $0x40
     f31:	c3                   	ret

00000f32 <close>:
SYSCALL(close)
     f32:	b8 15 00 00 00       	mov    $0x15,%eax
     f37:	cd 40                	int    $0x40
     f39:	c3                   	ret

00000f3a <kill>:
SYSCALL(kill)
     f3a:	b8 06 00 00 00       	mov    $0x6,%eax
     f3f:	cd 40                	int    $0x40
     f41:	c3                   	ret

00000f42 <exec>:
SYSCALL(exec)
     f42:	b8 07 00 00 00       	mov    $0x7,%eax
     f47:	cd 40                	int    $0x40
     f49:	c3                   	ret

00000f4a <open>:
SYSCALL(open)
     f4a:	b8 0f 00 00 00       	mov    $0xf,%eax
     f4f:	cd 40                	int    $0x40
     f51:	c3                   	ret

00000f52 <mknod>:
SYSCALL(mknod)
     f52:	b8 11 00 00 00       	mov    $0x11,%eax
     f57:	cd 40                	int    $0x40
     f59:	c3                   	ret

00000f5a <unlink>:
SYSCALL(unlink)
     f5a:	b8 12 00 00 00       	mov    $0x12,%eax
     f5f:	cd 40                	int    $0x40
     f61:	c3                   	ret

00000f62 <fstat>:
SYSCALL(fstat)
     f62:	b8 08 00 00 00       	mov    $0x8,%eax
     f67:	cd 40                	int    $0x40
     f69:	c3                   	ret

00000f6a <link>:
SYSCALL(link)
     f6a:	b8 13 00 00 00       	mov    $0x13,%eax
     f6f:	cd 40                	int    $0x40
     f71:	c3                   	ret

00000f72 <mkdir>:
SYSCALL(mkdir)
     f72:	b8 14 00 00 00       	mov    $0x14,%eax
     f77:	cd 40                	int    $0x40
     f79:	c3                   	ret

00000f7a <chdir>:
SYSCALL(chdir)
     f7a:	b8 09 00 00 00       	mov    $0x9,%eax
     f7f:	cd 40                	int    $0x40
     f81:	c3                   	ret

00000f82 <dup>:
SYSCALL(dup)
     f82:	b8 0a 00 00 00       	mov    $0xa,%eax
     f87:	cd 40                	int    $0x40
     f89:	c3                   	ret

00000f8a <getpid>:
SYSCALL(getpid)
     f8a:	b8 0b 00 00 00       	mov    $0xb,%eax
     f8f:	cd 40                	int    $0x40
     f91:	c3                   	ret

00000f92 <sbrk>:
SYSCALL(sbrk)
     f92:	b8 0c 00 00 00       	mov    $0xc,%eax
     f97:	cd 40                	int    $0x40
     f99:	c3                   	ret

00000f9a <sleep>:
SYSCALL(sleep)
     f9a:	b8 0d 00 00 00       	mov    $0xd,%eax
     f9f:	cd 40                	int    $0x40
     fa1:	c3                   	ret

00000fa2 <uptime>:
SYSCALL(uptime)
     fa2:	b8 0e 00 00 00       	mov    $0xe,%eax
     fa7:	cd 40                	int    $0x40
     fa9:	c3                   	ret

00000faa <clone>:
SYSCALL(clone)
     faa:	b8 16 00 00 00       	mov    $0x16,%eax
     faf:	cd 40                	int    $0x40
     fb1:	c3                   	ret

00000fb2 <join>:
SYSCALL(join)
     fb2:	b8 17 00 00 00       	mov    $0x17,%eax
     fb7:	cd 40                	int    $0x40
     fb9:	c3                   	ret
     fba:	66 90                	xchg   %ax,%ax
     fbc:	66 90                	xchg   %ax,%ax
     fbe:	66 90                	xchg   %ax,%ax

00000fc0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     fc0:	55                   	push   %ebp
     fc1:	89 e5                	mov    %esp,%ebp
     fc3:	57                   	push   %edi
     fc4:	56                   	push   %esi
     fc5:	53                   	push   %ebx
     fc6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     fc8:	89 d1                	mov    %edx,%ecx
{
     fca:	83 ec 3c             	sub    $0x3c,%esp
     fcd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
     fd0:	85 d2                	test   %edx,%edx
     fd2:	0f 89 80 00 00 00    	jns    1058 <printint+0x98>
     fd8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     fdc:	74 7a                	je     1058 <printint+0x98>
    x = -xx;
     fde:	f7 d9                	neg    %ecx
    neg = 1;
     fe0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
     fe5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     fe8:	31 f6                	xor    %esi,%esi
     fea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     ff0:	89 c8                	mov    %ecx,%eax
     ff2:	31 d2                	xor    %edx,%edx
     ff4:	89 f7                	mov    %esi,%edi
     ff6:	f7 f3                	div    %ebx
     ff8:	8d 76 01             	lea    0x1(%esi),%esi
     ffb:	0f b6 92 b0 14 00 00 	movzbl 0x14b0(%edx),%edx
    1002:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
    1006:	89 ca                	mov    %ecx,%edx
    1008:	89 c1                	mov    %eax,%ecx
    100a:	39 da                	cmp    %ebx,%edx
    100c:	73 e2                	jae    ff0 <printint+0x30>
  if(neg)
    100e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1011:	85 c0                	test   %eax,%eax
    1013:	74 07                	je     101c <printint+0x5c>
    buf[i++] = '-';
    1015:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
    101a:	89 f7                	mov    %esi,%edi
    101c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    101f:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1022:	01 df                	add    %ebx,%edi
    1024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
    1028:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
    102b:	83 ec 04             	sub    $0x4,%esp
    102e:	88 45 d7             	mov    %al,-0x29(%ebp)
    1031:	8d 45 d7             	lea    -0x29(%ebp),%eax
    1034:	6a 01                	push   $0x1
    1036:	50                   	push   %eax
    1037:	56                   	push   %esi
    1038:	e8 ed fe ff ff       	call   f2a <write>
  while(--i >= 0)
    103d:	89 f8                	mov    %edi,%eax
    103f:	83 c4 10             	add    $0x10,%esp
    1042:	83 ef 01             	sub    $0x1,%edi
    1045:	39 c3                	cmp    %eax,%ebx
    1047:	75 df                	jne    1028 <printint+0x68>
}
    1049:	8d 65 f4             	lea    -0xc(%ebp),%esp
    104c:	5b                   	pop    %ebx
    104d:	5e                   	pop    %esi
    104e:	5f                   	pop    %edi
    104f:	5d                   	pop    %ebp
    1050:	c3                   	ret
    1051:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1058:	31 c0                	xor    %eax,%eax
    105a:	eb 89                	jmp    fe5 <printint+0x25>
    105c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001060 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	57                   	push   %edi
    1064:	56                   	push   %esi
    1065:	53                   	push   %ebx
    1066:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1069:	8b 75 0c             	mov    0xc(%ebp),%esi
{
    106c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
    106f:	0f b6 1e             	movzbl (%esi),%ebx
    1072:	83 c6 01             	add    $0x1,%esi
    1075:	84 db                	test   %bl,%bl
    1077:	74 67                	je     10e0 <printf+0x80>
    1079:	8d 4d 10             	lea    0x10(%ebp),%ecx
    107c:	31 d2                	xor    %edx,%edx
    107e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    1081:	eb 34                	jmp    10b7 <printf+0x57>
    1083:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    1088:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    108b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1090:	83 f8 25             	cmp    $0x25,%eax
    1093:	74 18                	je     10ad <printf+0x4d>
  write(fd, &c, 1);
    1095:	83 ec 04             	sub    $0x4,%esp
    1098:	8d 45 e7             	lea    -0x19(%ebp),%eax
    109b:	88 5d e7             	mov    %bl,-0x19(%ebp)
    109e:	6a 01                	push   $0x1
    10a0:	50                   	push   %eax
    10a1:	57                   	push   %edi
    10a2:	e8 83 fe ff ff       	call   f2a <write>
    10a7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    10aa:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    10ad:	0f b6 1e             	movzbl (%esi),%ebx
    10b0:	83 c6 01             	add    $0x1,%esi
    10b3:	84 db                	test   %bl,%bl
    10b5:	74 29                	je     10e0 <printf+0x80>
    c = fmt[i] & 0xff;
    10b7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    10ba:	85 d2                	test   %edx,%edx
    10bc:	74 ca                	je     1088 <printf+0x28>
      }
    } else if(state == '%'){
    10be:	83 fa 25             	cmp    $0x25,%edx
    10c1:	75 ea                	jne    10ad <printf+0x4d>
      if(c == 'd'){
    10c3:	83 f8 25             	cmp    $0x25,%eax
    10c6:	0f 84 04 01 00 00    	je     11d0 <printf+0x170>
    10cc:	83 e8 63             	sub    $0x63,%eax
    10cf:	83 f8 15             	cmp    $0x15,%eax
    10d2:	77 1c                	ja     10f0 <printf+0x90>
    10d4:	ff 24 85 58 14 00 00 	jmp    *0x1458(,%eax,4)
    10db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    10e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10e3:	5b                   	pop    %ebx
    10e4:	5e                   	pop    %esi
    10e5:	5f                   	pop    %edi
    10e6:	5d                   	pop    %ebp
    10e7:	c3                   	ret
    10e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    10ef:	00 
  write(fd, &c, 1);
    10f0:	83 ec 04             	sub    $0x4,%esp
    10f3:	8d 55 e7             	lea    -0x19(%ebp),%edx
    10f6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    10fa:	6a 01                	push   $0x1
    10fc:	52                   	push   %edx
    10fd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    1100:	57                   	push   %edi
    1101:	e8 24 fe ff ff       	call   f2a <write>
    1106:	83 c4 0c             	add    $0xc,%esp
    1109:	88 5d e7             	mov    %bl,-0x19(%ebp)
    110c:	6a 01                	push   $0x1
    110e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1111:	52                   	push   %edx
    1112:	57                   	push   %edi
    1113:	e8 12 fe ff ff       	call   f2a <write>
        putc(fd, c);
    1118:	83 c4 10             	add    $0x10,%esp
      state = 0;
    111b:	31 d2                	xor    %edx,%edx
    111d:	eb 8e                	jmp    10ad <printf+0x4d>
    111f:	90                   	nop
        printint(fd, *ap, 16, 0);
    1120:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1123:	83 ec 0c             	sub    $0xc,%esp
    1126:	b9 10 00 00 00       	mov    $0x10,%ecx
    112b:	8b 13                	mov    (%ebx),%edx
    112d:	6a 00                	push   $0x0
    112f:	89 f8                	mov    %edi,%eax
        ap++;
    1131:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
    1134:	e8 87 fe ff ff       	call   fc0 <printint>
        ap++;
    1139:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    113c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    113f:	31 d2                	xor    %edx,%edx
    1141:	e9 67 ff ff ff       	jmp    10ad <printf+0x4d>
        s = (char*)*ap;
    1146:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1149:	8b 18                	mov    (%eax),%ebx
        ap++;
    114b:	83 c0 04             	add    $0x4,%eax
    114e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1151:	85 db                	test   %ebx,%ebx
    1153:	0f 84 87 00 00 00    	je     11e0 <printf+0x180>
        while(*s != 0){
    1159:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    115c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    115e:	84 c0                	test   %al,%al
    1160:	0f 84 47 ff ff ff    	je     10ad <printf+0x4d>
    1166:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1169:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    116c:	89 de                	mov    %ebx,%esi
    116e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
    1170:	83 ec 04             	sub    $0x4,%esp
    1173:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    1176:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1179:	6a 01                	push   $0x1
    117b:	53                   	push   %ebx
    117c:	57                   	push   %edi
    117d:	e8 a8 fd ff ff       	call   f2a <write>
        while(*s != 0){
    1182:	0f b6 06             	movzbl (%esi),%eax
    1185:	83 c4 10             	add    $0x10,%esp
    1188:	84 c0                	test   %al,%al
    118a:	75 e4                	jne    1170 <printf+0x110>
      state = 0;
    118c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    118f:	31 d2                	xor    %edx,%edx
    1191:	e9 17 ff ff ff       	jmp    10ad <printf+0x4d>
        printint(fd, *ap, 10, 1);
    1196:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1199:	83 ec 0c             	sub    $0xc,%esp
    119c:	b9 0a 00 00 00       	mov    $0xa,%ecx
    11a1:	8b 13                	mov    (%ebx),%edx
    11a3:	6a 01                	push   $0x1
    11a5:	eb 88                	jmp    112f <printf+0xcf>
        putc(fd, *ap);
    11a7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    11aa:	83 ec 04             	sub    $0x4,%esp
    11ad:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    11b0:	8b 03                	mov    (%ebx),%eax
        ap++;
    11b2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    11b5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    11b8:	6a 01                	push   $0x1
    11ba:	52                   	push   %edx
    11bb:	57                   	push   %edi
    11bc:	e8 69 fd ff ff       	call   f2a <write>
        ap++;
    11c1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    11c4:	83 c4 10             	add    $0x10,%esp
      state = 0;
    11c7:	31 d2                	xor    %edx,%edx
    11c9:	e9 df fe ff ff       	jmp    10ad <printf+0x4d>
    11ce:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
    11d0:	83 ec 04             	sub    $0x4,%esp
    11d3:	88 5d e7             	mov    %bl,-0x19(%ebp)
    11d6:	8d 55 e7             	lea    -0x19(%ebp),%edx
    11d9:	6a 01                	push   $0x1
    11db:	e9 31 ff ff ff       	jmp    1111 <printf+0xb1>
    11e0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    11e5:	bb 1f 14 00 00       	mov    $0x141f,%ebx
    11ea:	e9 77 ff ff ff       	jmp    1166 <printf+0x106>
    11ef:	90                   	nop

000011f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    11f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11f1:	a1 a4 1b 00 00       	mov    0x1ba4,%eax
{
    11f6:	89 e5                	mov    %esp,%ebp
    11f8:	57                   	push   %edi
    11f9:	56                   	push   %esi
    11fa:	53                   	push   %ebx
    11fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    11fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1208:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    120a:	39 c8                	cmp    %ecx,%eax
    120c:	73 32                	jae    1240 <free+0x50>
    120e:	39 d1                	cmp    %edx,%ecx
    1210:	72 04                	jb     1216 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1212:	39 d0                	cmp    %edx,%eax
    1214:	72 32                	jb     1248 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1216:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1219:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    121c:	39 fa                	cmp    %edi,%edx
    121e:	74 30                	je     1250 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1220:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1223:	8b 50 04             	mov    0x4(%eax),%edx
    1226:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1229:	39 f1                	cmp    %esi,%ecx
    122b:	74 3a                	je     1267 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    122d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    122f:	5b                   	pop    %ebx
  freep = p;
    1230:	a3 a4 1b 00 00       	mov    %eax,0x1ba4
}
    1235:	5e                   	pop    %esi
    1236:	5f                   	pop    %edi
    1237:	5d                   	pop    %ebp
    1238:	c3                   	ret
    1239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1240:	39 d0                	cmp    %edx,%eax
    1242:	72 04                	jb     1248 <free+0x58>
    1244:	39 d1                	cmp    %edx,%ecx
    1246:	72 ce                	jb     1216 <free+0x26>
{
    1248:	89 d0                	mov    %edx,%eax
    124a:	eb bc                	jmp    1208 <free+0x18>
    124c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1250:	03 72 04             	add    0x4(%edx),%esi
    1253:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1256:	8b 10                	mov    (%eax),%edx
    1258:	8b 12                	mov    (%edx),%edx
    125a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    125d:	8b 50 04             	mov    0x4(%eax),%edx
    1260:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1263:	39 f1                	cmp    %esi,%ecx
    1265:	75 c6                	jne    122d <free+0x3d>
    p->s.size += bp->s.size;
    1267:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    126a:	a3 a4 1b 00 00       	mov    %eax,0x1ba4
    p->s.size += bp->s.size;
    126f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1272:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1275:	89 08                	mov    %ecx,(%eax)
}
    1277:	5b                   	pop    %ebx
    1278:	5e                   	pop    %esi
    1279:	5f                   	pop    %edi
    127a:	5d                   	pop    %ebp
    127b:	c3                   	ret
    127c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001280 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	57                   	push   %edi
    1284:	56                   	push   %esi
    1285:	53                   	push   %ebx
    1286:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1289:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    128c:	8b 15 a4 1b 00 00    	mov    0x1ba4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1292:	8d 78 07             	lea    0x7(%eax),%edi
    1295:	c1 ef 03             	shr    $0x3,%edi
    1298:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    129b:	85 d2                	test   %edx,%edx
    129d:	0f 84 8d 00 00 00    	je     1330 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12a3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    12a5:	8b 48 04             	mov    0x4(%eax),%ecx
    12a8:	39 f9                	cmp    %edi,%ecx
    12aa:	73 64                	jae    1310 <malloc+0x90>
  if(nu < 4096)
    12ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
    12b1:	39 df                	cmp    %ebx,%edi
    12b3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    12b6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    12bd:	eb 0a                	jmp    12c9 <malloc+0x49>
    12bf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    12c2:	8b 48 04             	mov    0x4(%eax),%ecx
    12c5:	39 f9                	cmp    %edi,%ecx
    12c7:	73 47                	jae    1310 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    12c9:	89 c2                	mov    %eax,%edx
    12cb:	3b 05 a4 1b 00 00    	cmp    0x1ba4,%eax
    12d1:	75 ed                	jne    12c0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    12d3:	83 ec 0c             	sub    $0xc,%esp
    12d6:	56                   	push   %esi
    12d7:	e8 b6 fc ff ff       	call   f92 <sbrk>
  if(p == (char*)-1)
    12dc:	83 c4 10             	add    $0x10,%esp
    12df:	83 f8 ff             	cmp    $0xffffffff,%eax
    12e2:	74 1c                	je     1300 <malloc+0x80>
  hp->s.size = nu;
    12e4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    12e7:	83 ec 0c             	sub    $0xc,%esp
    12ea:	83 c0 08             	add    $0x8,%eax
    12ed:	50                   	push   %eax
    12ee:	e8 fd fe ff ff       	call   11f0 <free>
  return freep;
    12f3:	8b 15 a4 1b 00 00    	mov    0x1ba4,%edx
      if((p = morecore(nunits)) == 0)
    12f9:	83 c4 10             	add    $0x10,%esp
    12fc:	85 d2                	test   %edx,%edx
    12fe:	75 c0                	jne    12c0 <malloc+0x40>
        return 0;
  }
}
    1300:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1303:	31 c0                	xor    %eax,%eax
}
    1305:	5b                   	pop    %ebx
    1306:	5e                   	pop    %esi
    1307:	5f                   	pop    %edi
    1308:	5d                   	pop    %ebp
    1309:	c3                   	ret
    130a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1310:	39 cf                	cmp    %ecx,%edi
    1312:	74 4c                	je     1360 <malloc+0xe0>
        p->s.size -= nunits;
    1314:	29 f9                	sub    %edi,%ecx
    1316:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1319:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    131c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    131f:	89 15 a4 1b 00 00    	mov    %edx,0x1ba4
}
    1325:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1328:	83 c0 08             	add    $0x8,%eax
}
    132b:	5b                   	pop    %ebx
    132c:	5e                   	pop    %esi
    132d:	5f                   	pop    %edi
    132e:	5d                   	pop    %ebp
    132f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    1330:	c7 05 a4 1b 00 00 a8 	movl   $0x1ba8,0x1ba4
    1337:	1b 00 00 
    base.s.size = 0;
    133a:	b8 a8 1b 00 00       	mov    $0x1ba8,%eax
    base.s.ptr = freep = prevp = &base;
    133f:	c7 05 a8 1b 00 00 a8 	movl   $0x1ba8,0x1ba8
    1346:	1b 00 00 
    base.s.size = 0;
    1349:	c7 05 ac 1b 00 00 00 	movl   $0x0,0x1bac
    1350:	00 00 00 
    if(p->s.size >= nunits){
    1353:	e9 54 ff ff ff       	jmp    12ac <malloc+0x2c>
    1358:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    135f:	00 
        prevp->s.ptr = p->s.ptr;
    1360:	8b 08                	mov    (%eax),%ecx
    1362:	89 0a                	mov    %ecx,(%edx)
    1364:	eb b9                	jmp    131f <malloc+0x9f>
