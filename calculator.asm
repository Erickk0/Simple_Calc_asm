section .data
    prompt db "Enter first number: ", 0
    prompt2 db "Enter second number: ", 0
    prompt3 db "Choose operation (+ or -): ", 0
    result db "Result: ", 0
    newline db 0xA
    invalid_msg db "Invalid operation!", 0

section .bss
    num1 resb 5
    num2 resb 5
    op resb 1

section .text
    global _start

_start:
    ; Prompt for first number
    mov rax, 1                  ; sys_write
    mov rdi, 1                  ; stdout
    lea rsi, [rel prompt]       ; address of prompt message
    mov rdx, 19                 ; message length
    syscall

    ; Read first number
    mov rax, 0                  ; sys_read
    mov rdi, 0                  ; stdin
    lea rsi, [rel num1]         ; address of num1 buffer
    mov rdx, 5                  ; buffer size
    syscall

    ; Prompt for second number
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel prompt2]       ; address of prompt2 message
    mov rdx, 20
    syscall

    ; Read second number
    mov rax, 0
    mov rdi, 0
    lea rsi, [rel num2]          ; address of num2 buffer
    mov rdx, 5
    syscall

    ; Prompt for operation
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel prompt3]       ; address of prompt3 message
    mov rdx, 25
    syscall

    ; Read operation
    mov rax, 0
    mov rdi, 0
    lea rsi, [rel op]            ; address of op buffer
    mov rdx, 1
    syscall

    ; Convert num1 and num2 from ASCII to integer
    movzx rax, byte [num1]
    sub rax, '0'
    movzx rbx, byte [num2]
    sub rbx, '0'

    ; Perform the operation
    cmp byte [op], '+'
    je add_numbers
    cmp byte [op], '-'
    je subtract_numbers

    ; Invalid operation
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel invalid_msg]
    mov rdx, 17
    syscall
    jmp exit

add_numbers:
    add rax, rbx
    jmp print_result

subtract_numbers:
    sub rax, rbx

print_result:
    ; Print "Result: "
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel result]        ; address of result message
    mov rdx, 8
    syscall

    ; Convert result back to ASCII
    add rax, '0'

    ; Print the result
    mov rdi, 1
    mov rsi, rax
    mov rdx, 1
    syscall

    ; Print newline
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel newline]       ; address of newline character
    mov rdx, 1
    syscall

exit:
    ; Exit
    mov rax, 60                 ; sys_exit
    xor rdi, rdi                ; status 0
    syscall
