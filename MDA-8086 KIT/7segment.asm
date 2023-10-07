PPIC_C EQU 1FH
PPIC   EQU 1DH
PPIB   EQU 1BH
PPIA   EQU 19H
       ORG 1000H
       MOV AL,10000000B
       OUT PPIC_C,AL
       MOV AL,11111111B
       OUT PPIA,AL
L1:    MOV AL,11000000B;0
       OUT PPIA,AL
       CALL DELAY
       MOV AL,11111001B;1
       OUT PPIA,AL
       CALL DELAY
       MOV AL,10100100B;2 
       OUT PPIA,AL
       CALL DELAY
       MOV AL,10110000B;3
       OUT PPIA,AL
       CALL DELAY
       MOV AL,10011001B;4
       OUT PPIA,AL
       CALL DELAY 
       MOV AL,10010010B;5
       OUT PPIA,AL
       CALL DELAY
       MOV AL,10000010B;6
       OUT PPIA,AL
       CALL DELAY
       MOV AL,11111000B;7
       OUT PPIA,AL
       CALL DELAY   
       MOV AL,10000000B;8
       OUT PPIA,AL
       CALL DELAY  
       MOV AL,10010000B;9
       OUT PPIA,AL
       CALL DELAY 
       JMP L1
       
DELAY:MOV CX,0FFFFH
TIMER1:NOP
      NOP
      NOP
      NOP
      LOOP TIMER1
      RET