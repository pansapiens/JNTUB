EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 2 3
Title "JoyfulNoise Tiny Utility Board - Board 1 - Peripheral Board"
Date "2021-01-17"
Rev "0.2"
Comp "Created by Ben Reeves"
Comment1 "This hardware is open source under CC BY-SA 4.0"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R_POT_MountingPin RV3
U 1 1 5FE9C832
P 3250 1450
F 0 "RV3" H 3007 1404 50  0000 R CNN
F 1 "B100K" H 3007 1495 50  0000 R CNN
F 2 "SDIY:Potentiometer_Alpha_9mm_WithGround" H 3250 1450 50  0001 C CNN
F 3 "" H 3250 1450 50  0001 C CNN
F 4 "" H 3250 1450 50  0001 C CNN "Part"
F 5 "-smtmfg" H 3250 1450 50  0001 C CNN "Config"
F 6 "Alpha 9mm Vertical Potentiometer" H 3250 1450 50  0001 C CNN "Type"
	1    3250 1450
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5FE9C833
P 3250 1200
F 0 "#PWR01" H 3250 1050 50  0001 C CNN
F 1 "+5V" H 3250 1340 50  0000 C CNN
F 2 "" H 3250 1200 50  0001 C CNN
F 3 "" H 3250 1200 50  0001 C CNN
	1    3250 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT_MountingPin RV2
U 1 1 5FE9C835
P 3250 2450
F 0 "RV2" H 3007 2404 50  0000 R CNN
F 1 "B100K" H 3007 2495 50  0000 R CNN
F 2 "SDIY:Potentiometer_Alpha_9mm_WithGround" H 3250 2450 50  0001 C CNN
F 3 "" H 3250 2450 50  0001 C CNN
F 4 "" H 3250 2450 50  0001 C CNN "Part"
F 5 "-smtmfg" H 3250 2450 50  0001 C CNN "Config"
F 6 "Alpha 9mm Vertical Potentiometer" H 3250 2450 50  0001 C CNN "Type"
	1    3250 2450
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 5FE9C836
P 3250 2200
F 0 "#PWR02" H 3250 2050 50  0001 C CNN
F 1 "+5V" H 3250 2340 50  0000 C CNN
F 2 "" H 3250 2200 50  0001 C CNN
F 3 "" H 3250 2200 50  0001 C CNN
	1    3250 2200
	1    0    0    -1  
$EndComp
$Comp
L SDIY:JACK_MONO J1
U 1 1 5FE9C838
P 1850 4400
F 0 "J1" H 1900 4200 50  0000 C CNN
F 1 "3.5mm Mono Jack" H 2000 4550 50  0001 C CNN
F 2 "SDIY:PJ301M-12_Thonkiconn" H 1850 4400 50  0001 C CNN
F 3 "" H 1850 4400 50  0001 C CNN
F 4 "" H 1850 4400 50  0001 C CNN "Part"
F 5 "-smtmfg" H 1850 4400 50  0001 C CNN "Config"
F 6 "Thonkiconn Jack" H 1850 4400 50  0001 C CNN "Type"
	1    1850 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT_MountingPin RV1
U 1 1 5FE9C839
P 3250 3450
F 0 "RV1" H 3007 3404 50  0000 R CNN
F 1 "B100K" H 3007 3495 50  0000 R CNN
F 2 "SDIY:Potentiometer_Alpha_9mm_WithGround" H 3250 3450 50  0001 C CNN
F 3 "" H 3250 3450 50  0001 C CNN
F 4 "" H 3250 3450 50  0001 C CNN "Part"
F 5 "-smtmfg" H 3250 3450 50  0001 C CNN "Config"
F 6 "Alpha 9mm Vertical Potentiometer" H 3250 3450 50  0001 C CNN "Type"
	1    3250 3450
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5FE9C83A
P 3250 3200
F 0 "#PWR03" H 3250 3050 50  0001 C CNN
F 1 "+5V" H 3250 3340 50  0000 C CNN
F 2 "" H 3250 3200 50  0001 C CNN
F 3 "" H 3250 3200 50  0001 C CNN
	1    3250 3200
	1    0    0    -1  
$EndComp
$Comp
L SDIY:JACK_MONO J2
U 1 1 5FE9C83C
P 4625 4400
F 0 "J2" H 4675 4200 50  0000 C CNN
F 1 "3.5mm Mono Jack" H 4775 4550 50  0001 C CNN
F 2 "SDIY:PJ301M-12_Thonkiconn" H 4625 4400 50  0001 C CNN
F 3 "" H 4625 4400 50  0001 C CNN
F 4 "" H 4625 4400 50  0001 C CNN "Part"
F 5 "-smtmfg" H 4625 4400 50  0001 C CNN "Config"
F 6 "Thonkiconn Jack" H 4625 4400 50  0001 C CNN "Type"
	1    4625 4400
	-1   0    0    -1  
