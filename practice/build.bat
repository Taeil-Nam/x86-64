echo off
ml64 /nologo /c /Zi /Cp %1/%2.asm
cl /nologo /O2 /Zi /utf-8 /EHa /Fe%1.exe %1/%1.cpp %2.obj
