; Khai bao doan du lieu
	AREA    RESET, DATA, READONLY
		DCD  0x20001000     ; stack pointer value when stack is empty
		DCD  Reset_Handler  ; reset vector
  
      ALIGN
 
; Khai bao doan ma lenh
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY ;Khai bao diem vao chuong trinh
   	  EXPORT Reset_Handler
	  
Reset_Handler
;-------------------------------------------------------------------------
; Bat dau doan code (Diem vao cua chuong trinh)---------------------------
start
;---------------------------------------------------------------
	MOV	R2,	#0x01		; R2 = ?
	MOV	R3,	#0x02		; R3 = ?
		
	;Other examples to move immediate values
	MOV	R5,	#0x3210		; R5 = ?

	MOVT	R5, 	#0x7654		; R5 = ?

	MOV32	R6, 	#0x87654321	; R6 = ?

	LDR	R7,	= 0x87654321    ; R7 = ?


	ADD	R1,R2,R3		; R1 = ?
	MOV32   R3, 	#0xFFFFFFFF	; R3 = ?
	ADDS	R1,R2,R3		; R1 = ?   
					; specify Condition Code updates

	SUBS	R1,R2,R3		; R1 = ?   
					; specify Condition Code updates

	MOV	R4, 	#0xFFFFFFFF	; R4 = ?
	ADD	R1,R2,R4		; R1 = ?   
				; How did that operation affect the flags in CPSR?

	ADDS	R1,R2,R4	; R1 = ?  
				; Please specify Condition Code updates
				; and now what happened to the flags in the CPSR?


	MOV	R2,	#0x00000002	; R2 = ?
	ADDS	R1,R2,R4		; R1 = ?
					; again, what happened to the flags?

   	MOV	R2,	#0x00000001	; R2 = ?
	MOV	R3,	#0x00000002	; R3 = ?
	ADDS	R1,R2,R3		; R1 = ?   
					; Add some small numbers again
					; and check the flags again......

	; Add numbers that will create an overflow
	MOV     R2, 	#0x7FFFFFFF	; R2 = ?
	MOV	R3, 	#0x7FFFFFFF 	; R3 = ?

	ADDS    R1,R2,R3		; R1 = ? 
					; Check the Overflow flag in the CPSR?
;---------------------------------------------------------------
	END	