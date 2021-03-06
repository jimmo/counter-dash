EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ti
LIBS:redgreen-segment
LIBS:dash-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA328-P IC1
U 1 1 57921CF5
P 2300 3800
F 0 "IC1" H 1550 5050 50  0000 L BNN
F 1 "ATMEGA328-P" H 2700 2400 50  0000 L BNN
F 2 "Housings_DIP:DIP-28_W7.62mm" H 2300 3800 50  0000 C CIN
F 3 "" H 2300 3800 50  0000 C CNN
	1    2300 3800
	1    0    0    -1  
$EndComp
$Comp
L TLC5916 U2
U 1 1 57922025
P 7100 2850
F 0 "U2" H 7100 2350 50  0000 C CNN
F 1 "TLC5916" H 7100 3350 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 7100 2850 60  0001 C CNN
F 3 "" H 7100 2850 60  0000 C CNN
	1    7100 2850
	1    0    0    -1  
$EndComp
$Comp
L SBA23-11EGWA AFF1
U 1 1 5792372C
P 7100 4300
F 0 "AFF1" H 7100 4850 50  0000 C CNN
F 1 "SBA23-11EGWA" H 7100 3850 50  0000 C CNN
F 2 "redgreen-segment:7SegmentLED_SBA23-11EGWA" H 7100 4300 50  0001 C CNN
F 3 "" H 7100 4300 50  0000 C CNN
	1    7100 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2900 6300 2900
Wire Wire Line
	6300 2900 6300 3900
Wire Wire Line
	6300 3900 6500 3900
Wire Wire Line
	6700 3000 6200 3000
Wire Wire Line
	6200 3000 6200 4000
Wire Wire Line
	6200 4000 6500 4000
Wire Wire Line
	6700 3100 6100 3100
Wire Wire Line
	6100 3100 6100 4100
Wire Wire Line
	6100 4100 6500 4100
Wire Wire Line
	6700 3200 6000 3200
Wire Wire Line
	6000 3200 6000 4200
Wire Wire Line
	6000 4200 6500 4200
Wire Wire Line
	7500 3200 7500 3450
Wire Wire Line
	7500 3450 5900 3450
Wire Wire Line
	5900 3450 5900 4300
Wire Wire Line
	5900 4300 6500 4300
Wire Wire Line
	7500 3100 7600 3100
Wire Wire Line
	7600 3100 7600 3550
Wire Wire Line
	7600 3550 5800 3550
Wire Wire Line
	5800 3550 5800 4400
Wire Wire Line
	5800 4400 6500 4400
Wire Wire Line
	7500 3000 7700 3000
Wire Wire Line
	7700 3000 7700 3650
Wire Wire Line
	7700 3650 5700 3650
Wire Wire Line
	5700 3650 5700 4500
Wire Wire Line
	5700 4500 6500 4500
Wire Wire Line
	7700 4550 7800 4550
Wire Wire Line
	7800 4550 7800 2900
Wire Wire Line
	7800 2900 7500 2900
Wire Wire Line
	4950 2150 8950 2150
Wire Wire Line
	4950 2050 8950 2050
Wire Wire Line
	4950 1950 8950 1950
Wire Wire Line
	4950 1850 8950 1850
Wire Wire Line
	5700 2600 6700 2600
Wire Wire Line
	7500 2700 8450 2700
Wire Wire Line
	6500 2150 6500 2500
Wire Wire Line
	6500 2500 6700 2500
Connection ~ 6500 2150
Wire Wire Line
	7750 2050 7750 2500
Wire Wire Line
	7750 2500 7500 2500
Connection ~ 7750 2050
Wire Wire Line
	6700 2700 5800 2700
Wire Wire Line
	7500 2800 7850 2800
Wire Wire Line
	7850 2800 7850 2150
Connection ~ 7850 2150
$Comp
L CONN_01X08 P4
U 1 1 57923F64
P 9150 1800
F 0 "P4" H 9150 2250 50  0000 C CNN
F 1 "OUT" V 9250 1800 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Angled_1x08" H 9150 1800 50  0001 C CNN
F 3 "" H 9150 1800 50  0000 C CNN
	1    9150 1800
	1    0    0    1   
