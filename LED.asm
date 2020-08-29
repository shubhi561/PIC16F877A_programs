
_main:

;LED.c,2 :: 		void main()
;LED.c,4 :: 		TRISA=0X00;
	CLRF       TRISA+0
;LED.c,5 :: 		TRISB=0X00;
	CLRF       TRISB+0
;LED.c,6 :: 		TRISC=0X00;
	CLRF       TRISC+0
;LED.c,7 :: 		TRISD=0X00;
	CLRF       TRISD+0
;LED.c,8 :: 		TRISE=0X00;
	CLRF       TRISE+0
;LED.c,9 :: 		while(1)
L_main0:
;LED.c,11 :: 		for(a=0;a<3;a++)
	CLRF       _a+0
	CLRF       _a+1
L_main2:
	MOVLW      128
	XORWF      _a+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main58
	MOVLW      3
	SUBWF      _a+0, 0
L__main58:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;LED.c,13 :: 		PORTA=0XFF;
	MOVLW      255
	MOVWF      PORTA+0
;LED.c,14 :: 		PORTB=0XFF;
	MOVLW      255
	MOVWF      PORTB+0
;LED.c,15 :: 		PORTC=0XFF;
	MOVLW      255
	MOVWF      PORTC+0
;LED.c,16 :: 		PORTD=0XFF;
	MOVLW      255
	MOVWF      PORTD+0
;LED.c,17 :: 		PORTE=0XFF;
	MOVLW      255
	MOVWF      PORTE+0
;LED.c,18 :: 		Delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;LED.c,19 :: 		PORTA=0X00;
	CLRF       PORTA+0
;LED.c,20 :: 		PORTB=0X00;
	CLRF       PORTB+0
;LED.c,21 :: 		PORTC=0X00;
	CLRF       PORTC+0
;LED.c,22 :: 		PORTD=0X00;
	CLRF       PORTD+0
;LED.c,23 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,24 :: 		Delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;LED.c,11 :: 		for(a=0;a<3;a++)
	INCF       _a+0, 1
	BTFSC      STATUS+0, 2
	INCF       _a+1, 1
;LED.c,25 :: 		}
	GOTO       L_main2
L_main3:
;LED.c,27 :: 		for(a=0;a<2;a++)
	CLRF       _a+0
	CLRF       _a+1
L_main7:
	MOVLW      128
	XORWF      _a+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main59
	MOVLW      2
	SUBWF      _a+0, 0
L__main59:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;LED.c,29 :: 		PORTE=0X04;
	MOVLW      4
	MOVWF      PORTE+0
;LED.c,30 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;LED.c,31 :: 		PORTE=0X02;
	MOVLW      2
	MOVWF      PORTE+0
;LED.c,32 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;LED.c,33 :: 		PORTE=0X01;
	MOVLW      1
	MOVWF      PORTE+0
;LED.c,34 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;LED.c,35 :: 		PORTA=0X20;
	MOVLW      32
	MOVWF      PORTA+0
;LED.c,36 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,37 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;LED.c,38 :: 		PORTA=0X10;
	MOVLW      16
	MOVWF      PORTA+0
;LED.c,39 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,40 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;LED.c,41 :: 		PORTA=0X08;
	MOVLW      8
	MOVWF      PORTA+0
;LED.c,42 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,43 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
	NOP
;LED.c,44 :: 		PORTA=0X04;
	MOVLW      4
	MOVWF      PORTA+0
;LED.c,45 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,46 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
	NOP
;LED.c,47 :: 		PORTA=0X02;
	MOVLW      2
	MOVWF      PORTA+0
;LED.c,48 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,49 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
	NOP
;LED.c,51 :: 		PORTA=0X02;
	MOVLW      2
	MOVWF      PORTA+0
;LED.c,52 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,53 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
	NOP
;LED.c,54 :: 		PORTA=0X04;
	MOVLW      4
	MOVWF      PORTA+0
;LED.c,55 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,56 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
;LED.c,57 :: 		PORTA=0X08;
	MOVLW      8
	MOVWF      PORTA+0
;LED.c,58 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,59 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
;LED.c,60 :: 		PORTA=0X10;
	MOVLW      16
	MOVWF      PORTA+0
;LED.c,61 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,62 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
	NOP
;LED.c,63 :: 		PORTA=0X20;
	MOVLW      32
	MOVWF      PORTA+0
