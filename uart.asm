
_uart_int:

;uart.c,1 :: 		void uart_int()
;uart.c,3 :: 		SPBRG=129;//(baud rate 9600)if you want you can change the baud rate
	MOVLW      129
	MOVWF      SPBRG+0
;uart.c,4 :: 		TXSTA=0X24;
	MOVLW      36
	MOVWF      TXSTA+0
;uart.c,5 :: 		RCSTA=0X94;
	MOVLW      148
	MOVWF      RCSTA+0
;uart.c,6 :: 		}
L_end_uart_int:
	RETURN
; end of _uart_int

_uart_tx:

;uart.c,10 :: 		void uart_tx(unsigned char dataa)
;uart.c,12 :: 		TXREG=dataa;
	MOVF       FARG_uart_tx_dataa+0, 0
	MOVWF      TXREG+0
;uart.c,13 :: 		}
L_end_uart_tx:
	RETURN
; end of _uart_tx

_main:

;uart.c,15 :: 		void main()
;uart.c,19 :: 		TRISC=0X80;
	MOVLW      128
	MOVWF      TRISC+0
;uart.c,20 :: 		TRISD=0X00;
	CLRF       TRISD+0
;uart.c,21 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;uart.c,22 :: 		uart_int();
	CALL       _uart_int+0
;uart.c,24 :: 		while(1)
L_main1:
;uart.c,26 :: 		uart=RCREG;
	MOVF       RCREG+0, 0
	MOVWF      main_uart_L0+0
;uart.c,27 :: 		PORTD=uart;
	MOVF       main_uart_L0+0, 0
	MOVWF      PORTD+0
;uart.c,28 :: 		if(uart!=uart1)
	MOVF       main_uart_L0+0, 0
	XORWF      main_uart1_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;uart.c,30 :: 		uart_tx(uart);
	MOVF       main_uart_L0+0, 0
	MOVWF      FARG_uart_tx_dataa+0
	CALL       _uart_tx+0
;uart.c,31 :: 		}
L_main3:
;uart.c,32 :: 		uart1=uart;
	MOVF       main_uart_L0+0, 0
	MOVWF      main_uart1_L0+0
;uart.c,34 :: 		}
	GOTO       L_main1
;uart.c,35 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
