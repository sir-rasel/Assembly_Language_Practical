include "emu8086.inc"
.model small
.stack 100h
.data
    massage db 100 dup('$')
    n db ?
.code   

    main proc
        mov ax,@data
        mov ds,ax
        
        mov si,offset massage
        @input:
            mov ah,01h
            int 21h
            cmp al,13
            je @endOfInput
            mov [si],al
            inc si
            jmp @input
        @endOfInput:
            printn ''
            mov ah,01h
            int 21h
            mov n,al
            sub n,30h
            mov cx,0h
            mov cl,n
        @for:
            printn ''
            mov ah,09h
            lea dx,massage
            int 21h
        loop @for
        
        mov ah,04ch
        int 21h
    main endp
end main
                    