	.file	"cambioDeBase.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "\12Conversion de la parte entera desde Base %i a Base 10:\12\12\0"
	.align 8
.LC2:
	.ascii "Operacion realizada: %.0lf + %d*%d^%d\12\0"
	.align 8
.LC3:
	.ascii "Se obtuvo parcialmente %I64u en la base 10\12\0"
	.text
	.globl	enteroXa10
	.def	enteroXa10;	.scl	2;	.type	32;	.endef
	.seh_proc	enteroXa10
enteroXa10:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$152, %rsp
	.seh_stackalloc	152
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	movaps	%xmm6, -16(%rbp)
	.seh_savexmm	%xmm6, 112
	movaps	%xmm7, 0(%rbp)
	.seh_savexmm	%xmm7, 128
	.seh_endprologue
	movq	%rcx, 64(%rbp)
	movq	%rdx, 72(%rbp)
	movq	%r8, 80(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -24(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -32(%rbp)
	movl	$8, %ecx
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
	movq	-32(%rbp), %rax
	movl	$0, (%rax)
	movq	-40(%rbp), %rax
	movq	$0, (%rax)
	movq	80(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L3
	movq	64(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	jmp	.L3
.L4:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
.L3:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	72(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	jne	.L4
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L5
.L13:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	js	.L6
	cvtsi2sdq	%rax, %xmm6
	jmp	.L7
.L6:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	movapd	%xmm0, %xmm6
	addsd	%xmm0, %xmm6
.L7:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	72(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm7
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm1
	movq	64(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm0
	call	pow
	mulsd	%xmm7, %xmm0
	addsd	%xmm6, %xmm0
	comisd	.LC1(%rip), %xmm0
	jnb	.L8
	cvttsd2siq	%xmm0, %rax
	jmp	.L9
.L8:
	movsd	.LC1(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movabsq	$-9223372036854775808, %rdx
	xorq	%rdx, %rax
.L9:
	movq	-40(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	80(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L10
	movq	-32(%rbp), %rax
	movl	(%rax), %ebx
	movq	64(%rbp), %rax
	movl	(%rax), %edi
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	72(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %esi
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	js	.L11
	cvtsi2sdq	%rax, %xmm6
	jmp	.L12
.L11:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	movapd	%xmm0, %xmm6
	addsd	%xmm0, %xmm6
.L12:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	72(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm7
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm1
	movq	64(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm0
	call	pow
	mulsd	%xmm7, %xmm0
	subsd	%xmm0, %xmm6
	movapd	%xmm6, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movl	%ebx, 32(%rsp)
	movl	%edi, %r9d
	movl	%esi, %r8d
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	printf
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
.L10:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
.L5:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jns	.L13
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movl	$56, %ecx
	call	malloc
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L14
	movq	-48(%rbp), %rax
	movl	$0, (%rax)
	movq	-48(%rbp), %rax
	addq	$4, %rax
	movl	$-1, (%rax)
	jmp	.L15
.L14:
	movq	-48(%rbp), %rax
	movl	$-1, (%rax)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -56(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	movl	$0, (%rax)
	movq	-64(%rbp), %rax
	movl	$1, (%rax)
	jmp	.L16
.L17:
	movq	-40(%rbp), %rax
	movq	(%rax), %rcx
	movabsq	$-3689348814741910323, %rdx
	movq	%rcx, %rax
	mulq	%rdx
	shrq	$3, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	subq	%rax, %rcx
	movq	%rcx, %rdx
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movl	%edx, (%rax)
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-64(%rbp), %rax
	movl	%edx, (%rax)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movabsq	$-3689348814741910323, %rdx
	mulq	%rdx
	shrq	$3, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
.L16:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L17
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	movq	-64(%rbp), %rax
	movl	%edx, (%rax)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -72(%rbp)
	jmp	.L18
.L19:
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-72(%rbp), %rax
	movl	%edx, (%rax)
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rdx), %edx
	movl	%edx, (%rax)
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	-72(%rbp), %rdx
	movl	(%rdx), %edx
	movl	%edx, (%rax)
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-56(%rbp), %rax
	movl	%edx, (%rax)
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	movq	-64(%rbp), %rax
	movl	%edx, (%rax)
.L18:
	movq	-56(%rbp), %rax
	movl	(%rax), %edx
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jl	.L19
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	free
.L15:
	movq	80(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L20
	movl	$10, %ecx
	call	putchar
.L20:
	movq	-48(%rbp), %rax
	movaps	-16(%rbp), %xmm6
	movaps	0(%rbp), %xmm7
	addq	$152, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "\12Conversion de la parte fraccionaria desde Base %i a Base 10:\12\12\0"
	.align 8
.LC6:
	.ascii "Operacion realizada: %lf + %d*%d^%d\12\0"
	.align 8
.LC7:
	.ascii "Se obtuvo parcialmente %lf en la base 10\12\0"
	.text
	.globl	fraccionXa10
	.def	fraccionXa10;	.scl	2;	.type	32;	.endef
	.seh_proc	fraccionXa10
fraccionXa10:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$168, %rsp
	.seh_stackalloc	168
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	movaps	%xmm6, 0(%rbp)
	.seh_savexmm	%xmm6, 128
	movaps	%xmm7, 16(%rbp)
	.seh_savexmm	%xmm7, 144
	.seh_endprologue
	movq	%rcx, 80(%rbp)
	movq	%rdx, 88(%rbp)
	movq	%r8, 96(%rbp)
	movl	$8, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -16(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	movq	-8(%rbp), %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	movq	-24(%rbp), %rax
	movl	$-1, (%rax)
	movq	96(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L24
	movq	80(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	leaq	.LC5(%rip), %rcx
	call	printf
	jmp	.L24
.L26:
	movq	-8(%rbp), %rax
	movsd	(%rax), %xmm6
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	88(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm7
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm1
	movq	80(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm0
	call	pow
	mulsd	%xmm7, %xmm0
	addsd	%xmm6, %xmm0
	movq	-8(%rbp), %rax
	movsd	%xmm0, (%rax)
	movq	96(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L25
	movq	-24(%rbp), %rax
	movl	(%rax), %ebx
	movq	80(%rbp), %rax
	movl	(%rax), %edi
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	88(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %esi
	movq	-8(%rbp), %rax
	movsd	(%rax), %xmm6
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	88(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm7
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm1
	movq	80(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm0
	call	pow
	mulsd	%xmm7, %xmm0
	subsd	%xmm0, %xmm6
	movapd	%xmm6, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movl	%ebx, 32(%rsp)
	movl	%edi, %r9d
	movl	%esi, %r8d
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rcx
	call	printf
	movq	-8(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rcx
	call	printf
.L25:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
.L24:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	88(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	jne	.L26
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movl	$24, %ecx
	call	malloc
	movq	%rax, -32(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -40(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -48(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -56(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -64(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -72(%rbp)
	movq	-40(%rbp), %rax
	movl	$0, (%rax)
	movq	-48(%rbp), %rax
	movl	$1, (%rax)
	movq	-56(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L27
.L31:
	movq	-8(%rbp), %rax
	movsd	(%rax), %xmm6
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm0
	movq	.LC8(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow
	mulsd	%xmm6, %xmm0
	cvttsd2si	%xmm0, %eax
	movq	-64(%rbp), %rdx
	movl	%eax, (%rdx)
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm6
	movq	-8(%rbp), %rax
	movsd	(%rax), %xmm7
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm0
	movq	.LC8(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow
	mulsd	%xmm7, %xmm0
	ucomisd	%xmm0, %xmm6
	jp	.L28
	ucomisd	%xmm0, %xmm6
	jne	.L28
	movq	-56(%rbp), %rax
	movl	$1, (%rax)
.L28:
	movq	-64(%rbp), %rax
	movl	(%rax), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movq	-72(%rbp), %rax
	movl	%edx, (%rax)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	-72(%rbp), %rdx
	movl	(%rdx), %edx
	movl	%edx, (%rax)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-48(%rbp), %rax
	movl	%edx, (%rax)
.L27:
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$5, %eax
	jg	.L30
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L31
.L30:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	$-1, (%rax)
	movq	96(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L32
	movl	$10, %ecx
	call	putchar
.L32:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-40(%rbp), %rax
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
	movq	-32(%rbp), %rax
	movaps	0(%rbp), %xmm6
	movaps	16(%rbp), %xmm7
	addq	$168, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "\12Conversion de la parte entera desde Base 10 a Base %i:\12\12\0"
	.align 8
.LC10:
	.ascii "Se obtuvo el digito: 0 en la base %i\12\0"
	.align 8
.LC11:
	.ascii "Se obtuvo el digito: %i en la base %i\12\0"
	.text
	.globl	entero10aX
	.def	entero10aX;	.scl	2;	.type	32;	.endef
	.seh_proc	entero10aX
entero10aX:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movl	$8, %ecx
	call	malloc
	movq	%rax, -16(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	$0, (%rax)
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
	movq	32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L37
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	leaq	.LC9(%rip), %rcx
	call	printf
	jmp	.L37
.L38:
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cltq
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
.L37:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jns	.L38
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L39
	movl	$8, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	movq	-8(%rbp), %rax
	addq	$4, %rax
	movl	$-1, (%rax)
	movq	32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L40
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	leaq	.LC10(%rip), %rcx
	call	printf
.L40:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	free
	jmp	.L41
.L39:
	movl	$160, %ecx
	call	malloc
	movq	%rax, -32(%rbp)
	movl	$8, %ecx
	call	malloc
	movq	%rax, -40(%rbp)
	movl	$8, %ecx
	call	malloc
	movq	%rax, -48(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L42
.L44:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rbp), %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rcx
	movl	$0, %edx
	divq	%rcx
	movq	-48(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movl	%edx, (%rax)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rbp), %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rcx
	movl	$0, %edx
	divq	%rcx
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
	movq	32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L43
	movq	16(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC11(%rip), %rcx
	call	printf
.L43:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
.L42:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L44
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	addl	$1, %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, -8(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L45
.L46:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rdx), %edx
	movl	%edx, (%rax)
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-56(%rbp), %rax
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
.L45:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jg	.L46
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	$-1, (%rax)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	free
.L41:
	movq	32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L47
	movl	$10, %ecx
	call	putchar
.L47:
	movq	-8(%rbp), %rax
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "\12Conversion de la parte fraccionaria desde Base 10 a Base %i:\12\12\0"
	.text
	.globl	fraccion10aX
	.def	fraccion10aX;	.scl	2;	.type	32;	.endef
	.seh_proc	fraccion10aX
fraccion10aX:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	movaps	%xmm6, -16(%rbp)
	.seh_savexmm	%xmm6, 64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movl	$24, %ecx
	call	malloc
	movq	%rax, -24(%rbp)
	movl	$8, %ecx
	call	malloc
	movq	%rax, -32(%rbp)
	movl	$8, %ecx
	call	malloc
	movq	%rax, -40(%rbp)
	movl	$4, %ecx
	call	malloc
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	$0, (%rax)
	movq	-32(%rbp), %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	movq	32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L51
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	leaq	.LC12(%rip), %rcx
	call	printf
	jmp	.L51
.L52:
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	.LC8(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movq	-32(%rbp), %rax
	movsd	%xmm0, (%rax)
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm1
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm0
	addsd	%xmm1, %xmm0
	movq	-32(%rbp), %rax
	movsd	%xmm0, (%rax)
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-48(%rbp), %rax
	movl	%edx, (%rax)
.L51:
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jns	.L52
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm0
	pxor	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L53
	pxor	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jne	.L53
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
	movq	-24(%rbp), %rax
	addq	$4, %rax
	movl	$-1, (%rax)
	movq	32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L56
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	leaq	.LC10(%rip), %rcx
	call	printf
	jmp	.L56
.L53:
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm6
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm0
	movq	.LC8(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow
	divsd	%xmm0, %xmm6
	movapd	%xmm6, %xmm0
	movq	-32(%rbp), %rax
	movsd	%xmm0, (%rax)
	movq	-48(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L57
.L60:
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm1
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	movq	-32(%rbp), %rax
	movsd	%xmm0, (%rax)
	movq	-32(%rbp), %rax
	movq	(%rax), %rcx
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movq	%rcx, %xmm0
	call	modf
	movq	%xmm0, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-40(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	cvttsd2si	%xmm0, %eax
	movl	%eax, (%rdx)
	movq	32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L58
	movq	16(%rbp), %rax
	movl	(%rax), %edx
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC11(%rip), %rcx
	call	printf
.L58:
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-48(%rbp), %rax
	movl	%edx, (%rax)
.L57:
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$4, %eax
	jg	.L59
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm0
	pxor	%xmm1, %xmm1
	comisd	%xmm1, %xmm0
	ja	.L60
.L59:
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	$-1, (%rax)
.L56:
	movq	32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L61
	movl	$10, %ecx
	call	putchar
.L61:
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-24(%rbp), %rax
	movaps	-16(%rbp), %xmm6
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	enteroXaY
	.def	enteroXaY;	.scl	2;	.type	32;	.endef
	.seh_proc	enteroXaY
enteroXaY:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	40(%rbp), %rdx
	movq	32(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	enteroXa10
	movq	%rax, %rcx
	movq	40(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rcx, %rdx
	movq	%rax, %rcx
	call	entero10aX
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	fraccionXaY
	.def	fraccionXaY;	.scl	2;	.type	32;	.endef
	.seh_proc	fraccionXaY
fraccionXaY:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	40(%rbp), %rdx
	movq	32(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	fraccionXa10
	movq	%rax, %rcx
	movq	40(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rcx, %rdx
	movq	%rax, %rcx
	call	fraccion10aX
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.long	0
	.long	1138753536
	.align 8
.LC8:
	.long	0
	.long	1076101120
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	pow;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	modf;	.scl	2;	.type	32;	.endef
