# extern int max_element_asm(int *arr, int size);

.section .text
.global max_element_asm

max_element_asm:
    # TODO: You have to implement the max_element function with assembly language
    li t0, 0
    slli a1, a1, 2
    add a1, a1, a0

loops:
    bge a0, a1, done
    lw t1, 0(a0)
    bge t0, t1, else
    mv t0, t1
else:

    addi a0, a0, 4
    j loops

done:
    mv a0, t0
    ret