$EndComp
$Comp
L CONN_01X08 P3
U 1 1 57924055
P 4750 1800
F 0 "P3" H 4750 2250 50  0000 C CNN
F 1 "IN" V 4850 1800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x08" H 4750 1800 50  0001 C CNN
F 3 "" H 4750 1800 50  0000 C CNN
	1    4750 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	6700 2800 5900 2800
Wire Wire Line
	5900 2800 5900 1950
Connection ~ 5900 1950
Wire Wire Line
	5800 2700 5800 1850
Connection ~ 5800 1850
Wire Wire Line
	4950 1750 5700 1750
Wire Wire Line
	5700 1750 5700 2600
Wire Wire Line
	8450 2700 8450 1750
Wire Wire Line
	4950 1650 8950 1650
Wire Wire Line
	4950 1550 8950 1550
Wire Wire Line
	4950 1450 8950 1450
Wire Wire Line
	8450 1750 8950 1750
$Comp
L R R8
U 1 1 57924519
P 8650 2400
F 0 "R8" V 8730 2400 50  0000 C CNN
F 1 "820" V 8650 2400 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Vertical_RM5mm" V 8580 2400 50  0001 C CNN
F 3 "" H 8650 2400 50  0000 C CNN
	1    8650 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2250 8650 2150
Connection ~ 8650 2150
Wire Wire Line
	8650 2550 8650 2600
Wire Wire Line
	8650 2600 7500 2600
Wire Wire Line
	3300 3000 5100 3000
Wire Wire Line
	5100 3000 5100 1750
Connection ~ 5100 1750
Wire Wire Line
	3300 3200 5200 3200
Wire Wire Line
	5200 3200 5200 1850
Connection ~ 5200 1850
$Comp
L CONN_02X04 P2
U 1 1 5792477B
P 4650 4450
F 0 "P2" H 4650 4700 50  0000 C CNN
F 1 "ESP8266" H 4650 4200 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x04" H 4650 3250 50  0001 C CNN
F 3 "" H 4650 3250 50  0000 C CNN
	1    4650 4450
	1    0    0    1   
$EndComp
$Comp
L VCC #PWR01
U 1 1 57924829
P 5500 1250
F 0 "#PWR01" H 5500 1100 50  0001 C CNN
F 1 "VCC" H 5500 1390 50  0000 C CNN
F 2 "" H 5500 1250 50  0000 C CNN
F 3 "" H 5500 1250 50  0000 C CNN
	1    5500 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 1250 5500 2050
Connection ~ 5500 2050
$Comp
L VCC #PWR02
U 1 1 579248A4
P 1300 2350
F 0 "#PWR02" H 1300 2200 50  0001 C CNN
F 1 "VCC" H 1300 2490 50  0000 C CNN
F 2 "" H 1300 2350 50  0000 C CNN
F 3 "" H 1300 2350 50  0000 C CNN
	1    1300 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 4300 4400 4300
$Comp
L VCC #PWR03
U 1 1 5792499B
P 4300 4750
F 0 "#PWR03" H 4300 4600 50  0001 C CNN
F 1 "VCC" H 4300 4890 50  0000 C CNN
F 2 "" H 4300 4750 50  0000 C CNN
F 3 "" H 4300 4750 50  0000 C CNN
	1    4300 4750
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR04
U 1 1 57924A12
P 5400 4300
F 0 "#PWR04" H 5400 4050 50  0001 C CNN
F 1 "GND" H 5400 4150 50  0000 C CNN
F 2 "" H 5400 4300 50  0000 C CNN
F 3 "" H 5400 4300 50  0000 C CNN
	1    5400 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4900 4300 5400 4300
Wire Wire Line
	1400 4900 1300 4900
Wire Wire Line
	1300 4900 1300 5250
Wire Wire Line
	1400 5000 1300 5000
Connection ~ 1300 5000
$Comp
L GND #PWR05
U 1 1 57924B63
P 1300 5250
F 0 "#PWR05" H 1300 5000 50  0001 C CNN
F 1 "GND" H 1300 5100 50  0000 C CNN
F 2 "" H 1300 5250 50  0000 C CNN
F 3 "" H 1300 5250 50  0000 C CNN
	1    1300 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 2350 1300 3000
