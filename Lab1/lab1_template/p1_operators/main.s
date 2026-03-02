# extern int operators_asm(int a, int b, int c, int d);

.section .text
.global operators_asm

operators_asm:
    # TODO: You have to implement the operators function with assembly language
    bge a0, a1, else
    xor t1, a0, a1
    sll t2, a2, a3
    add a0, t1, t2
    ret

else:
    and t1, a0, a1
    or t2, a2, a3
    sub a0, t1, t2
    ret