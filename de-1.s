; ;DE 1
; ;1. TINH TONG CAC PHAN TU CHEO CHINH TRONG 1 MA TRAN
; ;2. DEM SO NGUYEN TO TREN CHEO CHINH

	; AREA RESET, DATA, READONLY
	; EXPORT _VECTOR
; _VECTOR
	; DCD 0x20001000
	; DCD RESET_HANDLER
	
	; AREA MYDATA, DATA, READONLY
; ARR DCD 2,0,0,0
	; DCD 0,3,0,0
	; DCD 0,0,4,0
	; DCD 0,0,0,5
	
	; AREA MYCODE, CODE, READONLY
; ;THANG NAY TINH TONG DUONG CHEO CHINH
; TONG PROC
	; LDR R4, [R0], #20		;LAY GIA TRI ARR
	; ADD R1,R1,R4			;R2 LA SUM CHEO CHINH
	; ADD R3,R3,#1			;TANG BIEN CHAY
	; CMP R3, #4				;SO SANH BIEN CHAY VS SO HANG CUA MA TRAN
	; BLE TONG				;NHAY VE NHAN TONG
	; BX LR					;TRO VE MAIN PROC
		; ENDP

; ;THANG NAY KTRA NGUYEN TO
; SNT PROC
	; LDR R4, [R0], #20	;LAY GIA TRI ARR
	; MOV R5, #1			;BIEN CHAY R5- CHAY TU 1
; Lap
	; ADD R5,R5,#1		;TANG BIEN CHAY LEN- KTRA TU 2
	; CMP R5, R4			;SO SANH BIEN CHAY VS SO CAN KIEM TRA
	; BLT ChiaDu			;NHAY VE ChiaDu NEU R5 < R4
	; BGT Exit
	; BEQ XuLy			;NHAY VE XuLy NEU R5 = R4
; ChiaDu
	; UDIV R6,R4,R5		;CHIA
	; MLS R7, R6, R5, R4	; R7 = R4- (R5*R5)
	; CMP R7, #0			;SO SANH 
	; BNE Lap				;NHAY NEU R8 # 0
	; B Exit				;NHAY KO DIEU KIEN
; XuLy
	; ADD R2,R2,#1		;TANG THEM BIEN DEM SNT
	; B Exit				;NHAY KHONG DIEU KIEN
; Exit
	; ADD R3,R3,#1		;TANG BIEN CHAY CHUNG
	; CMP R3, #4			;SO SANH
	; BLE SNT				;NHAY VE SNT NEU R3 < 4
	; BX LR				;TRO VE MAIN PROC
		; ENDP
		
; RESET_HANDLER
; MAIN PROC
	; LDR R0, =ARR		;LAY DIA CHI THANG ARR
	; MOV R1, #0			;TONG CHEO CHINH
	; MOV R2, #0			;SO SNT
	; MOV R3, #1			;BIEN CHAY
	; BL TONG				;BAY QUA THANG TONG
	; LDR R0, =ARR		;RESET OFFSET ARR VE 0
	; MOV R3, #1			;RESET BIEN DEM CHUNG
	; BL SNT				;BAY QUA HAM CON SNT
	; NOP
		; ENDP
		; END				;HamChoiqh