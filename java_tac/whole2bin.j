public static int whole2bin(int whole){
				// base 10 to binary 
				int number;
				int i;
				int count;
				int elem;
				int _2;

				elem = 0;
				_2 = 2;			

				number = whole;

				count = 0;
loop1:			for (; number != 0;) {
	        		elem = number % _2;
          			number = number / _2;
          			mips.push(elem);

          			count ++;
          			continue loop1;	
	        	}//end for
done1:			;	        	
        
	        	//pop_all()
				i = 0;
loop2:	        for (; i < count;){
	        		elem = mips.pop();
	        		mips.print_d(elem);
	        	
	        		i++;
	        		continue loop2;
	        	}//end for
done2:		;	
	return 0;
}//end whole2bin
