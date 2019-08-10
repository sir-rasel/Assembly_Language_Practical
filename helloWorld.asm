name "Hello World"          ;this is like declaration section in c/c++
 
include emu8086.inc         ;this is include section, like linking section in c/c++
 
.model small                ;size of program : tiny,small,compact,medium,large,huge

.stack 100h                 ;define stack memory size, that is used to store data and procedure

.data                       ;all global variable be declared in this segment
    massage1 db "Hello World! $"
    massage2 db "I am now learning Assembly language! $"
     
.code                       ;code segment hold actual instruction code with procedure and macro

massagePrint macro massage  ;define a macro, its work like inline function in c++, define in c
    lea dx,massage
    mov ah,09h
    int 21h
endm   
                            ;main procedure, like main function in c/c++ 
main proc
    mov ax,@data            ;load all data variable 
    mov ds,ax
    
    massagePrint massage1
    
    call printNewLine
    
    massagePrint massage2
    
    mov ah,4ch              ;its return control to operating system, works like return 0 in c/c++
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
  