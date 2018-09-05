; ;DE 6
; ;1. DEM SO PHAN TU DUONG AM TRONG 1 MA TRAN
; ;2. TINH TONG CAC SO CHIA HET CHO 6 TRONG 1 MA TRAN
	; AREA RESET, DATA, READONLY
	; EXPORT _VECTOR
; _VECTOR
	; DCD 0x20001000
	; DCD RESET_HANDLER
	
	; AREA MYDATA, DATA, READONLY
; MATRAN 
	; DCD -3, 8,10, 0
	; DCD  4, 6, 7, 8
	; DCD  5, 7,-9, 3
	; DCD -4, 5, 6,10
	
	; AREA MYCODE, CODE, READONLY
; ;DEM SO PHAN TU DUONG AM
; DUONG_AM PROC
	; LDR R5, [R0], #4	;LAY GIA TRI
	; CMP R5, #0			;SO SANH
	; BEQ Exit			;=0 Exit
	; BLE Am				;<0 Am
	; BGE	Duong			;>0 Duong
; Duong
	; ADD R1, R1, #1		;R1 = R1 +1
	; B Exit
; Am
	; ADD R2, R2, #1		;R2 = R2 +1
	; B Exit
; Exit
	; ADD R4, R4, #1		; R4 = R4 +1
	; CMP R4, #16			;MA TRAN 4*4
	; BLE DUONG_AM
	; BX LR
		; ENDP

; CHIA_6 PROC
	; LDR R5, [R0], #4	;LAY GIA TRI
	; MOV R6, #6			;R7 = 6
; ChiaDu
	; SDIV R7, R5, R6
	; MLS R8, R7, R6, R5
	; CMP R8, #0
	; BEQ XuLy
	; B Exit2
; XuLy
	; ADD R3, R3, #1		;DEM CHIA HEST CHO 6
; Exit2
	; ADD R4, R4, #1		; R4 = R4 +1
	; CMP R4, #16			;MA TRAN 4*4
	; BLE CHIA_6
	; BX LR
		; ENDP
		
; RESET_HANDLER
; MAIN PROC
	; LDR R0, =MATRAN
	; MOV R1, #0		;SO PHAN TU DUONG
	; MOV R2, #0		;SO PHAN TU AM
	; MOV R3, #0		;TONG CHIA 6
	; MOV R4, #1		;BIEN CHAY
	; BL DUONG_AM		;NHAY LEN HAM CON DUONG_AM
	; LDR R0, =MATRAN
	; MOV R4, #1		;RESET BIEN CHAY
	; BL CHIA_6
	; NOP
		; ENDP
		; END			;HamChoiqh

