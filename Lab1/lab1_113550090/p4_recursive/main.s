# extern int binary_search_asm(int arr[], int left, int right, int target);

.section .text
.global binary_search_asm

binary_search_asm:
    # TODO: You have to implement binary search with assembly language
    # HINT: You might need to use "jal(jump and link)" to finish the task
    mv t0, a0
    j binary_search

binary_search:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw a1, 4(sp)
    sw a2, 8(sp)
    sw a3, 12(sp)
    ble a1, a2, else1
    addi sp, sp, 16
    li a0, -1
    jr ra
else1:
    sub t1, a2, a1
    srli t1, t1, 1
    add t1, a1, t1 # mid
    slli t2, t1, 2 
    add t2, t0, t2
    lw t2, 0(t2) #arr[mid]
    bne t2, a3, else2
    addi sp, sp, 16
    mv a0, t1
    jr ra
else2:
    ble t2, a3, else3
    addi a2, t1, -1
    j done_if3
else3:
    addi a1, t1, 1
done_if3:
    jal ra, binary_search
    lw ra, 0(sp)
    addi sp, sp, 16
    jr ra
    