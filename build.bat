@echo off
cls
echo compilando: bootmgr
nasm -f bin src/bootmgr.asm -o bin/bootmgr
pause