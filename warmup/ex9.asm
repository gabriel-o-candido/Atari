    processor 6502
    seg Code
    org $F000
Start:

    
    


    ORG $FFFC
    .word Start     ; Reset vector at $FFFC (where the program starts)
    .word Start     ; Interrupt vector at $FFFE (unused in the VCS)