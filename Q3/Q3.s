.global _start

.text

_start: 
mov $3,%r8               #a=test case
mov $5,%r9               #b=test case
mov $123,%r10             #n=test case
mov $1,%rax              #1.acc=1  i will reset rax to 1 after every unneccesary use
mov $0,%rcx              #rcx has 0 for comparing purpose

mov %r8,%rax            #moving a into rax to  perform div operation
idivq %r10              #performing div with n
mov %rdx,%r8            #2.a=rdx ie a=a modn
mov $1,%rax             #as said in 1. statement

while:
cmp %r9,%rcx           #3.it has 0-r9
jns end_while         #3.if 0-r9 is negative ie r9 is posotive exit wile loop
mov %r9,%rbx           #rbx is temp it has r9
and $1,%rbx            #rbx=rbx&1
cmp $1,%rbx            #4.if r9 is odd

je odd                 #4.acts as if staement for above condition
odd_ended:
jmp even               #6.acts as satetement after if statement
even_ended:
jmp while              #9.ended that iteration of while loop


odd:
imulq %r8            #after mulytiplication result stored in rax ie acc => acc=acc*r8(a);
idivq %r10           #5.viding acc with r10 ie (acc*a)%n
mov %rdx,%rax        #5.oring remainder a%n in a
jmp odd_ended
even:
sar $1,%r9             #7.arithematic right shift is used to do r10=r10/2;
mov %rax,%r11        #as in my program rax is acc when id o mul or div value in it erased so tempvar is used to store rax
mov %r8,%rax         #moving r8 to rax to do mul
imulq %rax           #8.doing rax=a*a
idivq %r10           #8.rax/r10
mov %rdx,%r8         #storing remainder in r8 ie a
mov %r11,%rax        #moving bach acc value to rax from temp
jmp even_ended

end_while:
mov %rax,%rdi       #10.stores rax to rdi 
mov     $60, %rax               # system call 60 is exit
xor     %rdx, %rdx              # we want return code 0
mov %rdi,%r11
syscall

