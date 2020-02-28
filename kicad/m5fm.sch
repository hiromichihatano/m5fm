EESchema Schematic File Version 4
LIBS:m5fm-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "YM2608 Test"
Date "2020-01-15"
Rev "Rev.A"
Comp "Hiromichi Hatano"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Newlib:4094 U2
U 1 1 5E11A8E2
P 3300 4250
F 0 "U2" H 3050 4900 50  0000 C CNN
F 1 "4094" H 3550 4900 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 2800 4350 50  0001 C CNN
F 3 "http://akizukidenshi.com/download/ds/Toshiba/TC4094BP_datasheet_ja_20140301.pdf" H 2800 4350 50  0001 C CNN
	1    3300 4250
	1    0    0    -1  
$EndComp
Text GLabel 1550 2250 0    50   Input ~ 0
SPI_SS
Text GLabel 1550 2350 0    50   Input ~ 0
SPI_MOSI
Text GLabel 1550 2450 0    50   Input ~ 0
SPI_SCK
Wire Wire Line
	1550 2250 2400 2250
Wire Wire Line
	2400 2250 2400 3950
Wire Wire Line
	2400 3950 2800 3950
Connection ~ 2400 2250
Wire Wire Line
	2400 2250 2800 2250
Wire Wire Line
	1550 2350 2800 2350
Wire Wire Line
	1550 2450 2350 2450
Wire Wire Line
	2350 2450 2350 4150
Wire Wire Line
	2350 4150 2800 4150
Connection ~ 2350 2450
Wire Wire Line
	2350 2450 2800 2450
Wire Wire Line
	2750 3400 2750 4050
$Comp
L power:+3.3V #PWR05
U 1 1 5E1212D2
P 2600 1750
F 0 "#PWR05" H 2600 1600 50  0001 C CNN
F 1 "+3.3V" H 2615 1923 50  0000 C CNN
F 2 "" H 2600 1750 50  0001 C CNN
F 3 "" H 2600 1750 50  0001 C CNN
	1    2600 1750
	1    0    0    -1  
$EndComp
$Comp
L Newlib:4094 U1
U 1 1 5E11977A
P 3300 2550
F 0 "U1" H 3050 3200 50  0000 C CNN
F 1 "4094" H 3550 3200 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 2800 2650 50  0001 C CNN
F 3 "http://akizukidenshi.com/download/ds/Toshiba/TC4094BP_datasheet_ja_20140301.pdf" H 2800 2650 50  0001 C CNN
	1    3300 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1750 2600 1750
Wire Wire Line
	2600 3450 3300 3450
Wire Wire Line
	2750 4050 2800 4050
Wire Wire Line
	3800 4450 5000 4450
Wire Wire Line
	5000 4450 5000 3200
Wire Wire Line
	5000 3200 5150 3200
Wire Wire Line
	3800 4350 4950 4350
Wire Wire Line
	4950 4350 4950 3100
Wire Wire Line
	4950 3100 5150 3100
Wire Wire Line
	3800 4250 4900 4250
Wire Wire Line
	4900 4250 4900 3000
Wire Wire Line
	4900 3000 5150 3000
Wire Wire Line
	3800 4150 4850 4150
Wire Wire Line
	4850 4150 4850 2900
Wire Wire Line
	4850 2900 5150 2900
Wire Wire Line
	3800 4050 4800 4050
Wire Wire Line
	4800 4050 4800 2800
Wire Wire Line
	4800 2800 5150 2800
Wire Wire Line
	3800 3950 4750 3950
Wire Wire Line
	4750 3950 4750 2700
Wire Wire Line
	4750 2700 5150 2700
Text Notes 900  4450 0    50   ~ 0
1. SPI Data order MUST be MSBFIRST\n2. SPI MODE MUST be MODE0 or MODE3
Wire Wire Line
	3800 3850 4700 3850
Wire Wire Line
	4700 3850 4700 2600
Wire Wire Line
	4700 2600 5150 2600
Wire Wire Line
	3800 3750 4650 3750
Wire Wire Line
	4650 3750 4650 2500
Wire Wire Line
	4650 2500 5150 2500
Text GLabel 4800 1950 0    50   Input ~ 0
YM_CS
Wire Wire Line
	4800 1950 5150 1950
Wire Wire Line
	3800 2050 4150 2050
Wire Wire Line
	4150 2050 4150 2250
Wire Wire Line
	4150 2250 5150 2250
Wire Wire Line
	3800 2150 4100 2150
Wire Wire Line
	4100 2150 4100 2350
Wire Wire Line
	4100 2350 5150 2350
Wire Wire Line
	2600 2650 2800 2650
Wire Wire Line
	2600 2650 2600 3450
$Comp
L power:+3.3V #PWR010
U 1 1 5E15C185
P 4300 1400
F 0 "#PWR010" H 4300 1250 50  0001 C CNN
F 1 "+3.3V" H 4315 1573 50  0000 C CNN
F 2 "" H 4300 1400 50  0001 C CNN
F 3 "" H 4300 1400 50  0001 C CNN
	1    4300 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 2150 4300 2150
