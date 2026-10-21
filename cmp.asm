default rel   
global main    
extern printf   

section .data
    fmt_equal   db "%d is equal to %d", 10, 0
    fmt_greater db "%d is greater than %d", 10, 0
    fmt_less    db "%d is less than %d", 10, 0

section .text
main:
    mov rbx, 20         ; Первое число (A)
    mov rbp, 15         ; Второе число (B)

    cmp rbx, rbp        
    
    ; СИТУАЦИЯ 1: Если равны 
    ; СИТУАЦИЯ 2: Если A > B 
    ; СИТУАЦИЯ 3: Если A < B 

.equal_case:
    mov rcx, fmt_equal  
    mov rdx, rbx        
    mov r8, rbp         
    jmp .print_res      

.greater_case:
    mov rcx, fmt_greater
    mov rdx, rbx
    mov r8, rbp
    jmp .print_res

.less_case:
    mov rcx, fmt_less
    mov rdx, rbx
    mov r8, rbp
    jmp .print_res

.print_res:
    sub rsp, 40         
    call printf   
    add rsp, 40               

    xor eax, eax        
    ret
