; Link Library Test # 2:		(TestLib2.asm)
; Testing the Irvine32 Library Procedures.


INCLUDE Irvine32.inc
	TAB = 9		;ASCII Code for Tab
.code
main PROC
	call Randomize		;init random generator
	call Rand1
	call crlf
	call Rand2
	call crlf
	exit
main ENDP

Rand1 PROC
	; Generate Ten Pseudo-Random Integers.
	mov ecx,10	;loop 10 times
	L1:
		call Random32		;generate random int
		call WriteDec		;write in Unsigned Decimal
		mov al,TAB		;Horizontal Tab
		call WriteChar		;write the tab
	loop L1
	call crlf
	ret
Rand1 ENDP

Rand2 PROC
	; Generate Ten Pseudo-Random Integers from -50 to +49
	mov ecx,10	;loop 10 times
	L1:
		mov eax,100		;values 0-99
		call RandomRange	;generate random int
		sub eax,50		;values -50 to +49
		call WriteInt		;write Signed Decimal
		mov al,TAB		;Horizontal Tab
		call WriteChar		;write the tab
	loop L1
	call crlf
	ret
Rand2 ENDP

END main