Text GLabel 4800 2050 0    50   Input ~ 0
YM_WR
Wire Wire Line
	4800 2050 5150 2050
NoConn ~ 6400 2300
NoConn ~ 6400 2400
NoConn ~ 6400 2500
NoConn ~ 6400 2600
NoConn ~ 6400 2700
NoConn ~ 6400 2800
NoConn ~ 6400 2900
NoConn ~ 6400 3000
NoConn ~ 6400 3100
NoConn ~ 6400 3200
NoConn ~ 6400 3300
NoConn ~ 6400 3400
NoConn ~ 6400 3500
NoConn ~ 6400 3600
NoConn ~ 6400 3700
NoConn ~ 6400 3800
NoConn ~ 5150 4800
NoConn ~ 5150 4700
NoConn ~ 5150 4600
NoConn ~ 5150 4500
NoConn ~ 5150 4400
NoConn ~ 5150 4300
NoConn ~ 5150 4200
NoConn ~ 5150 4100
NoConn ~ 5150 3950
NoConn ~ 5150 3850
NoConn ~ 5150 3750
NoConn ~ 5150 3650
NoConn ~ 5150 3550
NoConn ~ 5150 3450
NoConn ~ 5150 3350
NoConn ~ 6400 4600
NoConn ~ 6400 4500
NoConn ~ 6400 4000
NoConn ~ 6400 4100
NoConn ~ 6400 4200
NoConn ~ 6400 4300
Text GLabel 4800 1800 0    50   Input ~ 0
RST
Wire Wire Line
	4800 1800 5150 1800
Wire Wire Line
	6400 1700 7100 1700
Wire Wire Line
	6400 2000 6550 2000
Wire Wire Line
	6550 2000 6550 1600
Wire Wire Line
	6550 1600 7100 1600
Wire Wire Line
	7100 1800 6400 1800
Wire Wire Line
	6400 1900 7100 1900
Text GLabel 6850 2250 0    50   Input ~ 0
RST
Wire Wire Line
	6850 2250 7100 2250
$Comp
L power:GND #PWR017
U 1 1 5E1983FE
P 7000 2750
F 0 "#PWR017" H 7000 2500 50  0001 C CNN
F 1 "GND" H 7005 2577 50  0000 C CNN
F 2 "" H 7000 2750 50  0001 C CNN
F 3 "" H 7000 2750 50  0001 C CNN
	1    7000 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E1991A7
P 6950 1300
F 0 "R2" H 7020 1346 50  0000 L CNN
F 1 "1K" H 7020 1255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6880 1300 50  0001 C CNN
F 3 "~" H 6950 1300 50  0001 C CNN
	1    6950 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2750 7000 2700
$Comp
L power:+5V #PWR016
U 1 1 5E1A1E4D
P 6800 900
F 0 "#PWR016" H 6800 750 50  0001 C CNN
F 1 "+5V" H 6815 1073 50  0000 C CNN
F 2 "" H 6800 900 50  0001 C CNN
F 3 "" H 6800 900 50  0001 C CNN
	1    6800 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 1100 7800 900 
Wire Wire Line
	7800 900  6950 900 
Wire Wire Line
	7700 1100 7800 1100
Wire Wire Line
	5650 1400 5650 900 
Wire Wire Line
	5650 900  6800 900 
Connection ~ 6800 900 
NoConn ~ 3800 2250
NoConn ~ 3800 2350
NoConn ~ 3800 2450
NoConn ~ 3800 2550
NoConn ~ 3800 2650
NoConn ~ 3800 2750
NoConn ~ 3800 3000
NoConn ~ 3800 4600
NoConn ~ 3800 4700
Connection ~ 7800 1100
$Comp
L Newlib:YM3016-D U8
U 1 1 5E1836F3
P 7750 1900
F 0 "U8" H 7350 2550 50  0000 C CNN
F 1 "YM3016-D" H 8100 2550 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 7100 1650 50  0001 C CNN
F 3 "" H 7100 1650 50  0001 C CNN
	1    7750 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 2600 7750 2700
Wire Wire Line
	7750 2700 7000 2700
$Comp
L Amplifier_Operational:NJM4560 U7
U 1 1 5E1A2E87
P 9300 1900
F 0 "U7" H 9550 1950 50  0000 C CNN
F 1 "NJM4560" H 9450 2050 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 9300 1900 50  0001 C CNN
F 3 "http://www.njr.com/semicon/PDF/NJM4560_E.pdf" H 9300 1900 50  0001 C CNN
	1    9300 1900
	1    0    0    1   
$EndComp
Wire Wire Line
	9600 1900 9600 1700
$Comp
L Device:R R7
U 1 1 5E1F671C
P 8700 1200
F 0 "R7" V 8493 1200 50  0000 C CNN
F 1 "33" V 8584 1200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8630 1200 50  0001 C CNN
F 3 "~" H 8700 1200 50  0001 C CNN
	1    8700 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	8400 1700 8400 1800
