[BITS 16]
[ORG 0500h]

pusha
call DefineWindow
popa
jmp ReturnKernel

DefineWindow:
    mov ah, 0Ch
    mov al, 1010b
    mov cx, 50
    mov dx, 50
    jmp Window

Window:
    LineUp:
        int 10h
        inc cx
        cmp cx, 100
        jne LineUp
    LineRight:
        int 10h
        inc dx
        cmp dx, 100
        jne LineRight
    LineDown:
        int 10h
        dec cx
        cmp cx, 50
        jne LineDown
    LineLeft:
        int 10h
        dec dx
        cmp dx, 50
        jne LineLeft
    ret

ReturnKernel:
    ret