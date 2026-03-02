# extern void dp_asm(int *arr, int n, int m);

.section .text
.global dp_asm

dp_asm:
    # TODO: You have to implement dynamic programming with assembly code (fill the dp_array)
    # HINT: You might need to use "slli(shift left)" to implement multiplication
    # HINT: You might need to be careful of calculating the memory address you store in your register
    li t0, 1
    sw t0, 0(a0)
    li t0, 0 # id << 2

    li t1, 0 # i
loop1:
    bge t1, a1, done_loop1
    
    li t2, 0 # j
loop2:
    bge t2, a2, done_loop2
    
    bne t0, x0, done_if1
    j continue_loop2
done_if1:
    
    add t3, a0, t0
    lw t4, 0(t3) # arr[id]

    beq t4, x0, done_if2
    j continue_loop2
done_if2:

    li t5, 0 # temp arr[id]

    ble t1, x0, done_if3
    slli t6, a2, 2
    sub t6, t0, t6
    add t6, a0, t6
    lw t6, 0(t6) # arr[id - m]
    blt t6, x0, done_if3
    add t5, t5, t6
done_if3:

    ble t2, x0, done_if4
    addi t6, t0, -4
    add t6, a0, t6
    lw t6,  0(t6) # arr[id - 1]
    blt t6, x0, done_if4
    add t5, t5, t6
done_if4:

    sw t5, 0(t3)

continue_loop2:
    addi t0, t0, 4
    addi t2, t2, 1
    j loop2

done_loop2:

addi t1, t1, 1
    j loop1

done_loop1:
    addi t0, t0, -4
    add t0, t0, a0
    lw a0, 0(t0)
    ret