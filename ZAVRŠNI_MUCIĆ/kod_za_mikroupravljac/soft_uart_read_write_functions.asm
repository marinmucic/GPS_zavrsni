
_rad2deg:

;soft_uart_read_write_functions.c,54 :: 		double rad2deg(double rad) {
;soft_uart_read_write_functions.c,56 :: 		return (rad * 180 / pi);
	MOVF        FARG_rad2deg_rad+0, 0 
	MOVWF       R0 
	MOVF        FARG_rad2deg_rad+1, 0 
	MOVWF       R1 
	MOVF        FARG_rad2deg_rad+2, 0 
	MOVWF       R2 
	MOVF        FARG_rad2deg_rad+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       134
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       208
	MOVWF       R4 
	MOVLW       15
	MOVWF       R5 
	MOVLW       73
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
;soft_uart_read_write_functions.c,58 :: 		}
L_end_rad2deg:
	RETURN      0
; end of _rad2deg

_deg2rad:

;soft_uart_read_write_functions.c,60 :: 		double deg2rad(double deg) {
;soft_uart_read_write_functions.c,62 :: 		return (deg * pi / 180);
	MOVF        FARG_deg2rad_deg+0, 0 
	MOVWF       R0 
	MOVF        FARG_deg2rad_deg+1, 0 
	MOVWF       R1 
	MOVF        FARG_deg2rad_deg+2, 0 
	MOVWF       R2 
	MOVF        FARG_deg2rad_deg+3, 0 
	MOVWF       R3 
	MOVLW       208
	MOVWF       R4 
	MOVLW       15
	MOVWF       R5 
	MOVLW       73
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       134
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
;soft_uart_read_write_functions.c,64 :: 		}
L_end_deg2rad:
	RETURN      0
; end of _deg2rad

_distance:

;soft_uart_read_write_functions.c,66 :: 		double distance(double lat1, double lon1, double lat2, double lon2) {
;soft_uart_read_write_functions.c,70 :: 		theta = lon1 - lon2;
	MOVF        FARG_distance_lon2+0, 0 
	MOVWF       R4 
	MOVF        FARG_distance_lon2+1, 0 
	MOVWF       R5 
	MOVF        FARG_distance_lon2+2, 0 
	MOVWF       R6 
	MOVF        FARG_distance_lon2+3, 0 
	MOVWF       R7 
	MOVF        FARG_distance_lon1+0, 0 
	MOVWF       R0 
	MOVF        FARG_distance_lon1+1, 0 
	MOVWF       R1 
	MOVF        FARG_distance_lon1+2, 0 
	MOVWF       R2 
	MOVF        FARG_distance_lon1+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       distance_theta_L0+0 
	MOVF        R1, 0 
	MOVWF       distance_theta_L0+1 
	MOVF        R2, 0 
	MOVWF       distance_theta_L0+2 
	MOVF        R3, 0 
	MOVWF       distance_theta_L0+3 
;soft_uart_read_write_functions.c,71 :: 		dist = sin(deg2rad(lat1)) * sin(deg2rad(lat2)) + cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * cos(deg2rad(theta));
	MOVF        FARG_distance_lat1+0, 0 
	MOVWF       FARG_deg2rad_deg+0 
	MOVF        FARG_distance_lat1+1, 0 
	MOVWF       FARG_deg2rad_deg+1 
	MOVF        FARG_distance_lat1+2, 0 
	MOVWF       FARG_deg2rad_deg+2 
	MOVF        FARG_distance_lat1+3, 0 
	MOVWF       FARG_deg2rad_deg+3 
	CALL        _deg2rad+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_sin_f+0 
	MOVF        R1, 0 
	MOVWF       FARG_sin_f+1 
	MOVF        R2, 0 
	MOVWF       FARG_sin_f+2 
	MOVF        R3, 0 
	MOVWF       FARG_sin_f+3 
	CALL        _sin+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__distance+0 
	MOVF        R1, 0 
	MOVWF       FLOC__distance+1 
	MOVF        R2, 0 
	MOVWF       FLOC__distance+2 
	MOVF        R3, 0 
	MOVWF       FLOC__distance+3 
	MOVF        FARG_distance_lat2+0, 0 
	MOVWF       FARG_deg2rad_deg+0 
	MOVF        FARG_distance_lat2+1, 0 
	MOVWF       FARG_deg2rad_deg+1 
	MOVF        FARG_distance_lat2+2, 0 
	MOVWF       FARG_deg2rad_deg+2 
	MOVF        FARG_distance_lat2+3, 0 
	MOVWF       FARG_deg2rad_deg+3 
	CALL        _deg2rad+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_sin_f+0 
	MOVF        R1, 0 
	MOVWF       FARG_sin_f+1 
	MOVF        R2, 0 
	MOVWF       FARG_sin_f+2 
	MOVF        R3, 0 
	MOVWF       FARG_sin_f+3 
	CALL        _sin+0, 0
	MOVF        FLOC__distance+0, 0 
	MOVWF       R4 
	MOVF        FLOC__distance+1, 0 
	MOVWF       R5 
	MOVF        FLOC__distance+2, 0 
	MOVWF       R6 
	MOVF        FLOC__distance+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__distance+4 
	MOVF        R1, 0 
	MOVWF       FLOC__distance+5 
	MOVF        R2, 0 
	MOVWF       FLOC__distance+6 
	MOVF        R3, 0 
	MOVWF       FLOC__distance+7 
	MOVF        FARG_distance_lat1+0, 0 
	MOVWF       FARG_deg2rad_deg+0 
	MOVF        FARG_distance_lat1+1, 0 
	MOVWF       FARG_deg2rad_deg+1 
	MOVF        FARG_distance_lat1+2, 0 
	MOVWF       FARG_deg2rad_deg+2 
	MOVF        FARG_distance_lat1+3, 0 
	MOVWF       FARG_deg2rad_deg+3 
	CALL        _deg2rad+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_cos_f+0 
	MOVF        R1, 0 
	MOVWF       FARG_cos_f+1 
	MOVF        R2, 0 
	MOVWF       FARG_cos_f+2 
	MOVF        R3, 0 
	MOVWF       FARG_cos_f+3 
	CALL        _cos+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__distance+0 
	MOVF        R1, 0 
	MOVWF       FLOC__distance+1 
	MOVF        R2, 0 
	MOVWF       FLOC__distance+2 
	MOVF        R3, 0 
	MOVWF       FLOC__distance+3 
	MOVF        FARG_distance_lat2+0, 0 
	MOVWF       FARG_deg2rad_deg+0 
	MOVF        FARG_distance_lat2+1, 0 
	MOVWF       FARG_deg2rad_deg+1 
	MOVF        FARG_distance_lat2+2, 0 
	MOVWF       FARG_deg2rad_deg+2 
	MOVF        FARG_distance_lat2+3, 0 
	MOVWF       FARG_deg2rad_deg+3 
	CALL        _deg2rad+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_cos_f+0 
	MOVF        R1, 0 
	MOVWF       FARG_cos_f+1 
	MOVF        R2, 0 
	MOVWF       FARG_cos_f+2 
	MOVF        R3, 0 
	MOVWF       FARG_cos_f+3 
	CALL        _cos+0, 0
	MOVF        FLOC__distance+0, 0 
	MOVWF       R4 
	MOVF        FLOC__distance+1, 0 
	MOVWF       R5 
	MOVF        FLOC__distance+2, 0 
	MOVWF       R6 
	MOVF        FLOC__distance+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__distance+0 
	MOVF        R1, 0 
	MOVWF       FLOC__distance+1 
	MOVF        R2, 0 
	MOVWF       FLOC__distance+2 
	MOVF        R3, 0 
	MOVWF       FLOC__distance+3 
	MOVF        distance_theta_L0+0, 0 
	MOVWF       FARG_deg2rad_deg+0 
	MOVF        distance_theta_L0+1, 0 
	MOVWF       FARG_deg2rad_deg+1 
	MOVF        distance_theta_L0+2, 0 
	MOVWF       FARG_deg2rad_deg+2 
	MOVF        distance_theta_L0+3, 0 
	MOVWF       FARG_deg2rad_deg+3 
	CALL        _deg2rad+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_cos_f+0 
	MOVF        R1, 0 
	MOVWF       FARG_cos_f+1 
	MOVF        R2, 0 
	MOVWF       FARG_cos_f+2 
	MOVF        R3, 0 
	MOVWF       FARG_cos_f+3 
	CALL        _cos+0, 0
	MOVF        FLOC__distance+0, 0 
	MOVWF       R4 
	MOVF        FLOC__distance+1, 0 
	MOVWF       R5 
	MOVF        FLOC__distance+2, 0 
	MOVWF       R6 
	MOVF        FLOC__distance+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC__distance+4, 0 
	MOVWF       R4 
	MOVF        FLOC__distance+5, 0 
	MOVWF       R5 
	MOVF        FLOC__distance+6, 0 
	MOVWF       R6 
	MOVF        FLOC__distance+7, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
;soft_uart_read_write_functions.c,72 :: 		dist = acos(dist);
	MOVF        R0, 0 
	MOVWF       FARG_acos_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_acos_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_acos_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_acos_x+3 
	CALL        _acos+0, 0
;soft_uart_read_write_functions.c,73 :: 		dist = rad2deg(dist);
	MOVF        R0, 0 
	MOVWF       FARG_rad2deg_rad+0 
	MOVF        R1, 0 
	MOVWF       FARG_rad2deg_rad+1 
	MOVF        R2, 0 
	MOVWF       FARG_rad2deg_rad+2 
	MOVF        R3, 0 
	MOVWF       FARG_rad2deg_rad+3 
	CALL        _rad2deg+0, 0
;soft_uart_read_write_functions.c,74 :: 		dist = dist * 60 * 1.1515;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       90
	MOVWF       R4 
	MOVLW       100
	MOVWF       R5 
	MOVLW       19
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
;soft_uart_read_write_functions.c,75 :: 		dist = dist * 1.609344;
	MOVLW       252
	MOVWF       R4 
	MOVLW       254
	MOVWF       R5 
	MOVLW       77
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
;soft_uart_read_write_functions.c,76 :: 		return (dist);
;soft_uart_read_write_functions.c,78 :: 		}
L_end_distance:
	RETURN      0
