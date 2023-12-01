public static int whole2bin(int whole){
	// base 10 to binary 
	int number;
	int i = 0;
	int count = 0;
	int elem = 0;

	number = whole;
	for (count = 0; number != 0; count ++) {
		elem = number % 2;
  		number = number / 2;
  		mips.push(elem);
	}//end for

	//pop_all()
	for (i = 0; i < count; i++){
		elem = mips.pop();
		mips.print_d(elem);
		
	}//end for
	mips.print_s("\n");
	return 0;
}//end whole2bin
