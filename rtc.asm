
_lcd_data:

;rtc.c,17 :: 		void lcd_data(int dataa)
;rtc.c,19 :: 		PORTB=dataa;
	MOVF       FARG_lcd_data_dataa+0, 0
	MOVWF      PORTB+0
;rtc.c,21 :: 		PORTE|=(1<<RE2);
	BSF        PORTE+0, 2
;rtc.c,22 :: 		Delay_ms(4);
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
;rtc.c,23 :: 		PORTE&=~(1<<RE2);
	BCF        PORTE+0, 2
;rtc.c,24 :: 		}
L_end_lcd_data:
	RETURN
; end of _lcd_data

_lcd_cmds:

;rtc.c,26 :: 		void lcd_cmds(int dataa)
;rtc.c,28 :: 		PORTE&=~(1<<RE1);
	BCF        PORTE+0, 1
;rtc.c,30 :: 		lcd_data(dataa);
	MOVF       FARG_lcd_cmds_dataa+0, 0
	MOVWF      FARG_lcd_data_dataa+0
	MOVF       FARG_lcd_cmds_dataa+1, 0
	MOVWF      FARG_lcd_data_dataa+1
	CALL       _lcd_data+0
;rtc.c,31 :: 		}
L_end_lcd_cmds:
	RETURN
; end of _lcd_cmds

_lcd_int:

;rtc.c,33 :: 		void lcd_int()
;rtc.c,35 :: 		lcd_cmds(0x38);
	MOVLW      56
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;rtc.c,36 :: 		lcd_cmds(0x0C);
	MOVLW      12
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;rtc.c,37 :: 		}
L_end_lcd_int:
	RETURN
; end of _lcd_int

_lcd_message:

;rtc.c,40 :: 		void lcd_message(char *dataa)
;rtc.c,42 :: 		PORTE|=(1<<RE1);
	BSF        PORTE+0, 1
;rtc.c,44 :: 		while(*dataa)
L_lcd_message1:
	MOVF       FARG_lcd_message_dataa+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_message2
;rtc.c,45 :: 		lcd_data(*dataa++);
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
;rtc.c,46 :: 		}
L_end_lcd_message:
	RETURN
; end of _lcd_message

_lcd_goto:

;rtc.c,48 :: 		void lcd_goto(int x,int y)
;rtc.c,51 :: 		if (y==0)
	MOVLW      0
	XORWF      FARG_lcd_goto_y+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lcd_goto14
	MOVLW      0
	XORWF      FARG_lcd_goto_y+0, 0
L__lcd_goto14:
	BTFSS      STATUS+0, 2
	GOTO       L_lcd_goto3
;rtc.c,53 :: 		lcd_cmds(0x80+x);
	MOVF       FARG_lcd_goto_x+0, 0
	ADDLW      128
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_lcd_goto_x+1, 0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;rtc.c,54 :: 		}
	GOTO       L_lcd_goto4
L_lcd_goto3:
;rtc.c,57 :: 		lcd_cmds(0x80+0x40+x);
	MOVF       FARG_lcd_goto_x+0, 0
	ADDLW      192
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_lcd_goto_x+1, 0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;rtc.c,58 :: 		}
L_lcd_goto4:
;rtc.c,59 :: 		}
L_end_lcd_goto:
	RETURN
; end of _lcd_goto

_main:

;rtc.c,62 :: 		void main() {
;rtc.c,64 :: 		ADCON1=0x07;     //MAKING ANALOG PINS TO ACT DIGITAL PINS
	MOVLW      7
	MOVWF      ADCON1+0
;rtc.c,67 :: 		TRISE=0X00;
	CLRF       TRISE+0
;rtc.c,68 :: 		TRISB=0X00;
	CLRF       TRISB+0
;rtc.c,69 :: 		TRISC=0xFF;
	MOVLW      255
	MOVWF      TRISC+0
;rtc.c,70 :: 		PORTB=0x00;
	CLRF       PORTB+0
;rtc.c,71 :: 		Delay_ms(2000);
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
;rtc.c,72 :: 		lcd_int();
	CALL       _lcd_int+0
;rtc.c,73 :: 		lcd_cmds(0x01);
	MOVLW      1
	MOVWF      FARG_lcd_cmds_dataa+0
	MOVLW      0
	MOVWF      FARG_lcd_cmds_dataa+1
	CALL       _lcd_cmds+0
;rtc.c,74 :: 		I2C1_Init(100000); //DS1307 I2C is running at 100KHz
	MOVLW      50
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;rtc.c,75 :: 		lcd_goto(0,0);
	CLRF       FARG_lcd_goto_x+0
	CLRF       FARG_lcd_goto_x+1
	CLRF       FARG_lcd_goto_y+0
	CLRF       FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;rtc.c,76 :: 		lcd_message("TIME:");
	MOVLW      ?lstr1_rtc+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;rtc.c,77 :: 		lcd_goto(0,1);
	CLRF       FARG_lcd_goto_x+0
	CLRF       FARG_lcd_goto_x+1
	MOVLW      1
	MOVWF      FARG_lcd_goto_y+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;rtc.c,78 :: 		lcd_message("DATE:");
	MOVLW      ?lstr2_rtc+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;rtc.c,83 :: 		write_ds1307(1,0x00); //write min 00
	MOVLW      1
	MOVWF      FARG_write_ds1307_address+0
	CLRF       FARG_write_ds1307_w_data+0
	CALL       _write_ds1307+0
;rtc.c,84 :: 		write_ds1307(2,0x07); //write hour 07
	MOVLW      2
	MOVWF      FARG_write_ds1307_address+0
	MOVLW      7
	MOVWF      FARG_write_ds1307_w_data+0
	CALL       _write_ds1307+0
;rtc.c,85 :: 		write_ds1307(4,0x27); // write date 27
	MOVLW      4
	MOVWF      FARG_write_ds1307_address+0
	MOVLW      39
	MOVWF      FARG_write_ds1307_w_data+0
	CALL       _write_ds1307+0
;rtc.c,86 :: 		write_ds1307(5,0x11); // write month 11
	MOVLW      5
	MOVWF      FARG_write_ds1307_address+0
	MOVLW      17
	MOVWF      FARG_write_ds1307_w_data+0
	CALL       _write_ds1307+0
;rtc.c,87 :: 		write_ds1307(6,0x17); // write year 17
	MOVLW      6
	MOVWF      FARG_write_ds1307_address+0
	MOVLW      23
	MOVWF      FARG_write_ds1307_w_data+0
	CALL       _write_ds1307+0
;rtc.c,89 :: 		write_ds1307(0,0x00); //Reset second to 0 sec. and start Oscillator
	CLRF       FARG_write_ds1307_address+0
	CLRF       FARG_write_ds1307_w_data+0
	CALL       _write_ds1307+0
;rtc.c,91 :: 		while(1)
L_main6:
;rtc.c,93 :: 		sec=read_ds1307(0); // read second
	CLRF       FARG_read_ds1307_address+0
	CALL       _read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _sec+0
;rtc.c,94 :: 		minute=read_ds1307(1); // read minute
	MOVLW      1
	MOVWF      FARG_read_ds1307_address+0
	CALL       _read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _minute+0
;rtc.c,95 :: 		hour=read_ds1307(2); // read hour
	MOVLW      2
	MOVWF      FARG_read_ds1307_address+0
	CALL       _read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _hour+0
;rtc.c,97 :: 		date=read_ds1307(4); // read date
	MOVLW      4
	MOVWF      FARG_read_ds1307_address+0
	CALL       _read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _date+0
;rtc.c,98 :: 		month=read_ds1307(5); // read month
	MOVLW      5
	MOVWF      FARG_read_ds1307_address+0
	CALL       _read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _month+0
;rtc.c,99 :: 		year=read_ds1307(6); // read year
	MOVLW      6
	MOVWF      FARG_read_ds1307_address+0
	CALL       _read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _year+0
;rtc.c,101 :: 		time[0] = BCD2UpperCh(hour);
	MOVF       _hour+0, 0
	MOVWF      FARG_BCD2UpperCh_bcd+0
	CALL       _BCD2UpperCh+0
	MOVF       R0+0, 0
	MOVWF      _time+0
;rtc.c,102 :: 		time[1] = BCD2LowerCh(hour);
	MOVF       _hour+0, 0
	MOVWF      FARG_BCD2LowerCh_bcd+0
	CALL       _BCD2LowerCh+0
	MOVF       R0+0, 0
	MOVWF      _time+1
;rtc.c,103 :: 		time[2] = ':';
	MOVLW      58
	MOVWF      _time+2
;rtc.c,104 :: 		time[3] = BCD2UpperCh(minute);
	MOVF       _minute+0, 0
	MOVWF      FARG_BCD2UpperCh_bcd+0
	CALL       _BCD2UpperCh+0
	MOVF       R0+0, 0
	MOVWF      _time+3
;rtc.c,105 :: 		time[4] = BCD2LowerCh(minute);
	MOVF       _minute+0, 0
	MOVWF      FARG_BCD2LowerCh_bcd+0
	CALL       _BCD2LowerCh+0
	MOVF       R0+0, 0
	MOVWF      _time+4
;rtc.c,106 :: 		time[5] = ':';
	MOVLW      58
	MOVWF      _time+5
;rtc.c,107 :: 		time[6] = BCD2UpperCh(sec);
	MOVF       _sec+0, 0
	MOVWF      FARG_BCD2UpperCh_bcd+0
	CALL       _BCD2UpperCh+0
	MOVF       R0+0, 0
	MOVWF      _time+6
;rtc.c,108 :: 		time[7] = BCD2LowerCh(sec);
	MOVF       _sec+0, 0
	MOVWF      FARG_BCD2LowerCh_bcd+0
	CALL       _BCD2LowerCh+0
	MOVF       R0+0, 0
	MOVWF      _time+7
;rtc.c,109 :: 		time[8] = '\0';
	CLRF       _time+8
;rtc.c,111 :: 		ddate[0] = BCD2UpperCh(date);
	MOVF       _date+0, 0
	MOVWF      FARG_BCD2UpperCh_bcd+0
	CALL       _BCD2UpperCh+0
	MOVF       R0+0, 0
	MOVWF      _ddate+0
;rtc.c,112 :: 		ddate[1] = BCD2LowerCh(date);
	MOVF       _date+0, 0
	MOVWF      FARG_BCD2LowerCh_bcd+0
	CALL       _BCD2LowerCh+0
	MOVF       R0+0, 0
	MOVWF      _ddate+1
;rtc.c,113 :: 		ddate[2] ='/';
	MOVLW      47
	MOVWF      _ddate+2
;rtc.c,114 :: 		ddate[3] = BCD2UpperCh(month);
	MOVF       _month+0, 0
	MOVWF      FARG_BCD2UpperCh_bcd+0
	CALL       _BCD2UpperCh+0
	MOVF       R0+0, 0
	MOVWF      _ddate+3
;rtc.c,115 :: 		ddate[4] = BCD2LowerCh(month);
	MOVF       _month+0, 0
	MOVWF      FARG_BCD2LowerCh_bcd+0
	CALL       _BCD2LowerCh+0
	MOVF       R0+0, 0
	MOVWF      _ddate+4
;rtc.c,116 :: 		ddate[5] ='/';
	MOVLW      47
	MOVWF      _ddate+5
;rtc.c,117 :: 		ddate[6] = '2';
	MOVLW      50
	MOVWF      _ddate+6
;rtc.c,118 :: 		ddate[7] = '0';
	MOVLW      48
	MOVWF      _ddate+7
;rtc.c,119 :: 		ddate[8] = BCD2UpperCh(year);
	MOVF       _year+0, 0
	MOVWF      FARG_BCD2UpperCh_bcd+0
	CALL       _BCD2UpperCh+0
	MOVF       R0+0, 0
	MOVWF      _ddate+8
;rtc.c,120 :: 		ddate[9] = BCD2LowerCh(year);
	MOVF       _year+0, 0
	MOVWF      FARG_BCD2LowerCh_bcd+0
	CALL       _BCD2LowerCh+0
	MOVF       R0+0, 0
	MOVWF      _ddate+9
;rtc.c,121 :: 		ddate[10] = '\0';
	CLRF       _ddate+10
;rtc.c,123 :: 		lcd_goto(6,0);
	MOVLW      6
	MOVWF      FARG_lcd_goto_x+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_x+1
	CLRF       FARG_lcd_goto_y+0
	CLRF       FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;rtc.c,124 :: 		lcd_message(time);
	MOVLW      _time+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;rtc.c,125 :: 		lcd_goto(6,1);
	MOVLW      6
	MOVWF      FARG_lcd_goto_x+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_x+1
	MOVLW      1
	MOVWF      FARG_lcd_goto_y+0
	MOVLW      0
	MOVWF      FARG_lcd_goto_y+1
	CALL       _lcd_goto+0
;rtc.c,126 :: 		lcd_message(ddate);
	MOVLW      _ddate+0
	MOVWF      FARG_lcd_message_dataa+0
	CALL       _lcd_message+0
;rtc.c,128 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;rtc.c,130 :: 		}
	GOTO       L_main6
