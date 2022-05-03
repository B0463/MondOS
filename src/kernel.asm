[BITS 16]
[ORG 0000h]

jmp OSMain

;+___________________________________+;
;+ \/ Directives and Inclusions______+;

%INCLUDE "src/hardware/monitor.lib"

;+ /\ _______________________________+;

;+___________________________________+;
;+ \/ Start the System_______________+;

OSMain:
    call ConfigSegment
    call ConfigStack
    call VGA.SetVideoMode
    call DrawBackground
    call EffectInit
    jmp END

;+ /\ ______________________________+;

;+__________________________________+;
;+ \/ Kernel Functions______________+;

ConfigSegment:
    mov ax, es
    mov ds, ax
    ret

ConfigStack:
    mov ax, 7D00h
    mov ss, ax
    mov sp, 03FFh
    ret

;+ /\ ______________________________+;

END:
    mov ah, 00h
    int 16h
    mov ax, 0040h
    mov ds, ax
    mov ax, 1234h
    mov [ds:0072h], ax
    jmp 0FFFFh:0000h