EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
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
L hydromisc:MOLEX_2x1 CN2
U 1 1 6036CB99
P 6350 5400
F 0 "CN2" H 6500 5473 50  0000 C CNN
F 1 "MOLEX_2x1" H 6800 5450 50  0001 C CNN
F 2 "hydromisc:HM_MOLEX_172448_2x1" H 6400 5400 50  0001 C CNN
F 3 "" H 6400 5400 50  0001 C CNN
	1    6350 5400
	-1   0    0    1   
$EndComp
$Comp
L hydromisc:MOLEX_2x4 CN5
U 1 1 6036E9ED
P 7150 850
F 0 "CN5" H 7300 923 50  0000 C CNN
F 1 "MOLEX_2x4" H 7600 900 50  0001 C CNN
F 2 "hydromisc:HM_MOLEX_172448_2x4" H 7200 850 50  0001 C CNN
F 3 "" H 7200 850 50  0001 C CNN
	1    7150 850 
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:MOLEX_2x1 CN7
U 1 1 60374B4B
P 6350 5650
F 0 "CN7" H 6500 5723 50  0000 C CNN
F 1 "MOLEX_2x1" H 6800 5700 50  0001 C CNN
F 2 "hydromisc:HM_MOLEX_172448_2x1" H 6400 5650 50  0001 C CNN
F 3 "" H 6400 5650 50  0001 C CNN
	1    6350 5650
	-1   0    0    1   
$EndComp
$Comp
L hydromisc:MOLEX_2x1 CN8
U 1 1 60375177
P 6350 5900
F 0 "CN8" H 6500 5973 50  0000 C CNN
F 1 "MOLEX_2x1" H 6800 5950 50  0001 C CNN
F 2 "hydromisc:HM_MOLEX_172448_2x1" H 6400 5900 50  0001 C CNN
F 3 "" H 6400 5900 50  0001 C CNN
	1    6350 5900
	-1   0    0    1   
$EndComp
$Comp
L hydromisc:MOLEX_2x1 CN9
U 1 1 60375299
P 6350 6150
F 0 "CN9" H 6500 6223 50  0000 C CNN
F 1 "MOLEX_2x1" H 6800 6200 50  0001 C CNN
F 2 "hydromisc:HM_MOLEX_172448_2x1" H 6400 6150 50  0001 C CNN
F 3 "" H 6400 6150 50  0001 C CNN
	1    6350 6150
	-1   0    0    1   
$EndComp
$Comp
L hydromisc:MOLEX_2x1 CN10
U 1 1 60375581
P 6350 6400
F 0 "CN10" H 6500 6473 50  0000 C CNN
F 1 "MOLEX_2x1" H 6800 6450 50  0001 C CNN
F 2 "hydromisc:HM_MOLEX_172448_2x1" H 6400 6400 50  0001 C CNN
F 3 "" H 6400 6400 50  0001 C CNN
	1    6350 6400
	-1   0    0    1   
$EndComp
$Comp
L hydromisc:MOLEX_2x1 CN11
U 1 1 60375849
P 6350 6650
F 0 "CN11" H 6500 6723 50  0000 C CNN
F 1 "MOLEX_2x1" H 6800 6700 50  0001 C CNN
F 2 "hydromisc:HM_MOLEX_172448_2x1" H 6400 6650 50  0001 C CNN
F 3 "" H 6400 6650 50  0001 C CNN
	1    6350 6650
	-1   0    0    1   
$EndComp
$Comp
L hydromisc:NFET Q1
U 1 1 6047F318
P 950 4050
F 0 "Q1" H 1194 3950 50  0000 L CNN
F 1 "NFET" H 950 4050 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 950 4050 50  0001 C CNN
F 3 "" H 950 4050 50  0001 C CNN
	1    950  4050
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D3
U 1 1 604851C4
P 1100 3800
F 0 "D3" V 1350 3850 50  0000 R CNN
F 1 "diode-schottky" H 1500 3850 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 1400 3850 50  0001 C CNN
F 3 "" V 1400 3850 50  0001 C CNN
	1    1100 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 3800 1150 3950
$Comp
L Device:R_US R5
U 1 1 60488E05
P 850 3950
F 0 "R5" H 918 3996 50  0000 L CNN
F 1 "1k" H 918 3905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 890 3940 50  0001 C CNN
F 3 "~" H 850 3950 50  0001 C CNN
	1    850  3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  4200 850  4200
Wire Wire Line
	850  4200 850  4100
Wire Wire Line
	1400 3850 1400 3950
Wire Wire Line
	1400 3950 1150 3950
Connection ~ 1150 3950
Wire Wire Line
	1150 3950 1150 4000
Wire Wire Line
	850  3800 850  3700
$Comp
L hydromisc:NFET Q2
U 1 1 6048E7E7
P 1800 4050
F 0 "Q2" H 2044 3950 50  0000 L CNN
F 1 "NFET" H 1800 4050 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 1800 4050 50  0001 C CNN
F 3 "" H 1800 4050 50  0001 C CNN
	1    1800 4050
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D4
U 1 1 6048E7ED
P 1950 3800
F 0 "D4" V 2200 3850 50  0000 R CNN
F 1 "diode-schottky" H 2350 3850 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 2250 3850 50  0001 C CNN
F 3 "" V 2250 3850 50  0001 C CNN
	1    1950 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 3800 2000 3950
$Comp
L Device:R_US R6
U 1 1 6048E7F4
P 1700 3950
F 0 "R6" H 1768 3996 50  0000 L CNN
F 1 "1k" H 1768 3905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 1740 3940 50  0001 C CNN
F 3 "~" H 1700 3950 50  0001 C CNN
	1    1700 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 4200 1700 4200
Wire Wire Line
	1700 4200 1700 4100
Wire Wire Line
	2250 3850 2250 3950
Wire Wire Line
	2250 3950 2000 3950
Connection ~ 2000 3950
Wire Wire Line
	2000 3950 2000 4000
Wire Wire Line
	1700 3800 1700 3700
$Comp
L hydromisc:NFET Q3
U 1 1 604904FC
P 2650 4050
F 0 "Q3" H 2894 3950 50  0000 L CNN
F 1 "NFET" H 2650 4050 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 2650 4050 50  0001 C CNN
F 3 "" H 2650 4050 50  0001 C CNN
	1    2650 4050
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D5
U 1 1 60490502
P 2800 3800
F 0 "D5" V 3050 3850 50  0000 R CNN
F 1 "diode-schottky" H 3200 3850 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 3100 3850 50  0001 C CNN
F 3 "" V 3100 3850 50  0001 C CNN
	1    2800 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2850 3800 2850 3950
$Comp
L Device:R_US R7
U 1 1 60490509
P 2550 3950
F 0 "R7" H 2618 3996 50  0000 L CNN
F 1 "1k" H 2618 3905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 2590 3940 50  0001 C CNN
F 3 "~" H 2550 3950 50  0001 C CNN
	1    2550 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4200 2550 4200
