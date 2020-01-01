include "emu8086.inc"
.model small
.stack 100h
.data
    m db 10
    n db 5
    p db 11
    result db ?
.code
    main proc
        mov ax,@data
        mov ds,ax
               
        mov al,m       
        add al,n
        sub al,p
        inc al
        mov result,al
        
        mov ah,02h
        mov dl,result
        add dl,48
        int 21h
                
        mov ah,04ch
        int 21h
    main endp
end main