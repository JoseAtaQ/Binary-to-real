
public static int glyph2int(char glyph, int radix){
            // deals with glyphs
            // converts glyph to digits

            int i = 0;
            int c = 0;

initA:      ;
            if (glyph >= 'A'){
        initF:  ;      
                if (glyph <= 'F'){
consA:          ;          
                    c = glyph - 'A' + 10;
                }
        forwadF:;       
            }
forwardA:    ;

inita:      ;         
            if (glyph >= 'a'){
        initf:  ;      
                if (glyph <= 'f'){
consa:          ;                
                    c = glyph - 'a' + 10;
                }
        forwadf:;            
            } 
forwada:    ;

init0:      ;            
            if (glyph >= '0'){
        init9:  ;      
                if (glyph <= '9'){
cons0:          ;                
                    c = glyph - '0';
                }
        forwad9:;            
            }
forwad0:    ;

init:       ;            
            if (c >= radix){
cons:           ;
                c = -1;
            }
forwad:     ;        
            return c;

}
        

public static int strtol(char[] buffer, int radix){
            // deals with bunch of glyphs
            int buffer_length;
            int i;
            int r = 0;
            int value = 0;
                          

            i = 0;
fnit:       ;
loop:       for (; buffer[i] != '\0';){       
body:           ;
                value = glyph2int(buffer[i], radix);// gives me the value of a glyph following the index
        initr:  ;      
                if (value != -1){
        consr:      ;   
                    r = r * radix;
                    r = r + value;
                }
        forwadr:;
                i ++;
                continue loop;
            }// end for
done:       ;       
    return r;
}// end nextInt