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
        
        mov ch,0h
        mov cl,n
        @inputSeries:
            int 21h
            sub al,48
            add sum,al
        loop @inputSeries
        
        printn ''
        
        mov ah,02h
        mov dl,sum
        add dl,48
        int 21h
                
        mov ah,04ch
        int 21h
    main endp
end main