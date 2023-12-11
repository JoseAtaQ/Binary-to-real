
.data                                                
                .text                
                .globl fractional2bin
                .globl value_of_max 

                .include "macros/syscalls.s"    
                .include "macros/subroutine.s"
                .include "macros/stack.s"
                .macro dec(%reg)
                  addi %reg, %reg, -1
                .end_macro

# public static int fractional2bin(int fractional, int max_bits){      
		 save_s_registers()
		 move $t0, $a0				# fractional = $t0
		 move $t1, $a1				# max_bits   = $t1
      	 # int max = $t2; 
         # int number = $t3;
         # int _2 = $t4;
         # int cnt = $t5;     

         # Load constants
         li $t4, 2					# _2 = 2;     

      	# //max = 10 ** stringlength(fractional);
      			#marshal_args
                move $a0, $t0 			# fractional = $t0

         		save_t_registers				
       			push $ra, $sp, $fp, $gp 

       			jal value_of_max  		# max = value_of_max(fractional);

       			pop $ra, $sp, $fp, $gp
                restore_t_registers
                move $t2, $v0			# max = $t2

         move $t3, $t0				# number = fractional;
         li $t5, 0 					# cnt = 0;

loop1:  beq $t3, $zero, done		# for(; number!= 0 ;) {
            
			blt $t5, $t1, loop1 		# if (cnt >= max_bits) break;
          	mul $t3, $t3, $t4           # number = number * _2;     
           	blt $t3, $t2, alt 			# if (number >= max) {
              	print_d(1)					# mips.print_d(1);
            	sub $t3, $t3, $t2			# number = number - max;
alt:           							# } else {
    			print_d(0) 					# mips.print_d(0);
           								# }
        	add $t5, $t5, 1    			# cnt++;
        b loop1
done:   nop   						# }//end for
		
		restore_s_registers()         
   		move $v0, $zero				# return 0;
   		jr $ra
								# }
								

value_of_max: nop               #  public static int value_of_max(int number) {
        # t0: number
        # t1: max               # int max;
        # t2: i                 # int i;
        # s0: 8                 # int _8;
        # s1: 10                # int _10;
      
        push_s_registers()      # Save S registers
        move $t0, $a0           # Demarshal input arguments
      
        li $t1, 10              # max = 10;
        li $t2, 0               # i=0;
        li $s0, 8               # _8 = 8;
        li $s1, 10              # _10 = 10;
      
loop2:  blt $t0, $t1, done2     # for (; number >= max ;) {
          bgt $t2, $s0, loop2   #    if( i > _8) break loop2;
          mul $t1, $t1, $s1     #    max = max * _10;
          addi $t2, $t2, 1      #    i++;
        b loop2                 #    continue loop2;
                                # }
done2:  nop                     # ;
                                # return max;
        move $v0, $t1           # Marshal output value
        pop_s_registers()       # Restore S registers                          
        jr $ra
                                # }