; end of _distance

_lcd_write:

;soft_uart_read_write_functions.c,81 :: 		void lcd_write(char lat[],char lon[],char speed[],char dist[])
;soft_uart_read_write_functions.c,83 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;soft_uart_read_write_functions.c,84 :: 		Lcd_Out(1, 1,"LAT ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_soft_uart_read_write_functions+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_soft_uart_read_write_functions+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;soft_uart_read_write_functions.c,85 :: 		Lcd_Out(2, 1, lat);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_lcd_write_lat+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_lcd_write_lat+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;soft_uart_read_write_functions.c,86 :: 		Delay_ms(700);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       27
	MOVWF       R12, 0
	MOVLW       39
	MOVWF       R13, 0
L_lcd_write0:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_write0
	DECFSZ      R12, 1, 1
	BRA         L_lcd_write0
	DECFSZ      R11, 1, 1
	BRA         L_lcd_write0
;soft_uart_read_write_functions.c,87 :: 		Lcd_Out(1, 1, "LON ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_soft_uart_read_write_functions+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_soft_uart_read_write_functions+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;soft_uart_read_write_functions.c,88 :: 		Lcd_Out(2, 1, lon);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_lcd_write_lon+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_lcd_write_lon+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;soft_uart_read_write_functions.c,89 :: 		Delay_ms(700);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       27
	MOVWF       R12, 0
	MOVLW       39
	MOVWF       R13, 0
L_lcd_write1:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_write1
	DECFSZ      R12, 1, 1
	BRA         L_lcd_write1
	DECFSZ      R11, 1, 1
	BRA         L_lcd_write1
;soft_uart_read_write_functions.c,90 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;soft_uart_read_write_functions.c,91 :: 		Lcd_Out(1, 1, "SPEED ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_soft_uart_read_write_functions+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_soft_uart_read_write_functions+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;soft_uart_read_write_functions.c,92 :: 		Lcd_Out(2, 1, speed);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_lcd_write_speed+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_lcd_write_speed+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;soft_uart_read_write_functions.c,93 :: 		Delay_ms(700);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       27
	MOVWF       R12, 0
	MOVLW       39
	MOVWF       R13, 0
L_lcd_write2:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_write2
	DECFSZ      R12, 1, 1
	BRA         L_lcd_write2
	DECFSZ      R11, 1, 1
	BRA         L_lcd_write2
;soft_uart_read_write_functions.c,94 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;soft_uart_read_write_functions.c,95 :: 		Lcd_Out(1, 1, "DIST ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_soft_uart_read_write_functions+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_soft_uart_read_write_functions+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;soft_uart_read_write_functions.c,96 :: 		Lcd_Out(2, 1, dist);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_lcd_write_dist+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_lcd_write_dist+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;soft_uart_read_write_functions.c,98 :: 		}
L_end_lcd_write:
	RETURN      0
; end of _lcd_write

_decimal_to_deg:

;soft_uart_read_write_functions.c,100 :: 		float decimal_to_deg(char latlon[])
;soft_uart_read_write_functions.c,103 :: 		if(isdigit(latlon[0]))
	MOVFF       FARG_decimal_to_deg_latlon+0, FSR0
	MOVFF       FARG_decimal_to_deg_latlon+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_isdigit_character+0 
	CALL        _isdigit+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_decimal_to_deg3
;soft_uart_read_write_functions.c,108 :: 		xlatlon = atof(latlon);
	MOVF        FARG_decimal_to_deg_latlon+0, 0 
	MOVWF       FARG_atof_s+0 
	MOVF        FARG_decimal_to_deg_latlon+1, 0 
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVF        R0, 0 
	MOVWF       decimal_to_deg_xlatlon_L1+0 
	MOVF        R1, 0 
	MOVWF       decimal_to_deg_xlatlon_L1+1 
	MOVF        R2, 0 
	MOVWF       decimal_to_deg_xlatlon_L1+2 
	MOVF        R3, 0 
	MOVWF       decimal_to_deg_xlatlon_L1+3 
;soft_uart_read_write_functions.c,109 :: 		b = xlatlon/100; // 51 degrees
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _Double2Int+0, 0
	MOVF        R0, 0 
	MOVWF       decimal_to_deg_b_L1+0 
	MOVF        R1, 0 
	MOVWF       decimal_to_deg_b_L1+1 
;soft_uart_read_write_functions.c,110 :: 		u = (xlatlon/100 - b)*100 ; //(51.536605 - 51)* 100 = 53.6605
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        decimal_to_deg_xlatlon_L1+0, 0 
	MOVWF       R0 
	MOVF        decimal_to_deg_xlatlon_L1+1, 0 
	MOVWF       R1 
	MOVF        decimal_to_deg_xlatlon_L1+2, 0 
	MOVWF       R2 
	MOVF        decimal_to_deg_xlatlon_L1+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__decimal_to_deg+4 
	MOVF        R1, 0 
	MOVWF       FLOC__decimal_to_deg+5 
	MOVF        R2, 0 
	MOVWF       FLOC__decimal_to_deg+6 
	MOVF        R3, 0 
	MOVWF       FLOC__decimal_to_deg+7 
	MOVF        decimal_to_deg_b_L1+0, 0 
	MOVWF       R0 
	MOVF        decimal_to_deg_b_L1+1, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__decimal_to_deg+0 
	MOVF        R1, 0 
	MOVWF       FLOC__decimal_to_deg+1 
	MOVF        R2, 0 
	MOVWF       FLOC__decimal_to_deg+2 
	MOVF        R3, 0 
	MOVWF       FLOC__decimal_to_deg+3 
	MOVF        FLOC__decimal_to_deg+0, 0 
	MOVWF       R4 
	MOVF        FLOC__decimal_to_deg+1, 0 
	MOVWF       R5 
	MOVF        FLOC__decimal_to_deg+2, 0 
	MOVWF       R6 
	MOVF        FLOC__decimal_to_deg+3, 0 
	MOVWF       R7 
	MOVF        FLOC__decimal_to_deg+4, 0 
	MOVWF       R0 
	MOVF        FLOC__decimal_to_deg+5, 0 
	MOVWF       R1 
	MOVF        FLOC__decimal_to_deg+6, 0 
	MOVWF       R2 
	MOVF        FLOC__decimal_to_deg+7, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
;soft_uart_read_write_functions.c,111 :: 		u /= 60; // 53.6605 / 60 = 0.8943417
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
;soft_uart_read_write_functions.c,112 :: 		u += b; // 0.8943417 + 51 = 51.8943417
	MOVF        FLOC__decimal_to_deg+0, 0 
	MOVWF       R4 
	MOVF        FLOC__decimal_to_deg+1, 0 
	MOVWF       R5 
	MOVF        FLOC__decimal_to_deg+2, 0 
	MOVWF       R6 
	MOVF        FLOC__decimal_to_deg+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
;soft_uart_read_write_functions.c,113 :: 		return u;
	GOTO        L_end_decimal_to_deg
;soft_uart_read_write_functions.c,116 :: 		}
L_decimal_to_deg3:
;soft_uart_read_write_functions.c,119 :: 		}
L_end_decimal_to_deg:
	RETURN      0
; end of _decimal_to_deg

_mmc_write:

;soft_uart_read_write_functions.c,121 :: 		void mmc_write(char lat[],char lon[])
;soft_uart_read_write_functions.c,124 :: 		Mmc_Fat_Write(lat,7);
	MOVF        FARG_mmc_write_lat+0, 0 
	MOVWF       FARG_Mmc_Fat_Write_fdata+0 
	MOVF        FARG_mmc_write_lat+1, 0 
	MOVWF       FARG_Mmc_Fat_Write_fdata+1 
	MOVLW       7
	MOVWF       FARG_Mmc_Fat_Write_len+0 
	MOVLW       0
	MOVWF       FARG_Mmc_Fat_Write_len+1 
	CALL        _Mmc_Fat_Write+0, 0
;soft_uart_read_write_functions.c,125 :: 		Delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_mmc_write4:
	DECFSZ      R13, 1, 1
	BRA         L_mmc_write4
	DECFSZ      R12, 1, 1
	BRA         L_mmc_write4
	NOP
;soft_uart_read_write_functions.c,126 :: 		Mmc_Fat_Write(" ",1);
	MOVLW       ?lstr5_soft_uart_read_write_functions+0
	MOVWF       FARG_Mmc_Fat_Write_fdata+0 
	MOVLW       hi_addr(?lstr5_soft_uart_read_write_functions+0)
	MOVWF       FARG_Mmc_Fat_Write_fdata+1 
	MOVLW       1
	MOVWF       FARG_Mmc_Fat_Write_len+0 
	MOVLW       0
	MOVWF       FARG_Mmc_Fat_Write_len+1 
	CALL        _Mmc_Fat_Write+0, 0
;soft_uart_read_write_functions.c,127 :: 		Delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_mmc_write5:
	DECFSZ      R13, 1, 1
	BRA         L_mmc_write5
	DECFSZ      R12, 1, 1
	BRA         L_mmc_write5
	NOP
;soft_uart_read_write_functions.c,128 :: 		Mmc_Fat_Write(lon,7);
	MOVF        FARG_mmc_write_lon+0, 0 
	MOVWF       FARG_Mmc_Fat_Write_fdata+0 
	MOVF        FARG_mmc_write_lon+1, 0 
	MOVWF       FARG_Mmc_Fat_Write_fdata+1 
	MOVLW       7
	MOVWF       FARG_Mmc_Fat_Write_len+0 
	MOVLW       0
	MOVWF       FARG_Mmc_Fat_Write_len+1 
	CALL        _Mmc_Fat_Write+0, 0
;soft_uart_read_write_functions.c,129 :: 		Mmc_Fat_Write("\n",1);
	MOVLW       ?lstr6_soft_uart_read_write_functions+0
	MOVWF       FARG_Mmc_Fat_Write_fdata+0 
	MOVLW       hi_addr(?lstr6_soft_uart_read_write_functions+0)
	MOVWF       FARG_Mmc_Fat_Write_fdata+1 
	MOVLW       1
	MOVWF       FARG_Mmc_Fat_Write_len+0 
	MOVLW       0
	MOVWF       FARG_Mmc_Fat_Write_len+1 
	CALL        _Mmc_Fat_Write+0, 0
;soft_uart_read_write_functions.c,131 :: 		}
L_end_mmc_write:
	RETURN      0
; end of _mmc_write

_M_Create_New_File:

;soft_uart_read_write_functions.c,134 :: 		void M_Create_New_File() {
;soft_uart_read_write_functions.c,135 :: 		filename[7] = 'A';
	MOVLW       65
	MOVWF       _filename+7 
;soft_uart_read_write_functions.c,136 :: 		Mmc_Fat_Assign(&filename, 0xA0);          // Find existing file or create a new one
	MOVLW       _filename+0
	MOVWF       FARG_Mmc_Fat_Assign_name+0 
	MOVLW       hi_addr(_filename+0)
	MOVWF       FARG_Mmc_Fat_Assign_name+1 
	MOVLW       160
	MOVWF       FARG_Mmc_Fat_Assign_attrib+0 
	CALL        _Mmc_Fat_Assign+0, 0
;soft_uart_read_write_functions.c,138 :: 		}
L_end_M_Create_New_File:
	RETURN      0
; end of _M_Create_New_File

_parsing_function:

;soft_uart_read_write_functions.c,142 :: 		void parsing_function(char stringData[],char MySpeedp[],char MyLatp[],char MyLonp[])
;soft_uart_read_write_functions.c,144 :: 		if ((stringData[3] == 'V') && (stringData[4] == 'T') && (stringData[5] == 'G'))
	MOVLW       3
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       86
	BTFSS       STATUS+0, 2 
	GOTO        L_parsing_function8
	MOVLW       4
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       84
	BTFSS       STATUS+0, 2 
	GOTO        L_parsing_function8
	MOVLW       5
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       71
	BTFSS       STATUS+0, 2 
	GOTO        L_parsing_function8
L__parsing_function42:
;soft_uart_read_write_functions.c,146 :: 		MySpeedp[0]=stringData[21];
	MOVLW       21
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVFF       FARG_parsing_function_MySpeedp+0, FSR1
	MOVFF       FARG_parsing_function_MySpeedp+1, FSR1H
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,147 :: 		MySpeedp[1]=stringData[22];
	MOVLW       1
	ADDWF       FARG_parsing_function_MySpeedp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MySpeedp+1, 0 
	MOVWF       FSR1H 
	MOVLW       22
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,148 :: 		MySpeedp[2]=stringData[23];
	MOVLW       2
	ADDWF       FARG_parsing_function_MySpeedp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MySpeedp+1, 0 
	MOVWF       FSR1H 
	MOVLW       23
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,149 :: 		MySpeedp[3]=stringData[24];
	MOVLW       3
	ADDWF       FARG_parsing_function_MySpeedp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MySpeedp+1, 0 
	MOVWF       FSR1H 
	MOVLW       24
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,150 :: 		MySpeedp[4]=stringData[25];
	MOVLW       4
	ADDWF       FARG_parsing_function_MySpeedp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MySpeedp+1, 0 
	MOVWF       FSR1H 
	MOVLW       25
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,151 :: 		MySpeedp[5]='\0';
	MOVLW       5
	ADDWF       FARG_parsing_function_MySpeedp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MySpeedp+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;soft_uart_read_write_functions.c,154 :: 		}
	GOTO        L_parsing_function9
