int a;
int b; 
int aa;
int bb;
int e;

int count[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0X7f,0x6f};
void main() {
TRISB=0X00;
TRISD=0X00;

while(1)
{
for(bb=0;bb<10;bb++)
{
for(aa=0;aa<10;aa++)
{
for(b=0;b<10;b++)
{
for(a=0;a<10;a++)
{
for(e=0;e<18;e++)
{
PORTD=0X01;
PORTB=count[a];
Delay_ms(3);
PORTD=0X00;
PORTD=0X02;
PORTB=count[b];
Delay_ms(3);
PORTD=0X00;
PORTD=0X04;
PORTB=count[aa];
Delay_ms(3);
PORTD=0X00;
PORTD=0X08;
PORTB=count[bb];
Delay_ms(3);
PORTD=0X00;
}
}
}
}
}
}
}