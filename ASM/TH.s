; LAB2:
; - 2.4: Tinh tong cac phan tu trong ma tran
; - 2.5: Dem so phan tu am, duong trong ma tran
; - 2.6: Tim min, max tren cheo chinh, cheo phu
; - 2.7: Tinh tong so chan, le trong ma tran
; - 2.8: Tinh tong cac so chia het cho 5 trong ma tran
; ----------------------------------------------------------------

	area reset, data, readonly
		dcd	0x20001000
		dcd	bdCode

;khai bao ma tran = vung nho
arMatran	
	dcd	1, 6, 10
	dcd	4, 2, 0
	dcd	5, 25, 0
	
	
	area doanCode, code, readonly
		entry
bdCode
SoPTMaTran	equ	9

; ; Bai 2.4: Tinh tong cac phan tu trong ma tran
	; ; Input:
		; ; - ma tran trong bo nho
	; ; Output:
		; ; - R0: chua tong cac phan tu cua ma tran
	; ; Thuc hien:
		; ; - R1: chua dia chi cua phan tu hien tai
		; ; - R4: chua gia tri cua phan tu hien tai
		; ; - R2: chua bien chay
		; ; - R3: chua so phan tu trong ma tran
	; mov	R0, #0
	; mov R2, #1
	; ldr R3, =SoPTMaTran
	; ldr	R1, =arMatran
	
; LapTinh
	; ldr R4, [R1]
	; add R0, R4
	
	; add R2, #1
	; add R1, #4
	
	; cmp R2, R3
	; ble	LapTinh

; ;---------------------------------------------------------------------------------------
; ; Bai 2.5: Dem so phan tu am, duong trong ma tran
	; ; Input:
		; ; - ma tran trong bo nho
	; ; Output:
		; ; - R0: = so phan tu am
		; ; - R5: = so phan tu duong
	; ; Thuc hien:
		; ; - R1: chua dia chi cua phan tu hien tai
		; ; - R4: chua gia tri cua phan tu hien tai
		; ; - R2: chua bien chay
		; ; - R3: chua so phan tu trong ma tran
		
	; mov	R0, #0
	; mov R2, #1
	; ldr R3, =SoPTMaTran
	; ldr	R1, =arMatran
	
; LapTinh
	; ldr R4, [R1] ;nap phan tu hien tai cua ma tran tu bo nho vao thanh ghi R4
	
	; ;kiem tra am, duong, va dem
	; cmp R4, #0
	; blt Am
	; bgt Duong
	; b	ThayDoi
; Am
	; add R0, #1
	; b ThayDoi
; Duong
	; add R5, #1
	; b ThayDoi

	; ;thay doi bien dem va dia chi
; ThayDoi
	; add R2, #1
	; add R1, #4
	
	; cmp R2, R3
	; ble	LapTinh
	; ;ket thuc: R0 = so phan tu am; R5 = so phan tu duong
; ;--------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------
; Bai 2.8: Tinh tong cac phan tu chia het cho 5 trong ma tran
	; Input:
		; - ma tran trong bo nho
	; Output:
		; - R0: = Tong cac phan tu chia het cho 5 trong ma tran
	; Thuc hien:
		; - R1: chua dia chi cua phan tu hien tai
		; - R4: chua gia tri cua phan tu hien tai
		; - R2: chua bien chay
		; - R3: chua so phan tu trong ma tran
		
	mov	R0, #0
	mov R2, #1
	ldr R3, =SoPTMaTran
	ldr	R1, =arMatran
	
LapTinh
	ldr R4, [R1] ;nap phan tu hien tai cua ma tran tu bo nho vao thanh ghi R4
	
	;kiem tra chia het cho 5 va add vao tong
	;kiem tra chia het cho 5:
	; lap -5 cho den khi ket qua < 5 thi dung; 
	;	- so buoc lap = phan nguyen; chua trong R6
	;	- hieu = phan du; chua trong R5
	mov R5, R4
	mov R6, #0
LapTru
	cmp	R5, #5
	blt	KetQuaChia
	add R6, #1
	sub R5, #5
	b LapTru

KetQuaChia
	;R6 = phan nguyen
	;R5 = phan du
	cmp R5, #0
	bne ThayDoi
	add R0, R4

	;thay doi bien dem va dia chi
ThayDoi
	add R2, #1
	add R1, #4
	
	cmp R2, R3
	ble	LapTinh
	;ket thuc: R0 = so phan tu am; R5 = so phan tu duong
;--------------------------------------------------------------------------------------
	nop
	nop
	nop ;=no operation: lenh khong lam gi, chi tre lai 1 khoang thoi gian cua CPU
	end