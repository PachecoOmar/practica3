;------------------------------------
; Hola mundo, assembly, linux
;
; Compilar:
; nasm -f elf64 -o hola.o hola.asm
; ld -s -o hola hola.o
;------------------------------------

; creo constantes
stdout equ 1

section .data
    msg db 'Hola mundo!',0
    lon db $-msg      ; calculo tamanio del string

section .text
    global _start

_start:
    ; imprime la cadena
    mov eax, 4        ; syscall write
    mov ebx, stdout   ; fd stdout
    mov ecx, msg      ; puntero a la cadena
    mov edx, lon      ; longitud de la cadena
    int 0x80          ; llama al kernel

    ; finaliza el programa
    mov eax, 1        ; syscall exit
    xor ebx, ebx      ; retorno 0
    int 0x80          ; llama al kernel

