[BITS 16]
[ORG 0x7C00]



times 512 - ($$-$) db 0
dw 0xAA55