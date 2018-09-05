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
   	  MOV R0, #12
 
STOP  
	ADD R0, R0, #4
	MOV R6, #10
	MOV R8, #10
	ADD R1, R6, R8
	B  STOP	;lenh nhay den nhan STOP

	BL Func1 ;goi ctr con
;------------------------------------------------------------------------
; Dinh nghia cac thu tuc
Func1	PROC
	MOV R6, #10
	MOV R8, #10
	ADD R1, R6, R8
	ENDP
;-------------------------------------------------------------------------

          END	;Ket thuc chuong trinhf
;-------------------------------------------------------------------------