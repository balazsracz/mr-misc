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
LIBS:conn-prime
LIBS:ledmatrix-cache
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
L 74HC595 U2
U 1 1 57CDB699
P 3100 3750
F 0 "U2" H 3250 4350 50  0000 C CNN
F 1 "74HC595" H 3100 3150 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 3100 3750 50  0001 C CNN
F 3 "" H 3100 3750 50  0000 C CNN
	1    3100 3750
	1    0    0    -1  
$EndComp
$Comp
L 74HC595 U1
U 1 1 57CDBDB7
P 3100 1850
F 0 "U1" H 3250 2450 50  0000 C CNN
F 1 "74HC595" H 3100 1250 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 3100 1850 50  0001 C CNN
F 3 "" H 3100 1850 50  0000 C CNN
	1    3100 1850
	1    0    0    -1  
$EndComp
$Comp
L 74HC595 U3
U 1 1 57CDBE44
P 3100 5500
F 0 "U3" H 3250 6100 50  0000 C CNN
F 1 "74HC595" H 3100 4900 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 3100 5500 50  0001 C CNN
F 3 "" H 3100 5500 50  0000 C CNN
	1    3100 5500
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X05 P1
U 1 1 57CDD0FA
P 1400 750
F 0 "P1" H 1400 1050 50  0000 C CNN
F 1 "CONN_01X05" V 1500 750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05" H 1400 750 50  0001 C CNN
F 3 "" H 1400 750 50  0000 C CNN
	1    1400 750 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3800 2300 3900 2300
Wire Wire Line
	3900 2300 3900 2750
Wire Wire Line
	3900 2750 2200 2750
Wire Wire Line
	2200 2750 2200 3300
Wire Wire Line
	2200 3300 2400 3300
Wire Wire Line
	3800 4200 3900 4200
Wire Wire Line
	3900 4200 3900 4600
Wire Wire Line
	3900 4600 2250 4600
Wire Wire Line
	2250 4600 2250 5050
Wire Wire Line
	2250 5050 2400 5050
Wire Wire Line
	1400 1600 2400 1600
Wire Wire Line
	1400 5250 2400 5250
Wire Wire Line
	2800 2400 2800 2550
Wire Wire Line
	2800 2550 1600 2550
Wire Wire Line
	1600 950  1600 6750
Wire Wire Line
	2800 1150 2800 1300
Wire Wire Line
	1500 1150 2800 1150
Wire Wire Line
	1500 950  1500 6750
Wire Wire Line
	2800 3050 2800 3200
Wire Wire Line
	1500 3050 2800 3050
Connection ~ 1500 1150
Wire Wire Line
	2800 4300 2800 4450
Wire Wire Line
	2800 4450 1600 4450
Connection ~ 1600 2550
Wire Wire Line
	2800 6050 2800 6200
Wire Wire Line
	2800 6200 1600 6200
Connection ~ 1600 4450
Wire Wire Line
	2800 4800 2800 4950
Wire Wire Line
	1500 4800 2800 4800
Connection ~ 1500 3050
Wire Wire Line
	1400 950  1400 6750
Connection ~ 1950 1600
Wire Wire Line
	2400 1900 1300 1900
Wire Wire Line
	1300 950  1300 6750
Wire Wire Line
	1300 3800 2400 3800
Connection ~ 1300 1900
Wire Wire Line
	1300 5550 2400 5550
Connection ~ 1300 3800
Wire Wire Line
	2400 1400 1200 1400
Wire Wire Line
	1200 1400 1200 950 
$Comp
L BSS138 Q1
U 1 1 57CDE0D7
P 4150 1350
F 0 "Q1" H 4350 1425 50  0000 L CNN
F 1 "BSS138" H 4350 1350 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4350 1250 50  0000 L CIN
F 3 "" H 4150 1350 50  0000 L CNN
	1    4150 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 57CDE2FE
P 4050 2200
F 0 "#PWR01" H 4050 1950 50  0001 C CNN
F 1 "GND" H 4050 2050 50  0000 C CNN
F 2 "" H 4050 2200 50  0000 C CNN
F 3 "" H 4050 2200 50  0000 C CNN
	1    4050 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 57CDE31C
P 2800 2550
F 0 "#PWR02" H 2800 2300 50  0001 C CNN
F 1 "GND" H 2800 2400 50  0000 C CNN
F 2 "" H 2800 2550 50  0000 C CNN
F 3 "" H 2800 2550 50  0000 C CNN
	1    2800 2550
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 57CDE33A
P 6650 1400
F 0 "D1" H 6650 1500 50  0000 C CNN
F 1 "LED" H 6650 1300 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 1400 50  0001 C CNN
F 3 "" H 6650 1400 50  0000 C CNN
	1    6650 1400
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 57CDE41B
P 6200 1400
F 0 "R1" V 6280 1400 50  0000 C CNN
F 1 "R" V 6200 1400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 1400 50  0001 C CNN
F 3 "" H 6200 1400 50  0000 C CNN
	1    6200 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 1150 5150 1150
