
.data                                                
                .text                
                .globl strtol
                .globl glyph2int

                .include "macros/syscalls.s"    
                .include "macros/subroutine.s"
                .include "macros/stack.s"
                .macro dec(%reg)
                  addi %reg, %reg, -1
                .end_macro

                save_s_registers()
                # demarshal
                move $t0, $a0
                # Load Constants
                li $s0, -1
                li $s1, '0'
                li $s2, '9'

                li $t1, -1                  #       value = -1;
                                            #
                read_c()                    #       mips.read_c();
                move $t2, $v0               #       c = mips.retval();
                                            #
top:                                        # do {
                blt $t2, $s1, done          #       if (c < '0') break;
                blt $s2, $t2, done          #       if ('9' < c) break;
                                            #
                sub $t1, $t2, $s1           #       value = c - '0';
                                            #
                blt $t1, $t0, skip          #       if (value >= radix){
                    li $t1, -1              #           value = -1;
        skip:                               #       }
                nop                         #   } while (false);
done:
                restore_s_registers()
                move $v0, $t1               #   return value;
                jr $ra                      # }// end glyph2int

                #save_s_registers()
                #demarshal
                move $t0, $a0

                li $t5, -1                  #       neg = -1;

                li $t2, 0                   #       int value;
                li $t3, 0                   #       int i = 0;
                                            #       int r = 0;
top:            beq $t4                          

            i = 0;
fnit:       ;
loop:       for (; buffer[i] != '\0';){       
body:           ;
                value = glyph2int(buffer[i], radix);// gives me the value of a glyph following the index
        initr:  ;      
                if (value != -1){
        consr:      ;   
                    r = r * radix;
                    r = r + value;
                }
        forwadr:;
                i ++;
                continue loop;
            }// end for
done:       ;       
    return r;
}// end nextInt


