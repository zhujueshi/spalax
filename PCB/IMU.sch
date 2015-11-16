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
LIBS:stm32f405vgt
LIBS:adp3335
LIBS:buzzer
LIBS:q_nmos_gsd
LIBS:ADIS16405
LIBS:uSD_holder
LIBS:ms5611-01ba03
LIBS:microusb
LIBS:usblc6-2
LIBS:swd
LIBS:IMU-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 7
Title ""
Date "28 oct 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L STM32F405VGT IC1
U 1 1 56315E6F
P 2950 950
F 0 "IC1" H 4050 950 60  0000 C CNN
F 1 "STM32F405VGT" H 3400 950 60  0000 C CNN
F 2 "IMU:LQFP100" H 2950 950 60  0001 C CNN
F 3 "" H 2950 950 60  0000 C CNN
F 4 "Value" H 2950 950 60  0001 C CNN "Digikey"
F 5 "Value" H 2950 950 60  0001 C CNN "Farnell"
F 6 "Value" H 2950 950 60  0001 C CNN "Fieldname"
	1    2950 950 
	1    0    0    -1  
$EndComp
$Sheet
S 6850 1100 1350 650 
U 56316C38
F0 "SDCard" 60
F1 "SDCard.sch" 60
F2 "CARD_DETECT" I L 6850 1200 60 
$EndSheet
$Sheet
S 9050 1100 1400 800 
U 56316CB8
F0 "StatusIndicators" 60
F1 "StatusIndicators.sch" 60
F2 "IMU" I L 9050 1200 60 
F3 "Buzzer" I L 9050 1500 60 
F4 "Sensors" I L 9050 1650 60 
F5 "~Sensors" I L 9050 1800 60 
F6 "~IMU" I L 9050 1350 60 
$EndSheet
$Sheet
S 6850 2100 1350 600 
U 56316D3B
F0 "Power" 60
F1 "Power.sch" 60
F2 "USB5V" I L 6850 2200 60 
$EndSheet
$Sheet
S 6850 3050 1350 850 
U 56316E47
F0 "IntertialSensors" 60
F1 "InertialSensors.sch" 60
F2 "SCLK" I L 6850 3150 60 
F3 "MISO" I L 6850 3300 60 
F4 "MOSI" I L 6850 3450 60 
F5 "~SS" I L 6850 3600 60 
F6 "IRQ" I L 6850 3800 60 
$EndSheet
$Sheet
S 9050 3050 1450 650 
U 56316E4B
F0 "Altimeter" 60
F1 "Altimeter.sch" 60
F2 "ALT_SCLK" I L 9050 3150 60 
F3 "ALT_SDI" I L 9050 3300 60 
F4 "ALT_SDO" I L 9050 3450 60 
F5 "ALT_CSB" I L 9050 3600 60 
$EndSheet
$Comp
L +3.3V #PWR1
U 1 1 563A56E3
P 800 950
F 0 "#PWR1" H 800 800 50  0001 C CNN
F 1 "+3.3V" H 800 1090 50  0000 C CNN
F 2 "" H 800 950 60  0000 C CNN
F 3 "" H 800 950 60  0000 C CNN
	1    800  950 
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 563A571D
P 800 1250
F 0 "C1" H 825 1350 50  0000 L CNN
F 1 "10µ" H 825 1150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 838 1100 30  0000 C CNN
F 3 "" H 800 1250 60  0000 C CNN
F 4 "Value" H 800 1250 60  0001 C CNN "Digikey"
F 5 "2309028" H 800 1250 60  0001 C CNN "Farnell"
F 6 "Value" H 800 1250 60  0001 C CNN "Fieldname"
	1    800  1250
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 563A582A
P 1050 1250
F 0 "C2" H 1075 1350 50  0000 L CNN
F 1 "100n" H 1075 1150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 1088 1100 30  0000 C CNN
F 3 "" H 1050 1250 60  0000 C CNN
F 4 "Value" H 1050 1250 60  0001 C CNN "Digikey"
F 5 "9406140" H 1050 1250 60  0001 C CNN "Farnell"
F 6 "Value" H 1050 1250 60  0001 C CNN "Fieldname"
	1    1050 1250
	1    0    0    -1  
