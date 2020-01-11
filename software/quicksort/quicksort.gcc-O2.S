	.file	"quicksort.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.quicksort,"ax",@progbits
	.align	1
	.globl	quicksort
	.type	quicksort, @function
quicksort:
	addi	sp,sp,-32
	sw	s2,16(sp)
	li	s2,1073741824
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	mv	s3,a1
	addi	s2,s2,-1
	li	s4,1
.L2:
	srli	a3,s3,1
	addi	a4,s3,-1
	slli	a3,a3,2
	slli	a5,a4,2
	add	a3,a0,a3
	add	a1,a0,a5
	lw	a2,0(a3)
	lw	a3,0(a1)
	mv	s0,a0
	li	s1,0
.L3:
	lw	a6,0(s0)
	bltu	a6,a2,.L4
	bgeu	a2,a3,.L5
	add	a5,a4,s2
	slli	a5,a5,2
	add	a5,a0,a5
.L6:
	mv	a1,a5
	addi	a5,a5,-4
	lw	a3,4(a5)
	addi	a4,a4,-1
	bgtu	a3,a2,.L6
	bleu	a4,s1,.L8
.L14:
	addi	a4,a4,-1
	sw	a3,0(s0)
	slli	a5,a4,2
	sw	a6,0(a1)
	add	a3,a0,a5
	lw	a3,0(a3)
.L4:
	addi	s1,s1,1
	addi	s0,s0,4
	j	.L3
.L5:
	add	a1,a0,a5
	bgtu	a4,s1,.L14
.L8:
	bleu	s1,s4,.L9
	mv	a1,s1
	call	quicksort
.L9:
	sub	s3,s3,s1
	mv	a0,s0
	bgtu	s3,s4,.L2
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	quicksort, .-quicksort
	.section	.text.data_random,"ax",@progbits
	.align	1
	.globl	data_random
	.type	data_random, @function
data_random:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lw	a1,0(a5)
	lw	a3,4(a5)
	li	a2,1103515648
	addi	a2,a2,-399
	mul	a4,a1,a2
	li	a0,12288
	addi	a0,a0,57
	mul	a3,a3,a2
	add	a0,a4,a0
	sltu	a4,a0,a4
	sw	a0,0(a5)
	mulhu	a2,a1,a2
	add	a3,a3,a2
	add	a4,a4,a3
	sw	a4,4(a5)
	ret
	.size	data_random, .-data_random
	.section	.text.data_vec_random,"ax",@progbits
	.align	1
	.globl	data_vec_random
	.type	data_vec_random, @function
data_vec_random:
	beq	a1,zero,.L16
	lui	t3,%hi(.LANCHOR0)
	addi	t3,t3,%lo(.LANCHOR0)
	lw	a3,0(t3)
	lw	a5,4(t3)
	slli	a1,a1,2
	li	a2,1103515648
	li	t1,12288
	add	a7,a0,a1
	addi	a2,a2,-399
	addi	t1,t1,57
.L18:
	mul	a4,a3,a2
	addi	a0,a0,4
	mulhu	a6,a3,a2
	add	a1,a4,t1
	sltu	a4,a1,a4
	sw	a1,-4(a0)
	mv	a3,a1
	mul	a5,a5,a2
	add	a5,a5,a6
	add	a5,a4,a5
	bne	a0,a7,.L18
	sw	a1,0(t3)
	sw	a5,4(t3)
.L16:
	ret
	.size	data_vec_random, .-data_vec_random
	.section	.text.data_vec_is_sorted,"ax",@progbits
	.align	1
	.globl	data_vec_is_sorted
	.type	data_vec_is_sorted, @function
data_vec_is_sorted:
	addi	a1,a1,-1
	li	a5,0
.L24:
	beq	a5,a1,.L28
	lw	a3,0(a0)
	addi	a0,a0,4
	addi	a5,a5,1
	lw	a4,0(a0)
	bleu	a3,a4,.L24
	li	a0,0
	ret
.L28:
	li	a0,1
	ret
	.size	data_vec_is_sorted, .-data_vec_is_sorted
	.section	.sdata.next.1591,"aw"
	.align	3
	.set	.LANCHOR0,. + 0
	.type	next.1591, @object
	.size	next.1591, 8
next.1591:
	.word	1325997111
	.word	0
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"