Wire Wire Line
	2550 4200 2550 4100
Text GLabel 3100 3850 1    50   Input ~ 0
SOL_2
Wire Wire Line
	3100 3850 3100 3950
Wire Wire Line
	3100 3950 2850 3950
Connection ~ 2850 3950
Wire Wire Line
	2850 3950 2850 4000
Text GLabel 2550 3700 1    50   Input ~ 0
G_SOL_2
Wire Wire Line
	2550 3800 2550 3700
$Comp
L hydromisc:NFET Q4
U 1 1 60491921
P 3500 4050
F 0 "Q4" H 3744 3950 50  0000 L CNN
F 1 "NFET" H 3500 4050 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 3500 4050 50  0001 C CNN
F 3 "" H 3500 4050 50  0001 C CNN
	1    3500 4050
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D6
U 1 1 60491927
P 3650 3800
F 0 "D6" V 3900 3850 50  0000 R CNN
F 1 "diode-schottky" H 4050 3850 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 3950 3850 50  0001 C CNN
F 3 "" V 3950 3850 50  0001 C CNN
	1    3650 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3700 3800 3700 3950
$Comp
L Device:R_US R8
U 1 1 6049192E
P 3400 3950
F 0 "R8" H 3468 3996 50  0000 L CNN
F 1 "1k" H 3468 3905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 3440 3940 50  0001 C CNN
F 3 "~" H 3400 3950 50  0001 C CNN
	1    3400 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4200 3400 4200
Wire Wire Line
	3400 4200 3400 4100
Text GLabel 3950 3850 1    50   Input ~ 0
SOL_3
Wire Wire Line
	3950 3850 3950 3950
Wire Wire Line
	3950 3950 3700 3950
Connection ~ 3700 3950
Wire Wire Line
	3700 3950 3700 4000
Text GLabel 3400 3700 1    50   Input ~ 0
G_SOL_3
Wire Wire Line
	3400 3800 3400 3700
$Comp
L hydromisc:NFET Q5
U 1 1 604BC343
P 4350 4050
F 0 "Q5" H 4594 3950 50  0000 L CNN
F 1 "NFET" H 4350 4050 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 4350 4050 50  0001 C CNN
F 3 "" H 4350 4050 50  0001 C CNN
	1    4350 4050
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D7
U 1 1 604BC349
P 4500 3800
F 0 "D7" V 4750 3850 50  0000 R CNN
F 1 "diode-schottky" H 4900 3850 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 4800 3850 50  0001 C CNN
F 3 "" V 4800 3850 50  0001 C CNN
	1    4500 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4550 3800 4550 3950
$Comp
L Device:R_US R9
U 1 1 604BC350
P 4250 3950
F 0 "R9" H 4318 3996 50  0000 L CNN
F 1 "1k" H 4318 3905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 4290 3940 50  0001 C CNN
F 3 "~" H 4250 3950 50  0001 C CNN
	1    4250 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 4200 4250 4200
Wire Wire Line
	4250 4200 4250 4100
Text GLabel 4800 3850 1    50   Input ~ 0
SOL_4
Wire Wire Line
	4800 3850 4800 3950
Wire Wire Line
	4800 3950 4550 3950
Connection ~ 4550 3950
Wire Wire Line
	4550 3950 4550 4000
Text GLabel 4250 3700 1    50   Input ~ 0
G_SOL_4
Wire Wire Line
	4250 3800 4250 3700
$Comp
L hydromisc:NFET Q6
U 1 1 604BC35F
P 5200 4050
F 0 "Q6" H 5444 3950 50  0000 L CNN
F 1 "NFET" H 5200 4050 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 5200 4050 50  0001 C CNN
F 3 "" H 5200 4050 50  0001 C CNN
	1    5200 4050
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D8
U 1 1 604BC365
P 5350 3800
F 0 "D8" V 5600 3850 50  0000 R CNN
F 1 "diode-schottky" H 5750 3850 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 5650 3850 50  0001 C CNN
F 3 "" V 5650 3850 50  0001 C CNN
	1    5350 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5400 3800 5400 3950
$Comp
L Device:R_US R10
U 1 1 604BC36C
P 5100 3950
F 0 "R10" H 5168 3996 50  0000 L CNN
F 1 "1k" H 5168 3905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 5140 3940 50  0001 C CNN
F 3 "~" H 5100 3950 50  0001 C CNN
	1    5100 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4200 5100 4200
Wire Wire Line
	5100 4200 5100 4100
Text GLabel 5650 3850 1    50   Input ~ 0
SOL_5
Wire Wire Line
	5650 3850 5650 3950
Wire Wire Line
	5650 3950 5400 3950
Connection ~ 5400 3950
Wire Wire Line
	5400 3950 5400 4000
Text GLabel 5100 3700 1    50   Input ~ 0
G_SOL_5
Wire Wire Line
	5100 3800 5100 3700
$Comp
L hydromisc:NFET Q7
U 1 1 604BC37B
P 6050 4050
F 0 "Q7" H 6294 3950 50  0000 L CNN
F 1 "NFET" H 6050 4050 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 6050 4050 50  0001 C CNN
F 3 "" H 6050 4050 50  0001 C CNN
	1    6050 4050
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D9
U 1 1 604BC381
P 6200 3800
F 0 "D9" V 6450 3850 50  0000 R CNN
F 1 "diode-schottky" H 6600 3850 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 6500 3850 50  0001 C CNN
F 3 "" V 6500 3850 50  0001 C CNN
	1    6200 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6250 3800 6250 3950
$Comp
L Device:R_US R11
U 1 1 604BC388
P 5950 3950
F 0 "R11" H 6018 3996 50  0000 L CNN
F 1 "1k" H 6018 3905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 5990 3940 50  0001 C CNN
F 3 "~" H 5950 3950 50  0001 C CNN
	1    5950 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4200 5950 4200
Wire Wire Line
	5950 4200 5950 4100
Text GLabel 6500 3850 1    50   Input ~ 0
SOL_6
Wire Wire Line
	6500 3850 6500 3950
Wire Wire Line
	6500 3950 6250 3950
Connection ~ 6250 3950
Wire Wire Line
	6250 3950 6250 4000
Text GLabel 5950 3700 1    50   Input ~ 0
G_SOL_6
Wire Wire Line
	5950 3800 5950 3700
$Comp
L hydromisc:NFET Q8
U 1 1 604BC397
P 6900 4050
F 0 "Q8" H 7144 3950 50  0000 L CNN
F 1 "NFET" H 6900 4050 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 6900 4050 50  0001 C CNN
F 3 "" H 6900 4050 50  0001 C CNN
	1    6900 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 3800 7100 3950
$Comp
L Device:R_US R12
U 1 1 604BC3A4
P 6800 3950
F 0 "R12" H 6868 3996 50  0000 L CNN
F 1 "1k" H 6868 3905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 6840 3940 50  0001 C CNN
F 3 "~" H 6800 3950 50  0001 C CNN
	1    6800 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 4200 6800 4200
