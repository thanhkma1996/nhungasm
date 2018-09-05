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
	LDR	r0, =0x16	; value = test value
	
	MOV	r1, r0		; tmp = value
	MOV	r2, #0		; count1s = 0
	
	MOVS	r1, r1, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC	r2, r2, #0	; count1s = count1s + C-flag
	
	MOVS	r1, r1, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC	r2, r2, #0	; count1s = count1s + C-flag

	MOVS	r1, r1, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC	r2, r2, #0	; count1s = count1s + C-flag

	MOVS	r1, r1, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC	r2, r2, #0	; count1s = count1s + C-flag

	MOVS	r1, r1, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC	r2, r2, #0	; count1s = count1s + C-flag

	MOVS	r1, r1, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC	r2, r2, #0	; count1s = count1s + C-flag

	MOVS	r1, r1, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC	r2, r2, #0	; count1s = count1s + C-flag

	; count1s now contains the number of set bits (1s) in the least
	; significant 7 bits of r0. If count1s is odd, our parity bit
	; should be 1. If count1s is even, our parity bit should be zero.
	; The LSB of count1s is equivalent to our desired parity bit.
		
	
	AND	r2, r2, #0x00000001	; clear all but parity bit
	ORR	r0, r0, r2, LSL #7	; set (or not!) parity bit in r0

	
stop	B	stop

	END	