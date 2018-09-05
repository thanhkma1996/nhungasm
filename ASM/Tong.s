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
MAX	EQU	100

start
	MOV	R0, #0		; sum = 0
	LDR	R1, =nums	; address = nums
	MOV	R2, #0		; offset = 0
	LDR	R3, =MAX	; count = MAX
	
do1	LDR	R4, [R1, R2]
	ADD	R0, R0, R4
	ADD	R2, R2, #4
	SUBS	R3, R3, #1
	BCS	do1
	
stop	B	stop


	AREA	Strings, DATA, READWRITE
	
nums	DCD	1,1,1,1,1,1,1,1,1,1
	DCD	1,1,1,1,1,1,1,1,1,1
	DCD	1,1,1,1,1,1,1,1,1,1
	DCD	1,1,1,1,1,1,1,1,1,1
	DCD	1,1,1,1,1,1,1,1,1,1
	DCD	1,1,1,1,1,1,1,1,1,1
	DCD	1,1,1,1,1,1,1,1,1,1
	DCD	1,1,1,1,1,1,1,1,1,1
	DCD	1,1,1,1,1,1,1,1,1,1
	DCD	1,1,1,1,1,1,1,1,1,1
	
	
	END	