Wire Wire Line
	6800 4200 6800 4100
Text GLabel 7350 3850 1    50   Input ~ 0
SOL_7
Wire Wire Line
	7350 3850 7350 3950
Wire Wire Line
	7350 3950 7100 3950
Connection ~ 7100 3950
Wire Wire Line
	7100 3950 7100 4000
Text GLabel 6800 3700 1    50   Input ~ 0
G_SOL_7
Wire Wire Line
	6800 3800 6800 3700
$Comp
L power:GND #PWR0108
U 1 1 604BD85F
P 7100 4400
F 0 "#PWR0108" H 7100 4150 50  0001 C CNN
F 1 "GND" H 7105 4227 50  0000 C CNN
F 2 "" H 7100 4400 50  0001 C CNN
F 3 "" H 7100 4400 50  0001 C CNN
	1    7100 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0109
U 1 1 604BED40
P 1150 3100
F 0 "#PWR0109" H 1150 2950 50  0001 C CNN
F 1 "+12V" H 1165 3273 50  0000 C CNN
F 2 "" H 1150 3100 50  0001 C CNN
F 3 "" H 1150 3100 50  0001 C CNN
	1    1150 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 3100 1150 3200
Wire Wire Line
	4550 3200 5400 3200
Wire Wire Line
	5400 3200 5400 3500
Wire Wire Line
	5400 3200 6250 3200
Wire Wire Line
	6250 3200 6250 3500
Wire Wire Line
	6250 3200 7100 3200
Wire Wire Line
	7100 3200 7100 3500
Connection ~ 6250 3200
Wire Wire Line
	7100 4400 7100 4350
Wire Wire Line
	7100 4350 6250 4350
Wire Wire Line
	6250 4350 6250 4300
Connection ~ 7100 4350
Wire Wire Line
	7100 4350 7100 4300
Wire Wire Line
	6250 4350 5400 4350
Wire Wire Line
	5400 4350 5400 4300
Connection ~ 6250 4350
Wire Wire Line
	5400 4350 4550 4350
Wire Wire Line
	4550 4350 4550 4300
Connection ~ 5400 4350
Wire Wire Line
	4550 4350 3700 4350
Wire Wire Line
	3700 4350 3700 4300
Connection ~ 4550 4350
Wire Wire Line
	3700 4350 2850 4350
Wire Wire Line
	2850 4350 2850 4300
Connection ~ 3700 4350
Wire Wire Line
	2850 4350 2000 4350
Wire Wire Line
	2000 4350 2000 4300
Connection ~ 2850 4350
Wire Wire Line
	2000 4350 1150 4350
Wire Wire Line
	1150 4350 1150 4300
Connection ~ 2000 4350
Connection ~ 4550 3200
Connection ~ 5400 3200
Wire Wire Line
	1150 3200 2000 3200
Wire Wire Line
	1150 3500 1150 3200
Connection ~ 1150 3200
Wire Wire Line
	2000 3500 2000 3200
Connection ~ 2000 3200
Wire Wire Line
	2000 3200 2850 3200
Wire Wire Line
	2850 3500 2850 3200
Connection ~ 2850 3200
Wire Wire Line
	2850 3200 3700 3200
Wire Wire Line
	3700 3500 3700 3200
Connection ~ 3700 3200
Wire Wire Line
	3700 3200 4550 3200
$Comp
L hydromisc:NFET Q9
U 1 1 60535D05
P 950 6500
F 0 "Q9" H 1194 6400 50  0000 L CNN
F 1 "NFET" H 950 6500 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 950 6500 50  0001 C CNN
F 3 "" H 950 6500 50  0001 C CNN
	1    950  6500
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D11
U 1 1 60535D0B
P 1100 6250
F 0 "D11" V 1350 6350 50  0000 R CNN
F 1 "diode-schottky" H 1500 6300 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 1400 6300 50  0001 C CNN
F 3 "" V 1400 6300 50  0001 C CNN
	1    1100 6250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 6250 1150 6400
$Comp
L Device:R_US R13
U 1 1 60535D12
P 850 6400
F 0 "R13" H 918 6446 50  0000 L CNN
F 1 "1k" H 918 6355 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 890 6390 50  0001 C CNN
F 3 "~" H 850 6400 50  0001 C CNN
	1    850  6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  6650 850  6650
Wire Wire Line
	850  6650 850  6550
Wire Wire Line
	1400 6300 1400 6400
Wire Wire Line
	1400 6400 1150 6400
Connection ~ 1150 6400
Wire Wire Line
	1150 6400 1150 6450
Wire Wire Line
	850  6250 850  6150
$Comp
L hydromisc:NFET Q10
U 1 1 60535D21
P 1800 6500
F 0 "Q10" H 2044 6400 50  0000 L CNN
F 1 "NFET" H 1800 6500 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 1800 6500 50  0001 C CNN
F 3 "" H 1800 6500 50  0001 C CNN
	1    1800 6500
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D12
U 1 1 60535D27
P 1950 6250
F 0 "D12" V 2200 6350 50  0000 R CNN
F 1 "diode-schottky" H 2350 6300 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 2250 6300 50  0001 C CNN
F 3 "" V 2250 6300 50  0001 C CNN
	1    1950 6250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 6250 2000 6400
$Comp
L Device:R_US R14
U 1 1 60535D2E
P 1700 6400
F 0 "R14" H 1768 6446 50  0000 L CNN
F 1 "1k" H 1768 6355 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 1740 6390 50  0001 C CNN
F 3 "~" H 1700 6400 50  0001 C CNN
	1    1700 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 6650 1700 6650
Wire Wire Line
	1700 6650 1700 6550
Wire Wire Line
	2250 6300 2250 6400
Wire Wire Line
	2250 6400 2000 6400
Connection ~ 2000 6400
Wire Wire Line
	2000 6400 2000 6450
Wire Wire Line
	1700 6250 1700 6150
$Comp
L hydromisc:NFET Q11
U 1 1 60535D3D
P 2650 6500
F 0 "Q11" H 2894 6400 50  0000 L CNN
F 1 "NFET" H 2650 6500 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 2650 6500 50  0001 C CNN
F 3 "" H 2650 6500 50  0001 C CNN
	1    2650 6500
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D13
U 1 1 60535D43
P 2800 6250
F 0 "D13" V 3050 6350 50  0000 R CNN
F 1 "diode-schottky" H 3200 6300 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 3100 6300 50  0001 C CNN
F 3 "" V 3100 6300 50  0001 C CNN
	1    2800 6250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2850 6250 2850 6400
$Comp
L Device:R_US R15
U 1 1 60535D4A
P 2550 6400
F 0 "R15" H 2618 6446 50  0000 L CNN
F 1 "1k" H 2618 6355 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 2590 6390 50  0001 C CNN
F 3 "~" H 2550 6400 50  0001 C CNN
	1    2550 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 6650 2550 6650
