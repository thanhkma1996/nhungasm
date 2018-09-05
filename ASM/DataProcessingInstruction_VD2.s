; Khai bao doan du lieu
	AREA    RESET, DATA, READONLY
		DCD  0x20001000     ; stack pointer value when stack is empty
		DCD  Reset_Handler  ; reset vector
  
      ALIGN
	  
;Chu y: Cac nhan, ten can dat sat le trai
SUM 	DCD 0
SUMP    DCD SUM


NUM1 	DCD 8
NUM2    DCD 7

; Khai bao doan ma lenh
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY ;Khai bao diem vao chuong trinh
   	  EXPORT Reset_Handler
	  
Reset_Handler
;-------------------------------------------------------------------------
; Bat dau doan code (Diem vao cua chuong trinh)---------------------------
start
;---------------------------------------------------------------
	LDR R1, NUM1
        LDR R2, NUM2

	
	MOV R0, #0

	ADD R0, R1, R2
	SUBS R0, R0, #1

	LSLS R3, R0, #2 	; Logical shift left by 2 bits with flag update

	LDR R4, SUMP
	STR R3, [R4]

 	ALIGN
STOP
        B  STOP


;---------------------------------------------------------------
	END	