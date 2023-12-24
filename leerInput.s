	.file	"leerInput.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "-h\0"
.LC1:
	.ascii "-s\0"
	.align 8
.LC2:
	.ascii "La base origen ingresada no pertenece al rango [2,16].\0"
	.align 8
.LC3:
	.ascii "El formato ingresado no es valido.\0"
.LC4:
	.ascii "-d\0"
	.align 8
.LC5:
	.ascii "La base destino ingresada no pertenece al rango [2,16].\0"
.LC6:
	.ascii "-v\0"
.LC7:
	.ascii "-n\0"
	.align 8
.LC8:
	.ascii "El numero ingresado excede el limite de 10 digitos enteros.\0"
	.align 8
.LC9:
	.ascii "El numero ingresado excede el limite de 5 digitos fraccionarios.\0"
	.align 8
.LC10:
	.ascii "La parte entera del numero ingresado no respeta la base origen ingresada.\0"
	.align 8
.LC11:
	.ascii "La parte fracionaria del numero ingresado no respeta la base origen ingresada.\0"
	.align 8
.LC12:
	.ascii "La cantidad de parametros ingresada no es correcta.\0"
	.text
	.globl	inputValido
	.def	inputValido;	.scl	2;	.type	32;	.endef
	.seh_proc	inputValido