$EndComp
Text Label 2800 4175 0    50   ~ 0
P1_CV
Text Label 3675 4175 2    50   ~ 0
P2_CV
$Comp
L SDIY:JACK_MONO_NoRing J4
U 1 1 5FE9C83E
P 4625 5300
F 0 "J4" H 4675 5100 50  0000 C CNN
F 1 "3.5mm Mono Jack" H 4775 5450 50  0001 C CNN
F 2 "SDIY:PJ301M-12_Thonkiconn_NoGround" H 4625 5300 50  0001 C CNN
F 3 "" H 4625 5300 50  0001 C CNN
F 4 "" H 4625 5300 50  0001 C CNN "Part"
F 5 "-smtmfg" H 4625 5300 50  0001 C CNN "Config"
F 6 "Thonkiconn Jack" H 4625 5300 50  0001 C CNN "Type"
	1    4625 5300
	-1   0    0    1   
$EndComp
NoConn ~ 4175 5300
$Comp
L power:GNDREF #PWR04
U 1 1 5FE9C83F
P 2300 4600
F 0 "#PWR04" H 2300 4350 50  0001 C CNN
F 1 "GNDREF" H 2300 4450 50  0001 C CNN
F 2 "" H 2300 4600 50  0001 C CNN
F 3 "" H 2300 4600 50  0001 C CNN
	1    2300 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR05
U 1 1 5FE9C840
P 4175 4600
F 0 "#PWR05" H 4175 4350 50  0001 C CNN
F 1 "GNDREF" H 4175 4450 50  0001 C CNN
F 2 "" H 4175 4600 50  0001 C CNN
F 3 "" H 4175 4600 50  0001 C CNN
	1    4175 4600
	-1   0    0    -1  
$EndComp
$Comp
L SDIY:JACK_MONO J5
U 1 1 5FE9C843
P 1850 6000
F 0 "J5" H 1900 5800 50  0000 C CNN
F 1 "3.5mm Mono Jack" H 2000 6150 50  0001 C CNN
F 2 "SDIY:PJ301M-12_Thonkiconn" H 1850 6000 50  0001 C CNN
F 3 "" H 1850 6000 50  0001 C CNN
F 4 "" H 1850 6000 50  0001 C CNN "Part"
F 5 "-smtmfg" H 1850 6000 50  0001 C CNN "Config"
F 6 "Thonkiconn Jack" H 1850 6000 50  0001 C CNN "Type"
	1    1850 6000
	1    0    0    -1  
$EndComp
Text Label 2425 5950 0    50   ~ 0
OUT1
$Comp
L SDIY:JACK_MONO J6
U 1 1 5FE9C844
P 4600 6000
F 0 "J6" H 4650 5800 50  0000 C CNN
F 1 "3.5mm Mono Jack" H 4750 6150 50  0001 C CNN
F 2 "SDIY:PJ301M-12_Thonkiconn" H 4600 6000 50  0001 C CNN
F 3 "" H 4600 6000 50  0001 C CNN
F 4 "" H 4600 6000 50  0001 C CNN "Part"
F 5 "-smtmfg" H 4600 6000 50  0001 C CNN "Config"
F 6 "Thonkiconn Jack" H 4600 6000 50  0001 C CNN "Type"
	1    4600 6000
	-1   0    0    -1  
$EndComp
Text Label 4050 5950 2    50   ~ 0
OUT2
NoConn ~ 2300 6000
NoConn ~ 4150 6000
$Comp
L power:GNDREF #PWR08
U 1 1 5FE9C845
P 4150 6200
F 0 "#PWR08" H 4150 5950 50  0001 C CNN
F 1 "GNDREF" H 4150 6050 50  0001 C CNN
F 2 "" H 4150 6200 50  0001 C CNN
F 3 "" H 4150 6200 50  0001 C CNN
	1    4150 6200
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR09
U 1 1 5FE9C846
P 2300 6200
F 0 "#PWR09" H 2300 5950 50  0001 C CNN
F 1 "GNDREF" H 2300 6050 50  0001 C CNN
F 2 "" H 2300 6200 50  0001 C CNN
F 3 "" H 2300 6200 50  0001 C CNN
	1    2300 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR013
