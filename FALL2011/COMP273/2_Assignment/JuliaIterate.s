
	 .data
string1: .asciiz "Enter the value of a: "
string2: .asciiz "Enter the value of b: "
string3: .asciiz "Enter the value of x0: "
string4: .asciiz "Enter the value of y0: "
string5: .asciiz "Enter the number of iterations n: "
string6: .asciiz "(x"
string7: .asciiz ", y"
string8: .asciiz ") = ("
string9: .asciiz ", "
string10: .asciiz ")\n"
newline:  .asciiz "\n"

	 .text
	 .globl main
main:	 li	$v0, 4
	 la	$a0, string1
	 syscall
	 li	$v0, 6
	 syscall
	 mov.s   $f1, $f0		# load a to $f1
	 
	 li	$v0, 4
	 la	$a0, string2
	 syscall
	 li	$v0, 6
	 syscall
	 mov.s   $f2, $f0		# load b to $f2
	 
	 li	$v0, 4			
	 la	$a0, string3
	 syscall
	 li	$v0, 6
	 syscall
	 mov.s   $f3, $f0		# load x0 to $f3
	 
	 li	$v0, 4
	 la	$a0, string4
	 syscall
	 li	$v0, 6
	 syscall
	 mov.s   $f4, $f0		# load y0 to $f4
	 
	 li	$v0, 4
	 la	$a0, string5
	 syscall
	 li	$v0, 5
	 syscall
	 move   $s0, $v0		# load number of iterations n to $s0
	 li	$v0, 4
	 la	$a0, newline
	 syscall
	 
	 add	$t0, $0, $0		# $t0 = 0
	 
Loop:	 beq	$t0, $0, Print		#if n ($s1) has not been changed, print x0, y0 directly
	 
	 mul.s	$f5, $f3, $f3		# $f5 = x * x
	 mul.s	$f6, $f4, $f4		# $f6 = y * y
	 sub.s	$f7, $f5, $f6		# f7 = x^2 - y^2
	 add.s	$f7, $f7, $f1		# f7 = x^2 - y^2 + a
	 
	 mul.s	$f5, $f3, $f4		# $f5 = x * y
	 add.s	$f5, $f5, $f5		# $f5 = 2xy
	 add.s	$f6, $f5, $f2		# $f6 = 2xy + b
	 mov.s  $f3, $f7		# x = $f7
	 mov.s  $f4, $f6		# y = $f6
	 
Print:	 la	$a0, string6
	 syscall
	 li	$v0, 1
	 add	$a0, $t0, $0
	 syscall
	 li	$v0, 4
	 la	$a0, string7
	 syscall
	 li	$v0, 1
	 add	$a0, $t0, $0
	 syscall
	 li	$v0, 4
	 la	$a0, string8
	 syscall
	 
	 li	$v0, 2
	 mov.s	$f12, $f3
	 syscall
	 li	$v0, 4
	 la	$a0, string9
	 syscall
	 
	 li	$v0, 2
	 mov.s	$f12, $f4
	 syscall
	 li	$v0, 4
	 la	$a0, string10
	 syscall
	 
	 addi	$t0, $t0, 1
	 slt	$t1, $s0, $t0		# $t1 = 1 if $t0 > n
	 beq	$t1, $0, Loop		# if ($t0 <= n) goto Loop
	 
Done:	 li $v0, 10
	 syscall
