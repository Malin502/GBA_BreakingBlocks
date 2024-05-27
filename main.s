	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.comm	blocks,240,4
	.comm	i,2,2
	.comm	j,2,2
	.comm	k,2,2
	.comm	n,2,2
	.comm	m,2,2
	.comm	col,2,2
	.comm	row,2,2
	.comm	ptr,4,4
	.comm	key,4,4
	.comm	right,2,2
	.comm	left,2,2
	.comm	start,2,2
	.comm	paddleX,2,2
	.comm	paddleY,2,2
	.comm	direction_vector_paddle,2,2
	.comm	ballX,2,2
	.comm	ballY,2,2
	.comm	ball_ang,2,2
	.comm	ball_speedX,2,2
	.comm	ball_speedY,2,2
	.comm	num_blocks,2,2
	.global	score
	.bss
	.align	1
	.type	score, %object
	.size	score, 2
score:
	.space	2
	.comm	game_state,2,2
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	mov	r0, #0
	bl	clear_screen
	ldr	r3, .L14
	ldr	r2, .L14+4
	str	r2, [r3]
	ldr	r3, .L14+8
	mov	r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+12
	mov	r2, #32
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+16
	mov	r2, #8
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+20
	mov	r2, #97
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+24
	mov	r2, #140
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+28
	mov	r2, #120
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+32
	mov	r2, #80
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+36
	mov	r2, #1
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+40
	mvn	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+44
	mov	r2, #40
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+48
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+52
	mov	r2, #1
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+56
	mov	r2, #0
	strh	r2, [r3]	@ movhi
.L13:
	ldr	r3, .L14+56
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #1
	beq	.L3
	cmp	r3, #2
	beq	.L4
	cmp	r3, #0
	bne	.L2
	mov	r0, #0
	bl	clear_screen
	ldr	r3, .L14
	ldr	r3, [r3]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L14+16
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	and	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L14+16
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r2, r3
	beq	.L6
	ldr	r3, .L14+56
	mov	r2, #1
	strh	r2, [r3]	@ movhi
	bl	init_blocks
	bl	draw_blocks
	ldr	r3, .L14+60
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L2
.L6:
	b	.L2
.L3:
	bl	draw_paddle
	ldr	r3, .L14
	ldr	r3, [r3]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L14+8
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	and	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L14+8
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r2, r3
	beq	.L7
	mov	r0, #1
	bl	move_paddle
	b	.L8
.L7:
	ldr	r3, .L14
	ldr	r3, [r3]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L14+12
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	and	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L14+12
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r2, r3
	beq	.L9
	mov	r0, #2
	bl	move_paddle
	b	.L8
.L9:
	mov	r0, #0
	bl	move_paddle
.L8:
	ldr	r3, .L14+48
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r3
	bl	move_ball
	bl	check_block_ball_collision
	ldr	r3, .L14+44
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L10
	ldr	r3, .L14+56
	mov	r2, #2
	strh	r2, [r3]	@ movhi
.L10:
	ldr	r3, .L14+64
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L11
.L12:
	ldr	r3, .L14+64
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L14+64
	strh	r3, [r2]	@ movhi
.L11:
	ldr	r3, .L14+64
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	r2, .L14+68
	cmp	r3, r2
	ble	.L12
	b	.L2
.L4:
	ldr	r0, .L14+72
	bl	clear_screen
	ldr	r3, .L14+20
	mov	r2, #97
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+24
	mov	r2, #140
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+28
	mov	r2, #120
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+32
	mov	r2, #80
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+36
	mov	r2, #1
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+40
	mvn	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+44
	mov	r2, #40
	strh	r2, [r3]	@ movhi
	ldr	r3, .L14+56
	mov	r2, #0
	strh	r2, [r3]	@ movhi
.L2:
	b	.L13
.L15:
	.align	2