Wire Wire Line
	7750 2700 8800 2700
Wire Wire Line
	8800 2700 8800 2350
Connection ~ 7750 2700
$Comp
L Amplifier_Operational:NJM4560 U5
U 1 1 5E26D367
P 9100 3150
F 0 "U5" H 9300 3250 50  0000 C CNN
F 1 "NJM4560" H 9200 3350 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 9100 3150 50  0001 C CNN
F 3 "http://www.njr.com/semicon/PDF/NJM4560_E.pdf" H 9100 3150 50  0001 C CNN
	1    9100 3150
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:NJM4560 U5
U 2 1 5E270409
P 9100 3650
F 0 "U5" H 9300 3750 50  0000 C CNN
F 1 "NJM4560" H 9200 3850 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 9100 3650 50  0001 C CNN
F 3 "http://www.njr.com/semicon/PDF/NJM4560_E.pdf" H 9100 3650 50  0001 C CNN
	2    9100 3650
	1    0    0    1   
$EndComp
Wire Wire Line
	9400 3150 9400 2950
Wire Wire Line
	9400 2950 8800 2950
Wire Wire Line
	8800 2950 8800 3050
Wire Wire Line
	9400 3650 9400 3450
Wire Wire Line
	9400 3450 8800 3450
Wire Wire Line
	8800 3450 8800 3550
Wire Wire Line
	8400 2150 8550 2150
Wire Wire Line
	8400 3750 8800 3750
$Comp
L Amplifier_Operational:NJM4560 U3
U 1 1 5E28E22D
P 7200 3850
F 0 "U3" H 7400 3950 50  0000 C CNN
F 1 "NJM4560" H 7300 4050 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 7200 3850 50  0001 C CNN
F 3 "http://www.njr.com/semicon/PDF/NJM4560_E.pdf" H 7200 3850 50  0001 C CNN
	1    7200 3850
	1    0    0    1   
$EndComp
Wire Wire Line
	6550 2100 6400 2100
Wire Wire Line
	6900 3600 6900 3750
$Comp
L power:GND #PWR021
U 1 1 5E2D391D
P 8400 3950
F 0 "#PWR021" H 8400 3700 50  0001 C CNN
F 1 "GND" H 8405 3777 50  0000 C CNN
F 2 "" H 8400 3950 50  0001 C CNN
F 3 "" H 8400 3950 50  0001 C CNN
	1    8400 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 2150 8550 3250
Wire Wire Line
	8400 3750 8400 2250
$Comp
L Device:R R10
U 1 1 5E2E9413
P 9550 3150
F 0 "R10" H 9620 3196 50  0000 L CNN
F 1 "10K" H 9620 3105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9480 3150 50  0001 C CNN
F 3 "~" H 9550 3150 50  0001 C CNN
	1    9550 3150
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 5E2EC6F2
P 9550 3650
F 0 "R11" H 9620 3696 50  0000 L CNN
F 1 "10K" H 9620 3605 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9480 3650 50  0001 C CNN
F 3 "~" H 9550 3650 50  0001 C CNN
	1    9550 3650
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5E1CD603
P 8550 3350
F 0 "C2" H 8638 3396 50  0000 L CNN
F 1 "2700PF" H 8638 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.0mm_P5.00mm" H 8550 3350 50  0001 C CNN
F 3 "~" H 8550 3350 50  0001 C CNN
F 4 "PPフィルムコンデンサ, 千石電商B1 \\21" H 8550 3350 50  0001 C CNN "メモ"
	1    8550 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5E1CE19A
P 8400 3850
F 0 "C1" H 8488 3896 50  0000 L CNN
F 1 "2700PF" H 8488 3805 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.0mm_P5.00mm" H 8400 3850 50  0001 C CNN
F 3 "~" H 8400 3850 50  0001 C CNN
F 4 "PPフィルムコンデンサ, 千石電商B1 \\21" H 8400 3850 50  0001 C CNN "メモ"
	1    8400 3850
	1    0    0    -1  
$EndComp
Connection ~ 8550 3250
Wire Wire Line
	8550 3250 8800 3250
Connection ~ 8400 3750
Wire Wire Line
	7500 3600 7500 3850
Connection ~ 9400 3150
Connection ~ 9400 3650
Wire Wire Line
	9700 3150 9750 3150
Wire Wire Line
	6550 3200 6750 3200
Wire Wire Line
	6750 3200 6750 3800
Wire Wire Line
	6550 2100 6550 3200
Wire Wire Line
	9700 4250 7900 4250
$Comp
L power:GND #PWR015
U 1 1 5E34FA2F
P 6750 4100
F 0 "#PWR015" H 6750 3850 50  0001 C CNN
F 1 "GND" H 6755 3927 50  0000 C CNN
F 2 "" H 6750 4100 50  0001 C CNN
F 3 "" H 6750 4100 50  0001 C CNN
	1    6750 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5E359429