$Comp
L +5V #PWR03
U 1 1 57CDE5C8
P 7250 1400
F 0 "#PWR03" H 7250 1250 50  0001 C CNN
F 1 "+5V" H 7250 1540 50  0000 C CNN
F 2 "" H 7250 1400 50  0000 C CNN
F 3 "" H 7250 1400 50  0000 C CNN
	1    7250 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 1150 5150 1400
Wire Wire Line
	5150 1400 6050 1400
Wire Wire Line
	6350 1400 6450 1400
Wire Wire Line
	4050 2200 4050 1550
Wire Wire Line
	4050 1550 4250 1550
$Comp
L LED D2
U 1 1 57CDEF9D
P 6650 1500
F 0 "D2" H 6650 1600 50  0000 C CNN
F 1 "LED" H 6650 1400 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 1500 50  0001 C CNN
F 3 "" H 6650 1500 50  0000 C CNN
	1    6650 1500
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 57CDEFA4
P 6200 1500
F 0 "R2" V 6280 1500 50  0000 C CNN
F 1 "R" V 6200 1500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 1500 50  0001 C CNN
F 3 "" H 6200 1500 50  0000 C CNN
	1    6200 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 1500 6050 1500
Wire Wire Line
	6350 1500 6450 1500
$Comp
L LED D3
U 1 1 57CDF0AE
P 6650 1600
F 0 "D3" H 6650 1700 50  0000 C CNN
F 1 "LED" H 6650 1500 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 1600 50  0001 C CNN
F 3 "" H 6650 1600 50  0000 C CNN
	1    6650 1600
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 57CDF0B5
P 6200 1600
F 0 "R3" V 6280 1600 50  0000 C CNN
F 1 "R" V 6200 1600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 1600 50  0001 C CNN
F 3 "" H 6200 1600 50  0000 C CNN
	1    6200 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 1600 6050 1600
Wire Wire Line
	6350 1600 6450 1600
$Comp
L LED D4
U 1 1 57CDF195
P 6650 1700
F 0 "D4" H 6650 1800 50  0000 C CNN
F 1 "LED" H 6650 1600 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 1700 50  0001 C CNN
F 3 "" H 6650 1700 50  0000 C CNN
	1    6650 1700
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 57CDF19C
P 6200 1700
F 0 "R4" V 6280 1700 50  0000 C CNN
F 1 "R" V 6200 1700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 1700 50  0001 C CNN
F 3 "" H 6200 1700 50  0000 C CNN
	1    6200 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	5550 1700 6050 1700
Wire Wire Line
	6350 1700 6450 1700
$Comp
L LED D5
U 1 1 57CDF27A
P 6650 1800
F 0 "D5" H 6650 1900 50  0000 C CNN
F 1 "LED" H 6650 1700 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 1800 50  0001 C CNN
F 3 "" H 6650 1800 50  0000 C CNN
	1    6650 1800
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 57CDF281
P 6200 1800
F 0 "R5" V 6280 1800 50  0000 C CNN
F 1 "R" V 6200 1800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 1800 50  0001 C CNN
F 3 "" H 6200 1800 50  0000 C CNN
	1    6200 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 1800 6050 1800
Wire Wire Line
	6350 1800 6450 1800
$Comp
L LED D6
U 1 1 57CDF395
P 6650 1900
F 0 "D6" H 6650 2000 50  0000 C CNN
F 1 "LED" H 6650 1800 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 1900 50  0001 C CNN
F 3 "" H 6650 1900 50  0000 C CNN
	1    6650 1900
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 57CDF39C
P 6200 1900
F 0 "R6" V 6280 1900 50  0000 C CNN
F 1 "R" V 6200 1900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 1900 50  0001 C CNN
F 3 "" H 6200 1900 50  0000 C CNN
	1    6200 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 1900 6050 1900
Wire Wire Line
	6350 1900 6450 1900
$Comp
L LED D7
U 1 1 57CDF46E
P 6650 2000
F 0 "D7" H 6650 2100 50  0000 C CNN
F 1 "LED" H 6650 1900 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 2000 50  0001 C CNN
F 3 "" H 6650 2000 50  0000 C CNN
	1    6650 2000
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 57CDF475
P 6200 2000
F 0 "R7" V 6280 2000 50  0000 C CNN
F 1 "R" V 6200 2000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 2000 50  0001 C CNN
F 3 "" H 6200 2000 50  0000 C CNN
	1    6200 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 2000 6050 2000
