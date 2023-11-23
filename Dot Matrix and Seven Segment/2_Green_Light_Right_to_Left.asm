CODE SEGMENT 
ASSUME CS:CODE,DS:CODE,ES:CODE,SS:CODE
;
PPIC_C EQU 1EH
PPIC   EQU 1CH;Port C is row. It is turned on one by 1
PPIB   EQU 1AH;Port B is Coloum. Red LED is connected to bit 0 of port B
PPIA   EQU 18H;Port A is Coloum. Green LED is connected to bit 0 of port A
ORG 1000H
MOV AL, 10000000B
OUT PPIC_C, AL
MOV AL, 11111111B
OUT PPIB, AL;Port B(Red Light) is turned off (all bits are 1)
;
    
    MOV AL,11111111B
    OUT PPIC,AL
    
    MOV AL,11111110B; Coloum is all active     
     

L1: OUT PPIA,AL
    CALL DELAY
    ROL AL,1;rotate the value in AL to the right by 1 position

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