Wire Wire Line
	2550 6650 2550 6550
Wire Wire Line
	3100 6300 3100 6400
Wire Wire Line
	3100 6400 2850 6400
Connection ~ 2850 6400
Wire Wire Line
	2850 6400 2850 6450
Wire Wire Line
	2550 6250 2550 6150
$Comp
L hydromisc:NFET Q12
U 1 1 60535D59
P 3500 6500
F 0 "Q12" H 3744 6400 50  0000 L CNN
F 1 "NFET" H 3500 6500 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 3500 6500 50  0001 C CNN
F 3 "" H 3500 6500 50  0001 C CNN
	1    3500 6500
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D14
U 1 1 60535D5F
P 3650 6250
F 0 "D14" V 3900 6350 50  0000 R CNN
F 1 "diode-schottky" H 4050 6300 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 3950 6300 50  0001 C CNN
F 3 "" V 3950 6300 50  0001 C CNN
	1    3650 6250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3700 6250 3700 6400
$Comp
L Device:R_US R16
U 1 1 60535D66
P 3400 6400
F 0 "R16" H 3468 6446 50  0000 L CNN
F 1 "1k" H 3468 6355 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 3440 6390 50  0001 C CNN
F 3 "~" H 3400 6400 50  0001 C CNN
	1    3400 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 6650 3400 6650
Wire Wire Line
	3400 6650 3400 6550
Wire Wire Line
	3950 6300 3950 6400
Wire Wire Line
	3950 6400 3700 6400
Connection ~ 3700 6400
Wire Wire Line
	3700 6400 3700 6450
Wire Wire Line
	3400 6250 3400 6150
$Comp
L hydromisc:NFET Q13
U 1 1 60535D75
P 4350 6500
F 0 "Q13" H 4594 6400 50  0000 L CNN
F 1 "NFET" H 4350 6500 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 4350 6500 50  0001 C CNN
F 3 "" H 4350 6500 50  0001 C CNN
	1    4350 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 6250 4550 6400
$Comp
L Device:R_US R17
U 1 1 60535D82
P 4250 6400
F 0 "R17" H 4318 6446 50  0000 L CNN
F 1 "1k" H 4318 6355 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 4290 6390 50  0001 C CNN
F 3 "~" H 4250 6400 50  0001 C CNN
	1    4250 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 6650 4250 6650
Wire Wire Line
	4250 6650 4250 6550
Wire Wire Line
	4800 6300 4800 6400
Wire Wire Line
	4800 6400 4550 6400
Connection ~ 4550 6400
Wire Wire Line
	4550 6400 4550 6450
Wire Wire Line
	4250 6250 4250 6150
Wire Wire Line
	4550 6800 4550 6750
Wire Wire Line
	4550 6800 3700 6800
Wire Wire Line
	3700 6800 3700 6750
Wire Wire Line
	3700 6800 2850 6800
Wire Wire Line
	2850 6800 2850 6750
Connection ~ 3700 6800
Wire Wire Line
	2850 6800 2000 6800
Wire Wire Line
	2000 6800 2000 6750
Connection ~ 2850 6800
Wire Wire Line
	2000 6800 1150 6800
Wire Wire Line
	1150 6800 1150 6750
Connection ~ 2000 6800
Wire Wire Line
	1150 5650 2000 5650
Wire Wire Line
	1150 5950 1150 5650
Wire Wire Line
	2000 5950 2000 5650
Connection ~ 2000 5650
Wire Wire Line
	2000 5650 2850 5650
Wire Wire Line
	2850 5950 2850 5650
Connection ~ 2850 5650
Wire Wire Line
	2850 5650 3700 5650
Wire Wire Line
	3700 5950 3700 5650
Connection ~ 3700 5650
$Comp
L hydromisc:NFET Q14
U 1 1 60535DC9
P 5200 6500
F 0 "Q14" H 5444 6400 50  0000 L CNN
F 1 "NFET" H 5200 6500 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 5200 6500 50  0001 C CNN
F 3 "" H 5200 6500 50  0001 C CNN
	1    5200 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 6250 5400 6400
$Comp
L Device:R_US R18
U 1 1 60535DD6
P 5100 6400
F 0 "R18" H 5168 6446 50  0000 L CNN
F 1 "1k" H 5168 6355 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 5140 6390 50  0001 C CNN
F 3 "~" H 5100 6400 50  0001 C CNN
	1    5100 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 6650 5100 6650
Wire Wire Line
	5100 6650 5100 6550
Wire Wire Line
	5650 6300 5650 6400
Wire Wire Line
	5650 6400 5400 6400
Connection ~ 5400 6400
Wire Wire Line
	5400 6400 5400 6450
Wire Wire Line
	5100 6250 5100 6150
Wire Wire Line
	5400 5650 5400 5950
Wire Wire Line
	4550 6800 5400 6800
Wire Wire Line
	5400 6800 5400 6750
Connection ~ 4550 6800
Wire Wire Line
	3700 5650 4550 5650
Wire Wire Line
	4550 5950 4550 5650
Connection ~ 4550 5650
Wire Wire Line
	4550 5650 5400 5650
Wire Wire Line
	4550 3200 4550 3500
$Comp
L Device:R_US R20
U 1 1 6058F096
P 5750 6900
F 0 "R20" V 5545 6900 50  0000 C CNN
F 1 "1k" V 5636 6900 50  0000 C CNN
F 2 "hydromisc:HM_0603" V 5790 6890 50  0001 C CNN
F 3 "~" H 5750 6900 50  0001 C CNN
	1    5750 6900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 60535DE5
P 6000 7350
F 0 "#PWR04" H 6000 7100 50  0001 C CNN
F 1 "GND" H 6005 7177 50  0000 C CNN
F 2 "" H 6000 7350 50  0001 C CNN
F 3 "" H 6000 7350 50  0001 C CNN
	1    6000 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R19
U 1 1 6058F974
P 5400 7100
F 0 "R19" H 5332 7054 50  0000 R CNN
F 1 "2.2" H 5332 7145 50  0000 R CNN
F 2 "hydromisc:HM_2010" V 5440 7090 50  0001 C CNN
F 3 "~" H 5400 7100 50  0001 C CNN
	1    5400 7100
	-1   0    0    1   
$EndComp
Wire Wire Line
	5400 6800 5400 6900
Connection ~ 5400 6800
Wire Wire Line
	5600 6900 5400 6900
Connection ~ 5400 6900
Wire Wire Line
	5400 6900 5400 6950
$Comp
L Device:C C?
U 1 1 605FA0CB
P 6000 7100
AR Path="/602E8AF8/605FA0CB" Ref="C?"  Part="1" 
AR Path="/6036C67E/605FA0CB" Ref="C16"  Part="1" 
F 0 "C16" H 6115 7146 50  0000 L CNN
F 1 "100n" H 6115 7055 50  0000 L CNN
F 2 "hydromisc:HM_0603" H 6038 6950 50  0001 C CNN
F 3 "~" H 6000 7100 50  0001 C CNN
	1    6000 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 7250 6000 7300
