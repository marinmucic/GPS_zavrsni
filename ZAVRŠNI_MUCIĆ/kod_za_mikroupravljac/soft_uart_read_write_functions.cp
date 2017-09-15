#line 1 "C:/Users/Probni/Desktop/soft_uart1/soft_uart_read_write_functions.c"



sbit Mmc_Chip_Select at LATC0_bit;
sbit Mmc_Chip_Select_Direction at TRISC0_bit;





sbit LCD_RS at RA4_bit;
sbit LCD_EN at RA5_bit;
sbit LCD_D4 at RA0_bit;
sbit LCD_D5 at RA1_bit;
sbit LCD_D6 at RA2_bit;
sbit LCD_D7 at RA3_bit;
sbit LCD_RS_Direction at TRISA4_bit;
sbit LCD_EN_Direction at TRISA5_bit;
sbit LCD_D4_Direction at TRISA0_bit;
sbit LCD_D5_Direction at TRISA1_bit;
sbit LCD_D6_Direction at TRISA2_bit;
sbit LCD_D7_Direction at TRISA3_bit;



char err_txt[20] = "FAT16 not found";
char filename[14] = "GPS_DATA.CSV";
char Buffer[512];
char MyTime[10];
char NMEA0[90];
char NMEA1[90];
char NMEA2[90];
char MyLon[15];
char MyLat[15];
char MySpeed[5];
char j, error;
int m;
double fl_lat;
double fl_lon;
double latbuf[10];
double lonbuf[10];
int t = 0;
double D_distance;
char CHBUFDIS[10];
double startlat = 0.0;
double startlon = 0.0;
int i;






 double rad2deg(double rad) {

 return (rad * 180 /  3.14159 );

}

double deg2rad(double deg) {

return (deg *  3.14159  / 180);

}

double distance(double lat1, double lon1, double lat2, double lon2) {

double theta, dist;

theta = lon1 - lon2;
dist = sin(deg2rad(lat1)) * sin(deg2rad(lat2)) + cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * cos(deg2rad(theta));
dist = acos(dist);
dist = rad2deg(dist);
dist = dist * 60 * 1.1515;
dist = dist * 1.609344;
return (dist);

}


void lcd_write(char lat[],char lon[],char speed[],char dist[])
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1,"LAT ");
 Lcd_Out(2, 1, lat);
 Delay_ms(700);
 Lcd_Out(1, 1, "LON ");
 Lcd_Out(2, 1, lon);
 Delay_ms(700);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "SPEED ");
 Lcd_Out(2, 1, speed);
 Delay_ms(700);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "DIST ");
 Lcd_Out(2, 1, dist);

}

 float decimal_to_deg(char latlon[])
 {

 if(isdigit(latlon[0]))
 {
 float xlatlon ;
 int b;
 float u;
 xlatlon = atof(latlon);
 b = xlatlon/100;
 u = (xlatlon/100 - b)*100 ;
 u /= 60;
 u += b;
 return u;


 }


 }

 void mmc_write(char lat[],char lon[])
 {

 Mmc_Fat_Write(lat,7);
 Delay_ms(10);
 Mmc_Fat_Write(" ",1);
 Delay_ms(10);
 Mmc_Fat_Write(lon,7);
 Mmc_Fat_Write("\n",1);

 }