U 1 1 5FE9BD85
P 3250 1700
F 0 "#PWR013" H 3250 1450 50  0001 C CNN
F 1 "GNDREF" H 3250 1550 50  0001 C CNN
F 2 "" H 3250 1700 50  0001 C CNN
F 3 "" H 3250 1700 50  0001 C CNN
	1    3250 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR015
U 1 1 5FEAB3D1
P 3600 5700
F 0 "#PWR015" H 3600 5450 50  0001 C CNN
F 1 "GNDREF" H 3600 5550 50  0001 C CNN
F 2 "" H 3600 5700 50  0001 C CNN
F 3 "" H 3600 5700 50  0001 C CNN
	1    3600 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D7
U 1 1 5FEAB52B
P 3275 6350
F 0 "D7" H 3275 6450 50  0000 C CNN
F 1 "LED" H 3275 6200 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 3275 6350 50  0001 C CNN
F 3 "" H 3275 6350 50  0001 C CNN
F 4 "" H 3275 6350 50  0001 C CNN "Part"
F 5 "-smtmfg" H 3275 6350 50  0001 C CNN "Config"
F 6 "3mm LED" H 3275 6350 50  0001 C CNN "Type"
	1    3275 6350
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D8
U 1 1 5FEAB576
P 3275 6650
F 0 "D8" H 3275 6750 50  0000 C CNN
F 1 "LED" H 3275 6500 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 3275 6650 50  0001 C CNN
F 3 "" H 3275 6650 50  0001 C CNN
F 4 "" H 3275 6650 50  0001 C CNN "Part"
F 5 "-smtmfg" H 3275 6650 50  0001 C CNN "Config"
F 6 "3mm LED" H 3275 6650 50  0001 C CNN "Type"
	1    3275 6650
	1    0    0    -1  
$EndComp
Text Label 3550 3450 0    50   ~ 0
P1_POT
Text Label 3550 2450 0    50   ~ 0
P2_POT
Text Label 3550 1450 0    50   ~ 0
P3_POT
Text Label 2800 5600 0    50   ~ 0
CLK_LED
Text Label 2575 6500 0    50   ~ 0
LED_POS
Text Label 3975 6500 2    50   ~ 0
LED_NEG
Wire Wire Line
	3250 1200 3250 1300
Wire Wire Line
	3250 2200 3250 2300
Wire Wire Line
	3250 2600 3250 2700
Wire Wire Line
	3250 3200 3250 3300
Wire Wire Line
	3250 3600 3250 3700
Wire Wire Line
	2300 4350 2800 4350
Wire Wire Line
	4175 4350 3675 4350
Wire Wire Line
	2300 4500 2300 4600
Wire Wire Line
	4175 4500 4175 4600
Wire Wire Line
	2300 5950 2425 5950
Wire Wire Line
	4150 5950 4050 5950
Wire Wire Line
	2300 6100 2300 6200
Wire Wire Line
	4150 6100 4150 6200
Wire Wire Line
	3400 1450 3550 1450
Wire Wire Line
	3400 2450 3550 2450
Wire Wire Line
	3400 3450 3550 3450
Wire Wire Line
	3150 5600 2800 5600
Wire Wire Line
	3450 5600 3600 5600
Wire Wire Line
	3600 5600 3600 5700
Wire Wire Line
	3525 6650 3425 6650
Wire Wire Line
	3525 6350 3525 6500
Wire Wire Line
	3525 6350 3425 6350
Wire Wire Line
	3125 6350 3025 6350
Wire Wire Line
	3025 6350 3025 6500
Wire Wire Line
	3025 6650 3125 6650
Wire Wire Line
	2575 6500 3025 6500
Connection ~ 3025 6500
Wire Wire Line
	3525 6500 3975 6500
Connection ~ 3525 6500
Wire Wire Line
	3025 6500 3025 6650
Wire Wire Line
	3525 6500 3525 6650
$Comp
L Device:LED D6
U 1 1 5FEAACC9
P 3300 5600
F 0 "D6" H 3300 5700 50  0000 C CNN
F 1 "LED" H 3300 5450 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 3300 5600 50  0001 C CNN
F 3 "" H 3300 5600 50  0001 C CNN
F 4 "" H 3300 5600 50  0001 C CNN "Part"
F 5 "-smtmfg" H 3300 5600 50  0001 C CNN "Config"
F 6 "3mm LED" H 3300 5600 50  0001 C CNN "Type"
	1    3300 5600
	-1   0    0    1   
