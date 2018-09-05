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
	LDR R1, N 		;Load count into R1
	
	MOV R0, #0 		;Clear accumulator R0

LOOP 
	ADD R0, R0, R1 		;Add number into R0
	SUBS R1, R1, #1 	;Decrement loop counter R1
	BGT LOOP 		;Branch back if not done
	
	LDR R3, SUMP		;Load address of SUM to R3
	STR R0, [R3]		;Store SUM

STOP
        B  STOP

;---------------------------------------------------------------
	END	