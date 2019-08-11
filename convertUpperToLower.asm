name "Convert a chaecter to uppercase from lowercase"          ;this is like declaration section in c/c++
 
include emu8086.inc         ;this is include section, like linking section in c/c++
 
.model small                ;size of program : tiny,small,compact,medium,large,huge

.stack 100h                 ;define stack memory size, that is used to store data and procedure

.data                       ;all global variable be declared in this segment
    massage1 db "Enter a upper case letter:  $"
    massage2 db "The converted Lower case letter is : $"
    char db ?
     
.code                       ;code segment hold actual instruction code with procedure and macro

massagePrint macro massage  ;define a macro, its work like inline function in c++, define in c
    lea dx,massage          ;macro for print a massage
    mov ah,09h
    int 21h
endm
                            ;macro for input a charecter
inputCharecter macro 
    mov ah,01h
    int 21h
    mov bl,al
endm

convertCase macro           ;macro for convert case of charecter
    add bl,20h
    mov char,bl
endm

outputCharecter macro       ;macro for output a charecter
    mov ah,02h
    mov dl,char
    int 21h
endm
                            ;main procedure, like main function in c/c++ 
main proc
    mov ax,@data            ;load all data variable 
    mov ds,ax
    
    massagePrint massage1
    
    inputCharecter
    
    call printNewLine
    
    massagePrint massage2
    
    convertCase
    
    outputCharecter
    
    call printNewLine
    
    
    
    mov ah,4ch              ;its return control to operating system, works like return 0 in c/c++
    int 21h
    
main endp

printNewLine proc
    mov ah, 02h             ;its a aditional procedure, like user define funtion in c/c++
    mov dl,0dh              ;procedure for print a new line
    int 21h   
    mov dl,0ah
    int 21h
    ret
printNewLine endp

endp
  