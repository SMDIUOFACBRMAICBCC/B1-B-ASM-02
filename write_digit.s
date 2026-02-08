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

write_number:
    push rbp
    mov rbp, rsp
    mov rax, rdi
    mov rcx, 0

.loop_div:
    mov rdx, 0
    mov rbx, 10
    div rbx
    push rdx
    inc rcx
    cmp rax, 0
    jne .loop_div

.loop_display:
    pop rdi
    push rcx
    call write_digit
    pop rcx
    loop .loop_display

    pop rbp
    ret

main:
    mov rdi, 12345
    call write_number
    
    mov rax, 60
    xor rdi, rdi
    syscall