Wire Wire Line
	6350 2000 6450 2000
$Comp
L LED D8
U 1 1 57CDF5A9
P 6650 2100
F 0 "D8" H 6650 2200 50  0000 C CNN
F 1 "LED" H 6650 2000 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 2100 50  0001 C CNN
F 3 "" H 6650 2100 50  0000 C CNN
	1    6650 2100
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 57CDF5B0
P 6200 2100
F 0 "R8" V 6280 2100 50  0000 C CNN
F 1 "R" V 6200 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 2100 50  0001 C CNN
F 3 "" H 6200 2100 50  0000 C CNN
	1    6200 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 2100 6050 2100
Wire Wire Line
	6350 2100 6450 2100
$Comp
L BSS138 Q2
U 1 1 57D071EC
P 4550 1450
F 0 "Q2" H 4750 1525 50  0000 L CNN
F 1 "BSS138" H 4750 1450 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4750 1350 50  0000 L CIN
F 3 "" H 4550 1450 50  0000 L CNN
	1    4550 1450
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q3
U 1 1 57D0728E
P 4950 1550
F 0 "Q3" H 5150 1625 50  0000 L CNN
F 1 "BSS138" H 5150 1550 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 5150 1450 50  0000 L CIN
F 3 "" H 4950 1550 50  0000 L CNN
	1    4950 1550
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q4
U 1 1 57D072F5
P 5350 1650
F 0 "Q4" H 5550 1725 50  0000 L CNN
F 1 "BSS138" H 5550 1650 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 5550 1550 50  0000 L CIN
F 3 "" H 5350 1650 50  0000 L CNN
	1    5350 1650
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q5
U 1 1 57D07361
P 4200 1750
F 0 "Q5" H 4400 1825 50  0000 L CNN
F 1 "BSS138" H 4400 1750 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4400 1650 50  0000 L CIN
F 3 "" H 4200 1750 50  0000 L CNN
	1    4200 1750
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q6
U 1 1 57D073EA
P 4600 1850
F 0 "Q6" H 4800 1925 50  0000 L CNN
F 1 "BSS138" H 4800 1850 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4800 1750 50  0000 L CIN
F 3 "" H 4600 1850 50  0000 L CNN
	1    4600 1850
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q7
U 1 1 57D07458
P 5000 1950
F 0 "Q7" H 5200 2025 50  0000 L CNN
F 1 "BSS138" H 5200 1950 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 5200 1850 50  0000 L CIN
F 3 "" H 5000 1950 50  0000 L CNN
	1    5000 1950
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q8
U 1 1 57D074C9
P 5400 2050
F 0 "Q8" H 5600 2125 50  0000 L CNN
F 1 "BSS138" H 5600 2050 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 5600 1950 50  0000 L CIN
F 3 "" H 5400 2050 50  0000 L CNN
	1    5400 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 1550 4250 1600
Wire Wire Line
	4250 1600 4550 1600
Wire Wire Line
	4550 1600 4550 1650
Wire Wire Line
	4550 1650 4650 1650
Wire Wire Line
	4650 1650 4650 1700
Wire Wire Line
	4650 1700 5000 1700
Wire Wire Line
	5000 1700 5000 1750
Wire Wire Line
	5000 1750 5050 1750
Wire Wire Line
	5050 1750 5050 1800
Wire Wire Line
	5050 1800 5400 1800
Wire Wire Line
	5400 1800 5400 1850
Wire Wire Line
	5400 1850 5450 1850
Wire Wire Line
	4650 1250 4750 1250
Wire Wire Line
	4750 1250 4750 1500
Wire Wire Line
	5050 1350 5100 1350
Wire Wire Line
	5100 1350 5100 1450
Wire Wire Line
	5100 1450 5150 1450
Wire Wire Line
	5150 1450 5150 1600
Wire Wire Line
	5450 1450 5550 1450
Wire Wire Line
	5550 1450 5550 1700
Wire Wire Line
	4350 1500 3800 1500
Wire Wire Line
	3800 1600 4750 1600
Wire Wire Line
	3800 1700 5150 1700
Wire Wire Line
	3800 1800 4000 1800
Wire Wire Line
	3800 1900 4400 1900
Wire Wire Line
	3800 2000 4800 2000
Wire Wire Line
	3800 2100 5200 2100
Wire Wire Line
	4300 1550 4400 1550
Wire Wire Line
	4400 1550 4400 1800
