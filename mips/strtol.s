
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

#glyph2int(char glyph, int radix){
                save_s_registers()
                # demarshal
                move $t0, $a0               # $t0 = glyph
                move $t1, $a1               # $t1 = radix
                                            # $t2 = c
                # Load Constants            
                li $s0, -1
                li $s1, '0'
                li $s2, '9'
                # $t0 = radix
                # $t2 = c = glyph

                li $t2, -1                  #       c = -1;
                                            #
                #read_c()                    #       mips.read_c();
                #move $t2, $v0               #       c = mips.retval();
                                            #
top:                                        # do {
                blt $t0, $s1, done          #       if (glyph < '0') break;
                blt $s2, $t0, done          #       if ('9' < glyph) break;
                                            #
                sub $t2, $t0, $s1           #       c = glyph - '0';
                                            #
                blt $t2, $t1, skip          #       if (c >= radix){
                    li $t2, -1              #           c = -1;
        skip:                               #       }
                nop                         #   } while (false);
done:
                restore_s_registers()
                move $v0, $t2               #   return c;
                jr $ra                      # }// end glyph2int


#strtol(char[] buffer, int radix){
                #save_s_registers()
                #demarshal
                move $t0, $a0               # $t0 = buffer
                move $t1, $a1               # $t1 = radix

                # Load Constants 
                li $t5, -1                  #       neg = -1;

                li $t8, 0                   #       int value;
                li $t3, 0                   #       int i = 0;
                add $t6, $t0, $t3           #       x = buffer[i]
                lbu $t4, 0($t6)             #       $t4 = x 
                                            #       int r = 0;
top:            beq $t4, $zero, done        #       for (; buffer[i] != '\0';){
                
                    #marshal_args
                    move $a0, $t4
                    move $a1, $t1

                    save_t_registers
                    push $ra, $sp, $fp, $gp                   
      
                    jal glyph2int           #       value = glyph2int(buffer[i], radix);

                    pop $ra, $sp, $fp, $gp
                    restore_t_registers
                    move $t7, $v0           #       value  = $t7

                beq $t7, $t5, done          #       if (value == neg ) break;   

                mul $t2, $t2, $t1           #           r = r * radix;
                add $t2, $t2, $t7           #           r = r + value;

                add $t3, $t3, 1             #           i ++;
                add $t6, $t0, $t3           #       x = buffer[i]
                lbu $t4, 0($t6)             #
            b top                           #           continue top;

done:       nop
            
            restore_s_registers()

            move $v0, $t2                   #       return r;
            jr $ra                          # }// end nextInt


