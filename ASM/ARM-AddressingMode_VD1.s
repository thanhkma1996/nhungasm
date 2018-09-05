;	CHUONG TRINH TINH TONG 1 MANG
; Khai bao doan du lieu
	AREA    RESET, DATA, READONLY
		DCD  0x20001000     ; stack pointer value when stack is empty
		DCD  Reset_Handler  ; reset vector
  
      ALIGN
	  
;Chu y: Cac nhan, ten can dat sat le trai
SUM 	DCD 0
SUMP    DCD SUM

N 	DCD 5
NUM1 	DCD 3, -7, 2, -2, 10
POINTER DCD NUM1


; Khai bao doan ma lenh
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY ;Khai bao diem vao chuong trinh
   	  EXPORT Reset_Handler
	  
Reset_Handler
;-------------------------------------------------------------------------
; Bat dau doan code (Diem vao cua chuong trinh)---------------------------
start
;---------------------------------------------------------------
	LDR R1, N

	LDR R2, POINTER

	MOV R0, #0

LOOP 	
	LDR R3, [R2], #4
	ADD R0, R0, R3
	SUBS R1, R1, #1
	BGT LOOP
	LDR R4, SUMP
	STR R0, [R4]
	
STOP
        B  STOP

;---------------------------------------------------------------
	END	