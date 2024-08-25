.section .data
.align 16
stack_bottom:
.skip 1048576
stack_top:

/* Kernel Entry Point */
.section .text
.global _start
.extern main
.type _start, @function
_start:

	/* Set the stack pointer to a basic initial location */
	mov $stack_top, %esp

	/* Enter the kernel with the C environment support */
	call main

	/* Loop forever here if kernel exits for some reason */
	cli
1:	hlt
	jmp 1b

.size start, . - _start