Wire Wire Line
	4700 1650 4800 1650
Wire Wire Line
	4800 1650 4800 1900
Wire Wire Line
	5100 1750 5200 1750
Wire Wire Line
	5200 1750 5200 2000
Wire Wire Line
	5500 1850 5600 1850
Wire Wire Line
	5600 1850 5600 2100
Wire Wire Line
	4150 2250 5500 2250
Wire Wire Line
	5100 2250 5100 2150
Wire Wire Line
	4700 2250 4700 2050
Connection ~ 5100 2250
Wire Wire Line
	4300 2250 4300 1950
Connection ~ 4700 2250
Wire Wire Line
	4150 2250 4150 2200
Connection ~ 4300 2250
Wire Wire Line
	6850 1400 6850 2100
Connection ~ 6850 2000
Connection ~ 6850 1900
Connection ~ 6850 1800
Connection ~ 6850 1700
Connection ~ 6850 1600
Connection ~ 6850 1500
Wire Wire Line
	6850 1400 7250 1400
Wire Wire Line
	4150 2200 4050 2200
Connection ~ 4050 2200
$Comp
L GND #PWR04
U 1 1 57D0B3B9
P 2400 2000
F 0 "#PWR04" H 2400 1750 50  0001 C CNN
F 1 "GND" H 2400 1850 50  0000 C CNN
F 2 "" H 2400 2000 50  0000 C CNN
F 3 "" H 2400 2000 50  0000 C CNN
	1    2400 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1150 2300 1700
Wire Wire Line
	2300 1700 2400 1700
Connection ~ 2300 1150
Wire Wire Line
	2300 3050 2300 3600
Wire Wire Line
	2300 3600 2400 3600
Connection ~ 2300 3050
Wire Wire Line
	2300 4800 2300 5350
Wire Wire Line
	2300 5350 2400 5350
Connection ~ 2300 4800
$Comp
L GND #PWR05
U 1 1 57D0C079
P 2400 3900
F 0 "#PWR05" H 2400 3650 50  0001 C CNN
F 1 "GND" H 2400 3750 50  0000 C CNN
F 2 "" H 2400 3900 50  0000 C CNN
F 3 "" H 2400 3900 50  0000 C CNN
	1    2400 3900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 57D0C0D8
P 2400 5650
F 0 "#PWR06" H 2400 5400 50  0001 C CNN
F 1 "GND" H 2400 5500 50  0000 C CNN
F 2 "" H 2400 5650 50  0000 C CNN
F 3 "" H 2400 5650 50  0000 C CNN
	1    2400 5650
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q17
U 1 1 57D0EB1E
P 4150 5000
F 0 "Q17" H 4350 5075 50  0000 L CNN
F 1 "BSS138" H 4350 5000 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4350 4900 50  0000 L CIN
F 3 "" H 4150 5000 50  0000 L CNN
	1    4150 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5050 3800 5050
$Comp
L LED D17
U 1 1 57D0EB2B
P 6650 5050
F 0 "D17" H 6650 5150 50  0000 C CNN
F 1 "LED" H 6650 4950 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 5050 50  0001 C CNN
F 3 "" H 6650 5050 50  0000 C CNN
	1    6650 5050
	1    0    0    -1  
$EndComp
$Comp
L R R17
U 1 1 57D0EB31
P 6200 5050
F 0 "R17" V 6280 5050 50  0000 C CNN
F 1 "R" V 6200 5050 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 5050 50  0001 C CNN
F 3 "" H 6200 5050 50  0000 C CNN
	1    6200 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 4800 5150 4800
$Comp
L +5V #PWR07
U 1 1 57D0EB38
P 7250 5050
F 0 "#PWR07" H 7250 4900 50  0001 C CNN
F 1 "+5V" H 7250 5190 50  0000 C CNN
F 2 "" H 7250 5050 50  0000 C CNN
F 3 "" H 7250 5050 50  0000 C CNN
	1    7250 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 4800 5150 5050
Wire Wire Line
	5150 5050 6050 5050
Wire Wire Line
	6350 5050 6450 5050
Wire Wire Line
	4050 5850 4050 5200
Wire Wire Line
	4050 5200 4250 5200
$Comp
L LED D18
U 1 1 57D0EB43
P 6650 5150
F 0 "D18" H 6650 5250 50  0000 C CNN
F 1 "LED" H 6650 5050 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 5150 50  0001 C CNN
F 3 "" H 6650 5150 50  0000 C CNN
	1    6650 5150
	1    0    0    -1  
