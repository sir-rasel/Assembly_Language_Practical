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
        @input1:
            mov ah,01h
            int 21h
            cmp al,13
            je @endOfInput1
            inc cl
            mov [si],al
            inc si
            jmp @input1
        @endOfInput1:
        printn ''
        @input2:
            mov ah,01h
            int 21h
            cmp al,13
            je @endOfInput2
            inc cl
            mov [si],al
            inc si
            jmp @input2
        @endOfInput2:
            printn ''
            mov ah,09h
            lea dx,massage
            int 21h
        
        mov ah,04ch
        int 21h
    main endp
end main