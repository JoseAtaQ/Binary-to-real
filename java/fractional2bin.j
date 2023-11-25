public static int fractional2bin(int fractional, int max_bits){
	
	max = 10 ** stringlength(fractional);
 	number = fractional;
 	while (number != 0 ) {
    	number = number * 2 
     	if ( number > max ) {
        	emit 1
        	number = number - max
     	} else {
        	emit 0
     	}
	}
}

public static int value_of_max(int number) {

   int max;

   max = 10;
   for (int i=0;  number >= max ;i++) {
      if( i > 8) break;
      max = max * 10;
   }
   return max;
}