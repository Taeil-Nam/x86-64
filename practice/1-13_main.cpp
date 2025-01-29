#include <stdio.h> // for printf()

// C++ Function Overloading으로 인한 Name Mangling 방지
extern "C"
{
     // 어셈블리어로 작성한 외부 함수 asmFunc 선언.
     // C++ 프로그램에서 호출할 예정.
    void asmFunc();
}

int main()
{
    printf("Calling asmFunc(): ");
    asmFunc(); // 외부 함수 asmFunc 호출.
    printf("Returned from asmFunc()");

    return 0;
}