$EndComp
$Comp
L R R18
U 1 1 57D0EB49
P 6200 5150
F 0 "R18" V 6280 5150 50  0000 C CNN
F 1 "R" V 6200 5150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 5150 50  0001 C CNN
F 3 "" H 6200 5150 50  0000 C CNN
	1    6200 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 5150 6050 5150
Wire Wire Line
	6350 5150 6450 5150
$Comp
L LED D19
U 1 1 57D0EB51
P 6650 5250
F 0 "D19" H 6650 5350 50  0000 C CNN
F 1 "LED" H 6650 5150 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 5250 50  0001 C CNN
F 3 "" H 6650 5250 50  0000 C CNN
	1    6650 5250
	1    0    0    -1  
$EndComp
$Comp
L R R19
U 1 1 57D0EB57
P 6200 5250
F 0 "R19" V 6280 5250 50  0000 C CNN
F 1 "R" V 6200 5250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 5250 50  0001 C CNN
F 3 "" H 6200 5250 50  0000 C CNN
	1    6200 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 5250 6050 5250
Wire Wire Line
	6350 5250 6450 5250
$Comp
L LED D20
U 1 1 57D0EB5F
P 6650 5350
F 0 "D20" H 6650 5450 50  0000 C CNN
F 1 "LED" H 6650 5250 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 5350 50  0001 C CNN
F 3 "" H 6650 5350 50  0000 C CNN
	1    6650 5350
	1    0    0    -1  
$EndComp
$Comp
L R R20
U 1 1 57D0EB65
P 6200 5350
F 0 "R20" V 6280 5350 50  0000 C CNN
F 1 "R" V 6200 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 5350 50  0001 C CNN
F 3 "" H 6200 5350 50  0000 C CNN
	1    6200 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	5550 5350 6050 5350
Wire Wire Line
	6350 5350 6450 5350
$Comp
L BSS138 Q18
U 1 1 57D0EBA5
P 4550 5100
F 0 "Q18" H 4750 5175 50  0000 L CNN
F 1 "BSS138" H 4750 5100 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4750 5000 50  0000 L CIN
F 3 "" H 4550 5100 50  0000 L CNN
	1    4550 5100
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q19
U 1 1 57D0EBAB
P 4950 5200
F 0 "Q19" H 5150 5275 50  0000 L CNN
F 1 "BSS138" H 5150 5200 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 5150 5100 50  0000 L CIN
F 3 "" H 4950 5200 50  0000 L CNN
	1    4950 5200
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q20
U 1 1 57D0EBB1
P 5350 5300
F 0 "Q20" H 5550 5375 50  0000 L CNN
F 1 "BSS138" H 5550 5300 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 5550 5200 50  0000 L CIN
F 3 "" H 5350 5300 50  0000 L CNN
	1    5350 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5400 5050 5500
Wire Wire Line
	4650 4900 4750 4900
Wire Wire Line
	4750 4900 4750 5150
Wire Wire Line
	5050 5000 5100 5000
Wire Wire Line
	5100 5000 5100 5100
Wire Wire Line
	5100 5100 5150 5100
Wire Wire Line
	5150 5100 5150 5250
Wire Wire Line
	5450 5100 5550 5100
Wire Wire Line
	5550 5100 5550 5350
Wire Wire Line
	4350 5150 3800 5150
Wire Wire Line
	3800 5250 4750 5250
Wire Wire Line
	3800 5350 5150 5350
Connection ~ 6850 5250
Connection ~ 6850 5150
Wire Wire Line
	6850 5050 7250 5050
Wire Wire Line
	3950 1400 3800 1400
$Comp
L BSS138 Q9
U 1 1 57D103CA
P 4150 3250
F 0 "Q9" H 4350 3325 50  0000 L CNN
F 1 "BSS138" H 4350 3250 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4350 3150 50  0000 L CIN
F 3 "" H 4150 3250 50  0000 L CNN
	1    4150 3250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 57D103D0
P 4050 4100
F 0 "#PWR08" H 4050 3850 50  0001 C CNN
F 1 "GND" H 4050 3950 50  0000 C CNN
F 2 "" H 4050 4100 50  0000 C CNN
F 3 "" H 4050 4100 50  0000 C CNN
	1    4050 4100
	1    0    0    -1  
$EndComp
$Comp
L LED D9
U 1 1 57D103D6
P 6650 3300
F 0 "D9" H 6650 3400 50  0000 C CNN
F 1 "LED" H 6650 3200 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 3300 50  0001 C CNN
F 3 "" H 6650 3300 50  0000 C CNN
	1    6650 3300
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 57D103DC
P 6200 3300
F 0 "R9" V 6280 3300 50  0000 C CNN
F 1 "R" V 6200 3300 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 3300 50  0001 C CNN
F 3 "" H 6200 3300 50  0000 C CNN
	1    6200 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 3050 5150 3050
