[BITS 16]
[ORG 0500h]

pusha
call DefineWindow
popa
jmp ReturnKernel

;+__________________________________+;
;+ \/ Includes _____________________+;
%INCLUDE "src/hardware/wmemory.lib"
;+ /\ ______________________________+;

DefineWindow:
    mov ah, 0Ch
    mov al, byte[Window_Border_Color]
    mov cx, word[Window_PositionX]
    mov dx, word[Window_PositionY]
    cmp byte[Window_Bar], 0
    je WindowNoBar
    jmp Rets

WindowNoBar:
    mov bx, word[Window_Width]
    add bx, cx
    LineUp:
        int 10h
        inc cx
        cmp cx, bx
        jne LineUp
        mov bx, word[Window_Height]
        add bx, dx
    LineRight:
        int 10h
        inc dx
        cmp dx, bx
        jne LineRight
        mov bx, word[Window_PositionX]
    LineDown:
        int 10h
        dec cx
        cmp cx, bx
        jne LineDown
        mov bx, word[Window_PositionY]
    LineLeft:
        int 10h
        dec dx
        cmp dx, bx
        jne LineLeft

Rets:
    ret

ReturnKernel:
    ret