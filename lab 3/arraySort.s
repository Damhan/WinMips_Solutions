.data

a:      .word 23      ; a[0]
        .word 12      ; a[1]
        .word 19      ; a[2]
        .word 9       ; .
        .word 98      ; .
        .word 4       ; .
        .word 7
        .word 9
        .word 30405
        .word 21
        .word 16288
        .word 26483
        .word 9982
        .word 261
        .word 5025
        .word 18825
        .word 30405
        .word 9575
        .word 9575
        .word 25247   ; a[19]

CONTROL: .word 0x10000
DATA:    .word 0x10008


.text

daddi r1,r0,1 ;initialize an i
daddi r6,r0,19 ;initialize a length of array counter

daddi r11,r0,8
daddi r9,r0,2

ld r20,CONTROL(r0)
ld r21,DATA(r0)

loop1:
daddi r5,r0,1 ;set r5 to 1
beq r1,r6,finished ;if r1 = r6 we are at the end so we need to reset i
dmul r2,r1,r11 ;multiply i * 8 and put in r2

ld r4,a(r2) ;get value at memory address r2
daddi r2,r1,-1 ;put i-1 in r2

dmul r2,r2,r11  ;multiply it by 8
ld r3,a(r2);get value at memory adress i-1 (r2)

sltu r5,r4,r3  ;set r5 to 0 if r3 < r4
beqz r5, sorted

;otherwise we swap em :)
daddi r2,r1,-1
dmul r2,r2,r11
sd r4,a(r2) ;store into the i-1 * 8
dadd r2,r0,r1 ;put i back into r2
dmul r2,r1,r11 ;mul by 8
sd r3,a(r2) ;store it

daddi r1,r0,1 ;set back to 0

j loop1

sorted:

daddi r1,r1,1 ;i++
j loop1
finished:

daddi r1,r0,0 ;set i to 0 for printing
print:
beq r1,r6,endit
dmul r7,r1,r11
ld r8,a(r7)

dadd r9,r0,r8
sd r9,0(r21)

daddi r9,r0,2
sd r9,0(r20)

daddi r1,r1,1 ;i++
j print

endit:
halt