$EndComp
$Comp
L C C12
U 1 1 563A87D6
P 2150 2200
F 0 "C12" H 2175 2300 50  0000 L CNN
F 1 "2µ2" H 2175 2100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2188 2050 30  0000 C CNN
F 3 "" H 2150 2200 60  0000 C CNN
F 4 "Value" H 2150 2200 60  0001 C CNN "Digikey"
F 5 "2211185" H 2150 2200 60  0001 C CNN "Farnell"
F 6 "Value" H 2150 2200 60  0001 C CNN "Fieldname"
	1    2150 2200
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR5
U 1 1 563A9C19
P 1250 2050
F 0 "#PWR5" H 1250 1900 50  0001 C CNN
F 1 "+3.3V" H 1250 2190 50  0000 C CNN
F 2 "" H 1250 2050 60  0000 C CNN
F 3 "" H 1250 2050 60  0000 C CNN
	1    1250 2050
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 563A9C67
P 1600 2300
F 0 "C9" H 1625 2400 50  0000 L CNN
F 1 "10n" H 1625 2200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 1638 2150 30  0000 C CNN
F 3 "" H 1600 2300 60  0000 C CNN
F 4 "Value" H 1600 2300 60  0001 C CNN "Digikey"
F 5 "1759102" H 1600 2300 60  0001 C CNN "Farnell"
F 6 "Value" H 1600 2300 60  0001 C CNN "Fieldname"
	1    1600 2300
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 563A9D30
P 1350 2300
F 0 "C7" H 1375 2400 50  0000 L CNN
F 1 "1µ" H 1375 2200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 1388 2150 30  0000 C CNN
F 3 "" H 1350 2300 60  0000 C CNN
F 4 "Value" H 1350 2300 60  0001 C CNN "Digikey"
F 5 "2211179" H 1350 2300 60  0001 C CNN "Farnell"
F 6 "Value" H 1350 2300 60  0001 C CNN "Fieldname"
	1    1350 2300
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 563AC2F8
P 1200 3050
F 0 "C3" H 1225 3150 50  0000 L CNN
F 1 "15p" H 1225 2950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 1238 2900 30  0001 C CNN
F 3 "" H 1200 3050 60  0000 C CNN
F 4 "Value" H 1200 3050 60  0001 C CNN "Digikey"
F 5 "2464619" H 1200 3050 60  0001 C CNN "Farnell"
F 6 "Value" H 1200 3050 60  0001 C CNN "Fieldname"
	1    1200 3050
	0    1    1    0   
$EndComp
$Comp
L Crystal Y1
U 1 1 563AC9C6
P 1400 3400
F 0 "Y1" H 1400 3550 50  0000 C CNN
F 1 "8M" H 1400 3250 50  0000 C CNN
F 2 "IMU:XTAL50x32" H 1400 3400 60  0001 C CNN
F 3 "" H 1400 3400 60  0000 C CNN
F 4 "2101329" H 1400 3400 60  0001 C CNN "Farnell"
	1    1400 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 2100 1600 2150
Wire Wire Line
	1250 2100 1850 2100
Wire Wire Line
	1850 2100 1850 2750
Wire Wire Line
	1850 2750 2950 2750
Wire Wire Line
	2150 1850 2950 1850
Wire Wire Line
	2150 2050 2150 1850
Wire Wire Line
	2400 1950 2950 1950
Wire Wire Line
	2400 2050 2400 1950
Connection ~ 2400 2450
Wire Wire Line
	2150 2350 2150 2450
Wire Wire Line
	2400 2350 2400 2450
Connection ~ 2650 2450
Connection ~ 2650 2250
Connection ~ 2650 2350
Wire Wire Line
	2650 2350 2950 2350
Wire Wire Line
	2150 2450 2950 2450
Wire Wire Line
	2650 2150 2650 2500
Wire Wire Line
	2950 2250 2650 2250
Wire Wire Line
	2950 2150 2650 2150
Connection ~ 800  1450
Connection ~ 2300 1450
Wire Wire Line
	2300 1450 2300 1400
Connection ~ 2050 1450
Wire Wire Line
	2050 1450 2050 1400
Connection ~ 1800 1450
Wire Wire Line
	1800 1450 1800 1400
Connection ~ 1550 1450
Wire Wire Line
	1550 1450 1550 1400
Connection ~ 1300 1450
Wire Wire Line
	1300 1450 1300 1400
Connection ~ 1050 1450
Wire Wire Line
	1050 1400 1050 1450
Wire Wire Line
	800  1400 800  1500
Wire Wire Line
	800  1450 2550 1450
Wire Wire Line
	2550 1450 2550 1400
Connection ~ 800  1050
Connection ~ 1050 1050
Wire Wire Line
	800  950  800  1100
Connection ~ 1300 1050
Wire Wire Line
	1050 1050 1050 1100
Connection ~ 1550 1050
Wire Wire Line
	1300 1050 1300 1100
Wire Wire Line
	1550 1050 1550 1100
Connection ~ 1800 1050
Connection ~ 2050 1050
Wire Wire Line
	1800 1050 1800 1100
Wire Wire Line
	2050 1050 2050 1100
Connection ~ 2300 1050
Wire Wire Line
	2300 1050 2300 1100
Connection ~ 2550 1050
Connection ~ 2850 1050
Wire Wire Line
	2550 1050 2550 1100
Connection ~ 2850 1250
Connection ~ 2850 1150
Connection ~ 2850 1450
Connection ~ 2850 1350
Connection ~ 2850 1550
Wire Wire Line
	2850 1650 2950 1650
Wire Wire Line
	2850 1550 2950 1550
Wire Wire Line
	2850 1450 2950 1450
Wire Wire Line
	2850 1350 2950 1350
Wire Wire Line
	2850 1250 2950 1250
Wire Wire Line
	2850 1150 2950 1150
Wire Wire Line
	2850 1050 2850 1650
Wire Wire Line
	800  1050 2950 1050
Wire Wire Line
	1350 2100 1350 2150
Connection ~ 1600 2100
Wire Wire Line
	1250 2100 1250 2050
