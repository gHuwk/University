;��������� ������������ � ������ Count ����
;      function (const S: LONGWORD; L:LONGWORD):INTEGER;
;������������ ����� ������ ������� ������ S ����� L.
.386
.model FLAT,PASCAL
PUBLIC COUNT

.CODE

COUNT:
	PUSH	EBP
	MOV		EBP,ESP

	PUSH	EBX

	
	MOV		EAX,0
	MOV		EBX,[EBP+12];������(������ 32)
	MOV		ECX,[EBP+8] ;����� ������ (� ������� ��������) 	
	MOV		EDX,0
CIKL:	
	BT		[EBX],EDX	;������� �������� ���� � �F
	JNC		DONOTINC	;���� 0 - ����� �������� �����
	INC		EAX			;����� eax++
	
DONOTINC:
	INC		EDX			;����� ���� � ������
	CMP		EDX,31
	JA		CONTINUE	;���� ���� �� ������
	
	MOV		EDX,0
	ADD		EBX,4		;������� � ������ ������ (���������� 7 �����)
CONTINUE:
	LOOP	CIKL
	

	POP		EBX


	MOV		ESP,EBP
	POP		EBP
	
	RET 8
END