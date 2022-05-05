[BITS 16]
[ORG 0000h]

jmp OSMain

;+___________________________________+;
;+ \/ Directives and Inclusions______+;

%INCLUDE "src/hardware/wmemory.lib"
%INCLUDE "src/hardware/monitor.lib"
%INCLUDE "src/hardware/disk.lib"

;+ /\ _______________________________+;

;+___________________________________+;
;+ \/ Start the System_______________+;

OSMain:
    call ConfigSegment
    call ConfigStack
    call VGA.SetVideoMode
    call DrawBackground
    call EffectInit
    call GraficInterface
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

GraficInterface:
    mov byte[Window_Bar], 0
    mov word[Window_PositionX], 5
    mov word[Window_PositionY], 5
    mov word[Window_Width], 100
    mov word[Window_Height], 150
    mov byte[Window_Border_Color], 1010b
    mov byte[Sector], 3
    mov byte[Drive], 80h
    mov byte[NumSectors], 1
    mov word[SegmentAddr], 0800h
    mov word[OffsetAddr], 0500h
    call ReadDisk
    call WindowAddress
    mov word[Window_PositionX], 110
    mov word[Window_PositionY], 5
    mov word[Window_Width], 50
    mov word[Window_Height], 50
    call WindowAddress
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