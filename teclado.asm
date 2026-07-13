section .data
    msg db "digite uma palavra de 5 letras: ", 10
    tam_msg equ $ - msg

    tam_entrada equ 5

section .bss
    buffer resb 5

section .text
    global _start

_start:

    ; mostra a mensagem
    mov eax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, tam_msg
    syscall

    ; pega a entrada
    mov eax, 0
    mov edi, 0
    mov rsi, buffer
    mov edx, tam_entrada
    syscall

    
    cmp dword [buffer], 'RIAS'
    je sair


    ; mostra a entrada do user
    mov eax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, tam_entrada
    syscall


sair:
    ; encerra o programa
    mov eax, 60
    mov rdi, 0
    syscall