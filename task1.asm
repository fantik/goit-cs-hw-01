org  0x100               ; .COM program, code starts at 0x100

section .text
_start:
    mov al, [b]          ; b - c + a, start from b
    sub al, [c]          ; subtract c
    add al, [a]          ; add a

    add al, 30h          ; one-digit number to ASCII
    mov bl, al           ; DOS print may overwrite AL

    mov ah, 09h          ; DOS: print a string
    lea dx, resultMsg
    int 21h

    mov dl, bl           ; print the result character
    mov ah, 02h
    int 21h

    mov ax, 4c00h        ; DOS: exit
    int 21h

section .data
    a db 5               ; same values as in the lecture
    b db 3
    c db 2
    resultMsg db 'Result: $'
