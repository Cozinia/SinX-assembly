.MODEL SMALL
 .STACK 200H
 .DATA
   numar dw 0
   x dw 0
   impartitor dw 0
   mesajIntroducere db "Introduceti valoare lui x in radiani: $"
   mesajRezultat db "sin(x) = $"
 .CODE

citireNumar proc
  mov ah, 01h
  int 21H
  mov ah, 0
  sub al, '0'
  mov numar, ax
  mov x, ax
  mov di, ax
  ret
endp

citirePutere proc

  mov bx, numar
  mov ax, numar
  mov cx, dx
  sub cx, 1
  ridicarePutere:
      mul bx
  loop ridicarePutere
  mov numar, ax
  ret
endp

impartire proc
    mov ax, numar
    mov cx, impartitor
    div cx
    mov numar, ax
    ret
endp

compunereNumar proc
  add bx, '0'
  ret
endp

scrieDeLaCapat proc
  mov dl, 0
  MOV AH, 02H                    
  MOV DL, 0DH          
  INT 21H

  MOV DL, 0AH                 
  INT 21H
  ret
endp

afisareCifra macro numar
mov ah, 02H
mov dx, offset numar
int 21h
endm

amTerminat proc
  mov ah, 04ch
  int 21h
endp

main:

mov ax, @data
mov ds, ax
mov dx, offset mesajIntroducere
mov ah, 09h
int 21h


call citireNumar

;---x^3/3!
mov dx, 3
call citirePutere
mov impartitor, 6
call impartire
mov si, ax
sbb x, ax
mov bx, x


;---x^5/5!
mov dx, 5
mov numar,di
call citirePutere
mov impartitor, 120
call impartire
mov ax, x
add ax, numar
mov x, ax


;---x^7/7!
mov dx, 7
mov numar,di
call citirePutere 
mov impartitor, 5040
call impartire
mov di, ax
mov bp, ax
sbb x, ax
mov bx, x


call compunereNumar
call scrieDeLaCapat

mov ax, @data
mov ds, ax
mov dx, offset mesajRezultat
mov ah, 09h
int 21h

afisareCifra bx

call amTerminat


 end main
