section .data
    msg db "Hola desde OpenSUSE!", 10  ; 10 es el salto de línea

section .text
    global _start

_start:
    ; syscall: write(1, msg, 21)
    mov rax, 1          ; ID de syscall para 'write'
    mov rdi, 1          ; file descriptor 1 (stdout)
    mov rsi, msg        ; dirección del mensaje
    mov rdx, 21         ; longitud del mensaje
    syscall

    ; syscall: exit(0)
    mov rax, 60         ; ID de syscall para 'exit'
    xor rdi, rdi        ; código de salida 0
    syscall