P 8550 3450
F 0 "#PWR022" H 8550 3200 50  0001 C CNN
F 1 "GND" H 8555 3277 50  0000 C CNN
F 2 "" H 8550 3450 50  0001 C CNN
F 3 "" H 8550 3450 50  0001 C CNN
	1    8550 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5E1C46C2
P 5700 5250
F 0 "#PWR014" H 5700 5000 50  0001 C CNN
F 1 "GND" H 5705 5077 50  0000 C CNN
F 2 "" H 5700 5250 50  0001 C CNN
F 3 "" H 5700 5250 50  0001 C CNN
	1    5700 5250
	1    0    0    -1  
$EndComp
Connection ~ 5700 5250
Wire Wire Line
	5850 5250 5950 5250
$Comp
L power:GND #PWR09
U 1 1 5E1D482A
P 3300 4950
F 0 "#PWR09" H 3300 4700 50  0001 C CNN
F 1 "GND" H 3305 4777 50  0000 C CNN
F 2 "" H 3300 4950 50  0001 C CNN
F 3 "" H 3300 4950 50  0001 C CNN
	1    3300 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3450 2600 4350
Wire Wire Line
	2600 4350 2800 4350
Connection ~ 2600 3450
$Comp
L power:+3.3V #PWR02
U 1 1 5E1DC666
P 2400 5700
F 0 "#PWR02" H 2400 5550 50  0001 C CNN
F 1 "+3.3V" H 2400 5850 50  0000 C CNN
F 2 "" H 2400 5700 50  0001 C CNN
F 3 "" H 2400 5700 50  0001 C CNN
	1    2400 5700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5E1DC66D
P 2600 5700
F 0 "#PWR06" H 2600 5550 50  0001 C CNN
F 1 "+5V" H 2600 5850 50  0000 C CNN
F 2 "" H 2600 5700 50  0001 C CNN
F 3 "" H 2600 5700 50  0001 C CNN
	1    2600 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5E1EE43A
P 2400 6800
F 0 "#PWR03" H 2400 6550 50  0001 C CNN
F 1 "GND" H 2405 6627 50  0000 C CNN
F 2 "" H 2400 6800 50  0001 C CNN
F 3 "" H 2400 6800 50  0001 C CNN
	1    2400 6800
	1    0    0    -1  
$EndComp
Text GLabel 2750 6000 2    50   Input ~ 0
SPI_MOSI
Text GLabel 2750 6100 2    50   Input ~ 0
SPI_MISO
Text GLabel 2750 6200 2    50   Input ~ 0
SPI_SCK
Text GLabel 2750 6300 2    50   Input ~ 0
SPI_SS
Text GLabel 2750 6400 2    50   Input ~ 0
YM_CS
Text GLabel 2750 6500 2    50   Input ~ 0
YM_WR
Text GLabel 2750 5900 2    50   Input ~ 0
RST
Text GLabel 2750 6700 2    50   Input ~ 0
MONOSPK_OUT
Text GLabel 2750 6600 2    50   Input ~ 0
YM_RD
Wire Wire Line
	2600 5700 2600 5800
Text Label 1900 5700 2    50   ~ 0
3V3
Text Label 1900 5800 2    50   ~ 0
5V
Text Label 1900 5900 2    50   ~ 0
RST
Text Label 1900 6000 2    50   ~ 0
MO_23
Text Label 1900 6100 2    50   ~ 0
MI_19
Text Label 1900 6200 2    50   ~ 0
SCK_18
Text Label 1900 6300 2    50   ~ 0
G_2
Text Label 1900 6400 2    50   ~ 0
G_5
Text Label 1900 6500 2    50   ~ 0
AD_35
Text Label 1900 6600 2    50   ~ 0
AD_36
Text Label 1900 6700 2    50   ~ 0
DA_25
Text Label 1900 6800 2    50   ~ 0
GND
Text GLabel 3850 6100 0    50   Input ~ 0
SPI_MISO
NoConn ~ 3850 6100
Wire Wire Line
	5600 5250 5700 5250
Connection ~ 7500 3850
Wire Wire Line
	9700 4250 9700 3650
Wire Wire Line
	9750 3150 9750 4300
Wire Wire Line
	9750 4300 8100 4300
Wire Wire Line
	7900 5100 8100 5100
Wire Wire Line
	7900 4700 7900 5100
Connection ~ 7900 4700
Wire Wire Line
	7800 4700 7900 4700
Wire Wire Line
	8100 4400 8100 4600
Connection ~ 8100 4400
Wire Wire Line
	7800 4400 8100 4400
Wire Wire Line
	7500 4400 7500 4700
Connection ~ 7500 4400
$Comp
L Device:R R6
U 1 1 5E2FE340
P 7650 4700
F 0 "R6" H 7720 4746 50  0000 L CNN
F 1 "10K" H 7720 4655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7580 4700 50  0001 C CNN
F 3 "~" H 7650 4700 50  0001 C CNN
	1    7650 4700
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5E2F9E29
P 7650 4400
F 0 "R5" H 7720 4446 50  0000 L CNN
F 1 "10K" H 7720 4355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7580 4400 50  0001 C CNN
F 3 "~" H 7650 4400 50  0001 C CNN
	1    7650 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	8100 4300 8100 4400
