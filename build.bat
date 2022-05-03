@echo off
cls
echo compilando: bootmgr
nasm -f bin src/bootmgr.asm -o bin/bootmgr
echo compilando: kernel
nasm -f bin src/kernel.asm -o bin/kernel.bin
echo.
pause