Connection ~ 1350 2100
Wire Wire Line
	1350 2450 1350 2500
Wire Wire Line
	1250 2500 1600 2500
Wire Wire Line
	1600 2500 1600 2450
Wire Wire Line
	1250 2500 1250 2550
Connection ~ 1350 2500
Wire Wire Line
	2450 2850 2950 2850
Wire Wire Line
	2950 3050 2600 3050
Wire Wire Line
	2450 2850 2450 2900
Wire Wire Line
	2950 3350 1750 3350
Wire Wire Line
	1750 3350 1750 3050
Wire Wire Line
	1750 3050 1350 3050
Wire Wire Line
	1400 3050 1400 3250
Connection ~ 1400 3050
Wire Wire Line
	1050 3050 850  3050
Wire Wire Line
	850  3050 850  3850
Wire Wire Line
	850  3750 1050 3750
Connection ~ 850  3750
$Comp
L C C4
U 1 1 563ACC05
P 1200 3750
F 0 "C4" H 1225 3850 50  0000 L CNN
F 1 "15p" H 1225 3650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 1238 3600 30  0001 C CNN
F 3 "" H 1200 3750 60  0000 C CNN
F 4 "Value" H 1200 3750 60  0001 C CNN "Digikey"
F 5 "2464619" H 1200 3750 60  0001 C CNN "Farnell"
F 6 "Value" H 1200 3750 60  0001 C CNN "Fieldname"
	1    1200 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 3550 1400 3750
Wire Wire Line
	1350 3750 1550 3750
Connection ~ 1400 3750
$Comp
L R R2
U 1 1 563AD480
P 1700 3750
F 0 "R2" V 1780 3750 50  0000 C CNN
F 1 "100" V 1700 3750 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 1630 3750 30  0001 C CNN
F 3 "" H 1700 3750 30  0000 C CNN
F 4 "2333587" V 1700 3750 60  0001 C CNN "Farnell"
	1    1700 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 3450 1950 3450
Wire Wire Line
	1950 3450 1950 3750
Wire Wire Line
	1950 3750 1850 3750
$Comp
L C C6
U 1 1 563AFA5E
P 1300 1250
F 0 "C6" H 1325 1350 50  0000 L CNN
F 1 "100n" H 1325 1150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 1338 1100 30  0000 C CNN
F 3 "" H 1300 1250 60  0000 C CNN
F 4 "Value" H 1300 1250 60  0001 C CNN "Digikey"
F 5 "9406140" H 1300 1250 60  0001 C CNN "Farnell"
F 6 "Value" H 1300 1250 60  0001 C CNN "Fieldname"
	1    1300 1250
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 563AFABC
P 1550 1250
F 0 "C8" H 1575 1350 50  0000 L CNN
F 1 "100n" H 1575 1150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 1588 1100 30  0000 C CNN
F 3 "" H 1550 1250 60  0000 C CNN
F 4 "Value" H 1550 1250 60  0001 C CNN "Digikey"
F 5 "9406140" H 1550 1250 60  0001 C CNN "Farnell"
F 6 "Value" H 1550 1250 60  0001 C CNN "Fieldname"
	1    1550 1250
	1    0    0    -1  
$EndComp
$Comp
L C C10
U 1 1 563AFB1F
P 1800 1250
F 0 "C10" H 1825 1350 50  0000 L CNN
F 1 "100n" H 1825 1150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 1838 1100 30  0000 C CNN
F 3 "" H 1800 1250 60  0000 C CNN
F 4 "Value" H 1800 1250 60  0001 C CNN "Digikey"
F 5 "9406140" H 1800 1250 60  0001 C CNN "Farnell"
F 6 "Value" H 1800 1250 60  0001 C CNN "Fieldname"
	1    1800 1250
	1    0    0    -1  
$EndComp
$Comp
L C C11
U 1 1 563AFB85
P 2050 1250
F 0 "C11" H 2075 1350 50  0000 L CNN
F 1 "100n" H 2075 1150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2088 1100 30  0000 C CNN
F 3 "" H 2050 1250 60  0000 C CNN
F 4 "Value" H 2050 1250 60  0001 C CNN "Digikey"
F 5 "9406140" H 2050 1250 60  0001 C CNN "Farnell"
F 6 "Value" H 2050 1250 60  0001 C CNN "Fieldname"
	1    2050 1250
	1    0    0    -1  
$EndComp
$Comp
L C C13
U 1 1 563AFBEE
P 2300 1250
F 0 "C13" H 2325 1350 50  0000 L CNN
F 1 "100n" H 2325 1150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2338 1100 30  0000 C CNN
F 3 "" H 2300 1250 60  0000 C CNN
F 4 "Value" H 2300 1250 60  0001 C CNN "Digikey"
F 5 "9406140" H 2300 1250 60  0001 C CNN "Farnell"
F 6 "Value" H 2300 1250 60  0001 C CNN "Fieldname"
	1    2300 1250
	1    0    0    -1  
