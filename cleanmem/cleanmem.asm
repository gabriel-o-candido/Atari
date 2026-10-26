    PROCESSOR 6502

    SEG code
    ORG $F000   ; Define the code origin at $F000

Start:
    SEI         ; Disable interrupts
    CLD         ; Disable the BCD decimal math mode
    LDX #$FF    ; Loads the X register with "#$FF"
    TXS         ; Transfer the X register to the (S)tack pointer

; Clear the page Zero region ($00 até $FF)
; ram inteira e registros TIA

    LDA #0      ; A=0
    LDX #$FF    ; X=#$FF
    STA $FF     ; make sure $FF is zeroes before the loop starts (pq o dex já tira um)
MemLoop:
    DEX         ;x--
    STA $0,X    ; Store the value of A inside in position 0 + X
    BNE MemLoop ; Loop until X is equal to zero (z-flag is set)

;Fill the rom size to exactly 4KB
    ORG $FFFC
    .word Start     ; Reset vector at $FFFC (where the program starts)
    .word Start     ; Interrupt vector at $FFFE (unused in the VCS)