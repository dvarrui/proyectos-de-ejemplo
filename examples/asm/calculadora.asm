section .text
    global _start

_start:
    ; --- SUMA ---
    mov rax, 10      ; Cargar 10 en RAX
    add rax, 5       ; Sumar 5 a RAX (RAX = 15)

    ; --- RESTA ---
    mov rbx, 3       ; Cargar 3 en RBX
    sub rax, rbx     ; Restar RBX a RAX (RAX = 12)

    ; --- SALIDA ---
    ; Vamos a usar el resultado (12) como código de retorno
    ; para que puedas verlo en la terminal.
    mov rdi, rax     ; Mover el resultado a RDI (argumento de salida)
    mov rax, 60      ; Syscall para exit
    syscall