Wire Wire Line
	1200 2700 1400 2700
Wire Wire Line
	1300 3000 1400 3000
Connection ~ 1300 2700
$Comp
L Crystal_Small Y1
U 1 1 57924D26
P 4350 3500
F 0 "Y1" H 4350 3600 50  0000 C CNN
F 1 "16MHz" H 4350 3400 50  0000 C CNN
F 2 "Crystals:Crystal_HC49-U_Vertical" H 4350 3500 50  0001 C CNN
F 3 "" H 4350 3500 50  0000 C CNN
	1    4350 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3300 4650 3300
Wire Wire Line
	4650 3300 4650 3500
Wire Wire Line
	4000 3400 4000 3500
Wire Wire Line
	3300 3400 4000 3400
Wire Wire Line
	4000 3500 4250 3500
Wire Wire Line
	4650 3500 4450 3500
$Comp
L C_Small C5
U 1 1 579250BE
P 4100 3650
F 0 "C5" H 4110 3720 50  0000 L CNN
F 1 "22p" H 4110 3570 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4100 3650 50  0001 C CNN
F 3 "" H 4100 3650 50  0000 C CNN
	1    4100 3650
	1    0    0    -1  
$EndComp
$Comp
L C_Small C6
U 1 1 57925152
P 4600 3650
F 0 "C6" H 4610 3720 50  0000 L CNN
F 1 "22p" H 4610 3570 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4600 3650 50  0001 C CNN
F 3 "" H 4600 3650 50  0000 C CNN
	1    4600 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3500 4100 3550
Connection ~ 4100 3500
Wire Wire Line
	4600 3500 4600 3550
Connection ~ 4600 3500
Wire Wire Line
	4400 4600 4300 4600
Wire Wire Line
	4300 4400 4300 4750
Wire Wire Line
	4900 4600 5050 4600
Wire Wire Line
	5050 4600 5050 4100
Wire Wire Line
	5050 4100 4200 4100
Wire Wire Line
	3300 4400 4200 4400
$Comp
L GND #PWR06
U 1 1 579255BA
P 4350 3850
F 0 "#PWR06" H 4350 3600 50  0001 C CNN
F 1 "GND" H 4350 3700 50  0000 C CNN
F 2 "" H 4350 3850 50  0000 C CNN
F 3 "" H 4350 3850 50  0000 C CNN
	1    4350 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3750 4100 3800
Wire Wire Line
	4100 3800 4600 3800
Wire Wire Line
	4600 3800 4600 3750
Wire Wire Line
	4350 3850 4350 3800
Connection ~ 4350 3800
$Comp
L C_Small C2
U 1 1 57936A5D
P 1100 3300
F 0 "C2" H 1110 3370 50  0000 L CNN
F 1 "100n" H 1110 3220 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1100 3300 50  0001 C CNN
F 3 "" H 1100 3300 50  0000 C CNN
	1    1100 3300
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR07
U 1 1 57936B55
P 850 3300
F 0 "#PWR07" H 850 3050 50  0001 C CNN
F 1 "GND" H 850 3150 50  0000 C CNN
F 2 "" H 850 3300 50  0000 C CNN
F 3 "" H 850 3300 50  0000 C CNN
	1    850  3300
	0    1    1    0   
$EndComp
Wire Wire Line
	850  3300 1000 3300
Wire Wire Line
	1200 3300 1400 3300
$Comp
L C_Small C1
U 1 1 57936CA5
P 1100 2700
F 0 "C1" H 1110 2770 50  0000 L CNN
F 1 "100n" H 1110 2620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1100 2700 50  0001 C CNN
F 3 "" H 1100 2700 50  0000 C CNN
	1    1100 2700
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR08
U 1 1 57936D68
P 850 2700
F 0 "#PWR08" H 850 2450 50  0001 C CNN
F 1 "GND" H 850 2550 50  0000 C CNN
F 2 "" H 850 2700 50  0000 C CNN
F 3 "" H 850 2700 50  0000 C CNN
	1    850  2700
	0    1    1    0   
$EndComp
Wire Wire Line
	850  2700 1000 2700