$Comp
L Amplifier_Operational:NJM4560 U4
U 1 1 5E2168AA
P 8550 4650
F 0 "U4" H 8400 4400 50  0000 C CNN
F 1 "NJM4560" H 8750 4400 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 8550 4650 50  0001 C CNN
F 3 "http://www.njr.com/semicon/PDF/NJM4560_E.pdf" H 8550 4650 50  0001 C CNN
	1    8550 4650
	1    0    0    1   
$EndComp
Connection ~ 8850 4650
$Comp
L Amplifier_Operational:NJM4560 U4
U 2 1 5E2168B0
P 8550 5150
F 0 "U4" H 8400 4900 50  0000 C CNN
F 1 "NJM4560" H 8750 4900 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 8550 5150 50  0001 C CNN
F 3 "http://www.njr.com/semicon/PDF/NJM4560_E.pdf" H 8550 5150 50  0001 C CNN
	2    8550 5150
	1    0    0    1   
$EndComp
Connection ~ 8850 5150
Wire Wire Line
	8250 4450 8250 4550
Wire Wire Line
	8850 4950 8250 4950
Wire Wire Line
	8250 4950 8250 5050
Wire Wire Line
	8250 4450 8850 4450
Wire Wire Line
	9800 5000 9800 5150
Wire Wire Line
	10300 5000 9800 5000
Wire Wire Line
	10100 5100 10100 4650
Wire Wire Line
	10300 5100 10100 5100
Wire Wire Line
	10250 4900 10250 5450
Wire Wire Line
	10300 4900 10250 4900
$Comp
L power:GND #PWR025
U 1 1 5E235E80
P 10250 5450
F 0 "#PWR025" H 10250 5200 50  0001 C CNN
F 1 "GND" H 10255 5277 50  0000 C CNN
F 2 "" H 10250 5450 50  0001 C CNN
F 3 "" H 10250 5450 50  0001 C CNN
	1    10250 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 4650 8850 4450
Wire Wire Line
	8850 5150 8850 4950
$Comp
L Connector:AudioJack3 J2
U 1 1 5E19DBA5
P 10500 5000
F 0 "J2" H 10700 5250 50  0000 R CNN
F 1 "AudioJack3" H 10550 5250 50  0000 R CNN
F 2 "Connector_Audio:Jack_3.5mm_Ledino_KB3SPRS_Horizontal" H 10500 5000 50  0001 C CNN
F 3 "~" H 10500 5000 50  0001 C CNN
	1    10500 5000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7500 3850 7500 4400
Wire Wire Line
	7900 4250 7900 4700
$Comp
L Amplifier_Operational:NJM4560 U3
U 2 1 5E3C16A1
P 9700 5800
F 0 "U3" H 9700 5433 50  0000 C CNN
F 1 "NJM4560" H 9700 5524 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 9700 5800 50  0001 C CNN
F 3 "http://www.njr.com/semicon/PDF/NJM4560_E.pdf" H 9700 5800 50  0001 C CNN
	2    9700 5800
	1    0    0    1   
$EndComp
$Comp
L Device:R R9
U 1 1 5E3EF33C
P 9200 5750
F 0 "R9" V 9300 5800 50  0000 L CNN
F 1 "10K" V 9300 5600 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9130 5750 50  0001 C CNN
F 3 "~" H 9200 5750 50  0001 C CNN
	1    9200 5750
	-1   0    0    1   
$EndComp
$Comp
L Device:R R8
U 1 1 5E4041E5
P 9000 5750
F 0 "R8" V 9100 5800 50  0000 L CNN
F 1 "10K" V 9100 5600 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8930 5750 50  0001 C CNN
F 3 "~" H 9000 5750 50  0001 C CNN
	1    9000 5750
	-1   0    0    1   
$EndComp
Wire Wire Line
	9000 5600 9000 4650
Wire Wire Line
	9200 5150 9200 5600
Wire Wire Line
	9000 5900 9200 5900
Connection ~ 9200 5900
Wire Wire Line
	9200 5900 9400 5900
Wire Wire Line
	10000 5800 10000 5600
Wire Wire Line
	10000 5600 9400 5600
Wire Wire Line
	9400 5600 9400 5700
Connection ~ 9000 4650
Wire Wire Line
	9000 4650 8850 4650
Connection ~ 9200 5150
Wire Wire Line
	9200 5150 8850 5150
Wire Wire Line
	9200 5150 9800 5150
Wire Wire Line
	9000 4650 10100 4650
$Comp
L Device:R_POT RV4
U 1 1 5E4829FF
P 10200 5950
F 0 "RV4" H 10131 5996 50  0000 R CNN
F 1 "10K" H 10131 5905 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3386P_Vertical" H 10200 5950 50  0001 C CNN
F 3 "~" H 10200 5950 50  0001 C CNN
	1    10200 5950
	1    0    0    1   
