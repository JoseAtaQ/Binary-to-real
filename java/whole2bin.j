public static int whole2bin(int whole){
	// base 10 to binary 
	int number;
	number = whole;
	while (number != 0) {
  		push (number % 2);
  		number = number / 2;
	}
	pop_all();
}
