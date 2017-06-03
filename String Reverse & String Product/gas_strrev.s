# 12(%ebp) string length
# 8(%ebp) array base address #1
.globl	_Z6strrevPci
_Z6strrevPci:

	# Push and pop onto stack.
	push	%ebp
	movl	%esp, %ebp


	# move the length of the string to %ecx
	movl 	12(%ebp), %ecx

	# move the array base address #1 to %edx
	movl 	8(%ebp), %esi

	# Jump to the "helper"
	jmp 	.loopHelper

.loopHelper:

	# Subtract 1 from %ecx. Aka "left counter"
   	decl	%ecx 
		
	# Start another right "counter"	
	movl	$0, %edi	        
				
	# Jump to the loop
	jmp  .theLoop			
	
.theLoop:
	
		
	# Using legacy registers to transfer chars.
	movb	(%esi, %edi, 1), %AL
	movb	(%esi, %ecx, 1), %AH
	movb	%AL, (%esi, %ecx, 1)
	movb	%AH, (%esi, %edi, 1) 
	
	# "Counter" arithmetic
	inc	%edi
	dec 	%ecx	
	
	# Compare ecx to ebx.
	cmp	%ecx, %edi

	# If they are not equal, go back to loop
	jne	.theLoop

	# If they are equal, go to out
	je	.out

	
.out:	
	# Move the result to %eax which will be returned.
	movl	%esi, %eax

	# Basic stack popping to end.
	popl	%ebp
	ret


	# GNU doesn't like it when ret 
	# is at the very bottom with no spacing 
	# under it. This is just to note for me
	# to ask in class why this is so.



