
extrn p1:near,p2:near,p3:near,p4:near,p5:near,p6:near


StkSeg  SEGMENT PARA STACK 'STACK'
        DB      200h DUP (?)
StkSeg  ENDS
;
DataS   SEGMENT WORD 'DATA'

menu	db 	"0 menu",13,10
	db	"1 vvod",13,10               
	db	"2 p2",13,10               
	db	"3 vvod",13,10               
	db	"4 vvod",13,10               
	db	"5 vvod",13,10               
	db	"6 vvod",13,10  
	db	"7 vvod",13,10               
	db	"8 vvod",13,10               
        db	"$" 
x	dw	24    
mas dw p1,p2,p3,p4,p5,p6
               
DataS   ENDS
;
Code    SEGMENT WORD 'CODE'
        ASSUME  CS:Code, DS:DataS
DispMsg:
        mov   AX,DataS                 ;�������� � AX ������ �������� ������
        mov   DS,AX                    ;��������� DS
vvodx:
	mov bx,x
mnu:        mov   DX,OFFSET MENU   ;DS:DX - ����� ������
        mov   AH,9                     ;��=09h ������ �� ������� ������
        int   21h  

	mov ah,7
	int 21h
	cmp al,'0'
	je mnu
	cmp al,'1'
	je vvodx
	
	cmp al,'8'
	je exit

	sub al,'0'
	sub al,2
mov ah,0
	shl al,1
	mov si,ax
	call mas[si]











exit:

        mov   AH,4Ch                   ;��=4Ch ��������� �������
        int   21h                      ;�����  ������� DOS
Code    ENDS
        END   DispMsg
 
