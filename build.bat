@echo off
cls
echo compilando: bootmgr
nasm -f bin src/bootmgr.asm -o bin/bootmgr
echo compilando: kernel
nasm -f bin src/kernel.asm -o bin/kernel.bin
echo compilando: window
nasm -f bin src/window.asm -o bin/window.bin
echo.
pause