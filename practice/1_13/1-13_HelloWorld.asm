        option casemap:none
        .data

; "Hello, World!\n\0" 값을 가지는 문자열 fmtStr 선언.
fmtStr  byte    'Hello, World!', 10, 0

        .code
        externdef printf:proc ; 외부 함수 printf 선언.

; asmFunc 함수 정의
        public  asmFunc
asmFunc proc

        sub     rsp, 56
        lea     rcx, fmtStr ; rcx에 fmtStr 메모리 주소 저장
        call    printf ; 외부 printf 함수 호출. (rcx 값이 printf 함수의 첫 번째 매개변수로 사용됨)
        add     rsp, 56
        ret     ; return

asmFunc endp    ; asmFunc 함수 종료.
        end     ; 소스 파일 종료.