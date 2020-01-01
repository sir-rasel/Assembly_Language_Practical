include "emu8086.inc"
.model small
.stack 100h
.data
    lowerCase db 97
    upperCase db 65
.code 
    
    printAllCharecters macro case
        mov ah,02h
        mov cx,26
        mov dl,case
        
        @loop:
            int 21h
            inc dl
            dec cx
        jnz @loop
    endm
        
    main proc
        mov ax,@data
        mov ds,ax
        
        printAllCharecters lowerCase 
        
        mov ah,04ch
        int 21h
    main endp  
               
end main