$Comp
L CONN_02X03 P1
U 1 1 57936E02
P 3950 2000
F 0 "P1" H 3950 2200 50  0000 C CNN
F 1 "ICSP" H 3950 1800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03" H 3950 800 50  0001 C CNN
F 3 "" H 3950 800 50  0000 C CNN
	1    3950 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1900 3700 1900
Wire Wire Line
	3450 1900 3450 3100
Wire Wire Line
	3450 3100 3300 3100
Wire Wire Line
	3550 2000 3700 2000
Wire Wire Line
	3550 2000 3550 3200
Connection ~ 3550 3200
Wire Wire Line
	3300 4150 3900 4150
Wire Wire Line
	3650 2100 3700 2100
Wire Wire Line
	5300 2400 5300 2050
Wire Wire Line
	1300 2400 5300 2400
Connection ~ 1300 2400
Connection ~ 5300 2050
Wire Wire Line
	4200 1900 4500 1900
Wire Wire Line
	4500 1900 4500 2400
Connection ~ 4500 2400
Wire Wire Line
	4200 2000 4400 2000
Wire Wire Line
	4400 2000 4400 3000
Connection ~ 4400 3000
Wire Wire Line
	4200 2100 4300 2100
Wire Wire Line
	4300 2100 4300 2500
Wire Wire Line
	4300 2500 5400 2500
Wire Wire Line
	5400 2500 5400 2150
Connection ~ 5400 2150
$Comp
L VCC #PWR09
U 1 1 57937641
P 3900 3750
F 0 "#PWR09" H 3900 3600 50  0001 C CNN
F 1 "VCC" H 3900 3890 50  0000 C CNN
F 2 "" H 3900 3750 50  0000 C CNN
F 3 "" H 3900 3750 50  0000 C CNN
	1    3900 3750
	1    0    0    -1  
$EndComp
$Comp
L R_Small R4
U 1 1 57937668
P 3900 3950
F 0 "R4" H 3930 3970 50  0000 L CNN
F 1 "10k" H 3930 3910 50  0000 L CNN
F 2 "Resistors_ThroughHole:Resistor_Vertical_RM5mm" H 3900 3950 50  0001 C CNN
F 3 "" H 3900 3950 50  0000 C CNN
	1    3900 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3750 3900 3850
Wire Wire Line
	3900 4050 3900 4500
$Comp
L C_Small C4
U 1 1 57937892
P 3900 4600
F 0 "C4" H 3910 4670 50  0000 L CNN
F 1 "100n" H 3910 4520 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3900 4600 50  0001 C CNN
F 3 "" H 3900 4600 50  0000 C CNN
	1    3900 4600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 57937A1E
P 3900 4800
F 0 "#PWR010" H 3900 4550 50  0001 C CNN
F 1 "GND" H 3900 4650 50  0000 C CNN
F 2 "" H 3900 4800 50  0000 C CNN
F 3 "" H 3900 4800 50  0000 C CNN
	1    3900 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4700 3900 4800
$Comp
L R_Small R6
U 1 1 57937B17
P 5250 4400
F 0 "R6" H 5280 4420 50  0000 L CNN
F 1 "10k" H 5280 4360 50  0000 L CNN
F 2 "Resistors_ThroughHole:Resistor_Vertical_RM5mm" H 5250 4400 50  0001 C CNN
F 3 "" H 5250 4400 50  0000 C CNN
	1    5250 4400
	0    1    1    0   
$EndComp
$Comp
L R_Small R7
U 1 1 57937BBD
P 5250 4650
F 0 "R7" H 5280 4670 50  0000 L CNN
F 1 "10k" H 5280 4610 50  0000 L CNN
F 2 "Resistors_ThroughHole:Resistor_Vertical_RM5mm" H 5250 4650 50  0001 C CNN
F 3 "" H 5250 4650 50  0000 C CNN
	1    5250 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 4400 5150 4400
Wire Wire Line
	4900 4500 5000 4500
Wire Wire Line
	5000 4500 5000 4650
Wire Wire Line
	5000 4650 5150 4650
Wire Wire Line
	5350 4400 5450 4400
Wire Wire Line
	5450 4400 5450 4800
Wire Wire Line
	5350 4650 5450 4650
