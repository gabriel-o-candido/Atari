	processor 6502
    seg Code
    org $f000

Start
    lda #$A
    ldx #%1010
    sta $80
    stx $81
    lda #10
    clc
    adc $80
    adc $81
    sta $82

    jmp Start

	org $fffc
    .word Start	; reset vector
    .word Start	; BRK vector
