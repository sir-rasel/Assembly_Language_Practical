include "emu8086.inc"
.model small
.stack 100h
.data
    massage db 100 dup('$')
    len db ?
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov si,offset massage
        mov cx,0h
        @input:
            mov ah,01h
            int 21h
            cmp al,13
            je @endOfInput
            inc cl
            mov [si],al
            inc si
            jmp @input
        @endOfInput:
            mov len,cl
            printn ''
            mov ah,02h
            mov dl,cl
            add dl,30h
            int 21h
        
        mov ah,04ch
        int 21h
    main endp
end main