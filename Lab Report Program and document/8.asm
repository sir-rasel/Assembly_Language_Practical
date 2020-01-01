include "emu8086.inc"
.model small
.stack 100h
.data
    n dw ?
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,01h
        int 21h
        mov ah,0h
        sub al,48
        mov n,ax 
        
        mov cx,n
        mov ax,1h
        @fact:
            mul cx
        loop @fact
               
        printn ''       
        
        mov dx,ax
        add dx,48
        mov ah,02h
        int 21h
                
        mov ah,04ch
        int 21h
    main endp
end main