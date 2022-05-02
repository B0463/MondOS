[BITS 16]
[ORG 0x7C00]

call HelloWorld
call JumpLine

HelloWorld:
    mov ah, 0eh
    mov al, 48h
    int 10h
    mov al, 65h
    int 10h
    mov al, 6ch
    int 10h
    mov al, 6ch
    int 10h
    mov al, 20h
    int 10h
    mov al, 57h
    int 10h
    mov al, 6fh
    int 10h
    mov al, 72h
    int 10h
    mov al, 6ch
    int 10h
    mov al, 64h
    int 10h
    ret

JumpLine:
    mov ah, 0eh
    mov al, 0ah
    int 10h 
    mov al, 0dh
    int 10h
    ret

times 512 - ($$-$) db 0
dw 0xAA55