;LED.c,64 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,65 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
;LED.c,66 :: 		PORTE=0X01;
	MOVLW      1
	MOVWF      PORTE+0
;LED.c,67 :: 		PORTA=0X00;
	CLRF       PORTA+0
;LED.c,68 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	DECFSZ     R11+0, 1
	GOTO       L_main23
	NOP
	NOP
;LED.c,69 :: 		PORTE=0X02;
	MOVLW      2
	MOVWF      PORTE+0
;LED.c,70 :: 		PORTA=0X00;
	CLRF       PORTA+0
;LED.c,71 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
	NOP
;LED.c,72 :: 		PORTE=0X04;
	MOVLW      4
	MOVWF      PORTE+0
;LED.c,73 :: 		PORTA=0X00;
	CLRF       PORTA+0
;LED.c,74 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
	NOP
;LED.c,27 :: 		for(a=0;a<2;a++)
	INCF       _a+0, 1
	BTFSC      STATUS+0, 2
	INCF       _a+1, 1
;LED.c,75 :: 		}
	GOTO       L_main7
L_main8:
;LED.c,76 :: 		for(a=0;a<2;a++)
	CLRF       _a+0
	CLRF       _a+1
L_main26:
	MOVLW      128
	XORWF      _a+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main60
	MOVLW      2
	SUBWF      _a+0, 0
L__main60:
	BTFSC      STATUS+0, 0
	GOTO       L_main27
;LED.c,78 :: 		PORTA=0X00;
	CLRF       PORTA+0
;LED.c,79 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,80 :: 		PORTA=0X02;
	MOVLW      2
	MOVWF      PORTA+0
;LED.c,81 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	DECFSZ     R11+0, 1
	GOTO       L_main29
	NOP
	NOP
;LED.c,82 :: 		PORTA=0X06;
	MOVLW      6
	MOVWF      PORTA+0
;LED.c,83 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
	DECFSZ     R11+0, 1
	GOTO       L_main30
	NOP
	NOP
;LED.c,84 :: 		PORTA=0X0E;
	MOVLW      14
	MOVWF      PORTA+0
;LED.c,85 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main31:
	DECFSZ     R13+0, 1
	GOTO       L_main31
	DECFSZ     R12+0, 1
	GOTO       L_main31
	DECFSZ     R11+0, 1
	GOTO       L_main31
	NOP
	NOP
;LED.c,86 :: 		PORTA=0X1E;
	MOVLW      30
	MOVWF      PORTA+0
;LED.c,87 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main32:
	DECFSZ     R13+0, 1
	GOTO       L_main32
	DECFSZ     R12+0, 1
	GOTO       L_main32
	DECFSZ     R11+0, 1
	GOTO       L_main32
	NOP
	NOP
;LED.c,88 :: 		PORTA=0X3E;
	MOVLW      62
	MOVWF      PORTA+0
;LED.c,89 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main33:
	DECFSZ     R13+0, 1
	GOTO       L_main33
	DECFSZ     R12+0, 1
	GOTO       L_main33
	DECFSZ     R11+0, 1
	GOTO       L_main33
	NOP
	NOP
;LED.c,90 :: 		PORTA=0X3E;
	MOVLW      62
	MOVWF      PORTA+0
;LED.c,91 :: 		PORTE=0X01;
	MOVLW      1
	MOVWF      PORTE+0
;LED.c,92 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	DECFSZ     R11+0, 1
	GOTO       L_main34
	NOP
	NOP
;LED.c,93 :: 		PORTA=0X3E;
	MOVLW      62
	MOVWF      PORTA+0
;LED.c,94 :: 		PORTE=0X03;
	MOVLW      3
	MOVWF      PORTE+0
;LED.c,95 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	DECFSZ     R11+0, 1
	GOTO       L_main35
	NOP
	NOP
;LED.c,96 :: 		PORTA=0X3E;
	MOVLW      62
	MOVWF      PORTA+0
;LED.c,97 :: 		PORTE=0X07;
	MOVLW      7
	MOVWF      PORTE+0
;LED.c,98 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
	DECFSZ     R11+0, 1
	GOTO       L_main36
	NOP
	NOP
;LED.c,99 :: 		PORTA=0X00;
	CLRF       PORTA+0
;LED.c,100 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,102 :: 		PORTE=0X04;
	MOVLW      4
	MOVWF      PORTE+0
