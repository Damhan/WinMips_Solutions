.data
n: .word 1000
i: .word 4
CONTROL: .word 0x10000
DATA:    .word 0x10008

.text

ld r20,CONTROL(r0)
ld r21,DATA(r0)

ld r1,i(r0) ; put i in r1
ld r2, n(r0) ; put n in r2

daddi r8,r0,1
daddi r9,r0,4
first3primes:
beq r8,r9,loop1

sd r8,0(r21) ;set data to the int value
daddi r6,r0,2 ; put two in r6
sd r6,0(r20) ; use int code to push it out
daddi r8,r8,1;inc r8s

j first3primes

loop1:
daddi r3,r0,2 ; make counter j for inner loop starting at 2
beq r1, r2, done ; compare i to n (r1 to r2)

loop2:
daddi r5,r1,-1 ;set r5 to i-1
beq r3,r5,pridone ;jump when j one less than i


ddiv r4,r1,r3 ; divide i by j and put in r4
dmul r7,r4,r3 ;multiply j * the division result
dsub r4,r1,r7 ; minus the mul result from i and put in r4
daddi r3,r3,1
beqz r4, divides ;if r4 = 0 it's not prime, otherwise its prime

j loop2

divides:
daddi r1,r1,1 ; add one to is
j loop1 ;jump out to outer loop because it wasnt prime

pridone:
sd r1,0(r21) ;set data to the int value
daddi r6,r0,2 ; put two in r6
sd r6,0(r20) ; use int code to push it out

daddi r1,r1,1 ; add one to i
j loop1

done:
  halt ;end the program
