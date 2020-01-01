include "emu8086.inc"
.model small
.stack 100h
.data
    n db ?
    sum db 0
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,01h
        int 21h
        sub al,48
        mov n,al 
        
        mov dl,n
        inc dl
        
        mov ah,0h
        mul dl
        
        mov bl,2
        div bl
        mov sum,al
        
        mov ah,02h
        mov dl,sum
        add dl,48
        int 21h
                
        mov ah,04ch
        int 21h
    main endp
end main