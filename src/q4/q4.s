.global difference

difference: # %r8 = min %r9 = max %r10 = i  # %rdi = n %rsi = input  # %rdi %rsi %rdx %rcx %r8 %r9(order of input) 
            movq (%rsi) , %r8     # min = input[0]
            movq (%rsi) , %r9     # max = input[0]
            movq $1 , %r10        # i = 1

L2:
    cmp %r10 , %rdi     # (%rdi - %r10) (n - i) (n<=i) break condition
    jle L5

    cmp %r8 , (%rsi,%r10,8) # (input + 8*i - min) (input[i]-min) (input[i]>=min)
    jge L3

    movq (%rsi,%r10,8) , %r8    # min = input[i]

L3:
    cmp %r9 , (%rsi,%r10,8) # (input + 8*i - max) (input[i]-max) (input[i]<=max)
    jle L4

    movq (%rsi,%r10,8) , %r9    # max = input[i]

L4:
    incq %r10   # i++
    jmp L2


L5:
    subq %r8 , %r9 # max = max - min
    movq %r9 , %rax 
    ret
