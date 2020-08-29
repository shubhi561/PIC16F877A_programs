
void lcd_data(int dataa)
        {
                PORTB=dataa;

                PORTE|=(1<<RE2);
                Delay_ms(5);
                PORTE&=~(1<<RE2);
        }

        void lcd_cmds(int dataa)
        {
                PORTE&=~(1<<RE1);

                lcd_data(dataa);
        }

        void lcd_int()
        {
                lcd_cmds(0x38);
                lcd_cmds(0x0C);
        }


        void lcd_message(char *dataa)
        {
                PORTE|=(1<<RE1);

                while(*dataa)
                lcd_data(*dataa++);
        }

        void lcd_goto(int x,int y)
        {

                if (y==0)
                {
                        lcd_cmds(0x80+x);
                }
                else
                {
                        lcd_cmds(0x80+0x40+x);
                }
        }


void main() {
  ADCON1=0x07;     //MAKING ANALOG PINS TO ACT DIGITAL PINS

TRISE=0X00;
TRISB=0X00;
TRISD=0x00;
Delay_ms(2000);
lcd_int();

while(1)
{
   lcd_cmds(0x01);
  PORTD=0XFF;
  if ((PORTD & 0XFF)==0XFE)
{

lcd_goto(0,0);
 lcd_message("HI");
 Delay_ms(100);
}

if ((PORTD & 0XFF)==0XFD)
{

lcd_goto(0,0);
 lcd_message("HELLO");
 Delay_ms(100);
}

if ((PORTD & 0XFF)==0XFB)
{

lcd_goto(0,0);
 lcd_message("GO");
 Delay_ms(100);
}

if ((PORTD & 0XFF)==0XF7)
{

lcd_goto(0,0);
 lcd_message("STOP");
 Delay_ms(100);
}

if ((PORTD & 0XFF)==0XEF)
{

lcd_goto(0,0);
 lcd_message("RIGHT");
 Delay_ms(100);
}

if ((PORTD & 0XFF)==0XDF)
{

lcd_goto(0,0);
 lcd_message("LEFT");
 Delay_ms(100);
}

if ((PORTD & 0XFF)==0XBF)
{

lcd_goto(0,0);
 lcd_message("SPEED");
 Delay_ms(100);
}

if ((PORTD & 0XFF)==0X7F)
{

lcd_goto(0,0);
 lcd_message("SLOW");
 Delay_ms(100);
}
}
}