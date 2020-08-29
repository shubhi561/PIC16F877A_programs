
_lcd_data:

;EEPROM.c,2 :: 		void lcd_data(int dataa)
;EEPROM.c,4 :: 		PORTB=dataa;
	MOVF       FARG_lcd_data_dataa+0, 0
	MOVWF      PORTB+0
;EEPROM.c,6 :: 		PORTE|=(1<<RE2);
	BSF        PORTE+0, 2
;EEPROM.c,7 :: 		Delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_lcd_data0:
	DECFSZ     R13+0, 1
	GOTO       L_lcd_data0
	DECFSZ     R12+0, 1
	GOTO       L_lcd_data0
	NOP
;EEPROM.c,8 :: 		PORTE&=~(1<<RE2);
	BCF        PORTE+0, 2
;EEPROM.c,9 :: 		}
L_end_lcd_data:
	RETURN
; end of _lcd_data

_lcd_cmds:

;EEPROM.c,11 :: 		void lcd_cmds(int dataa)
;EEPROM.c,13 :: 		PORTE&=~(1<<RE1);
	BCF        PORTE+0, 1
;EEPROM.c,15 :: 		lcd_data(dataa);
	MOVF       FARG_lcd_cmds_dataa+0, 0
	MOVWF      FARG_lcd_data_dataa+0
	MOVF       FARG_lcd_cmds_dataa+1, 0
	MOVWF      FARG_lcd_data_dataa+1
	CALL       _lcd_data+0
;EEPROM.c,16 :: 		}
L_end_lcd_cmds:
	RETURN
; end of _lcd_cmds

_lcd_int:

;EEPROM.c,18 :: 		void lcd_int()
;EEPROM.c,20 :: 		lcd_cmds(0x38);
	MOVLW      56
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;EEPROM.c,21 :: 		lcd_cmds(0x0C);
	MOVLW      12
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;EEPROM.c,22 :: 		}
L_end_lcd_int:
	RETURN
; end of _lcd_int

_lcd_message:

;EEPROM.c,25 :: 		void lcd_message(char *dataa)
;EEPROM.c,27 :: 		PORTE|=(1<<RE1);
	BSF        PORTE+0, 1
;EEPROM.c,29 :: 		while(*dataa)
L_lcd_message1:
	MOVF       FARG_lcd_message_dataa+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_message2
;EEPROM.c,30 :: 		lcd_data(*dataa++);
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
;EEPROM.c,31 :: 		}
L_end_lcd_message:
	RETURN
; end of _lcd_message

_lcd_goto:

;EEPROM.c,33 :: 		void lcd_goto(int x,int y)
;EEPROM.c,36 :: 		if (y==0)
	MOVLW      0
	XORWF      FARG_lcd_goto_y+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lcd_goto15
	MOVLW      0
	XORWF      FARG_lcd_goto_y+0, 0
L__lcd_goto15:
	BTFSS      STATUS+0, 2
	GOTO       L_lcd_goto3
;EEPROM.c,38 :: 		lcd_cmds(0x80+x);
	MOVF       FARG_lcd_goto_x+0, 0
	ADDLW      128
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_lcd_goto_x+1, 0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;EEPROM.c,39 :: 		}
	GOTO       L_lcd_goto4
L_lcd_goto3:
;EEPROM.c,42 :: 		lcd_cmds(0x80+0x40+x);
	MOVF       FARG_lcd_goto_x+0, 0
	ADDLW      192
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_lcd_goto_x+1, 0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;EEPROM.c,43 :: 		}
L_lcd_goto4:
;EEPROM.c,44 :: 		}
L_end_lcd_goto:
	RETURN
; end of _lcd_goto

_adcint:

;EEPROM.c,45 :: 		void adcint()
;EEPROM.c,47 :: 		ADCON0=0X0D;  //adc int
	MOVLW      13
	MOVWF      ADCON0+0
;EEPROM.c,48 :: 		ADCON1=0X09;
	MOVLW      9
	MOVWF      ADCON1+0
;EEPROM.c,49 :: 		}
L_end_adcint:
	RETURN
; end of _adcint

_adcread:

;EEPROM.c,52 :: 		void adcread()
;EEPROM.c,56 :: 		adcint();
	CALL       _adcint+0
;EEPROM.c,57 :: 		I2C1_Start();              // issue I2C start signal
	CALL       _I2C1_Start+0
