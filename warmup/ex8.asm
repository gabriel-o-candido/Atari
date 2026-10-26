	processor 6502
    seg Code
    org $f000

Start:
    ldy #10

Loop:
    tya
    sta $80,Y
    dey
    bne Loop
    sty $80


    jmp Start

	org $fffc
    .word Start	; reset vector
    .word Start	; BRK vector