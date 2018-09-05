;	CHUONG TRINH DEM CHIEU DAI 1 XAU
; Khai bao doan du lieu
	AREA    RESET, DATA, READONLY
		DCD  0x20001000     ; stack pointer value when stack is empty
		DCD  Reset_Handler  ; reset vector
  
      ALIGN
	  
;Chu y: Cac nhan, ten can dat sat le trai
string1
	DCB	"Hello world!",0


; Khai bao doan ma lenh
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY ;Khai bao diem vao chuong trinh
   	  EXPORT Reset_Handler
	  
Reset_Handler
;-------------------------------------------------------------------------
; Bat dau doan code (Diem vao cua chuong trinh)---------------------------
start
;---------------------------------------------------------------
	LDR  	R0, = string1   ; Load the address of string1 into the register R0 

	MOV	R1, #0  	; Initialize the counter counting the length of string1

loopCount

	LDRB	R2, [R0], #1	; Load the character from the address R0 contains
				; and update the pointer R0  
				; using Post-indexed addressing mode
	
	CBZ	R2, STOP   ; If it is zero...remember null terminated... 
				; You are done with the string. The length is in R1.

	;ADD	R0, #1;         ; Otherwise, increment index to the next character

	ADD	R1, #1;         ; increment the counter for length

	B	loopCount	
STOP
        B  STOP

;---------------------------------------------------------------
	END	