$EndComp
$Comp
L power:-5V #PWR0107
U 1 1 60F4B0CA
P 3250 2700
F 0 "#PWR0107" H 3250 2800 50  0001 C CNN
F 1 "-5V" H 3265 2873 50  0000 C CNN
F 2 "" H 3250 2700 50  0001 C CNN
F 3 "" H 3250 2700 50  0001 C CNN
	1    3250 2700
	-1   0    0    1   
$EndComp
$Comp
L power:-5V #PWR0108
U 1 1 60F4B6F0
P 3250 3700
F 0 "#PWR0108" H 3250 3800 50  0001 C CNN
F 1 "-5V" H 3265 3873 50  0000 C CNN
F 2 "" H 3250 3700 50  0001 C CNN
F 3 "" H 3250 3700 50  0001 C CNN
	1    3250 3700
	-1   0    0    1   
$EndComp
Wire Wire Line
	4075 5350 4175 5350
$Comp
L Connector:Conn_01x07_Male J?
U 1 1 61DF2F72
P 7625 4875
AR Path="/61DF2F72" Ref="J?"  Part="1" 
AR Path="/5FE97452/61DF2F72" Ref="J?"  Part="1" 
AR Path="/5FE9B0F3/61DF2F72" Ref="J7"  Part="1" 
F 0 "J7" H 7625 5300 50  0000 C CNN
F 1 "B1_HDR" V 7525 4875 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07_Pitch2.54mm" H 7625 4875 50  0001 C CNN
F 3 "" H 7625 4875 50  0001 C CNN
F 4 "" H 7625 4875 50  0001 C CNN "Part"
F 5 "-smtmfg" H 7625 4875 50  0001 C CNN "Config"
F 6 "1x7 Male Pin Header" H 7625 4875 50  0001 C CNN "Type"
	1    7625 4875
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x07_Male J?
U 1 1 61DF2F7C
P 9350 4875
AR Path="/61DF2F7C" Ref="J?"  Part="1" 
AR Path="/5FE97452/61DF2F7C" Ref="J?"  Part="1" 
AR Path="/5FE9B0F3/61DF2F7C" Ref="J8"  Part="1" 
F 0 "J8" H 9350 5300 50  0000 C CNN
F 1 "B1_HDR" V 9250 4875 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07_Pitch2.54mm" H 9350 4875 50  0001 C CNN
F 3 "" H 9350 4875 50  0001 C CNN
F 4 "" H 9350 4875 50  0001 C CNN "Part"
F 5 "-smtmfg" H 9350 4875 50  0001 C CNN "Config"
F 6 "1x7 Male Pin Header" H 9350 4875 50  0001 C CNN "Type"
	1    9350 4875
	-1   0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 6029459B
P 8575 5525
F 0 "H1" H 8675 5571 50  0000 L CNN
F 1 "MountingHole" H 8675 5480 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 8575 5525 50  0001 C CNN
F 3 "~" H 8575 5525 50  0001 C CNN
F 4 "Yes" H 8575 5525 50  0001 C CNN "Exclude"
F 5 "do not fit" H 8575 5525 50  0001 C CNN "Config"
	1    8575 5525
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 602D0D5F
P 6225 1525
AR Path="/5FE97452/602D0D5F" Ref="R?"  Part="1" 
AR Path="/5FE9B0F3/602D0D5F" Ref="R3"  Part="1" 
F 0 "R3" V 6305 1525 50  0000 C CNN
F 1 "10k" V 6225 1525 50  0000 C CNN
F 2 "SDIY:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 6155 1525 50  0001 C CNN
F 3 "" H 6225 1525 50  0001 C CNN
F 4 "" H 6225 1525 50  0001 C CNN "Part"
F 5 "1%" H 6225 1525 50  0001 C CNN "Tolerance"
F 6 "C17414" H 6225 1525 50  0001 C CNN "LCSC"
F 7 "Yes" H 6225 1525 50  0001 C CNN "SMT Place"
F 8 "R_0805" H 6225 1525 50  0001 C CNN "SMT package"
F 9 "1% Metal Film Resistor" H 6225 1525 50  0001 C CNN "Type"
	1    6225 1525
	0    1    -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 602D0D65
