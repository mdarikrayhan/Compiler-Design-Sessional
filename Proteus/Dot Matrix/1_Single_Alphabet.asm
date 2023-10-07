CODE SEGMENT
ASSUME CS:CODE, DS:CODE;
PPIC_C EQU 06H;
PPIC   EQU 04H;
PPIB   EQU 02H
PPIA   EQU 00H
;

ORG 0000H
MOV AL,10000000B
OUT PPIC_C,AL
;

L1:

MOV SI,OFFSET FONT1;
MOV AH,11111110B;


L2:MOV AL,AH
   OUT PPIB,AL
   MOV AL,BYTE PTR CS:[SI]
   OUT PPIA,AL
   ;
   CALL TIMER
   MOV AL,00H
   OUT PPIA,AL
   
   INC SI
   CLC
   ROL AH,1
   JC L2
    
   JMP L1
   


TIMER:MOV CX,100
TIMER1:NOP
       NOP
       NOP
      
       
       LOOP TIMER1
       RET
       ;

FONT1:DB 00000000B
      DB 00000000B
      DB 11000110B
      DB 10101001B
      DB 10011001B
      DB 10010001B
      DB 11111111B
      DB 00000000B
               
          
CODE ENDS
    END