L_parsing_function8:
;soft_uart_read_write_functions.c,157 :: 		if ((stringData[3] == 'G') && (stringData[4] == 'G') && (stringData[5] == 'A'))
	MOVLW       3
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       71
	BTFSS       STATUS+0, 2 
	GOTO        L_parsing_function12
	MOVLW       4
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       71
	BTFSS       STATUS+0, 2 
	GOTO        L_parsing_function12
	MOVLW       5
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       65
	BTFSS       STATUS+0, 2 
	GOTO        L_parsing_function12
L__parsing_function41:
;soft_uart_read_write_functions.c,160 :: 		MyLatp[0]=stringData[17];
	MOVLW       17
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVFF       FARG_parsing_function_MyLatp+0, FSR1
	MOVFF       FARG_parsing_function_MyLatp+1, FSR1H
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,161 :: 		MyLatp[1]=stringData[18];
	MOVLW       1
	ADDWF       FARG_parsing_function_MyLatp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLatp+1, 0 
	MOVWF       FSR1H 
	MOVLW       18
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,162 :: 		MyLatp[2]=stringData[19];
	MOVLW       2
	ADDWF       FARG_parsing_function_MyLatp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLatp+1, 0 
	MOVWF       FSR1H 
	MOVLW       19
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,163 :: 		MyLatp[3]=stringData[20];
	MOVLW       3
	ADDWF       FARG_parsing_function_MyLatp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLatp+1, 0 
	MOVWF       FSR1H 
	MOVLW       20
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,164 :: 		MyLatp[4]=stringData[21];
	MOVLW       4
	ADDWF       FARG_parsing_function_MyLatp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLatp+1, 0 
	MOVWF       FSR1H 
	MOVLW       21
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,165 :: 		MyLatp[5]=stringData[22];
	MOVLW       5
	ADDWF       FARG_parsing_function_MyLatp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLatp+1, 0 
	MOVWF       FSR1H 
	MOVLW       22
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,166 :: 		MyLatp[6]=stringData[23];
	MOVLW       6
	ADDWF       FARG_parsing_function_MyLatp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLatp+1, 0 
	MOVWF       FSR1H 
	MOVLW       23
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,167 :: 		MyLatp[7]=stringData[24];
	MOVLW       7
	ADDWF       FARG_parsing_function_MyLatp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLatp+1, 0 
	MOVWF       FSR1H 
	MOVLW       24
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,168 :: 		MyLatp[8]=stringData[25];
	MOVLW       8
	ADDWF       FARG_parsing_function_MyLatp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLatp+1, 0 
	MOVWF       FSR1H 
	MOVLW       25
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,169 :: 		MyLatp[9]=stringData[26];
	MOVLW       9
	ADDWF       FARG_parsing_function_MyLatp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLatp+1, 0 
	MOVWF       FSR1H 
	MOVLW       26
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,170 :: 		MyLatp[10]='\0';
	MOVLW       10
	ADDWF       FARG_parsing_function_MyLatp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLatp+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;soft_uart_read_write_functions.c,175 :: 		MyLonp[0]= stringData[30];
	MOVLW       30
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVFF       FARG_parsing_function_MyLonp+0, FSR1
	MOVFF       FARG_parsing_function_MyLonp+1, FSR1H
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,176 :: 		MyLonp[1]= stringData[31];
	MOVLW       1
	ADDWF       FARG_parsing_function_MyLonp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLonp+1, 0 
	MOVWF       FSR1H 
	MOVLW       31
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,177 :: 		MyLonp[2]= stringData[32];
	MOVLW       2
	ADDWF       FARG_parsing_function_MyLonp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLonp+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,178 :: 		MyLonp[3]= stringData[33];
	MOVLW       3
	ADDWF       FARG_parsing_function_MyLonp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLonp+1, 0 
	MOVWF       FSR1H 
	MOVLW       33
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,179 :: 		MyLonp[4]= stringData[34];
	MOVLW       4
	ADDWF       FARG_parsing_function_MyLonp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLonp+1, 0 
	MOVWF       FSR1H 
	MOVLW       34
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,180 :: 		MyLonp[5]= stringData[35];
	MOVLW       5
	ADDWF       FARG_parsing_function_MyLonp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLonp+1, 0 
	MOVWF       FSR1H 
	MOVLW       35
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,181 :: 		MyLonp[6]= stringData[36];
	MOVLW       6
	ADDWF       FARG_parsing_function_MyLonp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLonp+1, 0 
	MOVWF       FSR1H 
	MOVLW       36
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,182 :: 		MyLonp[7]= stringData[37];
	MOVLW       7
	ADDWF       FARG_parsing_function_MyLonp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLonp+1, 0 
	MOVWF       FSR1H 
	MOVLW       37
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,183 :: 		MyLonp[8]= stringData[38];
	MOVLW       8
	ADDWF       FARG_parsing_function_MyLonp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLonp+1, 0 
	MOVWF       FSR1H 
	MOVLW       38
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,184 :: 		MyLonp[9]= stringData[39];
	MOVLW       9
	ADDWF       FARG_parsing_function_MyLonp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLonp+1, 0 
	MOVWF       FSR1H 
	MOVLW       39
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,185 :: 		MyLonp[10]= stringData[40];
	MOVLW       10
	ADDWF       FARG_parsing_function_MyLonp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLonp+1, 0 
	MOVWF       FSR1H 
	MOVLW       40
	ADDWF       FARG_parsing_function_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_parsing_function_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,186 :: 		MyLonp[11]='\0';
	MOVLW       11
	ADDWF       FARG_parsing_function_MyLonp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_parsing_function_MyLonp+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;soft_uart_read_write_functions.c,191 :: 		}else{
	GOTO        L_parsing_function13
L_parsing_function12:
;soft_uart_read_write_functions.c,195 :: 		}
L_parsing_function13:
;soft_uart_read_write_functions.c,197 :: 		}  //*****************************************
L_parsing_function9:
;soft_uart_read_write_functions.c,199 :: 		}
L_end_parsing_function:
	RETURN      0
