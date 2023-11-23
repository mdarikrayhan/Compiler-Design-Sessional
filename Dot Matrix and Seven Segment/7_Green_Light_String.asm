CODE SEGMENT 
ASSUME CS:CODE,DS:CODE,ES:CODE,SS:CODE

PPIC_C EQU 1EH
PPIC   EQU 1CH ; Port C is row. It is turned on one by 1
PPIB   EQU 1AH ; Port B is Coloum. Red LED is connected to bit 0 of port B
PPIA   EQU 18H ; Port A is Coloum. Green LED is connected to bit 0 of port A

MOV AL,10000000B
OUT PPIC_C,AL
MOV AL,11111111B
OUT PPIB,AL

L1:
      MOV SI,OFFSET FONTA
      MOV AH,11111110B

L2:
      MOV AL,AH
      OUT PPIA,AL
      MOV AL,BYTE PTR CS:[SI]
      OUT PPIC,AL
      CALL TIMER
      MOV AL,00H
      OUT PPIB,AL
      INC SI
      CLC
      ROL AH,1
      JC L2
JMP L3

L3:
      DELAY:MOV CX,0FFFFH
      DELAY0:LOOP DELAY0
      MOV SI,OFFSET FONTB
      MOV AH,11111110B

L4:
      MOV AL,AH
      OUT PPIA,AL
      MOV AL,BYTE PTR CS:[SI]
      OUT PPIC,AL
      CALL TIMER
      MOV AL,00H
      OUT PPIB,AL
      INC SI
      CLC
      ROR AH,1
      JC L4
JMP L1

TIMER:
      MOV CX,100
TIMER1:
      NOP
      NOP
      NOP
      LOOP TIMER1
      RET

FONTA:DB 00000000B
      DB 11111100B
      DB 00010010B
      DB 00010001B
      DB 00010001B
      DB 00010010B
      DB 11111100B
      DB 00000000B

FONTB:
      DB 00000000B
      DB 00000000B
      DB 11000110B
      DB 10101001B
      DB 10011001B
      DB 10010001B
      DB 11111111B
      DB 00000000B

CODE ENDS
END

