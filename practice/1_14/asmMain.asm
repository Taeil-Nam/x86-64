maxLen      =           256 ; 상수 maxLen
nl          =           10 ; 상수 nl(new line(\n))

            .data
prompt      byte        "Enter input: ", 0
input       byte        maxLen dup (?) ; 256바이트 크기의 메모리 할당(초기화X)
fmtStr      byte        "User input: '%s'", nl, 0
            .code
            externdef   printf:proc
            externdef   readLine:proc

            public      asmMain
asmMain     proc
            sub         rsp, 56

            lea         rcx, prompt ; 첫 번째 인자에 prompt 주소 전달
            call        printf ; printf() 호출

            lea         rcx, input ; 첫 번째 인자에 input 주소 전달
            mov         rdx, maxLen ; 두 번째 인자에 maxLen 값 전달
            call        readLine ; readLine() 호출

            lea         rcx, fmtStr ; 첫 번째 인자에 fmtStr 주소 전달
            lea         rdx, input ; 두 번째 인자에 input 주소 전달
            call        printf ; printf() 호출

            add         rsp, 56
            ret
asmMain     endp
            end