; end of _parsing_function

_soft_uart_write_string:

;soft_uart_read_write_functions.c,203 :: 		void soft_uart_write_string(char stringData[]) //soft_uart_write
;soft_uart_read_write_functions.c,204 :: 		{     char m = 0;
	CLRF        soft_uart_write_string_m_L0+0 
;soft_uart_read_write_functions.c,205 :: 		while (stringData[m] != '\0')
L_soft_uart_write_string14:
	MOVF        soft_uart_write_string_m_L0+0, 0 
	ADDWF       FARG_soft_uart_write_string_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_soft_uart_write_string_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_soft_uart_write_string15
;soft_uart_read_write_functions.c,207 :: 		Soft_UART_Write(stringData[m]);
	MOVF        soft_uart_write_string_m_L0+0, 0 
	ADDWF       FARG_soft_uart_write_string_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_soft_uart_write_string_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;soft_uart_read_write_functions.c,208 :: 		Delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_soft_uart_write_string16:
	DECFSZ      R13, 1, 1
	BRA         L_soft_uart_write_string16
	DECFSZ      R12, 1, 1
	BRA         L_soft_uart_write_string16
	NOP
;soft_uart_read_write_functions.c,209 :: 		m++;
	INCF        soft_uart_write_string_m_L0+0, 1 
;soft_uart_read_write_functions.c,210 :: 		}
	GOTO        L_soft_uart_write_string14