$Comp
L +5V #PWR09
U 1 1 57D103E3
P 7250 3300
F 0 "#PWR09" H 7250 3150 50  0001 C CNN
F 1 "+5V" H 7250 3440 50  0000 C CNN
F 2 "" H 7250 3300 50  0000 C CNN
F 3 "" H 7250 3300 50  0000 C CNN
	1    7250 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3050 5150 3300
Wire Wire Line
	5150 3300 6050 3300
Wire Wire Line
	6350 3300 6450 3300
Wire Wire Line
	4050 4100 4050 3450
Wire Wire Line
	4050 3450 4250 3450
$Comp
L LED D10
U 1 1 57D103EE
P 6650 3400
F 0 "D10" H 6650 3500 50  0000 C CNN
F 1 "LED" H 6650 3300 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 3400 50  0001 C CNN
F 3 "" H 6650 3400 50  0000 C CNN
	1    6650 3400
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 57D103F4
P 6200 3400
F 0 "R10" V 6280 3400 50  0000 C CNN
F 1 "R" V 6200 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 3400 50  0001 C CNN
F 3 "" H 6200 3400 50  0000 C CNN
	1    6200 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 3400 6050 3400
Wire Wire Line
	6350 3400 6450 3400
$Comp
L LED D11
U 1 1 57D103FC
P 6650 3500
F 0 "D11" H 6650 3600 50  0000 C CNN
F 1 "LED" H 6650 3400 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 3500 50  0001 C CNN
F 3 "" H 6650 3500 50  0000 C CNN
	1    6650 3500
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 57D10402
P 6200 3500
F 0 "R11" V 6280 3500 50  0000 C CNN
F 1 "R" V 6200 3500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 3500 50  0001 C CNN
F 3 "" H 6200 3500 50  0000 C CNN
	1    6200 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 3500 6050 3500
Wire Wire Line
	6350 3500 6450 3500
$Comp
L LED D12
U 1 1 57D1040A
P 6650 3600
F 0 "D12" H 6650 3700 50  0000 C CNN
F 1 "LED" H 6650 3500 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 3600 50  0001 C CNN
F 3 "" H 6650 3600 50  0000 C CNN
	1    6650 3600
	1    0    0    -1  
$EndComp
$Comp
L R R12
U 1 1 57D10410
P 6200 3600
F 0 "R12" V 6280 3600 50  0000 C CNN
F 1 "R" V 6200 3600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 3600 50  0001 C CNN
F 3 "" H 6200 3600 50  0000 C CNN
	1    6200 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	5550 3600 6050 3600
Wire Wire Line
	6350 3600 6450 3600
$Comp
L LED D13
U 1 1 57D10418
P 6650 3700
F 0 "D13" H 6650 3800 50  0000 C CNN
F 1 "LED" H 6650 3600 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 3700 50  0001 C CNN
F 3 "" H 6650 3700 50  0000 C CNN
	1    6650 3700
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 57D1041E
P 6200 3700
F 0 "R13" V 6280 3700 50  0000 C CNN
F 1 "R" V 6200 3700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 3700 50  0001 C CNN
F 3 "" H 6200 3700 50  0000 C CNN
	1    6200 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 3700 6050 3700
Wire Wire Line
	6350 3700 6450 3700
$Comp
L LED D14
U 1 1 57D10426
P 6650 3800
F 0 "D14" H 6650 3900 50  0000 C CNN
F 1 "LED" H 6650 3700 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 3800 50  0001 C CNN
F 3 "" H 6650 3800 50  0000 C CNN
	1    6650 3800
	1    0    0    -1  
$EndComp
$Comp
L R R14
U 1 1 57D1042C
P 6200 3800
F 0 "R14" V 6280 3800 50  0000 C CNN
F 1 "R" V 6200 3800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 3800 50  0001 C CNN
F 3 "" H 6200 3800 50  0000 C CNN
	1    6200 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 3800 6050 3800
Wire Wire Line
	6350 3800 6450 3800
$Comp
L LED D15
U 1 1 57D10434
P 6650 3900
F 0 "D15" H 6650 4000 50  0000 C CNN
F 1 "LED" H 6650 3800 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 3900 50  0001 C CNN
F 3 "" H 6650 3900 50  0000 C CNN
	1    6650 3900
	1    0    0    -1  
$EndComp
$Comp
L R R15
U 1 1 57D1043A
P 6200 3900
F 0 "R15" V 6280 3900 50  0000 C CNN
F 1 "R" V 6200 3900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 3900 50  0001 C CNN
F 3 "" H 6200 3900 50  0000 C CNN
	1    6200 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 3900 6050 3900