$EndComp
Text GLabel 10350 5950 2    50   Output ~ 0
MONOSPK_OUT
$Comp
L power:GND #PWR024
U 1 1 5E499F07
P 10200 6100
F 0 "#PWR024" H 10200 5850 50  0001 C CNN
F 1 "GND" H 10205 5927 50  0000 C CNN
F 2 "" H 10200 6100 50  0001 C CNN
F 3 "" H 10200 6100 50  0001 C CNN
	1    10200 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 5800 10200 5800
Connection ~ 10000 5800
Text GLabel 3850 6600 0    50   Input ~ 0
YM_RD
NoConn ~ 3850 6600
Wire Wire Line
	5850 1400 5950 1400
Wire Wire Line
	5650 1400 5850 1400
Connection ~ 5650 1400
Connection ~ 5850 1400
Wire Wire Line
	6950 900  6950 1150
Connection ~ 6950 900 
Wire Wire Line
	6950 900  6800 900 
Wire Wire Line
	6950 1450 6950 2150
Wire Wire Line
	6950 2150 7100 2150
$Comp
L Oscillator:ACO-xxxMHz X1
U 1 1 5E5430BF
P 4850 1300
F 0 "X1" H 4700 1550 50  0000 R CNN
F 1 "8MHz" H 5150 1550 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 5300 950 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 4750 1300 50  0001 C CNN
	1    4850 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 1300 5150 1700
Wire Wire Line
	5650 900  4850 900 
Wire Wire Line
	4850 900  4850 1000
Connection ~ 5650 900 
$Comp
L Device:R R1
U 1 1 5E58BF67
P 4300 2000
F 0 "R1" H 4370 2046 50  0000 L CNN
F 1 "1K" H 4370 1955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4230 2000 50  0001 C CNN
F 3 "~" H 4300 2000 50  0001 C CNN
	1    4300 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1850 4300 1400
$Comp
L power:GND #PWR08
U 1 1 5E5A5836
P 3300 3250
F 0 "#PWR08" H 3300 3000 50  0001 C CNN
F 1 "GND" H 3450 3250 50  0000 C CNN
F 2 "" H 3300 3250 50  0001 C CNN
F 3 "" H 3300 3250 50  0001 C CNN
	1    3300 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 6500 2750 6500
Wire Wire Line
	2750 6400 1600 6400
Wire Wire Line
	1600 6300 2750 6300
Wire Wire Line
	1600 6200 2750 6200
Wire Wire Line
	1600 6100 2750 6100
Wire Wire Line
	1600 6000 2750 6000
Wire Wire Line
	1600 5900 2750 5900
Wire Wire Line
	1600 6700 2750 6700
Wire Wire Line
	2750 6600 1600 6600
$Comp
L Connector_Generic:Conn_01x12 J1
U 1 1 5E22B281
P 1400 6200
F 0 "J1" H 1318 6917 50  0000 C CNN
F 1 "Conn_01x12" H 1318 6826 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 1400 6200 50  0001 C CNN
F 3 "~" H 1400 6200 50  0001 C CNN
	1    1400 6200
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5E57C0C1
P 4850 1600
F 0 "#PWR011" H 4850 1350 50  0001 C CNN
F 1 "GND" H 4950 1600 50  0000 C CNN
F 2 "" H 4850 1600 50  0001 C CNN
F 3 "" H 4850 1600 50  0001 C CNN
	1    4850 1600
	1    0    0    -1  
$EndComp
Connection ~ 5850 5250
Wire Wire Line
	5700 5250 5850 5250
$Comp
L power:+3.3V #PWR01
U 1 1 5E66B1EE
P 2400 900
F 0 "#PWR01" H 2400 750 50  0001 C CNN
F 1 "+3.3V" H 2400 1050 50  0000 C CNN
F 2 "" H 2400 900 50  0001 C CNN
F 3 "" H 2400 900 50  0001 C CNN
	1    2400 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5E66B1F4
P 2600 900
F 0 "#PWR04" H 2600 750 50  0001 C CNN
F 1 "+5V" H 2600 1050 50  0000 C CNN
F 2 "" H 2600 900 50  0001 C CNN
F 3 "" H 2600 900 50  0001 C CNN
	1    2600 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5E673B43
P 2800 900
F 0 "#PWR07" H 2800 650 50  0001 C CNN
F 1 "GND" H 2805 727 50  0000 C CNN
F 2 "" H 2800 900 50  0001 C CNN
F 3 "" H 2800 900 50  0001 C CNN
	1    2800 900 
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG03
U 1 1 5E67C401
P 2800 900
F 0 "#FLG03" H 2800 975 50  0001 C CNN
F 1 "PWR_FLAG" H 2800 1073 50  0001 C CNN
F 2 "" H 2800 900 50  0001 C CNN
F 3 "~" H 2800 900 50  0001 C CNN
	1    2800 900 
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5E67D78D
P 2400 900
F 0 "#FLG01" H 2400 975 50  0001 C CNN
F 1 "PWR_FLAG" H 2400 1073 50  0001 C CNN
F 2 "" H 2400 900 50  0001 C CNN
F 3 "~" H 2400 900 50  0001 C CNN
	1    2400 900 
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5E685EB1
P 2600 900
F 0 "#FLG02" H 2600 975 50  0001 C CNN
F 1 "PWR_FLAG" H 2600 1073 50  0001 C CNN
F 2 "" H 2600 900 50  0001 C CNN
F 3 "~" H 2600 900 50  0001 C CNN
	1    2600 900 
	-1   0    0    1   
