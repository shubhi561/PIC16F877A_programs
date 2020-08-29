
_main:

;7 seg count 0-9.c,5 :: 		void main() {
;7 seg count 0-9.c,6 :: 		TRISB=0X00;
	CLRF       TRISB+0
;7 seg count 0-9.c,7 :: 		TRISD=0X00;
	CLRF       TRISD+0
;7 seg count 0-9.c,9 :: 		while(1)
L_main0:
;7 seg count 0-9.c,11 :: 		for(a=0;a<10;a++)
	CLRF       _a+0
	CLRF       _a+1
L_main2:
	MOVLW      128
	XORWF      _a+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      10
	SUBWF      _a+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;7 seg count 0-9.c,13 :: 		PORTD=0X0f;
	MOVLW      15
	MOVWF      PORTD+0
;7 seg count 0-9.c,14 :: 		PORTB=count[a];
	MOVF       _a+0, 0
	MOVWF      R0+0
	MOVF       _a+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _count+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;7 seg count 0-9.c,15 :: 		Delay_ms(800);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;7 seg count 0-9.c,11 :: 		for(a=0;a<10;a++)
	INCF       _a+0, 1
	BTFSC      STATUS+0, 2
	INCF       _a+1, 1
;7 seg count 0-9.c,17 :: 		}
	GOTO       L_main2
L_main3:
;7 seg count 0-9.c,18 :: 		}
	GOTO       L_main0
;7 seg count 0-9.c,19 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
