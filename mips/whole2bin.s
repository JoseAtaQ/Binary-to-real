
.data                                                
                .text                
                .globl whole2bin

                .include "macros/syscalls.s"    
                .include "macros/stack.s"
                .macro dec(%reg)
                  addi %reg, %reg, -1
                .end_macro

# public static int whole2bin(int whole){
whole2bin:	
				push_s_registers()
				# demarshal
				move $t0, $a0			# whole = $t0

				# int number = $t1;
				# int i 	 = $t2;
				# int count  = $t3;
				# int elem   = $t4;
				# int _2     = $t5;

				# load constans
				li $t4, 0				# elem = 0;
				li $t5, 2 				# _2 = 2;			

				move $t1, $t0			# number = whole;
				li $t3, 0               # count = 0;

top:			beq $t1, $zero, done	# for (; number != 0;) {

	        		rem $t4, $t1, $t5		# elem = number % _2;
          			div $t1, $t1, $t5		# number = number / _2;
          			push($t4)				# mips.push(elem);
					add $t3, $t3, 1			#count ++;
     			b top	
done:			nop
      	
	        	# //pop_all()
				li $t2, 0				# i = 0;

top1:	    	bge $t2, $t3, done1		# for (; i < count;){
	
	        		pop($t4)				# elem = mips.pop();
	        		print_d($t4)			# mips.print_d(elem);
	        	
	        		add $t2, $t2, 1 		# i++;
	        	b top1
done1:			nop
				
				pop_s_registers()

				move $v0, $zero		# return 0;
				jr $ra
									#}//end whole2bin

