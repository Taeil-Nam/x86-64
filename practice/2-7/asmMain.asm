; Listing 2-3
; 
; Demonstrate two's complement operation and input of numeric values.

        option  casemap:none

nl       =      10  ;ASCII code for newline
maxLen   =      256

         .data
titleStr byte   'Practice 2-7', 0

prompt1  byte   "Enter an integer between 0 and 127:", 0
fmtStr1  byte   "Value in hexadecimal: %x", nl, 0
fmtStr2  byte   "Invert all the bits (hexadecimal): %x", nl, 0
fmtStr3  byte   "Add 1 (hexadecimal): %x", nl, 0
fmtStr4  byte   "Output as signed integer: %d", nl, 0
fmtStr5  byte   "Using neg instruction: %d", nl, 0

intValue sqword ?
input    byte   maxLen dup (?)
            
            
            
            .code
            externdef printf:proc
            externdef atoi:proc
            externdef readLine:proc

; Return program title to C++ program:

            public getTitle
getTitle    proc
            lea     rax, titleStr
            ret
getTitle    endp

        
; Here is the "asmMain" function.

        
            public  asmMain
asmMain     proc
                           
; "Magic" instruction offered without explanation at this point:

            sub     rsp, 56
                
; Read an unsigned integer from the user: This code will blindly
; assume that the user's input was correct. The atoi function returns
; zero if there was some sort of error on the user input. Later
; chapters in Ao64A will describe how to check for errors from the
; user.

            lea     rcx, prompt1
            call    printf
        
            lea     rcx, input
            mov     rdx, maxLen
            call    readLine
        
; Call C stdlib atoi function.
;
; i = atoi( str )
        
            lea     rcx, input
            call    atoi
;            and     rax, 0ffh ; Only keep L.O. eight bits
            mov     intValue, rax
        
; Print the input value (in decimal) as a hexadecimal number:
        
            lea     rcx, fmtStr1
            mov     rdx, rax
            call    printf
        
; Perform the two's complement operation on the input number. 
; Begin by inverting all the bits (just work with a byte here).
        
            lea     rcx, fmtStr2
            mov     rdx, intValue
            not     dl ;Only work with 8-bit values!
            call    printf
        
; Invert all the bits and add 1 (still working with just a byte)
        
            lea     rcx, fmtStr3
            mov     rdx, intValue
            not     dl ;Only keep L.O. eight bits
            inc     dl
            call    printf
        
; Negate the value and print as a signed integer (work with a full
; integer here, because C++ %d format specifier expects a 32-bit
; integer. H.O. 32 bits of RDX get ignored by C++.
        
            lea     rcx, fmtStr4
            mov     rdx, intValue
            not     rdx ;dl로 사용하게 되면, 8비트만 반전 시키기 때문에, 32비트를 사용하는
                        ;%d에서 이상한 값이 나옴. (왼쪽 24비트가 0으로 패딩되기 때문)
            inc     rdx
            call    printf
        
; Negate the value using the neg instruction.
        
            lea     rcx, fmtStr5
            mov     rdx, intValue
            neg     rdx
            call    printf

; Another "magic" instruction that undoes the effect of the previous
; one before this procedure returns to its caller.
       
            add     rsp, 56
            ret     ;Returns to caller
asmMain     endp
            end