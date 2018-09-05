;	CHUONG TRINH MINH HOA SU DUNG NGAN XEP

INITIAL_MSP	EQU	0x20001000	; Initial Main Stack Pointer Value	 
			; Allocating 1000 bytes to the stack as it grows down
;Data			
 AREA    RESET, DATA, READONLY
            EXPORT  __Vectors

__Vectors	DCD	INITIAL_MSP	; stack pointer value when stack is empty
        	DCD	Reset_Handler	; reset vector
		ALIGN

; Program
; Linker requires Reset_Handler

            AREA    MYCODE, CODE, READONLY

		    ENTRY
		    EXPORT	Reset_Handler

		    ALIGN
;;; Define Procedures

function1	PROC	     ;Using PROC and ENDP for procedures
	PUSH 	{R5,LR}      ;Save values in the stack
	
	MOV	R5,#8        ;Set initial value for the delay loop
		
delay
	SUBS	R5, R5, #1
	BNE	delay

	POP	{R5,PC}	;pop out the saved value from the stack, 
			;check the value in the R1 and if it is the saved value


	ENDP

;;;;;;;user main program;;;;;;;;

Reset_Handler  	
         

     	MOV 	R0, #0x75
        MOV 	R3, #5
	PUSH	{R0, R3} 	 ;Notice the stack address is 0x200000FF8 
        MOV 	R0, #6
        MOV 	R3, #7
	POP	{R0, R3}	 ;Should be able to see R0 = #0x75 and R3 = #5 after pop



Loop

	ADD	R0, R0, #1
	CMP	R0, #0x80
	BNE	Loop


	MOV 	R5, #9	;; prepare for function call

		
    	BL 	function1

	MOV 	R3, #12

stop 
        B 	stop


        END