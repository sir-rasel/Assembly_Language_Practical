INCLUDE "emu8086.inc"
.model small
.stack 100h
.data
    array DB 5 dup('?')
.code  
main PROC
    MOV AX, @data
    MOV DS, AX
    print "Enter 5 Numbers: "
    MOV SI, OFFSET array
    MOV CX, 5
    LOOP1:
        MOV AH, 1
        INT 21h
        MOV [SI], AL
        print " "
        INC SI
    LOOP  loop1
    printn "" 
    MOV BX, 5
    LEA SI, array
    CALL BUBBLE_SORT
    MOV SI, OFFSET array
    MOV CX, 5
    LOOP2:
        MOV AH, 2
        MOV DL, [SI]
        INT 21h
        print " "
        INC SI
    LOOP lOOP2
    printn ""
    MOV AH, 4ch
    INT 21h    
    main ENDP
    BUBBLE_SORT PROC
       MOV AX, SI 
       MOV CX, BX
       DEC CX
       @OUTER_LOOP:     
         MOV BX, CX         
         MOV SI, AX          
         MOV DI, AX         
         INC DI               
         @INNER_LOOP: 
           MOV DL, [SI]          
           CMP [DI], DL        
           JNG @SKIP_EXCHANGE   
           XCHG DL, [DI]         
           MOV [SI], DL       
           @SKIP_EXCHANGE:        
           INC SI               
           INC DI              
           DEC BX               
         JNZ @INNER_LOOP        
       LOOP @OUTER_LOOP         
       RET
     BUBBLE_SORT ENDP
END main