Wire Wire Line
	6000 7300 5400 7300
Wire Wire Line
	5400 7300 5400 7250
Connection ~ 6000 7300
Wire Wire Line
	6000 7300 6000 7350
Wire Wire Line
	5900 6900 6000 6900
Wire Wire Line
	6000 6900 6000 6950
Wire Wire Line
	6100 6900 6000 6900
Connection ~ 6000 6900
Text GLabel 6100 6900 2    50   Input ~ 0
ISENSE
$Comp
L hydromisc:diode-schottky D10
U 1 1 604BC39D
P 7050 3800
F 0 "D10" V 7300 3900 50  0000 R CNN
F 1 "diode-schottky" H 7450 3850 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 7350 3850 50  0001 C CNN
F 3 "" V 7350 3850 50  0001 C CNN
	1    7050 3800
	0    -1   -1   0   
$EndComp
Text GLabel 2250 3850 1    50   Input ~ 0
SOL_1
Text GLabel 1700 3700 1    50   Input ~ 0
G_SOL_1
Text GLabel 1400 3850 1    50   Input ~ 0
SOL_0
Text GLabel 850  3700 1    50   Input ~ 0
G_SOL_0
Text GLabel 5650 6300 1    50   Input ~ 0
PUMP_5
Text GLabel 5100 6150 1    50   Input ~ 0
G_PUMP_5
Text GLabel 4800 6300 1    50   Input ~ 0
PUMP_4
Text GLabel 4250 6150 1    50   Input ~ 0
G_PUMP_4
Text GLabel 3950 6300 1    50   Input ~ 0
PUMP_3
Text GLabel 3400 6150 1    50   Input ~ 0
G_PUMP_3
Text GLabel 3100 6300 1    50   Input ~ 0
PUMP_2
Text GLabel 2550 6150 1    50   Input ~ 0
G_PUMP_2
Text GLabel 2250 6300 1    50   Input ~ 0
PUMP_1
$Comp
L hydromisc:diode-schottky D15
U 1 1 60535D7B
P 4500 6250
F 0 "D15" V 4750 6350 50  0000 R CNN
F 1 "diode-schottky" H 4900 6300 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 4800 6300 50  0001 C CNN
F 3 "" V 4800 6300 50  0001 C CNN
	1    4500 6250
	0    -1   -1   0   
$EndComp
Text GLabel 1700 6150 1    50   Input ~ 0
G_PUMP_1
Text GLabel 1400 6300 1    50   Input ~ 0
PUMP_0
Text GLabel 850  6150 1    50   Input ~ 0
G_PUMP_0
$Comp
L hydromisc:diode-schottky D16
U 1 1 60535DCF
P 5350 6250
F 0 "D16" V 5600 6350 50  0000 R CNN
F 1 "diode-schottky" H 5750 6300 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 5650 6300 50  0001 C CNN
F 3 "" V 5650 6300 50  0001 C CNN
	1    5350 6250
	0    -1   -1   0   
$EndComp
Text GLabel 8050 2600 2    50   Input ~ 0
SOL_0
Text GLabel 8050 2700 2    50   Input ~ 0
SOL_1
Text GLabel 8050 2800 2    50   Input ~ 0
SOL_2
Text GLabel 8050 2900 2    50   Input ~ 0
SOL_3
Text GLabel 7550 2900 0    50   Input ~ 0
SOL_4
Text GLabel 7550 2800 0    50   Input ~ 0
SOL_5
$Comp
L hydromisc:MOLEX_2x5 CN6
U 1 1 6036F40F
P 7650 2550
F 0 "CN6" H 7800 2623 50  0000 C CNN
F 1 "MOLEX_2x5" H 8100 2600 50  0001 C CNN
F 2 "hydromisc:HM_MOLEX_172448_2x5" H 7700 2550 50  0001 C CNN
F 3 "" H 7700 2550 50  0001 C CNN
	1    7650 2550
	1    0    0    -1  
$EndComp
Text GLabel 7550 2700 0    50   Input ~ 0
SOL_6
Text GLabel 7550 2600 0    50   Input ~ 0
SOL_7
Text GLabel 7550 3000 0    50   Input ~ 0
Vuser
$Comp
L power:+12V #PWR06
U 1 1 6063B9A7
P 8500 2500
F 0 "#PWR06" H 8500 2350 50  0001 C CNN
F 1 "+12V" H 8515 2673 50  0000 C CNN
F 2 "" H 8500 2500 50  0001 C CNN
F 3 "" H 8500 2500 50  0001 C CNN
	1    8500 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR05
U 1 1 6064D7AC
P 5400 4850
F 0 "#PWR05" H 5400 4700 50  0001 C CNN
F 1 "+12V" H 5415 5023 50  0000 C CNN
F 2 "" H 5400 4850 50  0001 C CNN
F 3 "" H 5400 4850 50  0001 C CNN
	1    5400 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R21
U 1 1 6064E41D
P 5650 4900
F 0 "R21" V 5445 4900 50  0000 C CNN
F 1 "zerohm" V 5536 4900 50  0000 C CNN
F 2 "hydromisc:HM_1206" V 5690 4890 50  0001 C CNN
F 3 "~" H 5650 4900 50  0001 C CNN
	1    5650 4900
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R22
U 1 1 6064F928
P 5650 5200
F 0 "R22" V 5445 5200 50  0000 C CNN
F 1 "dnp" V 5536 5200 50  0000 C CNN
F 2 "hydromisc:HM_1206" V 5690 5190 50  0001 C CNN
F 3 "~" H 5650 5200 50  0001 C CNN
	1    5650 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	5500 4900 5400 4900
Wire Wire Line
	5400 4900 5400 4850
Wire Wire Line
	5800 4900 5900 4900
Wire Wire Line
	5900 4900 5900 5200
Wire Wire Line
	5900 5350 5950 5350
Wire Wire Line
	5800 5200 5900 5200
Connection ~ 5900 5200
Wire Wire Line
	5900 5200 5900 5350
Text GLabel 5500 5200 0    50   Input ~ 0
Vuser
Wire Wire Line
	5950 5600 5900 5600
Wire Wire Line
	5900 5600 5900 5450
Connection ~ 5900 5350
Wire Wire Line
	5950 5850 5900 5850
Wire Wire Line
	5900 5850 5900 5600
Connection ~ 5900 5600
Wire Wire Line
	5950 6100 5900 6100
Wire Wire Line
	5900 6100 5900 5850
Connection ~ 5900 5850
Wire Wire Line
	5950 6350 5900 6350
Wire Wire Line
	5900 6350 5900 6100
Connection ~ 5900 6100
Wire Wire Line
	5950 6600 5900 6600
Wire Wire Line
	5900 6600 5900 6350
