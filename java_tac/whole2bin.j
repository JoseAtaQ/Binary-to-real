public static int whole2bin(int whole){
				// base 10 to binary 
				int number;
				int i = 0;
				int count;
				int elem = 0;
				int _2;

				elem = 0;
				_2 = 2;			

				number = whole;
				count = 0;
f_init:			;
f_loop:			for (; number != 0;) {
f_body:             ;	
	        		elem = number % _2;
          			number = number / _2;
          			mips.push(elem);

          			count ++;
          			continue f_loop;	
	        	}//end for
f_done:			;	        	
        
	        	//pop_all()
				i = 0;
f1_init:		;
f1_loop:	    for (; i < count;){
f1_body:			;	
	        		elem = mips.pop();
	        		mips.print_d(elem);
	        	
	        		i++;
	        		continue f1_loop;
	        	}//end for
f1_done:		;	
	return 0;
}//end whole2bin