$EndComp
$Comp
L C C15
U 1 1 563AFC60
P 2550 1250
F 0 "C15" H 2575 1350 50  0000 L CNN
F 1 "100n" H 2575 1150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2588 1100 30  0000 C CNN
F 3 "" H 2550 1250 60  0000 C CNN
F 4 "Value" H 2550 1250 60  0001 C CNN "Digikey"
F 5 "9406140" H 2550 1250 60  0001 C CNN "Farnell"
F 6 "Value" H 2550 1250 60  0001 C CNN "Fieldname"
	1    2550 1250
	1    0    0    -1  
$EndComp
$Comp
L C C14
U 1 1 563B0427
P 2400 2200
F 0 "C14" H 2425 2300 50  0000 L CNN
F 1 "2µ2" H 2425 2100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2438 2050 30  0000 C CNN
F 3 "" H 2400 2200 60  0000 C CNN
F 4 "Value" H 2400 2200 60  0001 C CNN "Digikey"
F 5 "2211185" H 2400 2200 60  0001 C CNN "Farnell"
F 6 "Value" H 2400 2200 60  0001 C CNN "Fieldname"
	1    2400 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR9
U 1 1 563A4AF2
P 2650 2500
F 0 "#PWR9" H 2650 2250 50  0001 C CNN
F 1 "GND" H 2650 2350 50  0000 C CNN
F 2 "" H 2650 2500 60  0000 C CNN
F 3 "" H 2650 2500 60  0000 C CNN
	1    2650 2500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR8
U 1 1 563A4C04
P 2450 2900
F 0 "#PWR8" H 2450 2650 50  0001 C CNN
F 1 "GND" H 2450 2750 50  0000 C CNN
F 2 "" H 2450 2900 60  0000 C CNN
F 3 "" H 2450 2900 60  0000 C CNN
	1    2450 2900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR6
U 1 1 563A4D5B
P 1250 2550
F 0 "#PWR6" H 1250 2300 50  0001 C CNN
F 1 "GND" H 1250 2400 50  0000 C CNN
F 2 "" H 1250 2550 60  0000 C CNN
F 3 "" H 1250 2550 60  0000 C CNN
	1    1250 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2
U 1 1 563A4DBD
P 800 1500
F 0 "#PWR2" H 800 1250 50  0001 C CNN
F 1 "GND" H 800 1350 50  0000 C CNN
F 2 "" H 800 1500 60  0000 C CNN
F 3 "" H 800 1500 60  0000 C CNN
	1    800  1500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR3
U 1 1 563A5366
P 850 3850
F 0 "#PWR3" H 850 3600 50  0001 C CNN
F 1 "GND" H 850 3700 50  0000 C CNN
F 2 "" H 850 3850 60  0000 C CNN
F 3 "" H 850 3850 60  0000 C CNN
	1    850  3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2650 2850 2650
Wire Wire Line
	2850 2650 2850 2750
Connection ~ 2850 2750
Text GLabel 4500 1800 2    60   Input ~ 0
SDIO_D0
Text GLabel 4500 1950 2    60   Input ~ 0
SDIO_D1
Text GLabel 4500 2100 2    60   Input ~ 0
SDIO_D2
Text GLabel 4500 2250 2    60   Input ~ 0
SDIO_D3
Text GLabel 4500 2400 2    60   Input ~ 0
SDIO_CK
Text GLabel 4500 2850 2    60   Input ~ 0
SDIO_CMD
Text GLabel 2700 3950 0    60   Input ~ 0
SPI1_NSS
Text GLabel 2700 4100 0    60   Input ~ 0
SPI1_SCK
Text GLabel 2700 4250 0    60   Input ~ 0
SPI1_MISO
Text GLabel 2700 4400 0    60   Input ~ 0
SPI1_MOSI
Text GLabel 2700 6450 0    60   Input ~ 0
SPI2_NSS
Text GLabel 2700 6600 0    60   Input ~ 0
SPI2_SCK
Text GLabel 2700 6750 0    60   Input ~ 0
SPI2_MISO
Text GLabel 2700 6900 0    60   Input ~ 0
SPI2_MOSI
Text GLabel 2700 5450 0    60   Input ~ 0
SPI3_NSS
Text GLabel 2700 5600 0    60   Input ~ 0
SPI3_SCK
Text GLabel 2700 5750 0    60   Input ~ 0
SPI3_MISO
Text GLabel 2700 5900 0    60   Input ~ 0
SPI3_MOSI
Text GLabel 2600 4550 0    60   Input ~ 0
USART1_TX
Text GLabel 2600 4700 0    60   Input ~ 0
USART1_RX
Text GLabel 2700 3650 0    60   Input ~ 0
USART2_TX
Text GLabel 2700 3800 0    60   Input ~ 0
USART2_RX
Text GLabel 2600 4850 0    60   Input ~ 0
OTG_FS_DM
Text GLabel 2600 5000 0    60   Input ~ 0
OTG_FS_DP
Wire Wire Line
	2700 3800 2800 3800
Wire Wire Line
	2800 3800 2800 3950
Wire Wire Line
	2800 3950 2950 3950
Wire Wire Line
	2700 3650 2850 3650
Wire Wire Line
	2850 3650 2850 3850
Wire Wire Line
	2850 3850 2950 3850
