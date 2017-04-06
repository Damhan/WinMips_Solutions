.data
str: .asciiz "hello"
CONTROL: .word 0x10000
DATA:    .word 0x10008


.text
ld r20,CONTROL(r0)
ld r21,DATA(r0)

daddi r1,r0,1 ; 1 into r1
daddi r2,r0,71 ;capital into r2

sb r2, str(r1) ;put byte r2 into pos r1

daddi r1,r0,str
sd r1,0(r21)     ; set DATA to output value (address of string, here)

daddi r1,r0,4
sd r1,0(r20)     ; write CONTROL