Connection ~ 5450 4650
$Comp
L VCC #PWR011
U 1 1 57937E72
P 5450 4800
F 0 "#PWR011" H 5450 4650 50  0001 C CNN
F 1 "VCC" H 5450 4940 50  0000 C CNN
F 2 "" H 5450 4800 50  0000 C CNN
F 3 "" H 5450 4800 50  0000 C CNN
	1    5450 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	4400 4400 4300 4400
Connection ~ 4300 4600
Wire Wire Line
	4400 4500 4150 4500
Wire Wire Line
	4150 4500 4150 5000
$Comp
L R_Small R5
U 1 1 57937FF3
P 4150 5100
F 0 "R5" H 4180 5120 50  0000 L CNN
F 1 "10k" H 4180 5060 50  0000 L CNN
F 2 "Resistors_ThroughHole:Resistor_Vertical_RM5mm" H 4150 5100 50  0001 C CNN
F 3 "" H 4150 5100 50  0000 C CNN
	1    4150 5100
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR012
U 1 1 5793807F
P 4150 5250
F 0 "#PWR012" H 4150 5100 50  0001 C CNN
F 1 "VCC" H 4150 5390 50  0000 C CNN
F 2 "" H 4150 5250 50  0000 C CNN
F 3 "" H 4150 5250 50  0000 C CNN
	1    4150 5250
	-1   0    0    1   
$EndComp
Wire Wire Line
	4150 5200 4150 5250
$Comp
L LM317T U1
U 1 1 579381F6
P 2300 1350
F 0 "U1" H 2100 1550 50  0000 C CNN
F 1 "LM317T" H 2300 1550 50  0000 L CNN
F 2 "Power_Integrations:TO-220" H 2300 1450 50  0000 C CIN
F 3 "" H 2300 1350 50  0000 C CNN
	1    2300 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1300 1900 1300
Wire Wire Line
	2700 1300 3550 1300
$Comp
L VCC #PWR013
U 1 1 579385FD
P 3550 1300
F 0 "#PWR013" H 3550 1150 50  0001 C CNN
F 1 "VCC" H 3550 1440 50  0000 C CNN
F 2 "" H 3550 1300 50  0000 C CNN
F 3 "" H 3550 1300 50  0000 C CNN
	1    3550 1300
	0    1    1    0   
$EndComp
$Comp
L GND #PWR014
U 1 1 57938641
P 2750 2050
F 0 "#PWR014" H 2750 1800 50  0001 C CNN
F 1 "GND" H 2750 1900 50  0000 C CNN
F 2 "" H 2750 2050 50  0000 C CNN
F 3 "" H 2750 2050 50  0000 C CNN
	1    2750 2050
	1    0    0    -1  
$EndComp
$Comp
L R_Small R2
U 1 1 5793871C
P 2750 1500
F 0 "R2" H 2780 1520 50  0000 L CNN
F 1 "220" H 2780 1460 50  0000 L CNN
F 2 "Resistors_ThroughHole:Resistor_Vertical_RM5mm" H 2750 1500 50  0001 C CNN
F 3 "" H 2750 1500 50  0000 C CNN
	1    2750 1500
	1    0    0    -1  
$EndComp
$Comp
L R_Small R1
U 1 1 57938960
P 2650 1850
F 0 "R1" H 2680 1870 50  0000 L CNN
F 1 "680" H 2680 1810 50  0000 L CNN
F 2 "Resistors_ThroughHole:Resistor_Vertical_RM5mm" H 2650 1850 50  0001 C CNN
F 3 "" H 2650 1850 50  0000 C CNN
	1    2650 1850
	-1   0    0    1   
$EndComp
$Comp
L R_Small R3
U 1 1 579389C5
P 2850 1850
F 0 "R3" H 2880 1870 50  0000 L CNN
F 1 "820" H 2880 1810 50  0000 L CNN
F 2 "Resistors_ThroughHole:Resistor_Vertical_RM5mm" H 2850 1850 50  0001 C CNN
F 3 "" H 2850 1850 50  0000 C CNN
	1    2850 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1600 2750 1700
Wire Wire Line
	2650 1700 2850 1700
Wire Wire Line
	2650 1700 2650 1750
Wire Wire Line
	2850 1700 2850 1750
Connection ~ 2750 1700
Wire Wire Line
	2750 1650 2300 1650
