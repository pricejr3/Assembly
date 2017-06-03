# 16(%ebp) array length
# 12(%ebp) array base address #2
# 8(%ebp) array base address #1
.globl _Z7productPiS_i
_Z7productPiS_i:

	# Basic steps
	push	%ebp
	movl	%esp, %ebp

	# move size of array and base address into registers
	movl 	16(%ebp), %ecx
	movl 	12(%ebp), %esi
	movl 	8(%ebp), %edi

	# Jump to the "helper"
	jmp 	.loopHelper

.loopHelper:

	# Used for counter
   	dec	%ecx 
		
	# %eax is used to store product
	movl	$0, %eax		        
				
	# Jump to the loop
	jmp  .theLoop			
	
.theLoop:
	
	# Moves the values at each index 
	# to appropriate temp. register
	movl	(%esi, %ecx, 4), %edx
	movl	(%edi, %ecx, 4), %ebx

	# Multiplies the registers
	imull	%edx, %ebx

	# Adds all of the products
	addl	%ebx, %eax

	# Decrement loop counter
	dec 	%ecx

	# Jump back to loop if needed
	jns	.theLoop

	# jump out of the function
	jmp 	.out
	
.out:	

	popl	%ebp
	ret
	