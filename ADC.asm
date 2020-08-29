
_lcd_data:

;ADC.c,2 :: 		void lcd_data(int dataa)
;ADC.c,4 :: 		PORTB=dataa;
	MOVF       FARG_lcd_data_dataa+0, 0
	MOVWF      PORTB+0
;ADC.c,6 :: 		PORTE|=(1<<RE2);
	BSF        PORTE+0, 2
;ADC.c,7 :: 		Delay_ms(5);
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
;ADC.c,8 :: 		PORTE&=~(1<<RE2);
	BCF        PORTE+0, 2
;ADC.c,9 :: 		}
L_end_lcd_data:
	RETURN
; end of _lcd_data

_lcd_cmds:

;ADC.c,11 :: 		void lcd_cmds(int dataa)
;ADC.c,13 :: 		PORTE&=~(1<<RE1);
	BCF        PORTE+0, 1
;ADC.c,15 :: 		lcd_data(dataa);
	MOVF       FARG_lcd_cmds_dataa+0, 0
	MOVWF      FARG_lcd_data_dataa+0
	MOVF       FARG_lcd_cmds_dataa+1, 0
	MOVWF      FARG_lcd_data_dataa+1
	CALL       _lcd_data+0
;ADC.c,16 :: 		}
L_end_lcd_cmds:
	RETURN
; end of _lcd_cmds

_lcd_int:

;ADC.c,18 :: 		void lcd_int()
;ADC.c,20 :: 		lcd_cmds(0x38);
	MOVLW      56
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;ADC.c,21 :: 		lcd_cmds(0x0C);
	MOVLW      12
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;ADC.c,22 :: 		}
L_end_lcd_int:
	RETURN
; end of _lcd_int

_lcd_message:

;ADC.c,25 :: 		void lcd_message(char *dataa)
;ADC.c,27 :: 		PORTE|=(1<<RE1);
	BSF        PORTE+0, 1
;ADC.c,29 :: 		while(*dataa)
L_lcd_message1:
	MOVF       FARG_lcd_message_dataa+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_message2
;ADC.c,30 :: 		lcd_data(*dataa++);
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
;ADC.c,31 :: 		}
L_end_lcd_message:
	RETURN
; end of _lcd_message

_lcd_goto:

;ADC.c,33 :: 		void lcd_goto(int x,int y)
;ADC.c,36 :: 		if (y==0)
	MOVLW      0
	XORWF      FARG_lcd_goto_y+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lcd_goto23
	MOVLW      0
	XORWF      FARG_lcd_goto_y+0, 0
L__lcd_goto23:
	BTFSS      STATUS+0, 2
	GOTO       L_lcd_goto3
;ADC.c,38 :: 		lcd_cmds(0x80+x);
	MOVF       FARG_lcd_goto_x+0, 0
	ADDLW      128
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_lcd_goto_x+1, 0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;ADC.c,39 :: 		}
	GOTO       L_lcd_goto4
L_lcd_goto3:
;ADC.c,42 :: 		lcd_cmds(0x80+0x40+x);
	MOVF       FARG_lcd_goto_x+0, 0
	ADDLW      192
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_lcd_goto_x+1, 0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;ADC.c,43 :: 		}
L_lcd_goto4:
;ADC.c,44 :: 		}
L_end_lcd_goto:
	RETURN
; end of _lcd_goto

_adcint:

;ADC.c,45 :: 		void adcint()
;ADC.c,47 :: 		ADCON0=0X05;  //adc int
	MOVLW      5
	MOVWF      ADCON0+0
;ADC.c,48 :: 		ADCON1=0X09;
	MOVLW      9
	MOVWF      ADCON1+0
;ADC.c,49 :: 		}
L_end_adcint:
	RETURN
; end of _adcint

_adcread:

;ADC.c,52 :: 		void adcread()
;ADC.c,56 :: 		adcint();
	CALL       _adcint+0
;ADC.c,59 :: 		if((ADCON0 & 0XFF)==0X01)//wait for adc result
	MOVLW      255
	ANDWF      ADCON0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_adcread5
;ADC.c,61 :: 		PORTD=ADRESH;    //DISPLAY TROUGH LED
	MOVF       ADRESH+0, 0
	MOVWF      PORTD+0
;ADC.c,63 :: 		temp_res =ADRESH;
	MOVF       ADRESH+0, 0
	MOVWF      adcread_temp_res_L0+0
;ADC.c,64 :: 		ByteToStr(temp_res,temp_text);
	MOVF       adcread_temp_res_L0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      adcread_temp_text_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;ADC.c,65 :: 		PORTE|=(1<<RE1);
	BSF        PORTE+0, 1
;ADC.c,66 :: 		lcd_goto(0,0);
	CLRF       FARG_lcd_goto_x+0
	CLRF       FARG_lcd_goto_x+1
	CLRF       FARG_lcd_goto_y+0
	CLRF       FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;ADC.c,67 :: 		lcd_message("CBR300 SPEED ");
	MOVLW      ?lstr1_ADC+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;ADC.c,68 :: 		lcd_message(temp_text);
	MOVLW      adcread_temp_text_L0+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;ADC.c,72 :: 		if(temp_res<=25)
	MOVF       adcread_temp_res_L0+0, 0
	SUBLW      25
	BTFSS      STATUS+0, 0
	GOTO       L_adcread6