.L14:
	.word	key
	.word	67109168
	.word	right
	.word	left
	.word	start
	.word	paddleX
	.word	paddleY
	.word	ballX
	.word	ballY
	.word	ball_speedX
	.word	ball_speedY
	.word	num_blocks
	.word	direction_vector_paddle
	.word	ball_ang
	.word	game_state
	.word	score
	.word	i
	.word	3499
	.word	32736
	.size	main, .-main
	.align	2
	.global	draw_point
	.type	draw_point, %function
draw_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r2
	strh	r0, [fp, #-6]	@ movhi
	strh	r1, [fp, #-8]	@ movhi
	strh	r3, [fp, #-10]	@ movhi
	ldr	r3, .L17
	mov	r2, #67108864
	str	r2, [r3]
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, .L17+4
	strh	r2, [r3]	@ movhi
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #4
	mov	r2, r3
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r2, r3
	mov	r3, r3, asl #1
	add	r3, r3, #100663296
	ldr	r2, .L17
	str	r3, [r2]
	ldr	r3, .L17
	ldr	r3, [r3]
	ldrh	r2, [fp, #-10]	@ movhi
	mov	r2, r2, asl #16
	mov	r2, r2, lsr #16
	strh	r2, [r3]	@ movhi
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L18:
	.align	2
.L17:
	.word	ptr
	.word	3843
	.size	draw_point, .-draw_point
	.align	2
	.global	clear_screen
	.type	clear_screen, %function
clear_screen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, r0
	strh	r3, [fp, #-6]	@ movhi
	ldr	r3, .L24
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L20
.L23:
	ldr	r3, .L24+4
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L21
.L22:
	ldr	r3, .L24+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, .L24
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, .L24+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L24+4
	strh	r3, [r2]	@ movhi
.L21:
	ldr	r3, .L24+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #239
	ble	.L22
	ldr	r3, .L24
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L24
	strh	r3, [r2]	@ movhi
.L20:
	ldr	r3, .L24
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #159
	ble	.L23
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	i
	.word	j
	.size	clear_screen, .-clear_screen
	.align	2
	.global	draw_rectangle
	.type	draw_rectangle, %function
draw_rectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	strh	r0, [fp, #-6]	@ movhi
	strh	r1, [fp, #-8]	@ movhi
	strh	r2, [fp, #-10]	@ movhi
	strh	r3, [fp, #-12]	@ movhi
	ldr	r3, .L31
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L27
.L30:
	ldr	r3, .L31+4
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L28
.L29:
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L31+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L31
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #4]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, .L31+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L31+4
	strh	r3, [r2]	@ movhi
.L28:
	ldr	r3, .L31+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldrh	r2, [fp, #-10]	@ movhi
	mov	r2, r2, asl #16
	mov	r2, r2, lsr #16
	cmp	r3, r2
	blt	.L29
	ldr	r3, .L31
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L31
	strh	r3, [r2]	@ movhi
.L27:
	ldr	r3, .L31
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldrh	r2, [fp, #-12]	@ movhi
	mov	r2, r2, asl #16
	mov	r2, r2, lsr #16
	cmp	r3, r2
	blt	.L30
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	i
	.word	j
	.size	draw_rectangle, .-draw_rectangle
	.align	2
	.global	draw_paddle
	.type	draw_paddle, %function
draw_paddle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r3, .L34
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	mov	r3, #31
	str	r3, [sp]
	mov	r0, r1
	mov	r1, r2
	mov	r2, #45
	mov	r3, #5
	bl	draw_rectangle
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	paddleX
	.word	paddleY
	.size	draw_paddle, .-draw_paddle
	.align	2
	.global	draw_ball
	.type	draw_ball, %function
draw_ball:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r3, .L37
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, .L37+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L37+8
	str	r3, [sp]
	mov	r0, r1
	mov	r1, r2
	mov	r2, #5
	mov	r3, #5
	bl	draw_rectangle
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	ballX
	.word	ballY
	.word	1023
	.size	draw_ball, .-draw_ball
	.align	2
	.global	draw_blocks
	.type	draw_blocks, %function
draw_blocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r3, .L46
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L40
.L45:
	ldr	r3, .L46+4
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L41
.L44:
	ldr	r3, .L46
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	r0, .L46+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, r0, r3
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #1
	bne	.L42
	ldr	r3, .L46
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	add	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L43
	ldr	r3, .L46
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	r0, .L46+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, r0, r3
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	ip, r3, lsr #16
	ldr	r3, .L46
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	r0, .L46+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, r0, r3
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L46+12
	str	r3, [sp]
	mov	r0, ip
	mov	r1, r2
	mov	r2, #20
	mov	r3, #10
	bl	draw_rectangle
	b	.L42
.L43:
	ldr	r3, .L46
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	r0, .L46+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, r0, r3
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	ip, r3, lsr #16
	ldr	r3, .L46
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	r0, .L46+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, r0, r3
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	mov	r3, #2016
	str	r3, [sp]
	mov	r0, ip
	mov	r1, r2
	mov	r2, #20
	mov	r3, #10
	bl	draw_rectangle
.L42:
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L46+4
	strh	r3, [r2]	@ movhi
.L41:
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #9
	ble	.L44
	ldr	r3, .L46
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L46
	strh	r3, [r2]	@ movhi
.L40:
	ldr	r3, .L46
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #3
	ble	.L45
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	row
	.word	col
	.word	blocks
	.word	32736
	.size	draw_blocks, .-draw_blocks
	.align	2
	.global	move_paddle
	.type	move_paddle, %function
move_paddle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, r0
	strh	r3, [fp, #-6]	@ movhi
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #1
	bne	.L49
	ldr	r3, .L54
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #194
	bgt	.L51
	ldr	r3, .L54
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, .L54+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	mov	r3, #0
	str	r3, [sp]
	mov	r0, r1
	mov	r1, r2
	mov	r2, #3
	mov	r3, #5
	bl	draw_rectangle
	ldr	r3, .L54
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L54
	strh	r3, [r2]	@ movhi
	ldr	r3, .L54+8
	mov	r2, #1
	strh	r2, [r3]	@ movhi
	ldr	r3, .L54
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #195
	ble	.L51
	ldr	r3, .L54
	mov	r2, #195
	strh	r2, [r3]	@ movhi
	b	.L51
.L49:
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #2
	bne	.L52
	ldr	r3, .L54
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #0
	ble	.L51
	ldr	r3, .L54
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #44
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, .L54+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	mov	r3, #0
	str	r3, [sp]
	mov	r0, r1
	mov	r1, r2
	mov	r2, #3
	mov	r3, #5
	bl	draw_rectangle
	ldr	r3, .L54
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	sub	r3, r3, #3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L54
	strh	r3, [r2]	@ movhi
	ldr	r3, .L54+8
	mov	r2, #2
	strh	r2, [r3]	@ movhi
	ldr	r3, .L54
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #0
	bge	.L51
	ldr	r3, .L54
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L51
.L52:
	ldr	r3, .L54+8
	mov	r2, #0
	strh	r2, [r3]	@ movhi
.L51:
	bl	draw_paddle
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	paddleX
	.word	paddleY
	.word	direction_vector_paddle
	.size	move_paddle, .-move_paddle
	.align	2
	.global	move_ball
	.type	move_ball, %function
move_ball:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, r0
	strh	r3, [fp, #-6]	@ movhi
	ldr	r3, .L77
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, .L77+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	mov	r3, #0
	str	r3, [sp]
	mov	r0, r1
	mov	r1, r2
	mov	r2, #5
	mov	r3, #5
	bl	draw_rectangle
	ldr	r3, .L77
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #0
	ble	.L57
	ldr	r3, .L77
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #234
	ble	.L58
.L57:
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L77+8
	strh	r3, [r2]	@ movhi
.L58:
	ldr	r3, .L77+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #0
	bgt	.L59
	ldr	r3, .L77+12
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L77+12
	strh	r3, [r2]	@ movhi
.L59:
	ldr	r3, .L77+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #154
	ble	.L60
	ldr	r3, .L77+16
	mov	r2, #2
	strh	r2, [r3]	@ movhi
.L60:
	ldr	r3, .L77+4
	ldrh	r2, [r3]
	ldr	r3, .L77+20
	ldrh	r3, [r3]
	mov	r2, r2, asl #16
	mov	r2, r2, asr #16
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r2, r3
	blt	.L61
	ldr	r3, .L77+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, .L77+20
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #5
	cmp	r2, r3
	bgt	.L61
	ldr	r3, .L77
	ldrh	r2, [r3]
	ldr	r3, .L77+24
	ldrh	r3, [r3]
	mov	r2, r2, asl #16
	mov	r2, r2, asr #16
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r2, r3
	blt	.L61
	ldr	r3, .L77
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, .L77+24
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #45
	cmp	r2, r3
	bgt	.L61
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #1
	bne	.L62
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #0
	bgt	.L63
.L62:
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #2
	bne	.L64
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #0
	bge	.L64
.L63:
	ldr	r3, .L77+28
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	sub	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L77+28
	strh	r3, [r2]	@ movhi
	b	.L65
.L64:
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #1
	bne	.L66
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #0
	blt	.L67
.L66:
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #2
	bne	.L65
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #0
	ble	.L65
.L67:
	ldr	r3, .L77+28
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L77+28
	strh	r3, [r2]	@ movhi
.L65:
	ldr	r3, .L77+28
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #3
	ble	.L68
	ldr	r3, .L77+28
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L69
.L68:
	ldr	r3, .L77+28
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #0
	bge	.L69
	ldr	r3, .L77+28
	mov	r2, #2
	strh	r2, [r3]	@ movhi
.L69:
	ldr	r3, .L77+28
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L70
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #0
	ble	.L71
	ldr	r3, .L77+8
	mov	r2, #2
	strh	r2, [r3]	@ movhi
	ldr	r3, .L77+12
	mvn	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L61
.L71:
	ldr	r3, .L77+8
	mvn	r2, #1
	strh	r2, [r3]	@ movhi
	ldr	r3, .L77+12
	mvn	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L61
.L70:
	ldr	r3, .L77+28
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #1
	bne	.L73
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #0
	ble	.L74
	ldr	r3, .L77+8
	mov	r2, #1
	strh	r2, [r3]	@ movhi
	ldr	r3, .L77+12
	mvn	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L61
.L74:
	ldr	r3, .L77+8
	mvn	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L77+12
	mvn	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L61
.L73:
	ldr	r3, .L77+28
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #2
	bne	.L61
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #0
	ble	.L76
	ldr	r3, .L77+8
	mov	r2, #1
	strh	r2, [r3]	@ movhi
	ldr	r3, .L77+12
	mvn	r2, #1
	strh	r2, [r3]	@ movhi
	b	.L61
.L76:
	ldr	r3, .L77+8
	mvn	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L77+12
	mvn	r2, #1
	strh	r2, [r3]	@ movhi
.L61:
	ldr	r3, .L77
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L77
	strh	r3, [r2]	@ movhi
	ldr	r3, .L77+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L77+12
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L77+4
	strh	r3, [r2]	@ movhi
	bl	draw_ball
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	ballX
	.word	ballY
	.word	ball_speedX
	.word	ball_speedY
	.word	game_state
	.word	paddleY
	.word	paddleX
	.word	ball_ang
	.size	move_ball, .-move_ball
	.align	2
	.global	init_blocks
	.type	init_blocks, %function
init_blocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r3, .L84
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L80
.L83:
	ldr	r3, .L84+4
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L81
.L82:
	ldr	r3, .L84
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L84+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	r0, .L84+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, r0, r3
	mov	r2, #1
	strh	r2, [r3, #4]	@ movhi
	ldr	r3, .L84
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L84+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r0, r3, asr #16
	ldr	r3, .L84+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, r3	@ movhi
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r2, r2, asl #3
	rsb	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #5
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	ip, r3, lsr #16
	ldr	lr, .L84+8
	mov	r2, r0
	mov	r2, r2, asl #1
	add	r2, r2, r0
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, lr, r3
	strh	ip, [r3]	@ movhi
	ldr	r3, .L84
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L84+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r0, r3, asr #16
	ldr	r3, .L84
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, r3	@ movhi
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r2, r2, asl #2
	add	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #20
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	ip, r3, lsr #16
	ldr	lr, .L84+8
	mov	r2, r0
	mov	r2, r2, asl #1
	add	r2, r2, r0
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, lr, r3
	strh	ip, [r3, #2]	@ movhi
	ldr	r3, .L84+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L84+4
	strh	r3, [r2]	@ movhi
.L81:
	ldr	r3, .L84+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #9
	ble	.L82
	ldr	r3, .L84
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L84
	strh	r3, [r2]	@ movhi
.L80:
	ldr	r3, .L84
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #3
	ble	.L83
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	row
	.word	col
	.word	blocks
	.size	init_blocks, .-init_blocks
	.align	2
	.global	check_block_ball_collision
	.type	check_block_ball_collision, %function
check_block_ball_collision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r3, .L95
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L87
.L94:
	ldr	r3, .L95+4
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	b	.L88
.L93:
	ldr	r3, .L95
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	r0, .L95+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, r0, r3
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #1
	bne	.L89
	ldr	r3, .L95+12
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	add	r0, r3, #5
	ldr	r3, .L95
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	ip, .L95+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, ip, r3
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r0, r3
	blt	.L89
	ldr	r3, .L95+12
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r0, r3, asr #16
	ldr	r3, .L95
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	ip, .L95+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, ip, r3
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #20
	cmp	r0, r3
	bgt	.L89
	ldr	r3, .L95+16
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	add	r0, r3, #5
	ldr	r3, .L95
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	ip, .L95+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, ip, r3
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r0, r3
	blt	.L89
	ldr	r3, .L95+16
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r0, r3, asr #16
	ldr	r3, .L95
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	ip, .L95+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, ip, r3
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #10
	cmp	r0, r3
	bgt	.L89
	ldr	r3, .L95+12
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	add	r2, r3, #5
	ldr	r3, .L95+20
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	rsb	r0, r3, r2
	ldr	r3, .L95
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	ip, .L95+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, ip, r3
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r0, r3
	ble	.L90
	ldr	r3, .L95+12
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, .L95+20
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	rsb	r0, r3, r2
	ldr	r3, .L95
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	ip, .L95+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, ip, r3
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #20
	cmp	r0, r3
	blt	.L91
.L90:
	ldr	r3, .L95+20
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L95+20
	strh	r3, [r2]	@ movhi
	b	.L92
.L91:
	ldr	r3, .L95+24
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L95+24
	strh	r3, [r2]	@ movhi
.L92:
	ldr	r3, .L95
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	r0, .L95+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, r0, r3
	mov	r2, #0
	strh	r2, [r3, #4]	@ movhi
	ldr	r3, .L95+28
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	sub	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L95+28
	strh	r3, [r2]	@ movhi
	ldr	r3, .L95
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	r0, .L95+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, r0, r3
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	ip, r3, lsr #16
	ldr	r3, .L95
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	r0, .L95+8
	mov	r2, r3
	mov	r2, r2, asl #1
	add	r2, r2, r3
	mov	r3, r2, asl #1
	mov	r2, r3
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	add	r3, r0, r3
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	mov	r3, #0
	str	r3, [sp]
	mov	r0, ip
	mov	r1, r2
	mov	r2, #20
	mov	r3, #10
	bl	draw_rectangle
.L89:
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L95+4
	strh	r3, [r2]	@ movhi
.L88:
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #9
	ble	.L93
	ldr	r3, .L95
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L95
	strh	r3, [r2]	@ movhi
.L87:
	ldr	r3, .L95
	ldrh	r3, [r3]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #3
	ble	.L94
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L96:
	.align	2
.L95:
	.word	row
	.word	col
	.word	blocks
	.word	ballX
	.word	ballY
	.word	ball_speedX
	.word	ball_speedY
	.word	num_blocks
	.size	check_block_ball_collision, .-check_block_ball_collision
	.ident	"GCC: (devkitARM release 44) 4.9.2"