P 6225 1225
AR Path="/5FE97452/602D0D65" Ref="R?"  Part="1" 
AR Path="/5FE9B0F3/602D0D65" Ref="R1"  Part="1" 
F 0 "R1" V 6305 1225 50  0000 C CNN
F 1 "10k" V 6225 1225 50  0000 C CNN
F 2 "SDIY:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 6155 1225 50  0001 C CNN
F 3 "" H 6225 1225 50  0001 C CNN
F 4 "" H 6225 1225 50  0001 C CNN "Part"
F 5 "1%" H 6225 1225 50  0001 C CNN "Tolerance"
F 6 "C17414" H 6225 1225 50  0001 C CNN "LCSC"
F 7 "Yes" H 6225 1225 50  0001 C CNN "SMT Place"
F 8 "R_0805" H 6225 1225 50  0001 C CNN "SMT package"
F 9 "1% Metal Film Resistor" H 6225 1225 50  0001 C CNN "Type"
	1    6225 1225
	0    1    -1   0   
$EndComp
Wire Wire Line
	6375 1525 6525 1525
Wire Wire Line
	6375 1225 6525 1225
Wire Wire Line
	6525 1225 6525 1525
Connection ~ 6525 1525
Text Notes 6010 1500 2    30   ~ 0
+5\n\n-5
Wire Notes Line
	5905 1475 5865 1475
Wire Notes Line
	5865 1475 5865 1375
Wire Notes Line
	5865 1375 5795 1375
Wire Notes Line
	5795 1375 5795 1475
Wire Notes Line
	5795 1475 5755 1475
Text Notes 6010 1200 2    30   ~ 0
+5\n\n-5
Wire Notes Line
	5905 1175 5865 1175
Wire Notes Line
	5865 1175 5865 1075
Wire Notes Line
	5865 1075 5795 1075
Wire Notes Line
	5795 1075 5795 1175
Wire Notes Line
	5795 1175 5755 1175
Text Notes 6715 1395 0    30   ~ 0
+2.5\n\n-2.5
Wire Notes Line
	6705 1375 6665 1375
Wire Notes Line
	6665 1375 6665 1275
Wire Notes Line
	6665 1275 6595 1275
Wire Notes Line
	6595 1275 6595 1375
Wire Notes Line
	6595 1375 6555 1375
Text Notes 6550 1825 2    40   ~ 0
Could really be -12V to +12V, but voltages are\nclamped before reaching the MCU so it’s fine\nto speak in terms of expected input.
Text Label 5525 1225 2    50   ~ 0
P2_POT
Text Label 5525 1525 2    50   ~ 0
P2_CV
Wire Wire Line
	6525 1525 7250 1525
Wire Wire Line
	5525 1225 6075 1225
Wire Wire Line
	5525 1525 6075 1525
Text Label 7250 1525 2    50   ~ 0
P2_AVG
$Comp
L Device:R R?
U 1 1 603377A1
P 6200 2350
AR Path="/5FE97452/603377A1" Ref="R?"  Part="1" 
AR Path="/5FE9B0F3/603377A1" Ref="R9"  Part="1" 
F 0 "R9" V 6280 2350 50  0000 C CNN
F 1 "10k" V 6200 2350 50  0000 C CNN
F 2 "SDIY:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 6130 2350 50  0001 C CNN
F 3 "" H 6200 2350 50  0001 C CNN
F 4 "" H 6200 2350 50  0001 C CNN "Part"
F 5 "1%" H 6200 2350 50  0001 C CNN "Tolerance"
F 6 "C17414" H 6200 2350 50  0001 C CNN "LCSC"
F 7 "Yes" H 6200 2350 50  0001 C CNN "SMT Place"
F 8 "R_0805" H 6200 2350 50  0001 C CNN "SMT package"
F 9 "1% Metal Film Resistor" H 6200 2350 50  0001 C CNN "Type"
	1    6200 2350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 603377A7
P 6200 2050
AR Path="/5FE97452/603377A7" Ref="R?"  Part="1" 
AR Path="/5FE9B0F3/603377A7" Ref="R7"  Part="1" 
F 0 "R7" V 6280 2050 50  0000 C CNN
F 1 "10k" V 6200 2050 50  0000 C CNN
F 2 "SDIY:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 6130 2050 50  0001 C CNN
F 3 "" H 6200 2050 50  0001 C CNN
F 4 "" H 6200 2050 50  0001 C CNN "Part"
F 5 "1%" H 6200 2050 50  0001 C CNN "Tolerance"
F 6 "C17414" H 6200 2050 50  0001 C CNN "LCSC"
F 7 "Yes" H 6200 2050 50  0001 C CNN "SMT Place"
F 8 "R_0805" H 6200 2050 50  0001 C CNN "SMT package"
F 9 "1% Metal Film Resistor" H 6200 2050 50  0001 C CNN "Type"
	1    6200 2050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6350 2350 6500 2350
Wire Wire Line
	6350 2050 6500 2050
Wire Wire Line
	6500 2050 6500 2350