;EEPROM.c,58 :: 		I2C1_Wr(0xA2);             // send byte via I2C  (device address + W)
	MOVLW      162
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,59 :: 		I2C1_Wr(2);                // send byte (data address)
	MOVLW      2
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,60 :: 		I2C1_Repeated_Start();     // issue I2C signal repeated start
	CALL       _I2C1_Repeated_Start+0
;EEPROM.c,61 :: 		I2C1_Wr(0xA3);             // send byte (device address + R)
	MOVLW      163
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,62 :: 		temp_res = I2C1_Rd(0u);       // Read the data (NO acknowledge)
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      adcread_temp_res_L0+0
;EEPROM.c,63 :: 		I2C1_Stop();               // issue I2C stop signal
	CALL       _I2C1_Stop+0
;EEPROM.c,64 :: 		ByteToStr(temp_res,temp_text);
	MOVF       adcread_temp_res_L0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      adcread_temp_text_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;EEPROM.c,66 :: 		PORTE|=(1<<RE1);
	BSF        PORTE+0, 1
;EEPROM.c,67 :: 		if(temp_res==0x0A)
	MOVF       adcread_temp_res_L0+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_adcread5
;EEPROM.c,69 :: 		lcd_goto(5,1);
	MOVLW      5
	MOVWF      FARG_lcd_goto_x+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_x+1
	MOVLW      1
	MOVWF      FARG_lcd_goto_y+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;EEPROM.c,70 :: 		lcd_message("PASS");
	MOVLW      ?lstr1_EEPROM+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;EEPROM.c,71 :: 		}
	GOTO       L_adcread6
L_adcread5:
;EEPROM.c,74 :: 		lcd_goto(5,1);
	MOVLW      5
	MOVWF      FARG_lcd_goto_x+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_x+1
	MOVLW      1
	MOVWF      FARG_lcd_goto_y+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;EEPROM.c,75 :: 		lcd_message("FAIL");
	MOVLW      ?lstr2_EEPROM+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;EEPROM.c,76 :: 		}
L_adcread6:
;EEPROM.c,77 :: 		}
L_end_adcread:
	RETURN
; end of _adcread

_main:

;EEPROM.c,82 :: 		void main()
;EEPROM.c,84 :: 		ADCON1=0X06;
	MOVLW      6
	MOVWF      ADCON1+0
;EEPROM.c,85 :: 		TRISE=0X00;
	CLRF       TRISE+0
;EEPROM.c,86 :: 		TRISB=0X00;
	CLRF       TRISB+0
;EEPROM.c,87 :: 		TRISD=0X00;
	CLRF       TRISD+0
;EEPROM.c,88 :: 		TRISA=0X02;
	MOVLW      2
	MOVWF      TRISA+0
;EEPROM.c,89 :: 		Delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;EEPROM.c,90 :: 		lcd_int();
	CALL       _lcd_int+0
;EEPROM.c,91 :: 		lcd_cmds(0x01);
	MOVLW      1
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;EEPROM.c,92 :: 		I2C1_Init(100000);         // initialize I2C communication
	MOVLW      50
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;EEPROM.c,93 :: 		I2C1_Start();              // issue I2C start signal
	CALL       _I2C1_Start+0
;EEPROM.c,94 :: 		I2C1_Wr(0xA2);             // send byte via I2C  (device address + W)
	MOVLW      162
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,95 :: 		I2C1_Wr(2);                // send byte (address of EEPROM location)
	MOVLW      2
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,96 :: 		I2C1_Wr(0x0A);             // send data (data to be written)
	MOVLW      10
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,97 :: 		I2C1_Stop();               // issue I2C stop signal
	CALL       _I2C1_Stop+0
;EEPROM.c,98 :: 		while(1)
L_main8:
;EEPROM.c,101 :: 		lcd_goto(0,0);
	CLRF       FARG_lcd_goto_x+0
	CLRF       FARG_lcd_goto_x+1
	CLRF       FARG_lcd_goto_y+0
	CLRF       FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;EEPROM.c,102 :: 		lcd_message("EEPROM READING");
	MOVLW      ?lstr3_EEPROM+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;EEPROM.c,103 :: 		adcread();
	CALL       _adcread+0
;EEPROM.c,104 :: 		}
	GOTO       L_main8
;EEPROM.c,105 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