void M_Create_New_File() {
 filename[7] = 'A';
 Mmc_Fat_Assign(&filename, 0xA0);

 }



 void parsing_function(char stringData[],char MySpeedp[],char MyLatp[],char MyLonp[])
 {
 if ((stringData[3] == 'V') && (stringData[4] == 'T') && (stringData[5] == 'G'))
 {
 MySpeedp[0]=stringData[21];
 MySpeedp[1]=stringData[22];
 MySpeedp[2]=stringData[23];
 MySpeedp[3]=stringData[24];
 MySpeedp[4]=stringData[25];
 MySpeedp[5]='\0';


 }
 else{

 if ((stringData[3] == 'G') && (stringData[4] == 'G') && (stringData[5] == 'A'))
 {

 MyLatp[0]=stringData[17];
 MyLatp[1]=stringData[18];
 MyLatp[2]=stringData[19];
 MyLatp[3]=stringData[20];
 MyLatp[4]=stringData[21];
 MyLatp[5]=stringData[22];
 MyLatp[6]=stringData[23];
 MyLatp[7]=stringData[24];
 MyLatp[8]=stringData[25];
 MyLatp[9]=stringData[26];
 MyLatp[10]='\0';




 MyLonp[0]= stringData[30];
 MyLonp[1]= stringData[31];
 MyLonp[2]= stringData[32];
 MyLonp[3]= stringData[33];
 MyLonp[4]= stringData[34];
 MyLonp[5]= stringData[35];
 MyLonp[6]= stringData[36];
 MyLonp[7]= stringData[37];
 MyLonp[8]= stringData[38];
 MyLonp[9]= stringData[39];
 MyLonp[10]= stringData[40];
 MyLonp[11]='\0';




 }else{



 }

 }

 }



 void soft_uart_write_string(char stringData[])
 { char m = 0;
 while (stringData[m] != '\0')
 {
 Soft_UART_Write(stringData[m]);
 Delay_ms(10);
 m++;
 }
 Soft_UART_Write(stringData[m]);


 }

 void soft_uart_read_string(char stringData[])
 { char c = 0, m = 0;
 do{
 if((c = Soft_UART_Read(&error)) == '$'){
 stringData[m]= c ;
 m++;
 while(( c = Soft_UART_Read(&error)) != '\n'){
 stringData[m]= c;
 m++;
 }
 stringData[m]= c ;
 m++;
 stringData[m]='\0';
 break;
 }

 }while(1);

 }

void main(){



 ADCON1 |= 0x0F;
 CMCON |= 7;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Delay_ms(1000);


 Lcd_Out(1, 1, "POCETAK ... ");
 Delay_ms(1000);



 if( ( j = Soft_UART_Init(&PORTB, 4, 1, 5000, 0)) == 0){
 Delay_ms(100);



 SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV64, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
 Delay_ms(20);

 if (Mmc_Fat_Init() == 0) {

 SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
 Delay_ms(20);

 soft_uart_write_string("Test started \n");
 M_Create_New_File();
 soft_uart_write_string("File created \n");
 Lcd_Out(1, 1, "FILE CREATED ... ");
 Lcd_Cmd(_LCD_CLEAR);
 Delay_ms(1000);

 for(m = 0; m < 1500; m++){

 soft_uart_read_string(NMEA0);
 soft_uart_read_string(NMEA1);
 soft_uart_read_string(NMEA2);
 parsing_function(NMEA0,MySpeed,MyLat,MyLon);
 parsing_function(NMEA1,MySpeed,MyLat,MyLon);
 parsing_function(NMEA2,MySpeed,MyLat,MyLon);

 soft_uart_write_string(MyLat);
 soft_uart_write_string("\n");
 soft_uart_write_string(MyLon);
 soft_uart_write_string("\n");

 fl_lat = decimal_to_deg(MyLat);
 fl_lon = decimal_to_deg(MyLon);

 if((startlat == 0.0) && (startlon == 0.0)){
 startlat = fl_lat;
 startlon = fl_lon;

 }

 if((fl_lat > 1.0) && (fl_lon > 1.0 )){


 D_distance = distance(startlat,startlon,fl_lat,fl_lon);
 sprintf(CHBUFDIS,"%.4f",D_distance);
 soft_uart_write_string(CHBUFDIS);



 sprintf(MyLat,"%f",fl_lat);
 sprintf(MyLon,"%f",fl_lon);

 soft_uart_write_string(MyLat);
 soft_uart_write_string("\n");
 soft_uart_write_string(MyLon);
 soft_uart_write_string("\n");
 mmc_write(MyLat,MyLon);
 lcd_write(MyLat,MyLon,MySpeed,CHBUFDIS);

 }

 }


 }
 else {
 soft_uart_write_string("Can't find FAT 16 \n");
 Lcd_Out(1, 1, "CANT FIND FAT ");
 }
;



 }

}
