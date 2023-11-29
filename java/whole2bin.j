public static int whole2bin(int whole){
	// base 10 to binary 
	int number;
	int i = 0;
	int count = 0;
	int elem = 0;

	number = whole;
	while (number != 0) {
  		mips.push(number % 2);
  		number = number / 2;
  		count ++;
	}//end while

	//pop_all()
	for (i = 0; i < count; i++){
		elem = mips.pop();//stack is empty


	}
	
	/*while (count > 0){
		result = mips.pop();
		count --;
		
	}*/
	return elem;
}//end whole2bin
