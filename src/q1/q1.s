.global one

one: # %r8 = once %r9 = twice %r10 = i (iterator for loop) # %rdi %rsi %rdx %rcx %r8 %r9(order of input)
    movq $0 , %r8  #once = 0
    movq $0 , %r9  #twice = 0
    movq $0 , %r10 # i =0 

    # %rdi = n %rsi = input array pointer

L2:
    cmp %rdi , %r10 # (i-n) condition for breaking  i>=n i-n>=0
    jge L3 

    # once = (once^input[i])&~twice
    xorq  (%rsi,%r10,8) , %r8     # once = input[i]^once (input[i] = input + 8*i)
    notq %r9                    # twice = ~twice
    andq %r9 , %r8                # once = twice&once
    notq %r9                    # restoring twice

    # twice = (twice^input[i])&~once
    xorq  (%rsi,%r10,8) , %r9     # twice = input[i]^twice (input[i] = input + 8*i)
    notq %r8                    # once = ~once
    andq %r8 , %r9                # twice = once&twice
    notq %r8                    # restoring once

    incq %r10                   # i++

    jmp L2

L3:
    movq %r8 , %rax               # move once to rax
    ret                         # return rax
