.global rotate

rotate:  # %r8 = zero %r9 = one %r10 = i (iterator for loop) # %rdi %rsi %rdx %rcx %r8 %r9(order of input)
        cmp $3 , %rdi     # (%rdi-3) (n-3<0) (n<3)
        jl end

        movq -16(%rsi,%rdi,8) , %r8     # zero = array[n-2]
        movq -8(%rsi,%rdi,8) , %r9      # one = array[n-1]

        # %rdi = n %rsi = array
        leaq -3(%rdi) , %r10                  # i = n-3

L2:
    cmp $0 , %r10       # (%r10 - 0) (i - 0) i<0 break condition
    jl L3

    movq (%rsi,%r10,8)  ,   %r11               # temp = array[i+2]
    movq %r11           ,   16(%rsi,%r10,8)    # array[i] = temp

    decq %r10                              # i--

    jmp L2


L3:
    movq %r9 , 8(%rsi)    # array[1] = one
    movq %r8 , (%rsi)     # array[0] = zero

end:
    ret