Wire Wire Line
	2700 3950 2750 3950
Wire Wire Line
	2750 3950 2750 4050
Wire Wire Line
	2750 4050 2950 4050
Wire Wire Line
	2700 4100 2750 4100
Wire Wire Line
	2750 4100 2750 4150
Wire Wire Line
	2750 4150 2950 4150
Wire Wire Line
	2700 4250 2950 4250
Wire Wire Line
	2700 4400 2750 4400
Wire Wire Line
	2750 4400 2750 4350
Wire Wire Line
	2750 4350 2950 4350
Wire Wire Line
	2600 4550 2950 4550
Wire Wire Line
	2600 4700 2650 4700
Wire Wire Line
	2650 4700 2650 4650
Wire Wire Line
	2650 4650 2950 4650
Wire Wire Line
	2700 4750 2950 4750
Wire Wire Line
	2600 5000 2750 5000
Wire Wire Line
	2750 5000 2750 4850
Wire Wire Line
	2750 4850 2950 4850
NoConn ~ 2950 4450
NoConn ~ 2950 3650
NoConn ~ 2950 3750
NoConn ~ 2950 5350
NoConn ~ 2950 5450
NoConn ~ 2950 5550
NoConn ~ 2950 5950
NoConn ~ 2950 6050
NoConn ~ 2950 6350
NoConn ~ 2950 6450
Wire Wire Line
	2700 5750 2950 5750
Wire Wire Line
	2700 5900 2750 5900
Wire Wire Line
	2750 5900 2750 5850
Wire Wire Line
	2750 5850 2950 5850
Wire Wire Line
	2700 5600 2750 5600
Wire Wire Line
	2750 5600 2750 5650
Wire Wire Line
	2750 5650 2950 5650
Wire Wire Line
	2700 6750 2950 6750
Wire Wire Line
	2700 6900 2750 6900
Wire Wire Line
	2750 6900 2750 6850
Wire Wire Line
	2750 6850 2950 6850
Wire Wire Line
	2700 6600 2750 6600
Wire Wire Line
	2750 6600 2750 6650
Wire Wire Line
	2750 6650 2950 6650
Wire Wire Line
	2700 6450 2800 6450
Wire Wire Line
	2800 6450 2800 6550
Wire Wire Line
	2800 6550 2950 6550
NoConn ~ 4250 5950
NoConn ~ 4250 5850
NoConn ~ 4250 5750
NoConn ~ 4250 5650
NoConn ~ 4250 5550
NoConn ~ 4250 5450
NoConn ~ 4250 5350
NoConn ~ 4250 5250
NoConn ~ 4250 4250
NoConn ~ 4250 4150
NoConn ~ 4250 4050
NoConn ~ 4250 3950
NoConn ~ 4250 3850
NoConn ~ 4250 3750
NoConn ~ 4250 3650
NoConn ~ 4250 3550
NoConn ~ 4250 3450
NoConn ~ 4250 3350
NoConn ~ 4250 3250
NoConn ~ 4250 3150
NoConn ~ 4250 2850
NoConn ~ 4250 2750
Wire Wire Line
	4400 2950 4250 2950
NoConn ~ 4250 2550
NoConn ~ 4250 2450
NoConn ~ 4250 2350
NoConn ~ 4250 1550
NoConn ~ 4250 1450
NoConn ~ 4250 1350
NoConn ~ 4250 1250
NoConn ~ 4250 1150
NoConn ~ 4250 1050
Wire Wire Line
	4250 1950 4500 1950
Wire Wire Line
	4250 1850 4450 1850
Wire Wire Line
	4450 1850 4450 1800
Wire Wire Line
	4450 1800 4500 1800
Wire Wire Line
	4250 2050 4450 2050
Wire Wire Line
	4450 2050 4450 2100
Wire Wire Line
	4450 2100 4500 2100
Wire Wire Line
	4250 2150 4400 2150
Wire Wire Line
	4400 2150 4400 2250
Wire Wire Line
	4400 2250 4500 2250
Wire Wire Line
	4250 2250 4350 2250
Wire Wire Line
	4350 2250 4350 2400
Wire Wire Line
	4350 2400 4500 2400
Text GLabel 8950 3600 0    60   Input ~ 0
SPI2_NSS
Text GLabel 8950 3150 0    60   Input ~ 0
SPI2_SCK
Text GLabel 8950 3450 0    60   Input ~ 0
SPI2_MISO
Text GLabel 8950 3300 0    60   Input ~ 0
SPI2_MOSI
Wire Wire Line
	8950 3600 9050 3600
Wire Wire Line
	9050 3450 8950 3450
Wire Wire Line
	8950 3300 9050 3300
Wire Wire Line
	9050 3150 8950 3150
$Sheet
S 9050 2100 1350 600 
U 56316E4F
F0 "USB" 60
F1 "USB.sch" 60
F2 "USB5V" O L 9050 2200 60 
$EndSheet
Wire Wire Line
	9050 2200 8450 2200
Text Label 8450 2200 0    60   ~ 0
USB_VBUS
Wire Wire Line
	6850 2200 6250 2200