Connection ~ 5900 6350
Text GLabel 6450 5350 2    50   Input ~ 0
PUMP_0
Text GLabel 6450 5600 2    50   Input ~ 0
PUMP_1
Text GLabel 6450 5850 2    50   Input ~ 0
PUMP_2
Text GLabel 6450 6100 2    50   Input ~ 0
PUMP_3
Text GLabel 6450 6350 2    50   Input ~ 0
PUMP_4
Text GLabel 6450 6600 2    50   Input ~ 0
PUMP_5
$Comp
L Device:L L?
U 1 1 6093552D
P 1750 1900
AR Path="/602E8AF8/6093552D" Ref="L?"  Part="1" 
AR Path="/6036C67E/6093552D" Ref="L3"  Part="1" 
F 0 "L3" V 1940 1900 50  0000 C CNN
F 1 "220u" V 1849 1900 50  0000 C CNN
F 2 "hydromisc:HM_L_MURATA_LQH44" H 1750 1900 50  0001 C CNN
F 3 "~" H 1750 1900 50  0001 C CNN
	1    1750 1900
	0    -1   -1   0   
$EndComp
$Comp
L hydromisc:NFET Q15
U 1 1 6095BCE8
P 1350 2050
F 0 "Q15" H 1594 1950 50  0000 L CNN
F 1 "NFET" H 1350 2050 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 1350 2050 50  0001 C CNN
F 3 "" H 1350 2050 50  0001 C CNN
	1    1350 2050
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D17
U 1 1 6095BCEE
P 1500 1800
F 0 "D17" V 1750 1750 50  0000 R CNN
F 1 "diode-schottky" H 1900 1850 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 1800 1850 50  0001 C CNN
F 3 "" V 1800 1850 50  0001 C CNN
	1    1500 1800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R25
U 1 1 6095BCF5
P 1250 1950
F 0 "R25" H 1318 1996 50  0000 L CNN
F 1 "1k" H 1318 1905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 1290 1940 50  0001 C CNN
F 3 "~" H 1250 1950 50  0001 C CNN
	1    1250 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 2200 1250 2200
Wire Wire Line
	1250 2200 1250 2100
Wire Wire Line
	1250 1800 1250 1750
$Comp
L power:+12V #PWR011
U 1 1 6095BD02
P 1550 950
F 0 "#PWR011" H 1550 800 50  0001 C CNN
F 1 "+12V" H 1565 1123 50  0000 C CNN
F 2 "" H 1550 950 50  0001 C CNN
F 3 "" H 1550 950 50  0001 C CNN
	1    1550 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2350 1550 2300
Text GLabel 2100 1800 1    50   Input ~ 0
DOSING_A
Text GLabel 1250 1700 1    50   Input ~ 0
G_DOSING_A
Wire Wire Line
	1550 1800 1550 1900
$Comp
L Device:C C?
U 1 1 6096D1DA
P 2000 1200
AR Path="/602E8AF8/6096D1DA" Ref="C?"  Part="1" 
AR Path="/6036C67E/6096D1DA" Ref="C21"  Part="1" 
F 0 "C21" H 2115 1246 50  0000 L CNN
F 1 "22u" H 2115 1155 50  0000 L CNN
F 2 "hydromisc:HM_1206" H 2038 1050 50  0001 C CNN
F 3 "~" H 2000 1200 50  0001 C CNN
	1    2000 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 1900 1550 1900
Connection ~ 1550 1900
Wire Wire Line
	1550 1900 1550 2000
Wire Wire Line
	2100 1900 2100 1800
$Comp
L Device:L L?
U 1 1 60A092B3
P 3050 1900
AR Path="/602E8AF8/60A092B3" Ref="L?"  Part="1" 
AR Path="/6036C67E/60A092B3" Ref="L4"  Part="1" 
F 0 "L4" V 3240 1900 50  0000 C CNN
F 1 "220u" V 3149 1900 50  0000 C CNN
F 2 "hydromisc:HM_L_MURATA_LQH44" H 3050 1900 50  0001 C CNN
F 3 "~" H 3050 1900 50  0001 C CNN
	1    3050 1900
	0    -1   -1   0   
$EndComp
$Comp
L hydromisc:NFET Q16
U 1 1 60A092B9
P 2650 2050
F 0 "Q16" H 2894 1950 50  0000 L CNN
F 1 "NFET" H 2650 2050 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 2650 2050 50  0001 C CNN
F 3 "" H 2650 2050 50  0001 C CNN
	1    2650 2050
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D18
U 1 1 60A092BF
P 2800 1800
F 0 "D18" V 3050 1750 50  0000 R CNN
F 1 "diode-schottky" H 3200 1850 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 3100 1850 50  0001 C CNN
F 3 "" V 3100 1850 50  0001 C CNN
	1    2800 1800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R26
U 1 1 60A092C5
P 2550 1950
F 0 "R26" H 2618 1996 50  0000 L CNN
F 1 "1k" H 2618 1905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 2590 1940 50  0001 C CNN
F 3 "~" H 2550 1950 50  0001 C CNN
	1    2550 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 2200 2550 2200
Wire Wire Line
	2550 2200 2550 2100
Wire Wire Line
	2550 1800 2550 1750
Wire Wire Line
	2850 2350 2850 2300
Text GLabel 3400 1800 1    50   Input ~ 0
DOSING_B
Text GLabel 2550 1700 1    50   Input ~ 0
G_DOSING_B
Wire Wire Line
	2850 1800 2850 1900
$Comp
L Device:C C?
U 1 1 60A092D2
P 3300 1200
AR Path="/602E8AF8/60A092D2" Ref="C?"  Part="1" 
AR Path="/6036C67E/60A092D2" Ref="C22"  Part="1" 
F 0 "C22" H 3415 1246 50  0000 L CNN
F 1 "22u" H 3415 1155 50  0000 L CNN
F 2 "hydromisc:HM_1206" H 3338 1050 50  0001 C CNN
F 3 "~" H 3300 1200 50  0001 C CNN
	1    3300 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1900 2850 1900
Connection ~ 2850 1900
Wire Wire Line
	2850 1900 2850 2000
Wire Wire Line
	3400 1900 3400 1800
$Comp
L Device:L L?
U 1 1 60A3325D
P 4350 1900
AR Path="/602E8AF8/60A3325D" Ref="L?"  Part="1" 
AR Path="/6036C67E/60A3325D" Ref="L5"  Part="1" 
F 0 "L5" V 4540 1900 50  0000 C CNN
F 1 "220u" V 4449 1900 50  0000 C CNN
F 2 "hydromisc:HM_L_MURATA_LQH44" H 4350 1900 50  0001 C CNN
F 3 "~" H 4350 1900 50  0001 C CNN
	1    4350 1900
	0    -1   -1   0   
