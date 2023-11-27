public static int whole2bin(int whole){
	// base 10 to binary 
	int number;
	int i = 0;
	int count = 0;
	int result = 0;

	number = whole;
	while (number != 0) {
  		mips.push(number % 2);
  		number = number / 2;
  		count ++;
	}//end while

	//pop_all()
	/*for (i = 0; i <= count; i++){
		result = mips.pop();
	}
	*/
	while (count > 0){
		result = mips.pop();
		count --;
		
	}
	return result;
}//end whole2bin