Text Label 6250 2200 0    60   ~ 0
USB_VBUS
Wire Wire Line
	6250 1200 6850 1200
Wire Wire Line
	8300 1200 9050 1200
Wire Wire Line
	8300 1500 9050 1500
Wire Wire Line
	8300 1650 9050 1650
Wire Wire Line
	8300 1800 9050 1800
Wire Wire Line
	2050 3150 2950 3150
Text Label 2050 3150 0    60   ~ 0
~RST
Text Label 1700 4700 2    60   ~ 0
~RST
$Comp
L SW_PUSH SW1
U 1 1 563B760D
P 950 5050
F 0 "SW1" H 1100 5160 50  0000 C CNN
F 1 "SW_PUSH" H 950 4970 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_EVQPE1" H 950 5050 60  0001 C CNN
F 3 "" H 950 5050 60  0000 C CNN
	1    950  5050
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR4
U 1 1 563B7B71
P 1100 5400
F 0 "#PWR4" H 1100 5150 50  0001 C CNN
F 1 "GND" H 1100 5250 50  0000 C CNN
F 2 "" H 1100 5400 60  0000 C CNN
F 3 "" H 1100 5400 60  0000 C CNN
	1    1100 5400
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 563B7F0B
P 1250 5000
F 0 "C5" H 1275 5100 50  0000 L CNN
F 1 "100n" H 1275 4900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 1288 4850 30  0000 C CNN
F 3 "" H 1250 5000 60  0000 C CNN
F 4 "Value" H 1250 5000 60  0001 C CNN "Digikey"
F 5 "9406140" H 1250 5000 60  0001 C CNN "Farnell"
F 6 "Value" H 1250 5000 60  0001 C CNN "Fieldname"
	1    1250 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  5350 950  5400
Wire Wire Line
	950  5400 1250 5400
Wire Wire Line
	1250 5400 1250 5150
Connection ~ 1100 5400
Wire Wire Line
	950  4750 950  4700
Wire Wire Line
	950  4700 1700 4700
Wire Wire Line
	1250 4700 1250 4850
Connection ~ 1250 4700
Text Notes 7000 4900 0    60   ~ 0
To do:\n-Component names, values, farnell numbers and footprints for every component
Text Label 6250 1200 0    60   ~ 0
SD_DETECT
Text Label 8300 1200 0    60   ~ 0
STAT_IMU
Text Label 8300 1500 0    60   ~ 0
STAT_BUZZER
Text Label 8300 1650 0    60   ~ 0
STAT_SENSORS
Text Label 8300 1800 0    60   ~ 0
STAT_~SENSORS
Wire Wire Line
	5000 4550 4250 4550
Wire Wire Line
	5000 4750 4250 4750
Wire Wire Line
	5000 4850 4250 4850
Wire Wire Line
	5000 4950 4250 4950
Text Label 5000 4550 2    60   ~ 0
STAT_IMU
Text Label 5000 4750 2    60   ~ 0
STAT_BUZZER
Text Label 5000 4850 2    60   ~ 0
STAT_SENSORS
Text Label 5000 4950 2    60   ~ 0
STAT_~SENSORS
Wire Wire Line
	5000 3050 4250 3050
Text Label 5000 3050 2    60   ~ 0
SD_DETECT
Text GLabel 6700 3150 0    60   Input ~ 0
SPI1_SCK
Text GLabel 6700 3450 0    60   Input ~ 0
SPI1_MOSI
Text GLabel 6700 3300 0    60   Input ~ 0
SPI1_MISO
Text GLabel 6700 3600 0    60   Input ~ 0
SPI1_NSS
Wire Wire Line
	6700 3150 6850 3150
Wire Wire Line
	6850 3300 6700 3300
Wire Wire Line
	6700 3450 6850 3450
Wire Wire Line
	6850 3600 6700 3600
Wire Wire Line
	6150 3800 6850 3800
Text Label 6150 3800 0    60   ~ 0
SENSOR_IRQ
Wire Wire Line
	4250 5150 5000 5150
Text Label 5000 5150 2    60   ~ 0
SENSOR_IRQ
Text GLabel 2200 2950 0    60   Output ~ 0
~RST
Wire Wire Line
	2200 2950 2300 2950
Wire Wire Line
	2300 2950 2300 3150
Connection ~ 2300 3150
$Comp
L CONN_01X04 P1
U 1 1 56495CD8
P 5250 7250
F 0 "P1" H 5250 7500 50  0000 C CNN
F 1 "UART1" V 5350 7250 50  0000 C CNN
F 2 "IMU:S04B-PASK-2" H 5250 7250 60  0001 C CNN
F 3 "" H 5250 7250 60  0000 C CNN
	1    5250 7250
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 P3
U 1 1 56495FC5
P 6550 7250
F 0 "P3" H 6550 7500 50  0000 C CNN
F 1 "UART2" V 6650 7250 50  0000 C CNN
F 2 "IMU:S04B-PASK-2" H 6550 7250 60  0001 C CNN
F 3 "" H 6550 7250 60  0000 C CNN
	1    6550 7250
	1    0    0    -1  
