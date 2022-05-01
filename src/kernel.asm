org 0000h                       ;organiza o offset

push cs                         ;CS = endereço do programa atual
pop ds                          ;DS = CS

call clearscreen               ;chama procedure de limpar a tela

lea si, Mensagem                ;SI = endereço da mensagem
mov ah, 0Eh                     ;subfuncao para imprimir caractere

repetição:

    mov al, [si]                ;move para AL o caractere em SI
    cmp al, 0h                  ;compara com 0 ( fim da string )
    jz terminou                 ;caso terminou, pule para ‘terminou’
    int 10h                     ;interrupção de video
    inc si                      ;próximo caractere
    jmp repetição               ;repete o processo ate achar o 0

terminou:

mov ah, 0h                      ;subfuncao de aguardar tecla
int 16h                         ;interrupção de teclado

mov ax, 0040h                   ;método de reboot consiste em setar_
mov ds, ax                      ;o valor do endereço 0040:0072h_
mov w.[0072h], 1234h            ;para 1234h e pular para o endereço_
jmp 0FFFFh:0000h                ;FFFF:0000h

clearscreen proc                ;procedure de limpar a tela
    pusha                       ;coloca todos os reg na pilha

    mov     ah, 06h             ;subfuncao de rolar a tela pra cima 
    mov     al, 0               ;limpa a tela
    mov     bh, 0000_1111b      ;seta as cores ( fundo_texto )
    mov     ch, 0               ;linha do canto sup. esq.
    mov     cl, 0               ;coluna do canto sup. esq.
    mov     dh, 19h             ;linha do canto inf. dir. ( 25 )
    mov     dl, 50h             ;coluna do canto inf. dir. ( 80 )
    int     10h                 ;interrupção de vídeo

    popa                        ;repõe os valores dos registradores
    ret                         ;retorna para o código
clearscreen endp   

Mensagem db ‘Hello World’,0 ;nossa string que vai ser exibida