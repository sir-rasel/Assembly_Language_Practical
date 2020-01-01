include "emu8086.inc"
.model small
.stack 100h
.data
    massage db 100 dup('$')
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
            mov [si],al
            inc si
            inc cl
            push ax
            jmp @input
        @endOfInput:
        mov ah,02h
        @reverseDisplay:
            pop dx
            int 21h
        loop @reverseDisplay
        
        mov ah,04ch
        int 21h
    main endp
end main