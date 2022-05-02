org 7C00h                       ;organiza o offset

;inicialização da pilha
mov     ax, 07C0h
mov     ss, ax                  ;seta o SS para 07C0h
mov     sp, 03FEh               ;aponta para o topo da pilha

;seta segmento de dados
xor     ax, ax                  ;zera AX
mov     ds, ax                  ;seta o segmento de dados par 0000h

;altera o modo de vídeo
mov     ah, 00h                 ;subfucao para setar modo de vídeo
mov     al, 03h                 ;03h = 80x25, 16 cores
int     10h                     ;interrupt de vídeo

;le dados do disquete
mov     ah, 02h                 ;subfunção de leitura
mov     al, 1                   ;numero de setores para ler
mov     ch, 0                   ;trilha ( cylinder )
mov     cl, 2                   ;setor
mov     dh, 0                   ;cabeça
mov     dl, 0                   ;drive ( 00h = A: )
mov     bx, 0800h               ;ES:BX aponta para o local da memória_
mov     es, bx                  ;onde vai ser escrito os dados_
mov     bx, 0                   ;0800:0000h ( ES = 0800h, BX = 0000h )
int     13h                     ;interrupt de disquete

jmp     0800h:0000h             ;pula para o local onde está o kernel
;e passa a execução para ele



; [SOURCE]: C:\Users\b.0463\Desktop\mycode.asm