L_soft_uart_write_string15:
;soft_uart_read_write_functions.c,211 :: 		Soft_UART_Write(stringData[m]);
	MOVF        soft_uart_write_string_m_L0+0, 0 
	ADDWF       FARG_soft_uart_write_string_stringData+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_soft_uart_write_string_stringData+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;soft_uart_read_write_functions.c,214 :: 		}
L_end_soft_uart_write_string:
	RETURN      0
; end of _soft_uart_write_string

_soft_uart_read_string:

;soft_uart_read_write_functions.c,216 :: 		void soft_uart_read_string(char stringData[]) //soft_uart_read funkcija
;soft_uart_read_write_functions.c,217 :: 		{         char c = 0, m = 0;
	CLRF        soft_uart_read_string_c_L0+0 
	CLRF        soft_uart_read_string_m_L0+0 
;soft_uart_read_write_functions.c,218 :: 		do{
L_soft_uart_read_string17:
;soft_uart_read_write_functions.c,219 :: 		if((c = Soft_UART_Read(&error)) == '$'){
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       soft_uart_read_string_c_L0+0 
	MOVF        R0, 0 
	XORLW       36
	BTFSS       STATUS+0, 2 
	GOTO        L_soft_uart_read_string20
;soft_uart_read_write_functions.c,220 :: 		stringData[m]= c ;
	MOVF        soft_uart_read_string_m_L0+0, 0 
	ADDWF       FARG_soft_uart_read_string_stringData+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_soft_uart_read_string_stringData+1, 0 
	MOVWF       FSR1H 
	MOVF        soft_uart_read_string_c_L0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,221 :: 		m++;
	INCF        soft_uart_read_string_m_L0+0, 1 
;soft_uart_read_write_functions.c,222 :: 		while(( c = Soft_UART_Read(&error)) != '\n'){
L_soft_uart_read_string21:
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       soft_uart_read_string_c_L0+0 
	MOVF        R0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_soft_uart_read_string22
;soft_uart_read_write_functions.c,223 :: 		stringData[m]= c;
	MOVF        soft_uart_read_string_m_L0+0, 0 
	ADDWF       FARG_soft_uart_read_string_stringData+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_soft_uart_read_string_stringData+1, 0 
	MOVWF       FSR1H 
	MOVF        soft_uart_read_string_c_L0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,224 :: 		m++;
	INCF        soft_uart_read_string_m_L0+0, 1 
;soft_uart_read_write_functions.c,225 :: 		}
	GOTO        L_soft_uart_read_string21
L_soft_uart_read_string22:
;soft_uart_read_write_functions.c,226 :: 		stringData[m]= c ;
	MOVF        soft_uart_read_string_m_L0+0, 0 
	ADDWF       FARG_soft_uart_read_string_stringData+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_soft_uart_read_string_stringData+1, 0 
	MOVWF       FSR1H 
	MOVF        soft_uart_read_string_c_L0+0, 0 
	MOVWF       POSTINC1+0 
;soft_uart_read_write_functions.c,227 :: 		m++;
	INCF        soft_uart_read_string_m_L0+0, 1 
;soft_uart_read_write_functions.c,228 :: 		stringData[m]='\0';
	MOVF        soft_uart_read_string_m_L0+0, 0 
	ADDWF       FARG_soft_uart_read_string_stringData+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_soft_uart_read_string_stringData+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;soft_uart_read_write_functions.c,229 :: 		break;
	GOTO        L_soft_uart_read_string18
;soft_uart_read_write_functions.c,230 :: 		}
L_soft_uart_read_string20:
;soft_uart_read_write_functions.c,232 :: 		}while(1);
	GOTO        L_soft_uart_read_string17
L_soft_uart_read_string18:
;soft_uart_read_write_functions.c,234 :: 		}
L_end_soft_uart_read_string:
	RETURN      0
; end of _soft_uart_read_string

_main:

;soft_uart_read_write_functions.c,236 :: 		void main(){
;soft_uart_read_write_functions.c,240 :: 		ADCON1 |= 0x0F;                    // Configure AN pins as digital
	MOVLW       15
	IORWF       ADCON1+0, 1 
;soft_uart_read_write_functions.c,241 :: 		CMCON  |= 7;                       // Disable comparators
	MOVLW       7
	IORWF       CMCON+0, 1 
;soft_uart_read_write_functions.c,243 :: 		Lcd_Init();             // Initialize LCD
	CALL        _Lcd_Init+0, 0
;soft_uart_read_write_functions.c,244 :: 		Lcd_Cmd(_LCD_CLEAR);      // Clear LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;soft_uart_read_write_functions.c,245 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn the cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;soft_uart_read_write_functions.c,246 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main23:
	DECFSZ      R13, 1, 1
	BRA         L_main23
	DECFSZ      R12, 1, 1
	BRA         L_main23
	DECFSZ      R11, 1, 1
	BRA         L_main23
	NOP
	NOP
;soft_uart_read_write_functions.c,249 :: 		Lcd_Out(1, 1, "POCETAK ... ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_soft_uart_read_write_functions+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_soft_uart_read_write_functions+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;soft_uart_read_write_functions.c,250 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main24:
	DECFSZ      R13, 1, 1
	BRA         L_main24
	DECFSZ      R12, 1, 1
	BRA         L_main24
	DECFSZ      R11, 1, 1
	BRA         L_main24
	NOP
	NOP
;soft_uart_read_write_functions.c,254 :: 		if( ( j = Soft_UART_Init(&PORTB, 4, 1, 5000, 0)) == 0){ // Initialize Soft UART at 5000 bps //111111111111111111111111111111111111111111111111111111111111111111111
	MOVLW       PORTB+0
	MOVWF       FARG_Soft_UART_Init_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Soft_UART_Init_port+1 
	MOVLW       4
	MOVWF       FARG_Soft_UART_Init_rx_pin+0 
	MOVLW       1
	MOVWF       FARG_Soft_UART_Init_tx_pin+0 
	MOVLW       136
	MOVWF       FARG_Soft_UART_Init_baud_rate+0 
	MOVLW       19
	MOVWF       FARG_Soft_UART_Init_baud_rate+1 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Init_baud_rate+2 
	MOVWF       FARG_Soft_UART_Init_baud_rate+3 
	CLRF        FARG_Soft_UART_Init_inverted+0 
	CALL        _Soft_UART_Init+0, 0
	MOVF        R0, 0 
	MOVWF       _j+0 
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main25
;soft_uart_read_write_functions.c,255 :: 		Delay_ms(100); //let them stablize
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main26:
	DECFSZ      R13, 1, 1
	BRA         L_main26
	DECFSZ      R12, 1, 1
	BRA         L_main26
	DECFSZ      R11, 1, 1
	BRA         L_main26
	NOP
;soft_uart_read_write_functions.c,259 :: 		SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV64, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
	MOVLW       2
	MOVWF       FARG_SPI1_Init_Advanced_master+0 
	CLRF        FARG_SPI1_Init_Advanced_data_sample+0 
	CLRF        FARG_SPI1_Init_Advanced_clock_idle+0 
	MOVLW       1
	MOVWF       FARG_SPI1_Init_Advanced_transmit_edge+0 
	CALL        _SPI1_Init_Advanced+0, 0
;soft_uart_read_write_functions.c,260 :: 		Delay_ms(20); //let them stablize
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	NOP
	NOP
;soft_uart_read_write_functions.c,262 :: 		if (Mmc_Fat_Init() == 0) {
	CALL        _Mmc_Fat_Init+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main28
;soft_uart_read_write_functions.c,264 :: 		SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
	CLRF        FARG_SPI1_Init_Advanced_master+0 
	CLRF        FARG_SPI1_Init_Advanced_data_sample+0 
	CLRF        FARG_SPI1_Init_Advanced_clock_idle+0 
	MOVLW       1
	MOVWF       FARG_SPI1_Init_Advanced_transmit_edge+0 
	CALL        _SPI1_Init_Advanced+0, 0
;soft_uart_read_write_functions.c,265 :: 		Delay_ms(20); //let them stablize
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main29:
	DECFSZ      R13, 1, 1
	BRA         L_main29
	DECFSZ      R12, 1, 1
	BRA         L_main29
	NOP
	NOP
;soft_uart_read_write_functions.c,267 :: 		soft_uart_write_string("Test started \n");
	MOVLW       ?lstr8_soft_uart_read_write_functions+0
	MOVWF       FARG_soft_uart_write_string_stringData+0 
	MOVLW       hi_addr(?lstr8_soft_uart_read_write_functions+0)
	MOVWF       FARG_soft_uart_write_string_stringData+1 
	CALL        _soft_uart_write_string+0, 0
;soft_uart_read_write_functions.c,268 :: 		M_Create_New_File();
	CALL        _M_Create_New_File+0, 0
;soft_uart_read_write_functions.c,269 :: 		soft_uart_write_string("File created \n");
	MOVLW       ?lstr9_soft_uart_read_write_functions+0
	MOVWF       FARG_soft_uart_write_string_stringData+0 
	MOVLW       hi_addr(?lstr9_soft_uart_read_write_functions+0)
	MOVWF       FARG_soft_uart_write_string_stringData+1 
	CALL        _soft_uart_write_string+0, 0
;soft_uart_read_write_functions.c,270 :: 		Lcd_Out(1, 1, "FILE CREATED ... ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_soft_uart_read_write_functions+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_soft_uart_read_write_functions+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;soft_uart_read_write_functions.c,271 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;soft_uart_read_write_functions.c,272 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main30:
	DECFSZ      R13, 1, 1
	BRA         L_main30
	DECFSZ      R12, 1, 1
	BRA         L_main30
	DECFSZ      R11, 1, 1
	BRA         L_main30
	NOP
	NOP
;soft_uart_read_write_functions.c,274 :: 		for(m = 0; m < 1500; m++){
	CLRF        _m+0 
	CLRF        _m+1 
L_main31:
	MOVLW       128
	XORWF       _m+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       5
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main56
	MOVLW       220
	SUBWF       _m+0, 0 
L__main56:
	BTFSC       STATUS+0, 0 
	GOTO        L_main32
;soft_uart_read_write_functions.c,276 :: 		soft_uart_read_string(NMEA0);
	MOVLW       _NMEA0+0
	MOVWF       FARG_soft_uart_read_string_stringData+0 
	MOVLW       hi_addr(_NMEA0+0)
	MOVWF       FARG_soft_uart_read_string_stringData+1 
	CALL        _soft_uart_read_string+0, 0
;soft_uart_read_write_functions.c,277 :: 		soft_uart_read_string(NMEA1);
	MOVLW       _NMEA1+0
	MOVWF       FARG_soft_uart_read_string_stringData+0 
	MOVLW       hi_addr(_NMEA1+0)
	MOVWF       FARG_soft_uart_read_string_stringData+1 
	CALL        _soft_uart_read_string+0, 0
;soft_uart_read_write_functions.c,278 :: 		soft_uart_read_string(NMEA2);
	MOVLW       _NMEA2+0
	MOVWF       FARG_soft_uart_read_string_stringData+0 
	MOVLW       hi_addr(_NMEA2+0)
	MOVWF       FARG_soft_uart_read_string_stringData+1 
	CALL        _soft_uart_read_string+0, 0
;soft_uart_read_write_functions.c,279 :: 		parsing_function(NMEA0,MySpeed,MyLat,MyLon);
	MOVLW       _NMEA0+0
	MOVWF       FARG_parsing_function_stringData+0 
	MOVLW       hi_addr(_NMEA0+0)
	MOVWF       FARG_parsing_function_stringData+1 
	MOVLW       _MySpeed+0
	MOVWF       FARG_parsing_function_MySpeedp+0 
	MOVLW       hi_addr(_MySpeed+0)
	MOVWF       FARG_parsing_function_MySpeedp+1 
	MOVLW       _MyLat+0
	MOVWF       FARG_parsing_function_MyLatp+0 
	MOVLW       hi_addr(_MyLat+0)
	MOVWF       FARG_parsing_function_MyLatp+1 
	MOVLW       _MyLon+0
	MOVWF       FARG_parsing_function_MyLonp+0 
	MOVLW       hi_addr(_MyLon+0)
	MOVWF       FARG_parsing_function_MyLonp+1 
	CALL        _parsing_function+0, 0
;soft_uart_read_write_functions.c,280 :: 		parsing_function(NMEA1,MySpeed,MyLat,MyLon);
	MOVLW       _NMEA1+0
	MOVWF       FARG_parsing_function_stringData+0 
	MOVLW       hi_addr(_NMEA1+0)
	MOVWF       FARG_parsing_function_stringData+1 
	MOVLW       _MySpeed+0
	MOVWF       FARG_parsing_function_MySpeedp+0 
	MOVLW       hi_addr(_MySpeed+0)
	MOVWF       FARG_parsing_function_MySpeedp+1 
	MOVLW       _MyLat+0
	MOVWF       FARG_parsing_function_MyLatp+0 
	MOVLW       hi_addr(_MyLat+0)
	MOVWF       FARG_parsing_function_MyLatp+1 
	MOVLW       _MyLon+0
	MOVWF       FARG_parsing_function_MyLonp+0 
	MOVLW       hi_addr(_MyLon+0)
	MOVWF       FARG_parsing_function_MyLonp+1 
	CALL        _parsing_function+0, 0
;soft_uart_read_write_functions.c,281 :: 		parsing_function(NMEA2,MySpeed,MyLat,MyLon);
	MOVLW       _NMEA2+0
	MOVWF       FARG_parsing_function_stringData+0 
	MOVLW       hi_addr(_NMEA2+0)
	MOVWF       FARG_parsing_function_stringData+1 
	MOVLW       _MySpeed+0
	MOVWF       FARG_parsing_function_MySpeedp+0 
	MOVLW       hi_addr(_MySpeed+0)
	MOVWF       FARG_parsing_function_MySpeedp+1 
	MOVLW       _MyLat+0
	MOVWF       FARG_parsing_function_MyLatp+0 
	MOVLW       hi_addr(_MyLat+0)
	MOVWF       FARG_parsing_function_MyLatp+1 
	MOVLW       _MyLon+0
	MOVWF       FARG_parsing_function_MyLonp+0 
	MOVLW       hi_addr(_MyLon+0)
	MOVWF       FARG_parsing_function_MyLonp+1 
	CALL        _parsing_function+0, 0
;soft_uart_read_write_functions.c,283 :: 		soft_uart_write_string(MyLat);
	MOVLW       _MyLat+0
	MOVWF       FARG_soft_uart_write_string_stringData+0 
	MOVLW       hi_addr(_MyLat+0)
	MOVWF       FARG_soft_uart_write_string_stringData+1 
	CALL        _soft_uart_write_string+0, 0
;soft_uart_read_write_functions.c,284 :: 		soft_uart_write_string("\n");
	MOVLW       ?lstr11_soft_uart_read_write_functions+0
	MOVWF       FARG_soft_uart_write_string_stringData+0 
	MOVLW       hi_addr(?lstr11_soft_uart_read_write_functions+0)
	MOVWF       FARG_soft_uart_write_string_stringData+1 
	CALL        _soft_uart_write_string+0, 0
;soft_uart_read_write_functions.c,285 :: 		soft_uart_write_string(MyLon);
	MOVLW       _MyLon+0
	MOVWF       FARG_soft_uart_write_string_stringData+0 
	MOVLW       hi_addr(_MyLon+0)
	MOVWF       FARG_soft_uart_write_string_stringData+1 
	CALL        _soft_uart_write_string+0, 0
;soft_uart_read_write_functions.c,286 :: 		soft_uart_write_string("\n");
	MOVLW       ?lstr12_soft_uart_read_write_functions+0
	MOVWF       FARG_soft_uart_write_string_stringData+0 
	MOVLW       hi_addr(?lstr12_soft_uart_read_write_functions+0)
	MOVWF       FARG_soft_uart_write_string_stringData+1 
	CALL        _soft_uart_write_string+0, 0
;soft_uart_read_write_functions.c,288 :: 		fl_lat = decimal_to_deg(MyLat);
	MOVLW       _MyLat+0
	MOVWF       FARG_decimal_to_deg_latlon+0 
	MOVLW       hi_addr(_MyLat+0)
	MOVWF       FARG_decimal_to_deg_latlon+1 
	CALL        _decimal_to_deg+0, 0
	MOVF        R0, 0 
	MOVWF       _fl_lat+0 
	MOVF        R1, 0 
	MOVWF       _fl_lat+1 
	MOVF        R2, 0 
	MOVWF       _fl_lat+2 
	MOVF        R3, 0 
	MOVWF       _fl_lat+3 
;soft_uart_read_write_functions.c,289 :: 		fl_lon = decimal_to_deg(MyLon);
	MOVLW       _MyLon+0
	MOVWF       FARG_decimal_to_deg_latlon+0 
	MOVLW       hi_addr(_MyLon+0)
	MOVWF       FARG_decimal_to_deg_latlon+1 
	CALL        _decimal_to_deg+0, 0
	MOVF        R0, 0 
	MOVWF       _fl_lon+0 
	MOVF        R1, 0 
	MOVWF       _fl_lon+1 
	MOVF        R2, 0 
	MOVWF       _fl_lon+2 
	MOVF        R3, 0 
	MOVWF       _fl_lon+3 
;soft_uart_read_write_functions.c,291 :: 		if((startlat == 0.0) && (startlon == 0.0)){
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        _startlat+0, 0 
	MOVWF       R0 
	MOVF        _startlat+1, 0 
	MOVWF       R1 
	MOVF        _startlat+2, 0 
	MOVWF       R2 
	MOVF        _startlat+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main36
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        _startlon+0, 0 
	MOVWF       R0 
	MOVF        _startlon+1, 0 
	MOVWF       R1 
	MOVF        _startlon+2, 0 
	MOVWF       R2 
	MOVF        _startlon+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main36
L__main44:
;soft_uart_read_write_functions.c,292 :: 		startlat = fl_lat;
	MOVF        _fl_lat+0, 0 
	MOVWF       _startlat+0 
	MOVF        _fl_lat+1, 0 
	MOVWF       _startlat+1 
	MOVF        _fl_lat+2, 0 
	MOVWF       _startlat+2 
	MOVF        _fl_lat+3, 0 
	MOVWF       _startlat+3 
;soft_uart_read_write_functions.c,293 :: 		startlon = fl_lon;
	MOVF        _fl_lon+0, 0 
	MOVWF       _startlon+0 
	MOVF        _fl_lon+1, 0 
	MOVWF       _startlon+1 
	MOVF        _fl_lon+2, 0 
	MOVWF       _startlon+2 
	MOVF        _fl_lon+3, 0 
	MOVWF       _startlon+3 
;soft_uart_read_write_functions.c,295 :: 		}
L_main36:
;soft_uart_read_write_functions.c,297 :: 		if((fl_lat > 1.0) && (fl_lon > 1.0 )){
	MOVF        _fl_lat+0, 0 
	MOVWF       R4 
	MOVF        _fl_lat+1, 0 
	MOVWF       R5 
	MOVF        _fl_lat+2, 0 
	MOVWF       R6 
	MOVF        _fl_lat+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main39
	MOVF        _fl_lon+0, 0 
	MOVWF       R4 
	MOVF        _fl_lon+1, 0 
	MOVWF       R5 
	MOVF        _fl_lon+2, 0 
	MOVWF       R6 
	MOVF        _fl_lon+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main39
L__main43:
;soft_uart_read_write_functions.c,300 :: 		D_distance = distance(startlat,startlon,fl_lat,fl_lon);
	MOVF        _startlat+0, 0 
	MOVWF       FARG_distance_lat1+0 
	MOVF        _startlat+1, 0 
	MOVWF       FARG_distance_lat1+1 
	MOVF        _startlat+2, 0 
	MOVWF       FARG_distance_lat1+2 
	MOVF        _startlat+3, 0 
	MOVWF       FARG_distance_lat1+3 
	MOVF        _startlon+0, 0 
	MOVWF       FARG_distance_lon1+0 
	MOVF        _startlon+1, 0 
	MOVWF       FARG_distance_lon1+1 
	MOVF        _startlon+2, 0 
	MOVWF       FARG_distance_lon1+2 
	MOVF        _startlon+3, 0 
	MOVWF       FARG_distance_lon1+3 
	MOVF        _fl_lat+0, 0 
	MOVWF       FARG_distance_lat2+0 
	MOVF        _fl_lat+1, 0 
	MOVWF       FARG_distance_lat2+1 
	MOVF        _fl_lat+2, 0 
	MOVWF       FARG_distance_lat2+2 
	MOVF        _fl_lat+3, 0 
	MOVWF       FARG_distance_lat2+3 
	MOVF        _fl_lon+0, 0 
	MOVWF       FARG_distance_lon2+0 
	MOVF        _fl_lon+1, 0 
	MOVWF       FARG_distance_lon2+1 
	MOVF        _fl_lon+2, 0 
	MOVWF       FARG_distance_lon2+2 
	MOVF        _fl_lon+3, 0 
	MOVWF       FARG_distance_lon2+3 
	CALL        _distance+0, 0
	MOVF        R0, 0 
	MOVWF       _D_distance+0 
	MOVF        R1, 0 
	MOVWF       _D_distance+1 
	MOVF        R2, 0 
	MOVWF       _D_distance+2 
	MOVF        R3, 0 
	MOVWF       _D_distance+3 
;soft_uart_read_write_functions.c,301 :: 		sprintf(CHBUFDIS,"%.4f",D_distance);
	MOVLW       _CHBUFDIS+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_CHBUFDIS+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_13_soft_uart_read_write_functions+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_13_soft_uart_read_write_functions+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_13_soft_uart_read_write_functions+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        R2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        R3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;soft_uart_read_write_functions.c,302 :: 		soft_uart_write_string(CHBUFDIS);
	MOVLW       _CHBUFDIS+0
	MOVWF       FARG_soft_uart_write_string_stringData+0 
	MOVLW       hi_addr(_CHBUFDIS+0)
	MOVWF       FARG_soft_uart_write_string_stringData+1 
	CALL        _soft_uart_write_string+0, 0
;soft_uart_read_write_functions.c,306 :: 		sprintf(MyLat,"%f",fl_lat);
	MOVLW       _MyLat+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_MyLat+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_14_soft_uart_read_write_functions+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_14_soft_uart_read_write_functions+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_14_soft_uart_read_write_functions+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _fl_lat+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _fl_lat+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _fl_lat+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _fl_lat+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;soft_uart_read_write_functions.c,307 :: 		sprintf(MyLon,"%f",fl_lon);
	MOVLW       _MyLon+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_MyLon+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_15_soft_uart_read_write_functions+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_15_soft_uart_read_write_functions+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_15_soft_uart_read_write_functions+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _fl_lon+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _fl_lon+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _fl_lon+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _fl_lon+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;soft_uart_read_write_functions.c,309 :: 		soft_uart_write_string(MyLat);
	MOVLW       _MyLat+0
	MOVWF       FARG_soft_uart_write_string_stringData+0 
	MOVLW       hi_addr(_MyLat+0)
	MOVWF       FARG_soft_uart_write_string_stringData+1 
	CALL        _soft_uart_write_string+0, 0
;soft_uart_read_write_functions.c,310 :: 		soft_uart_write_string("\n");
	MOVLW       ?lstr16_soft_uart_read_write_functions+0
	MOVWF       FARG_soft_uart_write_string_stringData+0 
	MOVLW       hi_addr(?lstr16_soft_uart_read_write_functions+0)
	MOVWF       FARG_soft_uart_write_string_stringData+1 
	CALL        _soft_uart_write_string+0, 0
;soft_uart_read_write_functions.c,311 :: 		soft_uart_write_string(MyLon);
	MOVLW       _MyLon+0
	MOVWF       FARG_soft_uart_write_string_stringData+0 
	MOVLW       hi_addr(_MyLon+0)
	MOVWF       FARG_soft_uart_write_string_stringData+1 
	CALL        _soft_uart_write_string+0, 0
;soft_uart_read_write_functions.c,312 :: 		soft_uart_write_string("\n");
	MOVLW       ?lstr17_soft_uart_read_write_functions+0
	MOVWF       FARG_soft_uart_write_string_stringData+0 
	MOVLW       hi_addr(?lstr17_soft_uart_read_write_functions+0)
	MOVWF       FARG_soft_uart_write_string_stringData+1 
	CALL        _soft_uart_write_string+0, 0
;soft_uart_read_write_functions.c,313 :: 		mmc_write(MyLat,MyLon);
	MOVLW       _MyLat+0
	MOVWF       FARG_mmc_write_lat+0 
	MOVLW       hi_addr(_MyLat+0)
	MOVWF       FARG_mmc_write_lat+1 
	MOVLW       _MyLon+0
	MOVWF       FARG_mmc_write_lon+0 
	MOVLW       hi_addr(_MyLon+0)
	MOVWF       FARG_mmc_write_lon+1 
	CALL        _mmc_write+0, 0
;soft_uart_read_write_functions.c,314 :: 		lcd_write(MyLat,MyLon,MySpeed,CHBUFDIS);
	MOVLW       _MyLat+0
	MOVWF       FARG_lcd_write_lat+0 
	MOVLW       hi_addr(_MyLat+0)
	MOVWF       FARG_lcd_write_lat+1 
	MOVLW       _MyLon+0
	MOVWF       FARG_lcd_write_lon+0 
	MOVLW       hi_addr(_MyLon+0)
	MOVWF       FARG_lcd_write_lon+1 
	MOVLW       _MySpeed+0
	MOVWF       FARG_lcd_write_speed+0 
	MOVLW       hi_addr(_MySpeed+0)
	MOVWF       FARG_lcd_write_speed+1 
	MOVLW       _CHBUFDIS+0
	MOVWF       FARG_lcd_write_dist+0 
	MOVLW       hi_addr(_CHBUFDIS+0)
	MOVWF       FARG_lcd_write_dist+1 
	CALL        _lcd_write+0, 0
;soft_uart_read_write_functions.c,316 :: 		}
L_main39:
;soft_uart_read_write_functions.c,274 :: 		for(m = 0; m < 1500; m++){
	INFSNZ      _m+0, 1 
	INCF        _m+1, 1 
;soft_uart_read_write_functions.c,318 :: 		}
	GOTO        L_main31
L_main32:
;soft_uart_read_write_functions.c,321 :: 		}
	GOTO        L_main40
L_main28:
;soft_uart_read_write_functions.c,323 :: 		soft_uart_write_string("Can't find FAT 16 \n");
	MOVLW       ?lstr18_soft_uart_read_write_functions+0
	MOVWF       FARG_soft_uart_write_string_stringData+0 
	MOVLW       hi_addr(?lstr18_soft_uart_read_write_functions+0)
	MOVWF       FARG_soft_uart_write_string_stringData+1 
	CALL        _soft_uart_write_string+0, 0
;soft_uart_read_write_functions.c,324 :: 		Lcd_Out(1, 1, "CANT FIND FAT ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr19_soft_uart_read_write_functions+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr19_soft_uart_read_write_functions+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;soft_uart_read_write_functions.c,325 :: 		}
L_main40:
;soft_uart_read_write_functions.c,330 :: 		} //1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
L_main25:
;soft_uart_read_write_functions.c,332 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
