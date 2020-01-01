include "emu8086.inc"
.model small
.stack 100h
.data
    lower db 97
    upper db 65
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,01h
        int 21h
        mov dl,al
        sub dl,32
        mov ah,02h
        int 21h
        
        printn ''
        
        mov ah,01h
        int 21h
        mov dl,al
        add dl,32
        mov ah,02h
        int 21h
        
        mov ah,04ch
        int 21h
    main endp
end main