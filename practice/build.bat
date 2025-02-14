echo off
ml64 /nologo /c /Zi /Cp %1/asmMain.asm
cl /nologo /O2 /Zi /utf-8 /EHa /Fe%1.exe main.cpp asmMain.obj
