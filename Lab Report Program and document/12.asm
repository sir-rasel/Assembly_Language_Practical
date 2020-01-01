include "emu8086.inc"
.model small
.stack 100h
.data
    x db 1,1,2,1
    y db 2,1,1,3
    n db 4
    result dw 0
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ch,0h
        mov cl,n
        
        @looping:
            mov si,cx
            dec si
            mov al,x[si]
            mul y[si]
            add result,ax
        loop @looping
        
        mov ah,02h
        mov dx,result
        add dx,48
        int 21h
        
        mov ah,04ch
        int 21h
    main endp
end main