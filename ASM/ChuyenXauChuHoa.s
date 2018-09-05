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
	LDR	r1, =0xA1000000	; address = 0xA1000000
	
	B	testwh1		; while ( (char = Memory.byte[address]) != 0 ) {
wh1	CMP	r0, #'a'	;  if (char >= 'a'
	BCC	endif1		;   AND
	CMP	r0, #'z'	;   char <= 'z')
	BHI	endif1		;  {
	BIC	r0, #0x00000020	;   char = char AND NOT 0x00000020
	STRB	r0, [r1]	;   Memory.byte[addres] = char
endif1				;  }
	ADD	r1, r1, #1	;  address = address + 1
testwh1	LDRB	r0, [r1]	; }
	CMP	r0, #0		;
	BNE	wh1		;

stop	B	stop

	END	