$EndComp
Wire Wire Line
	1600 5700 2400 5700
Wire Wire Line
	1600 5800 2600 5800
Wire Wire Line
	1600 6800 2400 6800
$Comp
L Newlib:YM2608B U6
U 1 1 5E148D1A
P 5750 3300
F 0 "U6" H 5400 5050 50  0000 C CNN
F 1 "YM2608B" H 6150 5050 50  0000 C CNN
F 2 "new_lib:DIP-64_750_ELL" H 5350 5050 50  0001 C CNN
F 3 "" H 5350 5050 50  0001 C CNN
	1    5750 3300
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:NJM4560 U3
U 3 1 5E2899C3
P 4800 6400
F 0 "U3" H 4758 6446 50  0000 L CNN
F 1 "NJM4560" H 4758 6355 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 4800 6400 50  0001 C CNN
F 3 "http://www.njr.com/semicon/PDF/NJM4560_E.pdf" H 4800 6400 50  0001 C CNN
	3    4800 6400
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:NJM4560 U4
U 3 1 5E2899C9
P 5200 6400
F 0 "U4" H 5158 6446 50  0000 L CNN
F 1 "NJM4560" H 5158 6355 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 5200 6400 50  0001 C CNN
F 3 "http://www.njr.com/semicon/PDF/NJM4560_E.pdf" H 5200 6400 50  0001 C CNN
	3    5200 6400
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:NJM4560 U5
U 3 1 5E2899CF
P 5600 6400
F 0 "U5" H 5558 6446 50  0000 L CNN
F 1 "NJM4560" H 5558 6355 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 5600 6400 50  0001 C CNN
F 3 "http://www.njr.com/semicon/PDF/NJM4560_E.pdf" H 5600 6400 50  0001 C CNN
	3    5600 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR012
U 1 1 5E2899D5
P 5300 6100
F 0 "#PWR012" H 5300 5950 50  0001 C CNN
F 1 "+5V" H 5315 6273 50  0000 C CNN
F 2 "" H 5300 6100 50  0001 C CNN
F 3 "" H 5300 6100 50  0001 C CNN
	1    5300 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 6100 5100 6100
Connection ~ 5100 6100
Wire Wire Line
	5100 6100 5300 6100
Wire Wire Line
	4700 6700 5100 6700
Connection ~ 5100 6700
Wire Wire Line
	5100 6700 5300 6700
$Comp
L power:GND #PWR013
U 1 1 5E2899E1
P 5300 6700
F 0 "#PWR013" H 5300 6450 50  0001 C CNN
F 1 "GND" H 5305 6527 50  0000 C CNN
F 2 "" H 5300 6700 50  0001 C CNN
F 3 "" H 5300 6700 50  0001 C CNN
	1    5300 6700
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:NJM4560 U7
U 3 1 5E2899E7
P 6000 6400
F 0 "U7" H 5958 6446 50  0000 L CNN
F 1 "NJM4560" H 5958 6355 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 6000 6400 50  0001 C CNN
F 3 "http://www.njr.com/semicon/PDF/NJM4560_E.pdf" H 6000 6400 50  0001 C CNN
	3    6000 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 6100 5900 6100
Connection ~ 5500 6100
Wire Wire Line
	5500 6700 5900 6700
Connection ~ 5500 6700
Connection ~ 5300 6100
Wire Wire Line
	5300 6100 5500 6100
Connection ~ 5300 6700
Wire Wire Line
	5300 6700 5500 6700
$Comp
L Amplifier_Operational:NJM4560 U7
U 2 1 5E1A58F4
P 9300 1300
F 0 "U7" H 9550 1350 50  0000 C CNN
F 1 "NJM4560" H 9450 1450 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 9300 1300 50  0001 C CNN
F 3 "http://www.njr.com/semicon/PDF/NJM4560_E.pdf" H 9300 1300 50  0001 C CNN
	2    9300 1300
	1    0    0    1   
$EndComp
Wire Wire Line
	9600 1300 9600 1100
Wire Wire Line
	9600 1100 9000 1100
Wire Wire Line
	9000 1100 9000 1200
Wire Wire Line
	9000 1400 8800 1400
Wire Wire Line
	8650 1400 8650 1550
Wire Wire Line
	8650 1550 8400 1550
Wire Wire Line
	8850 1200 9000 1200
