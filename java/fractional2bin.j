public static int fractional2bin(int fractional, int max_bits){

	int max; 
   int number;

	//max = 10 ** stringlength(fractional);
   max = value_of_max(fractional);
 	number = fractional;
 	while (number != 0 && max_bits != 0) {

    	number = number * 2;
      max_bits --;

     	if (number > max) {
        	mips.print_d(1);
      	number = number - max;
     	} else {
        	mips.print_d(0);
     	}
	}
   
   return 0;
}

public static int value_of_max(int number) {

   int max;

   max = 10;
   for (int i=0; number >= max ;i++) {
      if(i > 8) break;
      max = max * 10;
   }
   return max;
}