Wire Wire Line
	2300 1650 2300 1600
Connection ~ 2750 1650
Wire Wire Line
	2650 1950 2650 2000
Wire Wire Line
	2650 2000 2850 2000
Wire Wire Line
	2850 2000 2850 1950
Wire Wire Line
	2750 2000 2750 2050
Connection ~ 2750 2000
Wire Wire Line
	2750 1400 2750 1300
Connection ~ 2750 1300
$Comp
L CP1_Small C3
U 1 1 579391B8
P 3300 1500
F 0 "C3" H 3310 1570 50  0000 L CNN
F 1 "47u" H 3310 1420 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2" H 3300 1500 50  0001 C CNN
F 3 "" H 3300 1500 50  0000 C CNN
	1    3300 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1300 3300 1400
Connection ~ 3300 1300
$Comp
L GND #PWR015
U 1 1 57939331
P 3300 1700
F 0 "#PWR015" H 3300 1450 50  0001 C CNN
F 1 "GND" H 3300 1550 50  0000 C CNN
F 2 "" H 3300 1700 50  0000 C CNN
F 3 "" H 3300 1700 50  0000 C CNN
	1    3300 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1600 3300 1700
Wire Wire Line
	4200 4400 4200 4100
Connection ~ 3900 4150
Connection ~ 3650 4150
$Comp
L +12V #PWR016
U 1 1 5793AF56
P 1750 1300
F 0 "#PWR016" H 1750 1150 50  0001 C CNN
F 1 "+12V" H 1750 1440 50  0000 C CNN
F 2 "" H 1750 1300 50  0000 C CNN
F 3 "" H 1750 1300 50  0000 C CNN
	1    1750 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8000 1650 8000 3850
Wire Wire Line
	8000 3850 7700 3850
Connection ~ 8000 1650
Wire Wire Line
	8100 1550 8100 3950
Wire Wire Line
	8100 3950 7700 3950
Connection ~ 8100 1550
$Comp
L PWR_FLAG #FLG017
U 1 1 57938A71
P 10000 1350
F 0 "#FLG017" H 10000 1445 50  0001 C CNN
F 1 "PWR_FLAG" H 10000 1530 50  0000 C CNN
F 2 "" H 10000 1350 50  0000 C CNN
F 3 "" H 10000 1350 50  0000 C CNN
	1    10000 1350
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG018
U 1 1 5793900F
P 900 3200
F 0 "#FLG018" H 900 3295 50  0001 C CNN
F 1 "PWR_FLAG" H 900 3380 50  0000 C CNN
F 2 "" H 900 3200 50  0000 C CNN
F 3 "" H 900 3200 50  0000 C CNN
	1    900  3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  3200 900  3300
Connection ~ 900  3300
NoConn ~ 3300 2700
NoConn ~ 3300 2800
NoConn ~ 3300 3950
NoConn ~ 3300 4050
NoConn ~ 3300 4700
NoConn ~ 3300 4800
NoConn ~ 3300 4900
NoConn ~ 3300 5000
Wire Wire Line
	5550 2150 5550 2300
Connection ~ 5550 2150
$Comp
L GND #PWR019
U 1 1 579395FA
P 5550 2300
F 0 "#PWR019" H 5550 2050 50  0001 C CNN
F 1 "GND" H 5550 2150 50  0000 C CNN
F 2 "" H 5550 2300 50  0000 C CNN
F 3 "" H 5550 2300 50  0000 C CNN
	1    5550 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2900 5000 2900
Wire Wire Line
	5000 2900 5000 1950
Connection ~ 5000 1950
$Comp
L R_Small R11
U 1 1 57955FC6
P 9250 3650
F 0 "R11" H 9280 3670 50  0000 L CNN
F 1 "10k" H 9280 3610 50  0000 L CNN
F 2 "Resistors_ThroughHole:Resistor_Vertical_RM5mm" H 9250 3650 50  0001 C CNN
F 3 "" H 9250 3650 50  0000 C CNN
	1    9250 3650
	1    0    0    -1  
