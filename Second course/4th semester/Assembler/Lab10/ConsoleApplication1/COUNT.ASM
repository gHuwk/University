
;      function (const S: LONGWORD; L:LONGWORD):INTEGER;

.386
.model FLAT,C
PUBLIC COUNT
.DATA 
S1 	DD 00001111000011110000111100001111B,1010101B 
.CODE
COUNT:

					
	PUSH EBP		
	MOV EBP,ESP		
	PUSH EBX		

	
	XOR EAX,EAX		  
	MOV EBX,[EBP+8]  
	MOV	ECX,[EBP+12]  
	
	MOV	EDX,0        
	MOV EDI,0
	
CC:
	BT [EBX],EDX  
	JNC NO		 
	INC EAX		 
NO:	
	INC EDX		 
	LOOP CC
	
	
	
	POP EBX
	MOV ESP,EBP
	POP EBP
	RET 8
END