inputValido:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -16(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
	movq	24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jle	.L2
	movq	24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$9, %eax
	jg	.L2
	movq	-8(%rbp), %rax
	movl	$1, (%rax)
	jmp	.L3
.L5:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L4
	call	mostrarAyuda
	movl	$0, %ecx
	call	exit
.L4:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
.L3:
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jl	.L5
	movq	-8(%rbp), %rax
	movl	$1, (%rax)
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -32(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L6
.L23:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L7
	movq	48(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L8
	movq	-32(%rbp), %rax
	movl	$10, (%rax)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jge	.L9
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	esNumeroValido
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L9
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	atoi
	movl	%eax, %edx
	movq	48(%rbp), %rax
	movl	%edx, (%rax)
	movq	48(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jle	.L10
	movq	48(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$16, %eax
	jle	.L11
.L10:
	leaq	.LC2(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L11:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L12
.L9:
	leaq	.LC3(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L8:
	leaq	.LC3(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L7:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L13
	movq	56(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L14
	movq	-32(%rbp), %rax
	movl	$10, (%rax)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jge	.L15
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	esNumeroValido
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L15
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	atoi
	movl	%eax, %edx
	movq	56(%rbp), %rax
	movl	%edx, (%rax)
	movq	56(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jle	.L16
	movq	56(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$16, %eax
	jle	.L17
.L16:
	leaq	.LC5(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L17:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L12
.L15:
	leaq	.LC3(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L14:
	leaq	.LC3(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L13:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L18
	movq	64(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L19
	movq	64(%rbp), %rax
	movl	$1, (%rax)
	jmp	.L12
.L19:
	leaq	.LC3(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L18:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L20
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L21
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jge	.L22
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L12
.L22:
	leaq	.LC3(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L21:
	leaq	.LC3(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L20:
	leaq	.LC3(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L12:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
.L6:
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jl	.L23
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	movq	48(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L24
	movq	48(%rbp), %rax
	movl	$10, (%rax)
.L24:
	movq	56(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L26
	movq	56(%rbp), %rax
	movl	$10, (%rax)
	jmp	.L26
.L28:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
.L26:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$46, %al
	je	.L27
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L28
.L27:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$46, %al
	je	.L29
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L30
.L29:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$10, %eax
	jle	.L30
	leaq	.LC8(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L30:
	movl	$4, %ecx
	call	malloc
	movq	%rax, -48(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-48(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L31
.L32:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
.L31:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L32
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L33
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cmpl	$5, %eax
	jle	.L33
	leaq	.LC9(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L33:
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L34
.L35:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	%rdx, %rax
	movq	-16(%rbp), %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rdx
	movq	32(%rbp), %rcx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
.L34:
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jl	.L35
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	32(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	48(%rbp), %rdx
	movq	32(%rbp), %rax
	movq	%rax, %rcx
	call	esNumeroValido
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L36
	leaq	.LC10(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L36:
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L37
.L38:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movl	(%rax), %ecx
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	addl	%ecx, %eax
	cltq
	addq	$1, %rax
	addq	%rdx, %rax
	movq	-16(%rbp), %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rdx
	movq	40(%rbp), %rcx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
.L37:
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %ecx
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	%eax, %edx
	jl	.L38
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	40(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	48(%rbp), %rdx
	movq	40(%rbp), %rax
	movq	%rax, %rcx
	call	esNumeroValido
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L39
	leaq	.LC11(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L39:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-24(%rbp), %rax
	jmp	.L41
.L2:
	leaq	.LC12(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L41:
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	mapearDigitos
	.def	mapearDigitos;	.scl	2;	.type	32;	.endef
	.seh_proc	mapearDigitos
mapearDigitos:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L43
.L62:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$15, %eax
	ja	.L44
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L46(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L46(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L46:
	.long	.L61-.L46
	.long	.L60-.L46
	.long	.L59-.L46
	.long	.L58-.L46
	.long	.L57-.L46
	.long	.L56-.L46
	.long	.L55-.L46
	.long	.L54-.L46
	.long	.L53-.L46
	.long	.L52-.L46
	.long	.L51-.L46
	.long	.L50-.L46
	.long	.L49-.L46
	.long	.L48-.L46
	.long	.L47-.L46
	.long	.L45-.L46
	.text
.L61:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$48, (%rax)
	jmp	.L44
.L60:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$49, (%rax)
	jmp	.L44
.L59:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$50, (%rax)
	jmp	.L44
.L58:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$51, (%rax)
	jmp	.L44
.L57:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$52, (%rax)
	jmp	.L44
.L56:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$53, (%rax)
	jmp	.L44
.L55:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$54, (%rax)
	jmp	.L44
.L54:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$55, (%rax)
	jmp	.L44
.L53:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$56, (%rax)
	jmp	.L44
.L52:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$57, (%rax)
	jmp	.L44
.L51:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$65, (%rax)
	jmp	.L44
.L50:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$66, (%rax)
	jmp	.L44
.L49:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$67, (%rax)
	jmp	.L44
.L48:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$68, (%rax)
	jmp	.L44
.L47:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$69, (%rax)
	jmp	.L44
.L45:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$70, (%rax)
	nop
.L44:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
.L43:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	jne	.L62
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	free
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	mapearLetras
	.def	mapearLetras;	.scl	2;	.type	32;	.endef
	.seh_proc	mapearLetras
mapearLetras:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L64
.L83:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cmpl	$54, %eax
	ja	.L65
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L67(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L67(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L67:
	.long	.L82-.L67
	.long	.L81-.L67
	.long	.L80-.L67
	.long	.L79-.L67
	.long	.L78-.L67
	.long	.L77-.L67
	.long	.L76-.L67
	.long	.L75-.L67
	.long	.L74-.L67
	.long	.L73-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L72-.L67
	.long	.L71-.L67
	.long	.L70-.L67
	.long	.L69-.L67
	.long	.L68-.L67
	.long	.L66-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L72-.L67
	.long	.L71-.L67
	.long	.L70-.L67
	.long	.L69-.L67
	.long	.L68-.L67
	.long	.L66-.L67
	.text
.L82:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
	jmp	.L65
.L81:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$1, (%rax)
	jmp	.L65
.L80:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$2, (%rax)
	jmp	.L65
.L79:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$3, (%rax)
	jmp	.L65
.L78:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$4, (%rax)
	jmp	.L65
.L77:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$5, (%rax)
	jmp	.L65
.L76:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$6, (%rax)
	jmp	.L65
.L75:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$7, (%rax)
	jmp	.L65
.L74:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$8, (%rax)
	jmp	.L65
.L73:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$9, (%rax)
	jmp	.L65
.L72:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$10, (%rax)
	jmp	.L65
.L71:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$11, (%rax)
	jmp	.L65
.L70:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$12, (%rax)
	jmp	.L65
.L69:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$13, (%rax)
	jmp	.L65
.L68:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$14, (%rax)
	jmp	.L65
.L66:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$15, (%rax)
	nop
.L65:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
.L64:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L83
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	$-1, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	free
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC13:
	.ascii "\12Parametros de invocacion:\0"
	.align 8
.LC14:
	.ascii "-n <numero>: admite solo positivos, con la parte entera hasta 10 digitos y la fraccionaria hasta 5 digitos, separados por un punto.\0"
	.align 8
.LC15:
	.ascii "-s <base origen> : admite 2 a 16\0"
	.align 8
.LC16:
	.ascii "-d <base destino> : admite 2 a 16\0"
	.align 8
.LC17:
	.ascii "-v : muestra computos intermedios\0"
.LC18:
	.ascii "-h : muestra este mensaje\0"
	.align 8
.LC19:
	.ascii "EJ: convert -n 1234.5 -s 8 -d 16 -v\0"
	.text
	.globl	mostrarAyuda
	.def	mostrarAyuda;	.scl	2;	.type	32;	.endef
	.seh_proc	mostrarAyuda
mostrarAyuda:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	.LC13(%rip), %rcx
	call	puts
	leaq	.LC14(%rip), %rcx
	call	puts
	leaq	.LC15(%rip), %rcx
	call	puts
	leaq	.LC16(%rip), %rcx
	call	puts
	leaq	.LC17(%rip), %rcx
	call	puts
	leaq	.LC18(%rip), %rcx
	call	puts
	leaq	.LC19(%rip), %rcx
	call	puts
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	esNumeroValido
	.def	esNumeroValido;	.scl	2;	.type	32;	.endef
	.seh_proc	esNumeroValido
esNumeroValido:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -16(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	movl	$1, (%rax)
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
	movq	24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$16, %eax
	ja	.L86
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L88(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L88(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L88:
	.long	.L86-.L88
	.long	.L86-.L88
	.long	.L103-.L88
	.long	.L107-.L88
	.long	.L111-.L88
	.long	.L115-.L88
	.long	.L119-.L88
	.long	.L123-.L88
	.long	.L127-.L88
	.long	.L131-.L88
	.long	.L135-.L88
	.long	.L139-.L88
	.long	.L145-.L88
	.long	.L152-.L88
	.long	.L159-.L88
	.long	.L166-.L88
	.long	.L173-.L88
	.text
.L106:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L104
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jg	.L104
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L103
.L104:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L103:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L181
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L106
	jmp	.L181
.L110:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L108
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$50, %al
	jg	.L108
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L107
.L108:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L107:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L182
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L110
	jmp	.L182
.L114:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L112
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$51, %al
	jg	.L112
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L111
.L112:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L111:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L183
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L114
	jmp	.L183
.L118:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L116
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$52, %al
	jg	.L116
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L115
.L116:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L115:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L184
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L118
	jmp	.L184
.L122:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L120
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$53, %al
	jg	.L120
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L119
.L120:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L119:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L185
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L122
	jmp	.L185
.L126:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L124
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$54, %al
	jg	.L124
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L123
.L124:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L123:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L186
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L126
	jmp	.L186
.L130:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L128
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$55, %al
	jg	.L128
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L127
.L128:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L127:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L187
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L130
	jmp	.L187
.L134:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L132
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$56, %al
	jg	.L132
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L131
.L132:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L131:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L188
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L134
	jmp	.L188
.L138:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L136
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jg	.L136
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L135
.L136:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L135:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L189
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L138
	jmp	.L189
.L144:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L140
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jle	.L141
.L140:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$65, %al
	je	.L141
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$97, %al
	jne	.L142
.L141:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L139
.L142:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L139:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L190
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L144
	jmp	.L190
.L151:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L146
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jle	.L147
.L146:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L148
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$66, %al
	jle	.L147
.L148:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L149
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$98, %al
	jg	.L149
.L147:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L145
.L149:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L145:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L191
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L151
	jmp	.L191
.L158:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L153
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jle	.L154
.L153:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L155
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$67, %al
	jle	.L154
.L155:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L156
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$99, %al
	jg	.L156
.L154:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L152
.L156:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L152:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L192
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L158
	jmp	.L192
.L165:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L160
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jle	.L161
.L160:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L162
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$68, %al
	jle	.L161
.L162:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L163
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$100, %al
	jg	.L163
.L161:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L159
.L163:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L159:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L193
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L165
	jmp	.L193
.L172:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L167
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jle	.L168
.L167:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L169
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$69, %al
	jle	.L168
.L169:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L170
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$101, %al
	jg	.L170
.L168:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L166
.L170:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L166:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L194
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L172
	jmp	.L194
.L179:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L174
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jle	.L175
.L174:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L176
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$70, %al
	jle	.L175
.L176:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L177
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$102, %al
	jg	.L177
.L175:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L173
.L177:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
.L173:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L195
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L179
	jmp	.L195
.L181:
	nop
	jmp	.L86
.L182:
	nop
	jmp	.L86
.L183:
	nop
	jmp	.L86
.L184:
	nop
	jmp	.L86
.L185:
	nop
	jmp	.L86
.L186:
	nop
	jmp	.L86
.L187:
	nop
	jmp	.L86
.L188:
	nop
	jmp	.L86
.L189:
	nop
	jmp	.L86
.L190:
	nop
	jmp	.L86
.L191:
	nop
	jmp	.L86
.L192:
	nop
	jmp	.L86
.L193:
	nop
	jmp	.L86
.L194:
	nop
	jmp	.L86
.L195:
	nop
.L86:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
