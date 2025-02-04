            .data
titleStr    byte    "Practice1_14", 0

            .code
            public  getTitle
getTitle    proc
            lea     rax, titleStr
            ret;
getTitle    endp
            end