Wire Wire Line
	6350 3900 6450 3900
$Comp
L LED D16
U 1 1 57D10442
P 6650 4000
F 0 "D16" H 6650 4100 50  0000 C CNN
F 1 "LED" H 6650 3900 50  0000 C CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" H 6650 4000 50  0001 C CNN
F 3 "" H 6650 4000 50  0000 C CNN
	1    6650 4000
	1    0    0    -1  
$EndComp
$Comp
L R R16
U 1 1 57D10448
P 6200 4000
F 0 "R16" V 6280 4000 50  0000 C CNN
F 1 "R" V 6200 4000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 4000 50  0001 C CNN
F 3 "" H 6200 4000 50  0000 C CNN
	1    6200 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 4000 6050 4000
Wire Wire Line
	6350 4000 6450 4000
$Comp
L BSS138 Q10
U 1 1 57D10450
P 4550 3350
F 0 "Q10" H 4750 3425 50  0000 L CNN
F 1 "BSS138" H 4750 3350 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4750 3250 50  0000 L CIN
F 3 "" H 4550 3350 50  0000 L CNN
	1    4550 3350
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q11
U 1 1 57D10456
P 4950 3450
F 0 "Q11" H 5150 3525 50  0000 L CNN
F 1 "BSS138" H 5150 3450 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 5150 3350 50  0000 L CIN
F 3 "" H 4950 3450 50  0000 L CNN
	1    4950 3450
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q12
U 1 1 57D1045C
P 5350 3550
F 0 "Q12" H 5550 3625 50  0000 L CNN
F 1 "BSS138" H 5550 3550 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 5550 3450 50  0000 L CIN
F 3 "" H 5350 3550 50  0000 L CNN
	1    5350 3550
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q13
U 1 1 57D10462
P 4200 3650
F 0 "Q13" H 4400 3725 50  0000 L CNN
F 1 "BSS138" H 4400 3650 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4400 3550 50  0000 L CIN
F 3 "" H 4200 3650 50  0000 L CNN
	1    4200 3650
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q14
U 1 1 57D10468
P 4600 3750
F 0 "Q14" H 4800 3825 50  0000 L CNN
F 1 "BSS138" H 4800 3750 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4800 3650 50  0000 L CIN
F 3 "" H 4600 3750 50  0000 L CNN
	1    4600 3750
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q15
U 1 1 57D1046E
P 5000 3850
F 0 "Q15" H 5200 3925 50  0000 L CNN
F 1 "BSS138" H 5200 3850 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 5200 3750 50  0000 L CIN
F 3 "" H 5000 3850 50  0000 L CNN
	1    5000 3850
	1    0    0    -1  
$EndComp
$Comp
L BSS138 Q16
U 1 1 57D10474
P 5400 3950
F 0 "Q16" H 5600 4025 50  0000 L CNN
F 1 "BSS138" H 5600 3950 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 5600 3850 50  0000 L CIN
F 3 "" H 5400 3950 50  0000 L CNN
	1    5400 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3450 4250 3500
Wire Wire Line
	4250 3500 4550 3500
Wire Wire Line
	4550 3500 4550 3550
Wire Wire Line
	4550 3550 4650 3550
Wire Wire Line
	4650 3550 4650 3600
Wire Wire Line
	4650 3600 5000 3600
Wire Wire Line
	5000 3600 5000 3650
Wire Wire Line
	5000 3650 5050 3650
Wire Wire Line
	5050 3650 5050 3700
Wire Wire Line
	5050 3700 5400 3700
Wire Wire Line
	5400 3700 5400 3750
Wire Wire Line
	5400 3750 5450 3750
Wire Wire Line
	4650 3150 4750 3150
Wire Wire Line
	4750 3150 4750 3400
Wire Wire Line
	5050 3250 5100 3250
Wire Wire Line
	5100 3250 5100 3350
Wire Wire Line
	5100 3350 5150 3350
Wire Wire Line
	5150 3350 5150 3500
Wire Wire Line
	5450 3350 5550 3350
Wire Wire Line
	5550 3350 5550 3600
Wire Wire Line
	4350 3400 3800 3400
Wire Wire Line
	3800 3500 4750 3500
Wire Wire Line
	3800 3600 5150 3600
Wire Wire Line
	3800 3700 4000 3700
Wire Wire Line
	4300 3450 4400 3450
Wire Wire Line
	4400 3450 4400 3700
Wire Wire Line
	4700 3550 4800 3550
Wire Wire Line
	4800 3550 4800 3800
Wire Wire Line
	5100 3650 5200 3650