$EndComp
$Comp
L R_Small R9
U 1 1 579560DE
P 8700 4200
F 0 "R9" H 8730 4220 50  0000 L CNN
F 1 "4.7k" H 8730 4160 50  0000 L CNN
F 2 "Resistors_ThroughHole:Resistor_Vertical_RM5mm" H 8700 4200 50  0001 C CNN
F 3 "" H 8700 4200 50  0000 C CNN
	1    8700 4200
	0    -1   -1   0   
$EndComp
$Comp
L +12V #PWR020
U 1 1 5795622D
P 10100 3300
F 0 "#PWR020" H 10100 3150 50  0001 C CNN
F 1 "+12V" H 10100 3440 50  0000 C CNN
F 2 "" H 10100 3300 50  0000 C CNN
F 3 "" H 10100 3300 50  0000 C CNN
	1    10100 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 3300 10100 3500
Wire Wire Line
	10100 3350 9250 3350
Wire Wire Line
	9250 3350 9250 3550
Connection ~ 10100 3350
Wire Wire Line
	9250 3750 9250 4000
Wire Wire Line
	9250 3900 9700 3900
Wire Wire Line
	9700 3900 9700 3700
Wire Wire Line
	9700 3700 9800 3700
Connection ~ 9250 3900
$Comp
L GND #PWR021
U 1 1 579568AE
P 9250 4550
F 0 "#PWR021" H 9250 4300 50  0001 C CNN
F 1 "GND" H 9250 4400 50  0000 C CNN
F 2 "" H 9250 4550 50  0000 C CNN
F 3 "" H 9250 4550 50  0000 C CNN
	1    9250 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4400 9250 4550
Wire Wire Line
	8800 4200 8950 4200
Wire Wire Line
	8600 4200 8500 4200
Text GLabel 8500 4200 0    60   Input ~ 0
EN_RED
Text GLabel 10100 4100 3    60   Input ~ 0
PWR_RED
$Comp
L R_Small R12
U 1 1 57957938
P 9250 5400
F 0 "R12" H 9280 5420 50  0000 L CNN
F 1 "10k" H 9280 5360 50  0000 L CNN
F 2 "Resistors_ThroughHole:Resistor_Vertical_RM5mm" H 9250 5400 50  0001 C CNN
F 3 "" H 9250 5400 50  0000 C CNN
	1    9250 5400
	1    0    0    -1  
$EndComp
$Comp
L R_Small R10
U 1 1 57957944
P 8700 5950
F 0 "R10" H 8730 5970 50  0000 L CNN
F 1 "4.7k" H 8730 5910 50  0000 L CNN
F 2 "Resistors_ThroughHole:Resistor_Vertical_RM5mm" H 8700 5950 50  0001 C CNN
F 3 "" H 8700 5950 50  0000 C CNN
	1    8700 5950
	0    -1   -1   0   
$EndComp
$Comp
L +12V #PWR022
U 1 1 5795794A
P 10100 5050
F 0 "#PWR022" H 10100 4900 50  0001 C CNN
F 1 "+12V" H 10100 5190 50  0000 C CNN
F 2 "" H 10100 5050 50  0000 C CNN
F 3 "" H 10100 5050 50  0000 C CNN
	1    10100 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 5050 10100 5250
Wire Wire Line
	10100 5100 9250 5100
Wire Wire Line
	9250 5100 9250 5300
Connection ~ 10100 5100
Wire Wire Line
	9250 5500 9250 5750
Wire Wire Line
	9250 5650 9700 5650
Wire Wire Line
	9700 5650 9700 5450
Wire Wire Line
	9700 5450 9800 5450
Connection ~ 9250 5650
$Comp
L GND #PWR023
U 1 1 5795795B
P 9250 6300
F 0 "#PWR023" H 9250 6050 50  0001 C CNN
F 1 "GND" H 9250 6150 50  0000 C CNN
F 2 "" H 9250 6300 50  0000 C CNN
F 3 "" H 9250 6300 50  0000 C CNN
	1    9250 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 6150 9250 6300
Wire Wire Line
	8800 5950 8950 5950
Wire Wire Line
	8600 5950 8500 5950
Text GLabel 8500 5950 0    60   Input ~ 0
EN_GREEN
Text GLabel 10100 5850 3    60   Input ~ 0
PWR_GREEN
Wire Wire Line
	3650 4150 3650 2100
