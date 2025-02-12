#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern "C"
{
    char* getTitle();
    void asmMain();
    int readLine(char* buffer, int maxLen);
}

int readLine(char* buffer, int maxLen)
{
    char* result = fgets(buffer, maxLen, stdin);
    if (result == NULL)
        return -1;
    int len = strlen(result);
    buffer[len - 1] = '\0';

    return len;
}

int main()
{
    try
    {
        char* title = getTitle();
        printf( "Calling %s:\n", title );
        asmMain();
        printf( "%s terminated\n", title );
    }
    catch(...)
    {
        printf
        ( 
            "Exception occurred during program execution\n"
            "Abnormal program termination.\n"
        );
    }
    
    return 0;
}