$EndComp
$Comp
L hydromisc:NFET Q17
U 1 1 60A33263
P 3950 2050
F 0 "Q17" H 4194 1950 50  0000 L CNN
F 1 "NFET" H 3950 2050 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 3950 2050 50  0001 C CNN
F 3 "" H 3950 2050 50  0001 C CNN
	1    3950 2050
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D19
U 1 1 60A33269
P 4100 1800
F 0 "D19" V 4350 1750 50  0000 R CNN
F 1 "diode-schottky" H 4500 1850 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 4400 1850 50  0001 C CNN
F 3 "" V 4400 1850 50  0001 C CNN
	1    4100 1800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R27
U 1 1 60A3326F
P 3850 1950
F 0 "R27" H 3918 1996 50  0000 L CNN
F 1 "1k" H 3918 1905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 3890 1940 50  0001 C CNN
F 3 "~" H 3850 1950 50  0001 C CNN
	1    3850 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2200 3850 2200
Wire Wire Line
	3850 2200 3850 2100
Wire Wire Line
	3850 1800 3850 1750
Wire Wire Line
	4150 2350 4150 2300
Text GLabel 4700 1800 1    50   Input ~ 0
DOSING_PH
Text GLabel 3850 1700 1    50   Input ~ 0
G_DOSING_PH
Wire Wire Line
	4150 1800 4150 1900
$Comp
L Device:C C?
U 1 1 60A3327C
P 4600 1200
AR Path="/602E8AF8/60A3327C" Ref="C?"  Part="1" 
AR Path="/6036C67E/60A3327C" Ref="C23"  Part="1" 
F 0 "C23" H 4715 1246 50  0000 L CNN
F 1 "22u" H 4715 1155 50  0000 L CNN
F 2 "hydromisc:HM_1206" H 4638 1050 50  0001 C CNN
F 3 "~" H 4600 1200 50  0001 C CNN
	1    4600 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 1900 4150 1900
Connection ~ 4150 1900
Wire Wire Line
	4150 1900 4150 2000
Wire Wire Line
	4700 1900 4700 1800
$Comp
L Device:L L?
U 1 1 60A3328D
P 5650 1900
AR Path="/602E8AF8/60A3328D" Ref="L?"  Part="1" 
AR Path="/6036C67E/60A3328D" Ref="L6"  Part="1" 
F 0 "L6" V 5840 1900 50  0000 C CNN
F 1 "220u" V 5749 1900 50  0000 C CNN
F 2 "hydromisc:HM_L_MURATA_LQH44" H 5650 1900 50  0001 C CNN
F 3 "~" H 5650 1900 50  0001 C CNN
	1    5650 1900
	0    -1   -1   0   
$EndComp
$Comp
L hydromisc:NFET Q18
U 1 1 60A33293
P 5250 2050
F 0 "Q18" H 5494 1950 50  0000 L CNN
F 1 "NFET" H 5250 2050 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 5250 2050 50  0001 C CNN
F 3 "" H 5250 2050 50  0001 C CNN
	1    5250 2050
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:diode-schottky D20
U 1 1 60A33299
P 5400 1800
F 0 "D20" V 5650 1750 50  0000 R CNN
F 1 "diode-schottky" H 5800 1850 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 5700 1850 50  0001 C CNN
F 3 "" V 5700 1850 50  0001 C CNN
	1    5400 1800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R28
U 1 1 60A3329F
P 5150 1950
F 0 "R28" H 5218 1996 50  0000 L CNN
F 1 "1k" H 5218 1905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 5190 1940 50  0001 C CNN
F 3 "~" H 5150 1950 50  0001 C CNN
	1    5150 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2200 5150 2200
Wire Wire Line
	5150 2200 5150 2100
Wire Wire Line
	5150 1800 5150 1750
Wire Wire Line
	5450 2350 5450 2300
Text GLabel 6000 1800 1    50   Input ~ 0
DOSING_AUX
Text GLabel 5150 1700 1    50   Input ~ 0
G_DOSING_AUX
Wire Wire Line
	5450 1800 5450 1900
$Comp
L Device:C C?
U 1 1 60A332AC
P 5900 1200
AR Path="/602E8AF8/60A332AC" Ref="C?"  Part="1" 
AR Path="/6036C67E/60A332AC" Ref="C24"  Part="1" 
F 0 "C24" H 6015 1246 50  0000 L CNN
F 1 "22u" H 6015 1155 50  0000 L CNN
F 2 "hydromisc:HM_1206" H 5938 1050 50  0001 C CNN
F 3 "~" H 5900 1200 50  0001 C CNN
	1    5900 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 1900 5450 1900
Connection ~ 5450 1900
Wire Wire Line
	5450 1900 5450 2000
Wire Wire Line
	6000 1900 6000 1800
Connection ~ 2850 2350
Connection ~ 4150 2350
Wire Wire Line
	1550 950  1550 1000
Wire Wire Line
	1550 1000 2000 1000
Wire Wire Line
	2850 1000 2850 1500
Connection ~ 1550 1000
Wire Wire Line
	1550 1000 1550 1500
Wire Wire Line
	2850 1000 3300 1000
Wire Wire Line
	5450 1000 5450 1500
Connection ~ 2850 1000
Wire Wire Line
	4150 1000 4150 1500
Connection ~ 4150 1000
Wire Wire Line
	4150 1000 4600 1000
Text GLabel 7550 900  2    50   Input ~ 0
DOSING_A
Text GLabel 7550 1000 2    50   Input ~ 0
DOSING_B
Text GLabel 7050 1000 0    50   Input ~ 0
DOSING_PH
Text GLabel 7050 900  0    50   Input ~ 0
DOSING_AUX
Wire Wire Line
	5800 1900 5900 1900
Wire Wire Line
	4150 2350 4850 2350
Wire Wire Line
	4500 1900 4600 1900
Wire Wire Line
	3200 1900 3300 1900
Wire Wire Line
	2850 2350 3550 2350
Wire Wire Line
	1550 2350 2250 2350
Wire Wire Line
	1900 1900 2000 1900
Wire Wire Line
	2000 1350 2000 1900
Connection ~ 2000 1900
Wire Wire Line
	2000 1900 2100 1900
Wire Wire Line
	2000 1050 2000 1000
Wire Wire Line
	3300 1350 3300 1900
Connection ~ 3300 1900
Wire Wire Line
	3300 1900 3400 1900
Wire Wire Line
	3300 1050 3300 1000
Wire Wire Line
	4600 1350 4600 1900
Connection ~ 4600 1900
Wire Wire Line
	4600 1900 4700 1900
Wire Wire Line
	4600 1050 4600 1000
Wire Wire Line
	5450 1000 5900 1000
Wire Wire Line
	5900 1000 5900 1050
Connection ~ 5450 1000
Wire Wire Line
	5900 1350 5900 1900
Connection ~ 5900 1900
Wire Wire Line
	5900 1900 6000 1900