;LED.c,103 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main37:
	DECFSZ     R13+0, 1
	GOTO       L_main37
	DECFSZ     R12+0, 1
	GOTO       L_main37
	DECFSZ     R11+0, 1
	GOTO       L_main37
	NOP
	NOP
;LED.c,104 :: 		PORTE=0X06;
	MOVLW      6
	MOVWF      PORTE+0
;LED.c,105 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
	DECFSZ     R12+0, 1
	GOTO       L_main38
	DECFSZ     R11+0, 1
	GOTO       L_main38
	NOP
	NOP
;LED.c,106 :: 		PORTE=0X07;
	MOVLW      7
	MOVWF      PORTE+0
;LED.c,107 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main39:
	DECFSZ     R13+0, 1
	GOTO       L_main39
	DECFSZ     R12+0, 1
	GOTO       L_main39
	DECFSZ     R11+0, 1
	GOTO       L_main39
	NOP
	NOP
;LED.c,108 :: 		PORTE=0X07;
	MOVLW      7
	MOVWF      PORTE+0
;LED.c,109 :: 		PORTA=0X20;
	MOVLW      32
	MOVWF      PORTA+0
;LED.c,110 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main40:
	DECFSZ     R13+0, 1
	GOTO       L_main40
	DECFSZ     R12+0, 1
	GOTO       L_main40
	DECFSZ     R11+0, 1
	GOTO       L_main40
	NOP
	NOP
;LED.c,111 :: 		PORTE=0X07;
	MOVLW      7
	MOVWF      PORTE+0
;LED.c,112 :: 		PORTA=0X30;
	MOVLW      48
	MOVWF      PORTA+0
;LED.c,113 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main41:
	DECFSZ     R13+0, 1
	GOTO       L_main41
	DECFSZ     R12+0, 1
	GOTO       L_main41
	DECFSZ     R11+0, 1
	GOTO       L_main41
	NOP
	NOP
;LED.c,114 :: 		PORTE=0X07;
	MOVLW      7
	MOVWF      PORTE+0
;LED.c,115 :: 		PORTA=0X38;
	MOVLW      56
	MOVWF      PORTA+0
;LED.c,116 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main42:
	DECFSZ     R13+0, 1
	GOTO       L_main42
	DECFSZ     R12+0, 1
	GOTO       L_main42
	DECFSZ     R11+0, 1
	GOTO       L_main42
	NOP
	NOP
;LED.c,117 :: 		PORTE=0X07;
	MOVLW      7
	MOVWF      PORTE+0
;LED.c,118 :: 		PORTA=0X3C;
	MOVLW      60
	MOVWF      PORTA+0
;LED.c,119 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main43:
	DECFSZ     R13+0, 1
	GOTO       L_main43
	DECFSZ     R12+0, 1
	GOTO       L_main43
	DECFSZ     R11+0, 1
	GOTO       L_main43
	NOP
	NOP
;LED.c,120 :: 		PORTE=0X07;
	MOVLW      7
	MOVWF      PORTE+0
;LED.c,121 :: 		PORTA=0X3E;
	MOVLW      62
	MOVWF      PORTA+0
;LED.c,122 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main44:
	DECFSZ     R13+0, 1
	GOTO       L_main44
	DECFSZ     R12+0, 1
	GOTO       L_main44
	DECFSZ     R11+0, 1
	GOTO       L_main44
	NOP
	NOP
;LED.c,76 :: 		for(a=0;a<2;a++)
	INCF       _a+0, 1
	BTFSC      STATUS+0, 2
	INCF       _a+1, 1
;LED.c,123 :: 		}
	GOTO       L_main26
L_main27:
;LED.c,124 :: 		for(a=0;a<2;a++)
	CLRF       _a+0
	CLRF       _a+1
L_main45:
	MOVLW      128
	XORWF      _a+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	MOVLW      2
	SUBWF      _a+0, 0
L__main61:
	BTFSC      STATUS+0, 0
	GOTO       L_main46
;LED.c,126 :: 		PORTA=0X00;
	CLRF       PORTA+0
;LED.c,127 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,128 :: 		PORTA=0X02;
	MOVLW      2
	MOVWF      PORTA+0
;LED.c,129 :: 		PORTE=0X04;
	MOVLW      4
	MOVWF      PORTE+0
