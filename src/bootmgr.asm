[BITS 16]
[ORG 0x7C00]

call LoadSystem ;carrega o kernel
jmp 0800h:0000h ;passa o controle para o kernel

LoadSystem:
    mov ah, 02h ;carregar
    mov al, 1 ;setores 1
    mov ch, 0 ;trila 0
    mov cl, 2 ;setor 2
    mov dh, 0 ;cabesote 0
    mov dl, 80h ;primeiro disco
    mov bx, 0800h ;local 1
    mov es, bx ;ex = local 1
    mov bx, 0000h ;local 2
    int 13h ;executa
    ret ;retorna

times 510 - ($-$$) db 0
dw 0xAA55