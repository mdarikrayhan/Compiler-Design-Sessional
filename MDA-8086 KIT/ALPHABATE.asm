ORG 1000H
MOV AL, 10000000B
OUT 1EH, AL
MOV AL, 11111111B
OUT 18H, AL
L1: MOV SI, OFFSET FONT
    MOV AH, 11111110B
    
L2: MOV AL, BYTE PTR CS:[SI]
    OUT 1CH, AL
    MOV AL, AH
    OUT 1AH, AL
    MOV CX, 300
    L0: LOOP L0
    INC SI
    CLC
    ROL AH, 1
    JC L2
    JMP L1 



FONT: DB 10000001B
      DB 01000010B
      DB 00100100B
      DB 00011000B
      DB 00011000B
      DB 00100100B
      DB 01000010B
      DB 10000001B          