Connection ~ 6500 2350
Text Label 5550 2050 2    50   ~ 0
P1_POT
Text Label 5550 2350 2    50   ~ 0
P1_CV
Wire Wire Line
	6500 2350 7225 2350
Wire Wire Line
	5550 2050 6050 2050
Wire Wire Line
	5550 2350 6050 2350
Text Label 7225 2350 2    50   ~ 0
P1_AVG
Text Label 8225 5075 2    50   ~ 0
P3_POT
Text Label 8225 5175 2    50   ~ 0
P2_AVG
Text Label 8800 5075 0    50   ~ 0
CLK_TRG
Text Label 8800 4975 0    50   ~ 0
CLK_LED
Text Label 8950 4575 0    50   ~ 0
OUT
Text Label 8275 4975 2    50   ~ 0
LED_POS
Text Label 8275 4875 2    50   ~ 0
LED_NEG
Text Label 8825 5175 0    50   ~ 0
P1_AVG
Wire Wire Line
	8225 5175 7825 5175
Wire Wire Line
	8825 5175 9150 5175
$Comp
L power:+5V #PWR?
U 1 1 60541A89
P 8250 4375
AR Path="/5FE97452/60541A89" Ref="#PWR?"  Part="1" 
AR Path="/5FE9B0F3/60541A89" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 8250 4225 50  0001 C CNN
F 1 "+5V" H 8265 4548 50  0000 C CNN
F 2 "" H 8250 4375 50  0001 C CNN
F 3 "" H 8250 4375 50  0001 C CNN
	1    8250 4375
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 60541A8F
P 8550 5225
AR Path="/5FE97452/60541A8F" Ref="#PWR?"  Part="1" 
AR Path="/5FE9B0F3/60541A8F" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 8550 4975 50  0001 C CNN
F 1 "GNDREF" H 8550 5075 50  0001 C CNN
F 2 "" H 8550 5225 50  0001 C CNN
F 3 "" H 8550 5225 50  0001 C CNN
	1    8550 5225
	1    0    0    -1  
$EndComp
$Comp
L power:-5V #PWR?
U 1 1 60541A95
P 8425 4375
AR Path="/5FE97452/60541A95" Ref="#PWR?"  Part="1" 
AR Path="/5FE9B0F3/60541A95" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 8425 4475 50  0001 C CNN
F 1 "-5V" H 8440 4548 50  0000 C CNN
F 2 "" H 8425 4375 50  0001 C CNN
F 3 "" H 8425 4375 50  0001 C CNN
	1    8425 4375
	1    0    0    -1  
$EndComp
Connection ~ 8550 4875
Wire Wire Line
	8550 4875 9150 4875
Wire Wire Line
	8250 4375 8250 4575
Wire Wire Line
	7825 4575 8250 4575
Wire Wire Line
	8950 4575 9150 4575
Wire Wire Line
	7825 4675 8425 4675
Wire Wire Line
	8425 4675 8425 4375
Wire Wire Line
	8550 4875 8550 4775
Connection ~ 8550 4775
Wire Wire Line
	9150 4775 8550 4775
Wire Wire Line
	7825 5075 8225 5075
Wire Wire Line
	8800 5075 9150 5075
Wire Wire Line
	7825 4975 8275 4975
Wire Wire Line
	7825 4875 8275 4875
Wire Wire Line
	9150 4975 8800 4975
Wire Wire Line
	8550 4775 8550 4675
Wire Wire Line
	8550 4675 9150 4675
$Comp
L power:GNDREF #PWR?
U 1 1 608FB22D
P 6500 3075
AR Path="/5FE97452/608FB22D" Ref="#PWR?"  Part="1" 
AR Path="/5FE9B0F3/608FB22D" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 6500 2825 50  0001 C CNN
F 1 "GNDREF" H 6500 2925 50  0001 C CNN
F 2 "" H 6500 3075 50  0001 C CNN
F 3 "" H 6500 3075 50  0001 C CNN
	1    6500 3075
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3025 6500 3075
Wire Wire Line
	6500 2675 6500 2725
Wire Wire Line
	6500 2675 5550 2675
Text Label 5550 2675 2    50   ~ 0
CLK_TRG
Connection ~ 6500 2675
Text Label 7750 1850 2    50   ~ 0
OUT
Wire Wire Line
	7750 1850 8175 1850
Text Label 9050 1650 2    50   ~ 0
OUT1
Text Label 9050 2050 2    50   ~ 0
OUT2
Wire Wire Line
	8475 1850 8700 1850
