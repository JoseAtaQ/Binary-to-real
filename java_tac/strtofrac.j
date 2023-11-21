public static int strtofrac(char[] buffer, int radix) {

        int retval;
    
        float value;
        float denom;
        float fraction;

        int i;
        char glyph;
        int digit;
    
        value = 0;
        denom = radix;
        i = 0;
        glyph = buffer[i];
loop1:  for (; glyph != '\0' ;) {
           digit = glyph2int(glyph, radix);
    
           if (digit == -1 ) break loop1;
           
           fraction =  digit / denom;
           value = value + fraction;
           denom = denom * radix;
           i++;
           glyph = buffer[i];
           continue loop1;
        }
done1:  ;
loop2:  for (; i > 0 ;) {
            value = value * 10;
            i--;
            continue loop2;
        }
done2:  ;
        return (int) value;
}