;ADC.c,74 :: 		lcd_goto(0,1);
	CLRF       FARG_lcd_goto_x+0
	CLRF       FARG_lcd_goto_x+1
	MOVLW      1
	MOVWF      FARG_lcd_goto_y+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;ADC.c,75 :: 		lcd_message("LOW SPEED       ");
	MOVLW      ?lstr2_ADC+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;ADC.c,76 :: 		}
L_adcread6:
;ADC.c,78 :: 		if(temp_res<=40)
	MOVF       adcread_temp_res_L0+0, 0
	SUBLW      40
	BTFSS      STATUS+0, 0
	GOTO       L_adcread7
;ADC.c,80 :: 		if(temp_res>25)
	MOVF       adcread_temp_res_L0+0, 0
	SUBLW      25
	BTFSC      STATUS+0, 0
	GOTO       L_adcread8
;ADC.c,82 :: 		lcd_goto(0,1);
	CLRF       FARG_lcd_goto_x+0
	CLRF       FARG_lcd_goto_x+1
	MOVLW      1
	MOVWF      FARG_lcd_goto_y+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;ADC.c,83 :: 		lcd_message("MEDIUM SPEED        ");
	MOVLW      ?lstr3_ADC+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;ADC.c,84 :: 		}
L_adcread8:
;ADC.c,85 :: 		}
L_adcread7:
;ADC.c,87 :: 		if(temp_res>40)
	MOVF       adcread_temp_res_L0+0, 0
	SUBLW      40
	BTFSC      STATUS+0, 0
	GOTO       L_adcread9
;ADC.c,89 :: 		if(temp_res<=80)
	MOVF       adcread_temp_res_L0+0, 0
	SUBLW      80
	BTFSS      STATUS+0, 0
	GOTO       L_adcread10
;ADC.c,91 :: 		lcd_goto(0,1);
	CLRF       FARG_lcd_goto_x+0
	CLRF       FARG_lcd_goto_x+1
	MOVLW      1
	MOVWF      FARG_lcd_goto_y+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;ADC.c,92 :: 		lcd_message("HIGH SPEED        ");
	MOVLW      ?lstr4_ADC+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;ADC.c,94 :: 		}
L_adcread10:
;ADC.c,95 :: 		}
L_adcread9:
;ADC.c,98 :: 		if(temp_res>80)
	MOVF       adcread_temp_res_L0+0, 0
	SUBLW      80
	BTFSC      STATUS+0, 0
	GOTO       L_adcread11
;ADC.c,100 :: 		if(temp_res<=150)
	MOVF       adcread_temp_res_L0+0, 0
	SUBLW      150
	BTFSS      STATUS+0, 0
	GOTO       L_adcread12
;ADC.c,102 :: 		lcd_goto(0,1);
	CLRF       FARG_lcd_goto_x+0
	CLRF       FARG_lcd_goto_x+1
	MOVLW      1
	MOVWF      FARG_lcd_goto_y+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;ADC.c,103 :: 		lcd_message("VERY HIGH SPEED      ");
	MOVLW      ?lstr5_ADC+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;ADC.c,104 :: 		}
L_adcread12:
;ADC.c,105 :: 		}
L_adcread11:
;ADC.c,107 :: 		if(temp_res>150)
	MOVF       adcread_temp_res_L0+0, 0
	SUBLW      150
	BTFSC      STATUS+0, 0
	GOTO       L_adcread13
;ADC.c,109 :: 		if(temp_res<=255)
	MOVF       adcread_temp_res_L0+0, 0
	SUBLW      255
	BTFSS      STATUS+0, 0
	GOTO       L_adcread14
;ADC.c,111 :: 		lcd_goto(0,1);
	CLRF       FARG_lcd_goto_x+0
	CLRF       FARG_lcd_goto_x+1
	MOVLW      1
	MOVWF      FARG_lcd_goto_y+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;ADC.c,112 :: 		lcd_message("DANGER         ");
	MOVLW      ?lstr6_ADC+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;ADC.c,113 :: 		}
L_adcread14:
;ADC.c,114 :: 		}
L_adcread13:
;ADC.c,116 :: 		}
L_adcread5:
;ADC.c,117 :: 		}
L_end_adcread:
	RETURN
; end of _adcread

_main:

;ADC.c,121 :: 		void main()
;ADC.c,123 :: 		ADCON1=0X06;
	MOVLW      6
	MOVWF      ADCON1+0
;ADC.c,124 :: 		TRISE=0X00;
	CLRF       TRISE+0
;ADC.c,125 :: 		TRISB=0X00;
	CLRF       TRISB+0
;ADC.c,126 :: 		TRISD=0X00;
	CLRF       TRISD+0
;ADC.c,127 :: 		TRISA=0X01;
	MOVLW      1
	MOVWF      TRISA+0
;ADC.c,128 :: 		Delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
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
;ADC.c,129 :: 		lcd_int();
	CALL       _lcd_int+0
;ADC.c,130 :: 		lcd_cmds(0x01);
	MOVLW      1
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;ADC.c,131 :: 		while(1)
L_main16:
;ADC.c,133 :: 		adcread();
	CALL       _adcread+0
;ADC.c,135 :: 		}
	GOTO       L_main16
;ADC.c,137 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