Wire Wire Line
	5200 3650 5200 3900
Wire Wire Line
	5500 3750 5600 3750
Wire Wire Line
	5600 3750 5600 4000
Wire Wire Line
	4150 4150 5500 4150
Wire Wire Line
	5100 4150 5100 4050
Wire Wire Line
	4700 4150 4700 3950
Connection ~ 5100 4150
Wire Wire Line
	4300 4150 4300 3850
Connection ~ 4700 4150
Wire Wire Line
	4150 4150 4150 4100
Connection ~ 4300 4150
Wire Wire Line
	6850 3300 6850 4000
Connection ~ 6850 3900
Connection ~ 6850 3800
Connection ~ 6850 3700
Connection ~ 6850 3600
Connection ~ 6850 3500
Connection ~ 6850 3400
Wire Wire Line
	6850 3300 7250 3300
Wire Wire Line
	4150 4100 4050 4100
Connection ~ 4050 4100
Wire Wire Line
	6850 5050 6850 5350
Wire Wire Line
	4250 5200 4250 5300
Wire Wire Line
	4250 5300 4650 5300
Wire Wire Line
	4650 5300 4650 5400
Wire Wire Line
	4650 5400 5050 5400
Connection ~ 5050 5400
Connection ~ 4650 5300
Connection ~ 4250 5200
Wire Wire Line
	5050 5500 5450 5500
$Comp
L GND #PWR010
U 1 1 57D12CB7
P 4050 5850
F 0 "#PWR010" H 4050 5600 50  0001 C CNN
F 1 "GND" H 4050 5700 50  0000 C CNN
F 2 "" H 4050 5850 50  0000 C CNN
F 3 "" H 4050 5850 50  0000 C CNN
	1    4050 5850
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X05 P2
U 1 1 57D13542
P 1400 6950
F 0 "P2" H 1400 7250 50  0000 C CNN
F 1 "CONN_01X05" V 1500 6950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05" H 1400 6950 50  0001 C CNN
F 3 "" H 1400 6950 50  0000 C CNN
	1    1400 6950
	0    -1   1    0   
$EndComp
Wire Wire Line
	3800 5950 3800 6350
Wire Wire Line
	3800 6350 1200 6350
Wire Wire Line
	1200 6350 1200 6750
Connection ~ 1300 5550
Connection ~ 1400 1600
Wire Wire Line
	2400 3500 1400 3500
Connection ~ 1400 3500
Connection ~ 1400 5250
Connection ~ 1500 4800
Connection ~ 1600 6200
$Comp
L +5V #PWR011
U 1 1 57D16BE6
P 1850 1150
F 0 "#PWR011" H 1850 1000 50  0001 C CNN
F 1 "+5V" H 1850 1290 50  0000 C CNN
F 2 "" H 1850 1150 50  0000 C CNN
F 3 "" H 1850 1150 50  0000 C CNN
	1    1850 1150
	1    0    0    -1  
$EndComp
Connection ~ 1850 1150
Connection ~ 2400 2000
Connection ~ 2800 2550
NoConn ~ 3800 5550
NoConn ~ 3800 5650
NoConn ~ 3800 5750
$Comp
L PWR_FLAG #FLG012
U 1 1 57D21391
P 2150 1150
F 0 "#FLG012" H 2150 1245 50  0001 C CNN
F 1 "PWR_FLAG" H 2150 1330 50  0000 C CNN
F 2 "" H 2150 1150 50  0000 C CNN
F 3 "" H 2150 1150 50  0000 C CNN
	1    2150 1150
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG013
U 1 1 57D21466
P 2150 2550
F 0 "#FLG013" H 2150 2645 50  0001 C CNN
F 1 "PWR_FLAG" H 2150 2730 50  0000 C CNN
F 2 "" H 2150 2550 50  0000 C CNN
F 3 "" H 2150 2550 50  0000 C CNN
	1    2150 2550
	1    0    0    -1  
$EndComp
Connection ~ 2150 1150
Connection ~ 2150 2550
Wire Wire Line
	3950 3300 3950 5450
Wire Wire Line
	3950 5450 3800 5450
Wire Wire Line
	3800 3800 4400 3800
Wire Wire Line
	5200 4000 4400 4000
Wire Wire Line
	4400 4000 4400 3900
Wire Wire Line
	4400 3900 3800 3900
Wire Wire Line
	4800 3900 4600 3900
Wire Wire Line
	4600 3900 4600 3950
Wire Wire Line
	4600 3950 4350 3950
Wire Wire Line
	4350 3950 4350 4000
Wire Wire Line
	4350 4000 3800 4000
$EndSCHEMATC