$EndComp
Text GLabel 4800 7150 0    60   Input ~ 0
USART1_TX
Text GLabel 4800 7350 0    60   Input ~ 0
USART1_RX
$Comp
L +3.3V #PWR10
U 1 1 56496C13
P 4950 7050
F 0 "#PWR10" H 4950 6900 50  0001 C CNN
F 1 "+3.3V" H 4950 7190 50  0000 C CNN
F 2 "" H 4950 7050 60  0000 C CNN
F 3 "" H 4950 7050 60  0000 C CNN
	1    4950 7050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR11
U 1 1 56496F2A
P 4950 7450
F 0 "#PWR11" H 4950 7200 50  0001 C CNN
F 1 "GND" H 4950 7300 50  0000 C CNN
F 2 "" H 4950 7450 60  0000 C CNN
F 3 "" H 4950 7450 60  0000 C CNN
	1    4950 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 7050 4950 7100
Wire Wire Line
	4950 7100 5050 7100
Wire Wire Line
	5050 7400 4950 7400
Wire Wire Line
	4950 7400 4950 7450
Wire Wire Line
	4800 7350 4900 7350
Wire Wire Line
	4900 7350 4900 7300
Wire Wire Line
	4900 7300 5050 7300
Wire Wire Line
	4800 7150 4900 7150
Wire Wire Line
	4900 7150 4900 7200
Wire Wire Line
	4900 7200 5050 7200
Text GLabel 6100 7150 0    60   Input ~ 0
USART2_TX
Text GLabel 6100 7350 0    60   Input ~ 0
USART2_RX
$Comp
L +3.3V #PWR14
U 1 1 56497C14
P 6250 7050
F 0 "#PWR14" H 6250 6900 50  0001 C CNN
F 1 "+3.3V" H 6250 7190 50  0000 C CNN
F 2 "" H 6250 7050 60  0000 C CNN
F 3 "" H 6250 7050 60  0000 C CNN
	1    6250 7050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR15
U 1 1 56497C1A
P 6250 7450
F 0 "#PWR15" H 6250 7200 50  0001 C CNN
F 1 "GND" H 6250 7300 50  0000 C CNN
F 2 "" H 6250 7450 60  0000 C CNN
F 3 "" H 6250 7450 60  0000 C CNN
	1    6250 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 7050 6250 7100
Wire Wire Line
	6250 7100 6350 7100
Wire Wire Line
	6350 7400 6250 7400
Wire Wire Line
	6250 7400 6250 7450
Wire Wire Line
	6100 7350 6200 7350
Wire Wire Line
	6200 7350 6200 7300
Wire Wire Line
	6200 7300 6350 7300
Wire Wire Line
	6100 7150 6200 7150
Wire Wire Line
	6200 7150 6200 7200
Wire Wire Line
	6200 7200 6350 7200
Text GLabel 7700 5550 0    60   Input ~ 0
SPI3_SCK
Text GLabel 7700 5700 0    60   Input ~ 0
SPI3_MISO
Text GLabel 7700 5850 0    60   Input ~ 0
SPI3_MOSI
Text GLabel 8550 5700 2    60   Input ~ 0
SPI3_NSS
$Comp
L CONN_02X04 P4
U 1 1 56499376
P 8100 5750
F 0 "P4" H 8100 6000 50  0000 C CNN
F 1 "SPI" H 8100 5500 50  0000 C CNN
F 2 "Connectors_Molex:Connector_Microfit3_Header_02x04_Straight_43045-0828" H 8100 4550 60  0001 C CNN
F 3 "" H 8100 4550 60  0000 C CNN
	1    8100 5750
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR17
U 1 1 5649972C
P 8400 5550
F 0 "#PWR17" H 8400 5400 50  0001 C CNN
F 1 "+3.3V" H 8400 5690 50  0000 C CNN
F 2 "" H 8400 5550 60  0000 C CNN
F 3 "" H 8400 5550 60  0000 C CNN
	1    8400 5550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR16
U 1 1 564998F1
P 7800 5950
F 0 "#PWR16" H 7800 5700 50  0001 C CNN
F 1 "GND" H 7800 5800 50  0000 C CNN
F 2 "" H 7800 5950 60  0000 C CNN
F 3 "" H 7800 5950 60  0000 C CNN
	1    7800 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR18
U 1 1 56499E3E
P 8400 5950
F 0 "#PWR18" H 8400 5700 50  0001 C CNN
F 1 "GND" H 8400 5800 50  0000 C CNN
F 2 "" H 8400 5950 60  0000 C CNN
F 3 "" H 8400 5950 60  0000 C CNN
	1    8400 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 5950 7800 5900
Wire Wire Line
	7800 5900 7850 5900
Wire Wire Line
	8350 5900 8400 5900
Wire Wire Line
	8400 5900 8400 5950
Wire Wire Line
	8350 5600 8400 5600
Wire Wire Line
	8400 5600 8400 5550
Wire Wire Line
	7850 5600 7800 5600
Wire Wire Line
	7800 5600 7800 5550
Wire Wire Line
	7800 5550 7700 5550
Wire Wire Line
	7850 5700 7700 5700
Wire Wire Line
	7700 5850 7800 5850
