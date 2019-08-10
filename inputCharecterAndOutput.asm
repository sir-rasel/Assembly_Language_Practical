name "input and output charecter"          ;this is like declaration section in c/c++
 
include emu8086.inc         ;this is include section, like linking section in c/c++
 
.model small                ;size of program : tiny,small,compact,medium,large,huge

.stack 100h                 ;define stack memory size, that is used to store data and procedure

.data                       ;all global variable be declared in this segment
    number1 db 10
    number2 db 20
    sum db ?
    
     
.code                       ;code segment hold actual instruction code with procedure and macro

inputCharecter macro        ;define a macro, its work like inline function in c++, define in c
    mov ah,01h
    int 21h
    mov bl,al
endm

outputCharecter macro       ;define a macro, its work like inline function in c++, define in c
    mov ah,02h
    mov dl,bl
    int 21h
endm
                            ;main procedure, like main function in c/c++ 
main proc
    mov ax,@data            ;load all data variable 
    mov ds,ax
    
    inputCharecter
    
    call printNewLine
    
    
    outputCharecter
    
                            ;its return control to operating system, works like return 0 in c/c++
    mov ah,4ch
    int 21h
    
main endp

printNewLine proc
    mov ah, 02h             ;its a aditional procedure, like user define funtion in c/c++
    mov dl,0dh
    int 21h   
    mov dl,0ah
    int 21h
    ret
printNewLine endp

endp
  