CODE SEGMENT 
ASSUME CS:CODE,DS:CODE,ES:CODE,SS:CODE
;
PPIC_C EQU 06H
PPIC   EQU 04H
PPIB   EQU 02H
PPIA   EQU 00H
    ;
    ORG 0000H
    MOV Al,10000000B
    OUT PPIC_C,AL  
    
    MOV AL,11111111B;row er value all 1
    OUT PPIA,AL

    MOV AL,01111111B

L1: OUT PPIB,AL
    CALL DELAY
    ROR AL,1;rotate the value in AL to the right by 1 position

    JMP L1

DELAY: MOV CX,11111111111111B
TIMER1: NOP
    NOP
    NOP
    NOP
    LOOP TIMER1
    RET
    ;
CODE ENDS
END