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
	MOV R0, #10
	LDR R1, =10
	MOV R2, #10
	MOV R3, #10
	LDR	R4, =10
	
	MOV	r0, r1		; Make the first number the subtotal
	ADD	r0, r0, r2	; Add the second number to the subtotal
	ADD	r0, r0, r3	; Add the third number to the subtotal
	ADD	r0, r0, r4	; Add the fourth number to the subtotal
	
stop	B	stop

	END	