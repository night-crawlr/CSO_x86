.global _start

.text

_start: 
       mov $360,%r8         #r8 is takin input
       mov %r8,%rax        #rax=45 ie test case
       mov %r8,%rbx        #rbx=45 ie test case
       mov %rbx,%r12         #r8=40; it is used as temp if required
       mov $1,%r9           #creating another temp avr it has 1
       mov $1,%r10          #creating another temp avr it has 1
       mov $1,%rax          #storing 1 in rax
for_loop:                   #starting of for loop
mov %r10,%rcx               #r10 act as i rcx is temp of i
jmp factorial               #going to do fac for i
end_fac:                    #after compleing fac
mov $1,%r9                  #reseting fac var(r9) by 1
idivq %rbx                  #dividing rax by rbx
mov $1,%rax                 #reseting fac var rax by 1
cmp $0,%rdx                 #comparing remainder
je completed                #if it is zero then programm is completed
inc %r10                    #if not for loop continues by incrementing i
jmp for_loop




factorial: 
imulq %r9                  #r9 has 1 initialy multiplying and storing in rax
cmp %r9,%rcx               #it is for no of times the product has happened ie 4!=4*3*2*1 this should happen 4 times
je end_fac                 #if num of times completed return to back by end_fac label
inc %r9                    #incrementing fac local var
jmp factorial              #if not jmp back then factorial loop continues till it computinf factorial

completed:                
mov %rcx,%rdi              #moving answer to rdi

mov $60,%rax
xor %rdx,%rdx
mov %rdi,%r11             #moving output to r11
syscall