;rtc.c,131 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_read_ds1307:

;rtc.c,133 :: 		unsigned short read_ds1307(unsigned short address)
;rtc.c,135 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;rtc.c,136 :: 		I2C1_Wr(0xd0); //address 0x68 followed by direction bit (0 for write, 1 for read) 0x68 followed by 0 --> 0xD0
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,137 :: 		I2C1_Wr(address);
	MOVF       FARG_read_ds1307_address+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,138 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;rtc.c,139 :: 		I2C1_Wr(0xd1); //0x68 followed by 1 --> 0xD1
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,140 :: 		dataa=I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _dataa+0
;rtc.c,141 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;rtc.c,142 :: 		return(dataa);
	MOVF       _dataa+0, 0
	MOVWF      R0+0
;rtc.c,143 :: 		}
L_end_read_ds1307:
	RETURN
; end of _read_ds1307

_BCD2UpperCh:

;rtc.c,145 :: 		unsigned char BCD2UpperCh(unsigned char bcd)
;rtc.c,147 :: 		return ((bcd >> 4) + '0');
	MOVF       FARG_BCD2UpperCh_bcd+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      48
	ADDWF      R0+0, 1
;rtc.c,148 :: 		}
L_end_BCD2UpperCh:
	RETURN
; end of _BCD2UpperCh

_BCD2LowerCh:

;rtc.c,150 :: 		unsigned char BCD2LowerCh(unsigned char bcd)
;rtc.c,152 :: 		return ((bcd & 0x0F) + '0');
	MOVLW      15
	ANDWF      FARG_BCD2LowerCh_bcd+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
;rtc.c,153 :: 		}
L_end_BCD2LowerCh:
	RETURN
; end of _BCD2LowerCh

_write_ds1307:

;rtc.c,154 :: 		void write_ds1307(unsigned short address,unsigned short w_data)
;rtc.c,156 :: 		I2C1_Start(); // issue I2C start signal
	CALL       _I2C1_Start+0
;rtc.c,158 :: 		I2C1_Wr(0xD0); // send byte via I2C (device address + W)
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,159 :: 		I2C1_Wr(address); // send byte (address of DS1307 location)
	MOVF       FARG_write_ds1307_address+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,160 :: 		I2C1_Wr(w_data); // send data (data to be written)
	MOVF       FARG_write_ds1307_w_data+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,161 :: 		I2C1_Stop(); // issue I2C stop signal
	CALL       _I2C1_Stop+0
;rtc.c,162 :: 		}
L_end_write_ds1307:
	RETURN
; end of _write_ds1307