NoConn ~ 3300 3550
NoConn ~ 3300 3650
NoConn ~ 3300 3750
NoConn ~ 3300 3850
Text GLabel 3600 5150 3    60   Input ~ 0
EN_RED
Text GLabel 3450 5150 3    60   Input ~ 0
EN_GREEN
Wire Wire Line
	3300 4500 3600 4500
Wire Wire Line
	3600 4500 3600 5150
Wire Wire Line
	3300 4600 3450 4600
Wire Wire Line
	3450 4600 3450 5150
Text GLabel 6250 1050 2    60   Input ~ 0
PWR_RED
Text GLabel 7000 1050 2    60   Input ~ 0
PWR_GREEN
Wire Wire Line
	6250 1050 6050 1050
Wire Wire Line
	6050 1050 6050 1650
Connection ~ 6050 1650
Wire Wire Line
	7000 1050 6800 1050
Wire Wire Line
	6800 1050 6800 1550
Connection ~ 6800 1550
$Comp
L Q_NPN_CBE Q1
U 1 1 5795FE3E
P 9150 4200
F 0 "Q1" H 9450 4250 50  0000 R CNN
F 1 "Q_NPN_CBE" H 9750 4150 50  0000 R CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 9350 4300 50  0001 C CNN
F 3 "" H 9150 4200 50  0000 C CNN
	1    9150 4200
	1    0    0    -1  
$EndComp
$Comp
L Q_NPN_CBE Q2
U 1 1 5795FEEF
P 9150 5950
F 0 "Q2" H 9450 6000 50  0000 R CNN
F 1 "Q_NPN_CBE" H 9750 5900 50  0000 R CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 9350 6050 50  0001 C CNN
F 3 "" H 9150 5950 50  0000 C CNN
	1    9150 5950
	1    0    0    -1  
$EndComp
$Comp
L Q_PMOS_GDS Q3
U 1 1 579603F2
P 10000 3700
F 0 "Q3" H 10300 3750 50  0000 R CNN
F 1 "Q_PMOS_GDS" H 10650 3650 50  0000 R CNN
F 2 "TO_SOT_Packages_THT:TO-220_Neutral123_Vertical" H 10200 3800 50  0001 C CNN
F 3 "" H 10000 3700 50  0000 C CNN
	1    10000 3700
	1    0    0    1   
$EndComp
$Comp
L Q_PMOS_GDS Q4
U 1 1 57960529
P 10000 5450
F 0 "Q4" H 10300 5500 50  0000 R CNN
F 1 "Q_PMOS_GDS" H 10650 5400 50  0000 R CNN
F 2 "TO_SOT_Packages_THT:TO-220_Neutral123_Vertical" H 10200 5550 50  0001 C CNN
F 3 "" H 10000 5450 50  0000 C CNN
	1    10000 5450
	1    0    0    1   
$EndComp
Wire Wire Line
	10100 3900 10100 4100
Wire Wire Line
	10100 5650 10100 5850
$Comp
L CONN_01X02 P5
U 1 1 57961761
P 10300 1500
F 0 "P5" H 10300 1650 50  0000 C CNN
F 1 "DC" V 10400 1500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 10300 1500 50  0001 C CNN
F 3 "" H 10300 1500 50  0000 C CNN
	1    10300 1500
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR024
U 1 1 57961914
P 9900 1450
F 0 "#PWR024" H 9900 1300 50  0001 C CNN
F 1 "+12V" H 9900 1590 50  0000 C CNN
F 2 "" H 9900 1450 50  0000 C CNN
F 3 "" H 9900 1450 50  0000 C CNN
	1    9900 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10100 1450 9900 1450
Wire Wire Line
	10000 1350 10000 1450
Connection ~ 10000 1450
$Comp
L GND #PWR025
U 1 1 57961C93
P 10000 1650
F 0 "#PWR025" H 10000 1400 50  0001 C CNN
F 1 "GND" H 10000 1500 50  0000 C CNN
F 2 "" H 10000 1650 50  0000 C CNN
F 3 "" H 10000 1650 50  0000 C CNN
	1    10000 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 1550 10000 1550
Wire Wire Line
	10000 1550 10000 1650
$EndSCHEMATC