Connection ~ 9000 1200
Wire Wire Line
	8550 1200 8550 1450
Wire Wire Line
	8550 1450 8400 1450
$Comp
L Device:C_Small C3
U 1 1 5E37E3D9
P 8800 1500
F 0 "C3" H 8650 1450 50  0000 L CNN
F 1 "68-33pF" H 8850 1450 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.0mm_P5.00mm" H 8800 1500 50  0001 C CNN
F 3 "~" H 8800 1500 50  0001 C CNN
F 4 "PPフィルムコンデンサ, 千石電商B1 \\21" H 8800 1500 50  0001 C CNN "メモ"
	1    8800 1500
	1    0    0    -1  
$EndComp
Connection ~ 8800 1400
Wire Wire Line
	8800 1400 8650 1400
$Comp
L power:GND #PWR023
U 1 1 5E388DF6
P 8800 1600
F 0 "#PWR023" H 8800 1350 50  0001 C CNN
F 1 "GND" H 8900 1600 50  0001 C CNN
F 2 "" H 8800 1600 50  0001 C CNN
F 3 "" H 8800 1600 50  0001 C CNN
	1    8800 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 1700 9000 1700
Wire Wire Line
	9000 1700 9000 1800
Wire Wire Line
	9000 1800 8400 1800
Connection ~ 9000 1800
Connection ~ 8400 1800
$Comp
L Device:CP C4
U 1 1 5E1D5CF4
P 8800 2200
F 0 "C4" H 8650 2100 50  0000 L CNN
F 1 "10u" H 8800 2100 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 8838 2050 50  0001 C CNN
F 3 "~" H 8800 2200 50  0001 C CNN
	1    8800 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 1900 8800 1900
Wire Wire Line
	8800 1900 8800 2000
Wire Wire Line
	8800 2000 9000 2000
Connection ~ 8800 2000
Wire Wire Line
	8800 2000 8800 2050
$Comp
L Device:R R3
U 1 1 5E40539A
P 7350 3600
F 0 "R3" H 7420 3646 50  0000 L CNN
F 1 "10K" H 7420 3555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 3600 50  0001 C CNN
F 3 "~" H 7350 3600 50  0001 C CNN
	1    7350 3600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 5E40EC52
P 7650 3600
F 0 "R4" H 7720 3646 50  0000 L CNN
F 1 "4.7K" H 7720 3555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7580 3600 50  0001 C CNN
F 3 "~" H 7650 3600 50  0001 C CNN
	1    7650 3600
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5E4173AA
P 7850 3700
F 0 "#PWR018" H 7850 3450 50  0001 C CNN
F 1 "GND" H 7855 3527 50  0000 C CNN
F 2 "" H 7850 3700 50  0001 C CNN
F 3 "" H 7850 3700 50  0001 C CNN
	1    7850 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3600 6900 3600
Connection ~ 2600 2650
Connection ~ 2600 1750
Wire Wire Line
	2600 1750 2600 2650
Wire Wire Line
	7800 3600 7850 3600
Wire Wire Line
	7850 3600 7850 3700
Wire Wire Line
	3800 2900 3900 2900
Wire Wire Line
	3900 2900 3900 3400
Wire Wire Line
	2750 3400 3900 3400
$Comp
L power:GND #PWR020
U 1 1 5E345A47
P 8100 5400
F 0 "#PWR020" H 8100 5150 50  0001 C CNN
F 1 "GND" H 8105 5227 50  0001 C CNN
F 2 "" H 8100 5400 50  0001 C CNN
F 3 "" H 8100 5400 50  0001 C CNN
	1    8100 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5E34AB0B
P 8100 4900
F 0 "#PWR019" H 8100 4650 50  0001 C CNN
F 1 "GND" H 8105 4727 50  0001 C CNN
F 2 "" H 8100 4900 50  0001 C CNN
F 3 "" H 8100 4900 50  0001 C CNN
	1    8100 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV3
U 1 1 5E33675F
P 8100 5250
F 0 "RV3" H 8031 5296 50  0000 R CNN
F 1 "10K" H 8031 5205 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3386P_Vertical" H 8100 5250 50  0001 C CNN
F 3 "~" H 8100 5250 50  0001 C CNN
	1    8100 5250
	1    0    0    1   
$EndComp
$Comp
L Device:R_POT RV2
U 1 1 5E2DDCAA
P 8100 4750
F 0 "RV2" V 8000 4950 50  0000 R CNN
F 1 "10K" V 8000 4750 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3386P_Vertical" H 8100 4750 50  0001 C CNN
F 3 "~" H 8100 4750 50  0001 C CNN
	1    8100 4750
	1    0    0    1   
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 5E2A737A
P 6750 3950
F 0 "RV1" H 6680 3996 50  0000 R CNN
F 1 "10K" H 6680 3905 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3386P_Vertical" H 6750 3950 50  0001 C CNN
F 3 "~" H 6750 3950 50  0001 C CNN
	1    6750 3950
	1    0    0    1   
$EndComp
$EndSCHEMATC
