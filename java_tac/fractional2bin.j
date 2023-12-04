
public static int fractional2bin(int fractional, int max_bits){      

      	int max; 
         int number;
         int _2;
         int cnt;     

         _2 = 2;     

      	//max = 10 ** stringlength(fractional);
         max = value_of_max(fractional);
         number = fractional;

         cnt = 0;
loop1:   for(; number!= 0 ;) {
            if (cnt >= max_bits) break;

          	number = number * _2;     
           	if (number >= max) {
              	mips.print_d(1);
            	number = number - max;
           	} else {
              	mips.print_d(0);
           	}
            cnt++;
            continue loop1;
      	}//end for
done1:   ;         
   return 0;
}

public static int value_of_max(int number) {

         int _8;
         int _10;

         int max;
         int i;

         _8  =  8;
         _10 = 10;

         max = 10;
         i   =  0;

loop2:   for (; number >= max ;) {
            if( i > _8) break loop2;
            max = max * _10;
            i++;
            continue loop2;
         }//end for
done2:   ;
         return max;
}