Wire Wire Line
	8700 1850 8700 1650
Wire Wire Line
	8700 1650 9050 1650
Wire Wire Line
	8700 1850 8700 2050
Wire Wire Line
	8700 2050 9050 2050
Connection ~ 8700 1850
Text Label 4075 5350 2    50   ~ 0
DITTO
Wire Wire Line
	6500 2675 6775 2675
Wire Wire Line
	8475 2675 9050 2675
Text Label 9050 2675 2    50   ~ 0
DITTO
Wire Wire Line
	2300 4400 3250 4400
Connection ~ 3250 4400
Wire Wire Line
	3250 4400 4175 4400
$Comp
L Device:R R?
U 1 1 60AA80E9
P 3250 4725
AR Path="/5FE97452/60AA80E9" Ref="R?"  Part="1" 
AR Path="/5FE9B0F3/60AA80E9" Ref="R29"  Part="1" 
F 0 "R29" V 3330 4725 50  0000 C CNN
F 1 "R_lim" V 3250 4725 40  0000 C CNN
F 2 "SDIY:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 3180 4725 50  0001 C CNN
F 3 "" H 3250 4725 50  0001 C CNN
F 4 "Use 1k 1/4W or 2k 1/8W" H 3250 4725 50  0001 C CNN "Note"
F 5 "" H 3250 4725 50  0001 C CNN "Part"
F 6 "1/4W" H 3250 4725 50  0001 C CNN "Power Rating"
F 7 "Yes" H 3250 4725 50  0001 C CNN "SMT Place"
F 8 "C4410" H 3250 4725 50  0001 C CNN "LCSC"
F 9 "1206 1/4W" H 3250 4725 50  0001 C CNN "SMT Note"
F 10 "R_0805 or R_1206" H 3250 4725 50  0001 C CNN "SMT package"
F 11 "5% Resistor" H 3250 4725 50  0001 C CNN "Type"
	1    3250 4725
	-1   0    0    1   
$EndComp
Wire Wire Line
	3250 4400 3250 4575
$Comp
L power:GNDREF #PWR014
U 1 1 60AAA9DE
P 3250 4925
F 0 "#PWR014" H 3250 4675 50  0001 C CNN
F 1 "GNDREF" H 3250 4775 50  0001 C CNN
F 2 "" H 3250 4925 50  0001 C CNN
F 3 "" H 3250 4925 50  0001 C CNN
	1    3250 4925
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4875 3250 4925
Wire Wire Line
	2800 4350 2800 4175
Wire Wire Line
	3675 4175 3675 4350
Wire Wire Line
	6775 2675 6775 2925
Wire Wire Line
	6775 2925 7225 2925
Connection ~ 6775 2675
Wire Wire Line
	6775 2675 8175 2675
Text Label 7225 2925 2    50   ~ 0
CLK_TRG
Wire Wire Line
	8550 4875 8550 5225
NoConn ~ 7825 4775
Wire Wire Line
	2300 5350 2400 5350
NoConn ~ 2300 5300
Text Label 2400 5350 0    50   ~ 0
CLK_TRG
$Comp
L SDIY:JACK_MONO_NoRing J3
U 1 1 5FE9C83D
P 1850 5300
F 0 "J3" H 1900 5100 50  0000 C CNN
F 1 "3.5mm Mono Jack" H 2000 5450 50  0001 C CNN
F 2 "SDIY:PJ301M-12_Thonkiconn_NoGround" H 1850 5300 50  0001 C CNN
F 3 "" H 1850 5300 50  0001 C CNN
F 4 "" H 1850 5300 50  0001 C CNN "Part"
F 5 "-smtmfg" H 1850 5300 50  0001 C CNN "Config"
F 6 "Thonkiconn Jack" H 1850 5300 50  0001 C CNN "Type"
	1    1850 5300
	1    0    0    1   
$EndComp
Text Notes 2150 5125 0    50   ~ 0
Ground pin shared\nwith J1
Text Notes 4325 5125 2    50   ~ 0
Ground pin shared\nwith J2
Wire Wire Line
	3250 1600 3250 1700
$Comp
L power:GNDREF #PWR0119
U 1 1 6021A020
P 3050 1500
F 0 "#PWR0119" H 3050 1250 50  0001 C CNN
F 1 "GNDREF" H 3050 1350 50  0001 C CNN
F 2 "" H 3050 1500 50  0001 C CNN
F 3 "" H 3050 1500 50  0001 C CNN
	1    3050 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1450 3050 1500