;LED.c,130 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main48:
	DECFSZ     R13+0, 1
	GOTO       L_main48
	DECFSZ     R12+0, 1
	GOTO       L_main48
	DECFSZ     R11+0, 1
	GOTO       L_main48
	NOP
	NOP
;LED.c,131 :: 		PORTA=0X06;
	MOVLW      6
	MOVWF      PORTA+0
;LED.c,132 :: 		PORTE=0X06;
	MOVLW      6
	MOVWF      PORTE+0
;LED.c,133 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main49:
	DECFSZ     R13+0, 1
	GOTO       L_main49
	DECFSZ     R12+0, 1
	GOTO       L_main49
	DECFSZ     R11+0, 1
	GOTO       L_main49
	NOP
	NOP
;LED.c,134 :: 		PORTA=0X0E;
	MOVLW      14
	MOVWF      PORTA+0
;LED.c,135 :: 		PORTE=0X07;
	MOVLW      7
	MOVWF      PORTE+0
;LED.c,136 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main50:
	DECFSZ     R13+0, 1
	GOTO       L_main50
	DECFSZ     R12+0, 1
	GOTO       L_main50
	DECFSZ     R11+0, 1
	GOTO       L_main50
	NOP
	NOP
;LED.c,137 :: 		PORTA=0XFF;
	MOVLW      255
	MOVWF      PORTA+0
;LED.c,138 :: 		PORTE=0XFF;
	MOVLW      255
	MOVWF      PORTE+0
;LED.c,139 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main51:
	DECFSZ     R13+0, 1
	GOTO       L_main51
	DECFSZ     R12+0, 1
	GOTO       L_main51
	DECFSZ     R11+0, 1
	GOTO       L_main51
	NOP
	NOP
;LED.c,140 :: 		PORTA=0X00;
	CLRF       PORTA+0
;LED.c,141 :: 		PORTE=0X00;
	CLRF       PORTE+0
;LED.c,142 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main52:
	DECFSZ     R13+0, 1
	GOTO       L_main52
	DECFSZ     R12+0, 1
	GOTO       L_main52
	DECFSZ     R11+0, 1
	GOTO       L_main52
	NOP
	NOP
;LED.c,143 :: 		PORTA=0X30;
	MOVLW      48
	MOVWF      PORTA+0
;LED.c,144 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main53:
	DECFSZ     R13+0, 1
	GOTO       L_main53
	DECFSZ     R12+0, 1
	GOTO       L_main53
	DECFSZ     R11+0, 1
	GOTO       L_main53
	NOP
	NOP
;LED.c,145 :: 		PORTA=0X38;
	MOVLW      56
	MOVWF      PORTA+0
;LED.c,146 :: 		PORTE=0X01;
	MOVLW      1
	MOVWF      PORTE+0
;LED.c,147 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main54:
	DECFSZ     R13+0, 1
	GOTO       L_main54
	DECFSZ     R12+0, 1
	GOTO       L_main54
	DECFSZ     R11+0, 1
	GOTO       L_main54
	NOP
	NOP
;LED.c,148 :: 		PORTA=0X3C;
	MOVLW      60
	MOVWF      PORTA+0
;LED.c,149 :: 		PORTE=0X03;
	MOVLW      3
	MOVWF      PORTE+0
;LED.c,150 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main55:
	DECFSZ     R13+0, 1
	GOTO       L_main55
	DECFSZ     R12+0, 1
	GOTO       L_main55
	DECFSZ     R11+0, 1
	GOTO       L_main55
	NOP
	NOP
;LED.c,151 :: 		PORTA=0X3E;
	MOVLW      62
	MOVWF      PORTA+0
;LED.c,152 :: 		PORTE=0X07;
	MOVLW      7
	MOVWF      PORTE+0
;LED.c,153 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main56:
	DECFSZ     R13+0, 1
	GOTO       L_main56
	DECFSZ     R12+0, 1
	GOTO       L_main56
	DECFSZ     R11+0, 1
	GOTO       L_main56
	NOP
	NOP
;LED.c,124 :: 		for(a=0;a<2;a++)
	INCF       _a+0, 1
	BTFSC      STATUS+0, 2
	INCF       _a+1, 1
;LED.c,154 :: 		}
	GOTO       L_main45
L_main46:
;LED.c,155 :: 		}
	GOTO       L_main0
;LED.c,156 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