$Comp
L power:GND #PWR0110
U 1 1 60DBF5B7
P 5450 2450
F 0 "#PWR0110" H 5450 2200 50  0001 C CNN
F 1 "GND" H 5455 2277 50  0000 C CNN
F 2 "" H 5450 2450 50  0001 C CNN
F 3 "" H 5450 2450 50  0001 C CNN
	1    5450 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2450 5450 2350
Connection ~ 5450 2350
$Comp
L power:GND #PWR0118
U 1 1 60DD79F9
P 7600 1300
F 0 "#PWR0118" H 7600 1050 50  0001 C CNN
F 1 "GND" H 7605 1127 50  0000 C CNN
F 2 "" H 7600 1300 50  0001 C CNN
F 3 "" H 7600 1300 50  0001 C CNN
	1    7600 1300
	1    0    0    -1  
$EndComp
Text GLabel 7050 1100 0    50   Input ~ 0
BIG_PUMP
Text GLabel 7050 1200 0    50   Input ~ 0
Vuser
$Comp
L hydromisc:NFET Q19
U 1 1 61181EDD
P 9100 5150
F 0 "Q19" H 9344 5050 50  0000 L CNN
F 1 "NFET" H 9100 5150 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 9100 5150 50  0001 C CNN
F 3 "" H 9100 5150 50  0001 C CNN
	1    9100 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 4900 9300 5050
$Comp
L Device:R_US R45
U 1 1 61181EE4
P 8850 5300
F 0 "R45" V 8645 5300 50  0000 C CNN
F 1 "1k" V 8736 5300 50  0000 C CNN
F 2 "hydromisc:HM_0603" V 8890 5290 50  0001 C CNN
F 3 "~" H 8850 5300 50  0001 C CNN
	1    8850 5300
	0    1    1    0   
$EndComp
Wire Wire Line
	9100 5300 9000 5300
Text GLabel 9550 5050 2    50   Input ~ 0
BIG_PUMP
Wire Wire Line
	9550 5050 9300 5050
Connection ~ 9300 5050
Wire Wire Line
	9300 5050 9300 5100
Text GLabel 8600 5300 0    50   Input ~ 0
G_BIG_PUMP
Wire Wire Line
	8700 5300 8600 5300
$Comp
L power:GND #PWR0126
U 1 1 61181EF3
P 9300 5500
F 0 "#PWR0126" H 9300 5250 50  0001 C CNN
F 1 "GND" H 9305 5327 50  0000 C CNN
F 2 "" H 9300 5500 50  0001 C CNN
F 3 "" H 9300 5500 50  0001 C CNN
	1    9300 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 4300 9300 4600
$Comp
L hydromisc:diode-schottky D21
U 1 1 61181EFF
P 9250 4900
F 0 "D21" V 9500 5000 50  0000 R CNN
F 1 "diode-schottky" H 9650 4950 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 9550 4950 50  0001 C CNN
F 3 "" V 9550 4950 50  0001 C CNN
	1    9250 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9300 5400 9300 5500
$Comp
L power:+12V #PWR0127
U 1 1 6119B2AA
P 9300 4300
F 0 "#PWR0127" H 9300 4150 50  0001 C CNN
F 1 "+12V" H 9315 4473 50  0000 C CNN
F 2 "" H 9300 4300 50  0001 C CNN
F 3 "" H 9300 4300 50  0001 C CNN
	1    9300 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 1100 7600 1100
Wire Wire Line
	7550 1200 8100 1200
Wire Wire Line
	8100 900  8100 1200
Wire Wire Line
	7600 1100 7600 1300
$Comp
L power:+12V #PWR0138
U 1 1 605D953E
P 8100 900
F 0 "#PWR0138" H 8100 750 50  0001 C CNN
F 1 "+12V" H 8115 1073 50  0000 C CNN
F 2 "" H 8100 900 50  0001 C CNN
F 3 "" H 8100 900 50  0001 C CNN
	1    8100 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 3000 8500 2500
Wire Wire Line
	8050 3000 8500 3000
Wire Wire Line
	5400 5650 5650 5650
Wire Wire Line
	5650 5650 5650 5450
Wire Wire Line
	5650 5450 5900 5450
Connection ~ 5400 5650
Connection ~ 5900 5450
Wire Wire Line
	5900 5450 5900 5350
$Comp
L Device:R_US R50
U 1 1 60F859B9
P 950 1950
F 0 "R50" H 1018 1996 50  0000 L CNN
F 1 "1k" H 1018 1905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 990 1940 50  0001 C CNN
F 3 "~" H 950 1950 50  0001 C CNN
	1    950  1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  2350 950  2100
Connection ~ 1550 2350
Wire Wire Line
	950  1800 950  1750
Connection ~ 1250 1750
Wire Wire Line
	1250 1750 1250 1700
$Comp
L Device:R_US R51
U 1 1 60FADD1B
P 2250 1950
F 0 "R51" H 2318 1996 50  0000 L CNN
F 1 "1k" H 2318 1905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 2290 1940 50  0001 C CNN
F 3 "~" H 2250 1950 50  0001 C CNN
	1    2250 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1750 2250 1800
Connection ~ 2550 1750
Wire Wire Line
	2550 1750 2550 1700
Wire Wire Line
	2250 2100 2250 2350
$Comp
L Device:R_US R52
U 1 1 60FD6BE9
P 3550 1950
F 0 "R52" H 3618 1996 50  0000 L CNN
F 1 "1k" H 3618 1905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 3590 1940 50  0001 C CNN
F 3 "~" H 3550 1950 50  0001 C CNN
	1    3550 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1750 3550 1800
Connection ~ 3850 1750
Wire Wire Line
	3850 1750 3850 1700
Wire Wire Line
	3550 2100 3550 2350
$Comp
L Device:R_US R53
U 1 1 6100162A
P 4850 1950
F 0 "R53" H 4918 1996 50  0000 L CNN
F 1 "1k" H 4918 1905 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 4890 1940 50  0001 C CNN
F 3 "~" H 4850 1950 50  0001 C CNN
	1    4850 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 1750 4850 1800
Connection ~ 5150 1750
Wire Wire Line
	5150 1750 5150 1700
Wire Wire Line
	4850 2100 4850 2350
Wire Wire Line
	950  2350 1550 2350
Wire Wire Line
	950  1750 1250 1750
Wire Wire Line
	2250 1750 2550 1750
Wire Wire Line
	2250 2350 2850 2350
Connection ~ 2250 2350
Wire Wire Line
	3550 1750 3850 1750
Wire Wire Line
	3550 2350 4150 2350
Connection ~ 3550 2350
Wire Wire Line
	4850 1750 5150 1750
Wire Wire Line
	4850 2350 5450 2350
Connection ~ 4850 2350
Wire Wire Line
	4600 1000 5450 1000
Connection ~ 4600 1000
Wire Wire Line
	3300 1000 4150 1000
Connection ~ 3300 1000
Wire Wire Line
	2000 1000 2850 1000
Connection ~ 2000 1000
$EndSCHEMATC