Wire Wire Line
	7800 5850 7800 5800
Wire Wire Line
	7800 5800 7850 5800
Wire Wire Line
	8550 5700 8350 5700
Wire Wire Line
	8350 5800 8400 5800
Wire Wire Line
	8400 5800 8400 5850
Wire Wire Line
	8400 5850 9050 5850
Text Label 9050 5850 2    60   ~ 0
DATA_RDY
Text Label 5000 4450 2    60   ~ 0
DATA_RDY
Wire Wire Line
	4250 4450 5000 4450
Text Label 2600 3050 0    60   ~ 0
BOOT0
Text Label 800  6150 0    60   ~ 0
BOOT0
$Comp
L R R1
U 1 1 5649CDB3
P 1400 6150
F 0 "R1" V 1480 6150 50  0000 C CNN
F 1 "10K" V 1400 6150 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 1330 6150 30  0001 C CNN
F 3 "" H 1400 6150 30  0000 C CNN
	1    1400 6150
	0    1    1    0   
$EndComp
$Comp
L GND #PWR7
U 1 1 5649D1F8
P 1600 6200
F 0 "#PWR7" H 1600 5950 50  0001 C CNN
F 1 "GND" H 1600 6050 50  0000 C CNN
F 2 "" H 1600 6200 60  0000 C CNN
F 3 "" H 1600 6200 60  0000 C CNN
	1    1600 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 6150 1600 6200
$Comp
L SWD P2
U 1 1 5649E1B2
P 5850 6000
F 0 "P2" H 6100 6300 60  0000 C CNN
F 1 "SWD" H 5550 6300 60  0000 C CNN
F 2 "IMU:FTSH-105-01-F-D-K" H 6200 5800 60  0001 C CNN
F 3 "" H 6200 5800 60  0000 C CNN
	1    5850 6000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR13
U 1 1 5649E3E9
P 5300 6250
F 0 "#PWR13" H 5300 6000 50  0001 C CNN
F 1 "GND" H 5300 6100 50  0000 C CNN
F 2 "" H 5300 6250 60  0000 C CNN
F 3 "" H 5300 6250 60  0000 C CNN
	1    5300 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 6200 5350 6200
Wire Wire Line
	5300 5900 5300 6250
$Comp
L +3.3V #PWR12
U 1 1 5649E622
P 5300 5750
F 0 "#PWR12" H 5300 5600 50  0001 C CNN
F 1 "+3.3V" H 5300 5890 50  0000 C CNN
F 2 "" H 5300 5750 60  0000 C CNN
F 3 "" H 5300 5750 60  0000 C CNN
	1    5300 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 5750 5300 5800
Wire Wire Line
	5300 5800 5350 5800
Wire Wire Line
	5350 5900 5300 5900
Connection ~ 5300 6200
Wire Wire Line
	5350 6000 5300 6000
Connection ~ 5300 6000
Text Label 6700 6200 2    60   ~ 0
~RST
Text Label 6700 5800 2    60   ~ 0
SWDIO
Text Label 6700 5900 2    60   ~ 0
SWDCLK
NoConn ~ 6300 6000
NoConn ~ 6300 6100
Wire Wire Line
	6700 5800 6300 5800
Wire Wire Line
	6700 5900 6300 5900
Wire Wire Line
	6700 6200 6300 6200
Wire Wire Line
	2700 5450 2900 5450
Wire Wire Line
	2900 5450 2900 5150
Wire Wire Line
	2900 5150 2950 5150
Wire Wire Line
	2950 5050 2850 5050
Wire Wire Line
	2850 5050 2850 5350
Wire Wire Line
	2850 5350 2200 5350
Wire Wire Line
	2950 4950 2800 4950
Wire Wire Line
	2800 4950 2800 5200
Wire Wire Line
	2800 5200 2200 5200
Wire Wire Line
	2700 4750 2700 4850
Wire Wire Line
	2700 4850 2600 4850
Text Label 2200 5200 0    60   ~ 0
SWDIO
Text Label 2200 5350 0    60   ~ 0
SWDCLK
NoConn ~ 4250 1650
NoConn ~ 4250 1750
NoConn ~ 2950 6150
NoConn ~ 2950 6250
Wire Wire Line
	8300 1350 9050 1350
Text Label 8300 1350 0    60   ~ 0
STAT_~IMU
Wire Wire Line
	5000 4650 4250 4650
Text Label 5000 4650 2    60   ~ 0
STAT_~IMU
Wire Wire Line
	1550 6150 1600 6150
Wire Wire Line
	800  6150 1250 6150
$Comp
L TST TP1
U 1 1 564A7F8A
P 1200 6100
F 0 "TP1" H 1200 6400 50  0000 C BNN
F 1 "BOOT0" H 1200 6350 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Round-SMD-Pad_Big" H 1200 6100 60  0001 C CNN
F 3 "" H 1200 6100 60  0000 C CNN
	1    1200 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 6100 1200 6150
Connection ~ 1200 6150
NoConn ~ 4250 5050
Wire Wire Line
	4400 2950 4400 2850
Wire Wire Line
	4400 2850 4500 2850
$EndSCHEMATC
