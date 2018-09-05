;	This program will catculate the value of the following function:
;	f(x) = 5x^2 - 6x + 8  when x = 5.
; Khai bao doan du lieu
	AREA    RESET, DATA, READONLY
		DCD  0x20001000     ; stack pointer value when stack is empty
		DCD  Reset_Handler  ; reset vector
  
      ALIGN
	  
;Chu y: Cac nhan, ten can dat sat le trai
SUM 	DCD 0
SUMP    DCD SUM
N 	DCD 5


; Khai bao doan ma lenh
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY ;Khai bao diem vao chuong trinh
   	  EXPORT Reset_Handler
	  
Reset_Handler
;-------------------------------------------------------------------------
; Bat dau doan code (Diem vao cua chuong trinh)---------------------------
start
;---------------------------------------------------------------
	MOV R0, #5	; x = 5
 
		MUL R1, R0, R0	; R1 = x^2
		MOV R4, #5
		MUL R1, R1, R4

		MOV R5, #6
		MUL R2, R0, R5	; R2 = 6x

		SUB R3, R1, R2	; R3 = 5x^2 - 6x
		ADD R3, R3, #8	; R3 = 5x^2 - 6x + 8
 
		ALIGN

STOP
        B  STOP

;---------------------------------------------------------------
	END	