
_lcd_data:

;LCD.c,2 :: 		void lcd_data(int dataa)
;LCD.c,4 :: 		PORTB=dataa;
	MOVF       FARG_lcd_data_dataa+0, 0
	MOVWF      PORTB+0
;LCD.c,6 :: 		PORTE|=(1<<RE2);
	BSF        PORTE+0, 2
;LCD.c,7 :: 		Delay_ms(4);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_lcd_data0:
	DECFSZ     R13+0, 1
	GOTO       L_lcd_data0
	DECFSZ     R12+0, 1
	GOTO       L_lcd_data0
	NOP
;LCD.c,8 :: 		PORTE&=~(1<<RE2);
	BCF        PORTE+0, 2
;LCD.c,9 :: 		}
L_end_lcd_data:
	RETURN
; end of _lcd_data

_lcd_cmds:

;LCD.c,11 :: 		void lcd_cmds(int dataa)
;LCD.c,13 :: 		PORTE&=~(1<<RE1);
	BCF        PORTE+0, 1
;LCD.c,15 :: 		lcd_data(dataa);
	MOVF       FARG_lcd_cmds_dataa+0, 0
	MOVWF      FARG_lcd_data_dataa+0
	MOVF       FARG_lcd_cmds_dataa+1, 0
	MOVWF      FARG_lcd_data_dataa+1
	CALL       _lcd_data+0
;LCD.c,16 :: 		}
L_end_lcd_cmds:
	RETURN
; end of _lcd_cmds

_lcd_int:

;LCD.c,18 :: 		void lcd_int()
;LCD.c,20 :: 		lcd_cmds(0x38);
	MOVLW      56
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;LCD.c,21 :: 		lcd_cmds(0x0C);
	MOVLW      12
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;LCD.c,22 :: 		}
L_end_lcd_int:
	RETURN
; end of _lcd_int

_lcd_message:

;LCD.c,25 :: 		void lcd_message(char *dataa)
;LCD.c,27 :: 		PORTE|=(1<<RE1);
	BSF        PORTE+0, 1
;LCD.c,29 :: 		while(*dataa)
L_lcd_message1:
	MOVF       FARG_lcd_message_dataa+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_message2
;LCD.c,30 :: 		lcd_data(*dataa++);
	MOVF       FARG_lcd_message_dataa+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_lcd_data_dataa+0
	CLRF       FARG_lcd_data_dataa+1
	MOVLW      0
	MOVWF      FARG_lcd_data_dataa+1
	CALL       _lcd_data+0
	INCF       FARG_lcd_message_dataa+0, 1
	GOTO       L_lcd_message1
L_lcd_message2:
;LCD.c,31 :: 		}
L_end_lcd_message:
	RETURN
; end of _lcd_message

_lcd_goto:

;LCD.c,33 :: 		void lcd_goto(int x,int y)
;LCD.c,36 :: 		if (y==0)
	MOVLW      0
	XORWF      FARG_lcd_goto_y+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lcd_goto15
	MOVLW      0
	XORWF      FARG_lcd_goto_y+0, 0
L__lcd_goto15:
	BTFSS      STATUS+0, 2
	GOTO       L_lcd_goto3
;LCD.c,38 :: 		lcd_cmds(0x80+x);
	MOVF       FARG_lcd_goto_x+0, 0
	ADDLW      128
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_lcd_goto_x+1, 0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;LCD.c,39 :: 		}
	GOTO       L_lcd_goto4
L_lcd_goto3:
;LCD.c,42 :: 		lcd_cmds(0x80+0x40+x);
	MOVF       FARG_lcd_goto_x+0, 0
	ADDLW      192
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_lcd_goto_x+1, 0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;LCD.c,43 :: 		}
L_lcd_goto4:
;LCD.c,44 :: 		}
L_end_lcd_goto:
	RETURN
; end of _lcd_goto

_main:

;LCD.c,47 :: 		void main() {
;LCD.c,49 :: 		ADCON1=0x07;     //MAKING ANALOG PINS TO ACT DIGITAL PINS
	MOVLW      7
	MOVWF      ADCON1+0
;LCD.c,52 :: 		TRISE=0X00;
	CLRF       TRISE+0
;LCD.c,53 :: 		TRISB=0X00;
	CLRF       TRISB+0
;LCD.c,56 :: 		Delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;LCD.c,57 :: 		lcd_int();
	CALL       _lcd_int+0
;LCD.c,59 :: 		while(1)
L_main6:
;LCD.c,62 :: 		lcd_goto(2,0);
	MOVLW      2
	MOVWF      FARG_lcd_goto_x+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_x+1
	CLRF       FARG_lcd_goto_y+0
	CLRF       FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;LCD.c,63 :: 		lcd_message("well come to");
	MOVLW      ?lstr1_LCD+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;LCD.c,64 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
;LCD.c,65 :: 		lcd_goto(0,1);
	CLRF       FARG_lcd_goto_x+0
	CLRF       FARG_lcd_goto_x+1
	MOVLW      1
	MOVWF      FARG_lcd_goto_y+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;LCD.c,66 :: 		lcd_message("NSK ELECTRONICS");
	MOVLW      ?lstr2_LCD+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;LCD.c,67 :: 		Delay_ms(3000);
	MOVLW      77
	MOVWF      R11+0
	MOVLW      25
	MOVWF      R12+0
	MOVLW      79
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;LCD.c,68 :: 		lcd_cmds(0x01);
	MOVLW      1
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;LCD.c,69 :: 		}
	GOTO       L_main6
;LCD.c,71 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
