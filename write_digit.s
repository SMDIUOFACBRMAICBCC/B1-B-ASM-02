section .text
global main

write_digit:
    push rbp
    mov rbp, rsp
    
    add rdi, 0x30
    push rdi
    
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    syscall
    
    add rsp, 8
    pop rbp
    ret

main:
    mov rdi, 9
    call write_digit
    
    mov rax, 60
    xor rdi, rdi
    syscall
