include "emu8086.inc"
.model small
.stack 100h
.data
    n db ?
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,01h
        int 21h
        mov n,al
        
        test n,01h
        printn ''
        je @even
        
        @odd:
            printn 'Odd'
            jmp @exit
        @even:
            printn 'Even'
        @exit:
            mov ah,04ch
            int 21h
    main endp
end main