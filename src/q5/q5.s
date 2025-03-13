.global produc

produc: # %r8 = left %r9 = right %r10 = i  # %rdi = n %rsi = input %rdx = output        # %rdi %rsi %rdx %rcx %r8 %r9(order of input)
        movq $1 , %r8   # left = 1
        movq $1 , %r9   # right = 1
        movq $0 , %r10  # i = 0

L2:
    cmp %rdi , %r10   # (%r10 - %rdi) (i - n) (i >= n)
    jge L3

    movq %r8            , (%rdx,%r10,8)       # output[i] = left
    imulq (%rsi,%r10,8) , %r8                 # left = left*input[i]

    incq %r10       # i++
    jmp L2

L3:
    decq %r10       # i-- to n-1
L4:
    cmp $0 , %r10   # (%r10 - 0) (i - 0) (i<0)
    jl L5

    movq (%rdx,%r10,8)  , %r11              # temp = output[i]
    imulq %r9           , %r11              # temp = temp*right
    movq  %r11          , (%rdx,%r10,8)     #  output[i] = temp
    imulq (%rsi,%r10,8) , %r9               # right = right*input[i]

    decq %r10       # i--
    jmp L4

L5:
    ret

