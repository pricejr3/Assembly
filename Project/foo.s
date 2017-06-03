#12 is the address of b
#8 is the address of a

.globl _Z3fooii
	
_Z3fooii:

	push %ebp
	movl %esp, %ebp

	movl 12(%ebp), %ecx  #move b into
	movl 8(%ebp), %edx  # move a into

	pushl		%ecx
	pushl		 %edx

	call foo

	ret


foo:

	popl		%edx      #value of a
	popl 		%ecx       #value of b

	#need to subtract b from a for number of elments that we will have + 1

	movl 		%edx, %eax  # copy of a into eax
	movl	       %ecx, %ebx    # copy of b into ebx



	subl		%edx, %ecx        # number of elements in array
	incl		%ecx		    # add 1 so we get true number of elements in array     
	# now ECX holds B-A

	movl   %ecx, %edx  # can now have # of elem in array KEEP THIS 

	
	jmp .loop
	

.loop:

	# put array in esi
	movl %eax, (%esi, %eax, 4)
	


	incl  %eax  # increase a by one each time
	dec  	%ecx  # decrement loop counter

	#jump back if needed
	jns 	.loop


	#push array  aka return bar(array, b-a+1)
	pushl   %esi          #ESI holds array
	pushl   %edx   # push the number of elements in the array

	call bar

	ret


	

.globl bar
bar:

	popl    %edx    # pop the number of elements in for each I
	popl	 %esi      # pop the array back in
	
	movl $0, %ebx   #move 1 to ebx for counter  n = 0

	jmp 	.loop2

	
	
.loop2:
	
	
	
	movl	(%esi, %edx, 4),%eax  # move the element to eax
	orl	$2,%eax      # divide eax by 2

	dec	%edx  # decrease count of edx by 1

	cmpl  $0,%eax  #compare eax with 0
	incl	%ebx  # increase ebx (count) by 1

	cmpl	$0, %edx
	# Jump back to loop if needed
	jns	.loop2


	popl  %ebx
	call _Z3fooii
	ret




	
	
	


	

	
	

	

	
     

	
	

	
	