$Comp
L power:GNDREF #PWR0123
U 1 1 6021E886
P 3050 2525
F 0 "#PWR0123" H 3050 2275 50  0001 C CNN
F 1 "GNDREF" H 3050 2375 50  0001 C CNN
F 2 "" H 3050 2525 50  0001 C CNN
F 3 "" H 3050 2525 50  0001 C CNN
	1    3050 2525
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2525 3050 2450
$Comp
L power:GNDREF #PWR0124
U 1 1 6022381F
P 3050 3525
F 0 "#PWR0124" H 3050 3275 50  0001 C CNN
F 1 "GNDREF" H 3050 3375 50  0001 C CNN
F 2 "" H 3050 3525 50  0001 C CNN
F 3 "" H 3050 3525 50  0001 C CNN
	1    3050 3525
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 3525 3050 3450
Text Notes 6700 6475 0    60   ~ 0
NOTES:\n\n- R15/R21: Use 1k for 1/4W resistors. Use 2k for 1/8W resistors.\n\n- D8 can be omitted from Board 1 but must be replaced\n   with a regular switching diode to avoid damage to D7.
$Comp
L Device:R R?
U 1 1 61B5CD54
P 8325 2675
AR Path="/5FE97452/61B5CD54" Ref="R?"  Part="1" 
AR Path="/5FE9B0F3/61B5CD54" Ref="R15"  Part="1" 
F 0 "R15" V 8405 2675 50  0000 C CNN
F 1 "R_lim" V 8325 2675 40  0000 C CNN
F 2 "SDIY:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 8255 2675 50  0001 C CNN
F 3 "" H 8325 2675 50  0001 C CNN
F 4 "Use 1k 1/4W or 2k 1/8W" H 8325 2675 50  0001 C CNN "Note"
F 5 "" H 8325 2675 50  0001 C CNN "Part"
F 6 "1/4W" H 8325 2675 50  0001 C CNN "Power Rating"
F 7 "Yes" H 8325 2675 50  0001 C CNN "SMT Place"
F 8 "C4410" H 8325 2675 50  0001 C CNN "LCSC"
F 9 "1206 1/4W" H 8325 2675 50  0001 C CNN "SMT Note"
F 10 "R_0805 or R_1206" H 8325 2675 50  0001 C CNN "SMT package"
F 11 "5% Resistor" H 8325 2675 50  0001 C CNN "Type"
	1    8325 2675
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 608FB227
P 6500 2875
AR Path="/5FE97452/608FB227" Ref="R?"  Part="1" 
AR Path="/5FE9B0F3/608FB227" Ref="R17"  Part="1" 
F 0 "R17" V 6580 2875 50  0000 C CNN
F 1 "100k" V 6500 2875 50  0000 C CNN
F 2 "SDIY:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 6430 2875 50  0001 C CNN
F 3 "" H 6500 2875 50  0001 C CNN
F 4 "" H 6500 2875 50  0001 C CNN "Part"
F 5 "Yes" H 6500 2875 50  0001 C CNN "SMT Place"
F 6 "C17407" H 6500 2875 50  0001 C CNN "LCSC"
F 7 "R_0805" H 6500 2875 50  0001 C CNN "SMT package"
F 8 "5% Carbon Film Resistor" H 6500 2875 50  0001 C CNN "Type"
	1    6500 2875
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 60A49DEE
P 8325 1850
AR Path="/5FE97452/60A49DEE" Ref="R?"  Part="1" 
AR Path="/5FE9B0F3/60A49DEE" Ref="R21"  Part="1" 
F 0 "R21" V 8405 1850 50  0000 C CNN
F 1 "R_lim" V 8325 1850 40  0000 C CNN
F 2 "SDIY:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 8255 1850 50  0001 C CNN
F 3 "" H 8325 1850 50  0001 C CNN
F 4 "Use 1k 1/4W or 2k 1/8W" H 8325 1850 50  0001 C CNN "Note"
F 5 "" H 8325 1850 50  0001 C CNN "Part"
F 6 "1/4W" H 8325 1850 50  0001 C CNN "Power Rating"
F 7 "Yes" H 8325 1850 50  0001 C CNN "SMT Place"
F 8 "C4410" H 8325 1850 50  0001 C CNN "LCSC"
F 9 "1206 1/4W" H 8325 1850 50  0001 C CNN "SMT Note"
F 10 "R_0805 or R_1206" H 8325 1850 50  0001 C CNN "SMT package"
F 11 "5% Resistor" H 8325 1850 50  0001 C CNN "Type"
	1    8325 1850
	0    1    -1   0   
$EndComp
$EndSCHEMATC
