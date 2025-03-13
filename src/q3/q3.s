.global pallindrome

pallindrome: # %r8 = i , %r9 = j , %rdi = length , %rsi = array            # %rdi %rsi %rdx %rcx %r8 %r9(order of input)
            movq $0 , %r8             # i = 0
            leaq -1(%rdi) , %r9     # j = length-1 

L2:
    cmp %r8,  %r9   # (r9 - r8) (j - i) (j<=i) break condition
    jle L4

    movzbq (%rsi,%r8) , %r10         # temp = array[i]
    cmpb %r10b , (%rsi,%r9)          # comp temp(array[i]) and array[j]

    jne L3  # jump when not equal

    incq %r8    # i++
    decq %r9    # j--

    jmp L2

L3:
    movq $0 , %rax
    ret         # return 0

L4:
    movq $1 , %rax
    ret         # return 1
