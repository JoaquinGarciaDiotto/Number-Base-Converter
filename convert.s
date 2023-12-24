	.file	"convert.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "\12Conversion de Base %i a Base %i\12\12\0"
	.align 8
.LC1:
	.ascii "\12No hace falta hacer ningun paso intermedio.\12\0"
.LC2:
	.ascii "\12El resultado es: 0.0\0"
.LC3:
	.ascii "\12El resultado es: %s.0\12\0"
.LC4:
	.ascii "\12El resultado es: 0.%s\12\0"
.LC5:
	.ascii "\12El resultado es: %s.%s\12\0"
	.align 8
.LC6:
	.ascii "\12Conversion de Base 10 a Base %i\12\12\0"
	.align 8
.LC7:
	.ascii "\12Conversion de Base %i a Base 10\12\0"
	.align 8
.LC8:
	.ascii "\12Conversion de Base %i a Base %i con Base 10 como intermediario.\12\12\0"
	.align 8
.LC9:
	.ascii "El formato ingresado no es valido.\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$160, %rsp
	.seh_stackalloc	160
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	call	__main
	movl	$4, %ecx
	call	malloc
	movq	%rax, -40(%rbp)
	movl	$11, %ecx
	call	malloc
	movq	%rax, -24(%rbp)
	movl	$6, %ecx
	call	malloc
	movq	%rax, -32(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -48(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -56(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -64(%rbp)
	movq	-40(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, (%rax)
	movq	-48(%rbp), %rax
	movl	$0, (%rax)
	movq	-56(%rbp), %rax
	movl	$0, (%rax)
	movq	-64(%rbp), %rax
	movl	$0, (%rax)
	movq	-32(%rbp), %r9
	movq	-24(%rbp), %r8
	movq	-40(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	-64(%rbp), %rcx
	movq	%rcx, 48(%rsp)
	movq	-56(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movq	-48(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	inputValido
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L2
	movq	-56(%rbp), %rax
	movl	(%rax), %edx
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L3
	movq	-56(%rbp), %rax
	movl	(%rax), %edx
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L4
	leaq	.LC1(%rip), %rcx
	call	puts
.L4:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L5
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L5
	leaq	.LC2(%rip), %rcx
	call	puts
	jmp	.L13
.L5:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L7
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L7
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	jmp	.L13
.L7:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L8
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L8
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rcx
	call	printf
	jmp	.L13
.L8:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rcx
	call	printf
	jmp	.L13
.L3:
	movl	$44, %ecx
	call	malloc
	movq	%rax, -80(%rbp)
	movl	$24, %ecx
	call	malloc
	movq	%rax, -88(%rbp)
	movq	-80(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	mapearLetras
	movq	-88(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	mapearLetras
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movl	$41, %ecx
	call	malloc
	movq	%rax, -24(%rbp)
	movl	$6, %ecx
	call	malloc
	movq	%rax, -32(%rbp)
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$10, %eax
	jne	.L10
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	leaq	.LC6(%rip), %rcx
	call	printf
	movq	-64(%rbp), %rcx
	movq	-80(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	entero10aX
	movq	%rax, -8(%rbp)
	movq	-64(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	fraccion10aX
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	mapearDigitos
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	mapearDigitos
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rcx
	call	printf
	jmp	.L11
.L10:
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$10, %eax
	jne	.L12
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	leaq	.LC7(%rip), %rcx
	call	printf
	movq	-64(%rbp), %rcx
	movq	-80(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	enteroXa10
	movq	%rax, -8(%rbp)
	movq	-64(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	fraccionXa10
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	mapearDigitos
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	mapearDigitos
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rcx
	call	printf
	jmp	.L11
.L12:
	movq	-56(%rbp), %rax
	movl	(%rax), %edx
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC8(%rip), %rcx
	call	printf
	movq	-64(%rbp), %r8
	movq	-80(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	enteroXaY
	movq	%rax, -8(%rbp)
	movq	-64(%rbp), %r8
	movq	-88(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	fraccionXaY
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	mapearDigitos
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	mapearDigitos
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rcx
	call	printf
.L11:
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	free
	jmp	.L13
.L2:
	leaq	.LC9(%rip), %rcx
	call	puts
	movl	$1, %ecx
	call	exit
.L13:
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movl	$0, %ecx
	call	exit
	nop
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	inputValido;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	mapearLetras;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	entero10aX;	.scl	2;	.type	32;	.endef
	.def	fraccion10aX;	.scl	2;	.type	32;	.endef
	.def	mapearDigitos;	.scl	2;	.type	32;	.endef
	.def	enteroXa10;	.scl	2;	.type	32;	.endef
	.def	fraccionXa10;	.scl	2;	.type	32;	.endef
	.def	enteroXaY;	.scl	2;	.type	32;	.endef
	.def	fraccionXaY;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
