[BITS 16] ;seta processador de 16bits
[ORG 0x7C00] ;organisa offset ára 0x7c00

call HelloWorld ;primeira forma de hello world
call JumpLine ;pula linha
call PointerString ;aponta para a string
call PrintString ;escreve a string
call PointerBuffer ;aponta para o buffer
call ReadString ;le o usuario
call PointerStringBuffer ;aponta para o resultado do usuario
call PrintString ;imprime o resultado do usuario

HelloWorld:
    mov ah, 0eh ;defune função de bios (ah) para 0e (escrever na tela)
    mov al, 48h ;defina o parametrho da bios (al) para a caractere 48 (H)
    int 10h ;printa a caractere de fato
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
    ret ;retorna ao local do call

JumpLine:
    mov ah, 0eh
    mov al, 0ah
    int 10h 
    mov al, 0dh
    int 10h
    ret

PointerString:
    mov si, hello ;move hello para si (string para ser impressa)
    ret

PointerBuffer:
    mov di, buffer ;move buffer para di (buffer ira gaurdar o valor do usuario)
    ret

PointerStringBuffer:
    mov si, buffer ;o mesmo que PointerString mas para o buffer
    ret

PrintString:
    mov ah, 0eh
    mov al, [si] ;pega o primeiro parametro de si (hello) que é (H)
    print: ;cria subrotina
        int 10h
        inc si ;adiciona 1 ao si (pegar a proxima caractere)
        mov al, [si] ;move ultima caractere de si para al
        cmp al, 0 ;compara al com 0
        jne print ;se não for pula para print e faz o loop
    ret ;caso seja 0 ele retorna

ReadString:
    mov ah, 00h ;define bios para 00
    int 16h ;define monitor para 16 (leitura de dados)
    mov ah, 0eh
    int 10h
    mov [di], al ;move al (caractere lida) para o primeiro lugar de di
    inc di ;adiciona um a di
    cmp al, 0dh ;compara di com pulalinha
    jne ReadString ;caso não ele cria loop
    mov ah, 1eh ;caso sim ele define bios para 1e (escrever)
    mov al, 0ah ;defina parametro de bios para 0a (pulalinha)
    int 10h ;escreve de fato
    ret

hello db "Hello World!",13,10,0 ;define hello como a string "Hello World!" e coloca 13 (pula linha) 10 e 0 (fim de string)
buffer times 20 db 0 ; define buffer em 20 espaços com 0 escrito
times 512 - ($$-$) db 0 ;define o arquivo no primeiro setor
dw 0xAA55 ;define que existe sistema