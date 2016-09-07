opt subtitle "Microchip Technology Omniscient Code Generator v1.35 (PRO mode) build 201507080246"

opt pagewidth 120

	opt pm

	processor	18F14K50
porta	equ	0F80h
portb	equ	0F81h
portc	equ	0F82h
portd	equ	0F83h
porte	equ	0F84h
lata	equ	0F89h
latb	equ	0F8Ah
latc	equ	0F8Bh
latd	equ	0F8Ch
late	equ	0F8Dh
trisa	equ	0F92h
trisb	equ	0F93h
trisc	equ	0F94h
trisd	equ	0F95h
trise	equ	0F96h
pie1	equ	0F9Dh
pir1	equ	0F9Eh
ipr1	equ	0F9Fh
pie2	equ	0FA0h
pir2	equ	0FA1h
ipr2	equ	0FA2h
t3con	equ	0FB1h
tmr3l	equ	0FB2h
tmr3h	equ	0FB3h
ccp1con	equ	0FBDh
ccpr1l	equ	0FBEh
ccpr1h	equ	0FBFh
adcon1	equ	0FC1h
adcon0	equ	0FC2h
adresl	equ	0FC3h
adresh	equ	0FC4h
sspcon2	equ	0FC5h
sspcon1	equ	0FC6h
sspstat	equ	0FC7h
sspadd	equ	0FC8h
sspbuf	equ	0FC9h
t2con	equ	0FCAh
pr2	equ	0FCBh
tmr2	equ	0FCCh
t1con	equ	0FCDh
tmr1l	equ	0FCEh
tmr1h	equ	0FCFh
rcon	equ	0FD0h
wdtcon	equ	0FD1h
lvdcon	equ	0FD2h
osccon	equ	0FD3h
t0con	equ	0FD5h
tmr0l	equ	0FD6h
tmr0h	equ	0FD7h
status	equ	0FD8h
fsr2	equ	0FD9h
fsr2l	equ	0FD9h
fsr2h	equ	0FDAh
plusw2	equ	0FDBh
preinc2	equ	0FDCh
postdec2	equ	0FDDh
postinc2	equ	0FDEh
indf2	equ	0FDFh
bsr	equ	0FE0h
fsr1	equ	0FE1h
fsr1l	equ	0FE1h
fsr1h	equ	0FE2h
plusw1	equ	0FE3h
preinc1	equ	0FE4h
postdec1	equ	0FE5h
postinc1	equ	0FE6h
indf1	equ	0FE7h
wreg	equ	0FE8h
fsr0	equ	0FE9h
fsr0l	equ	0FE9h
fsr0h	equ	0FEAh
plusw0	equ	0FEBh
preinc0	equ	0FECh
postdec0	equ	0FEDh
postinc0	equ	0FEEh
indf0	equ	0FEFh
intcon3	equ	0FF0h
intcon2	equ	0FF1h
intcon	equ	0FF2h
prod	equ	0FF3h
prodl	equ	0FF3h
prodh	equ	0FF4h
tablat	equ	0FF5h
tblptr	equ	0FF6h
tblptrl	equ	0FF6h
tblptrh	equ	0FF7h
tblptru	equ	0FF8h
pcl	equ	0FF9h
pclat	equ	0FFAh
pclath	equ	0FFAh
pclatu	equ	0FFBh
stkptr	equ	0FFCh
tosl	equ	0FFDh
tosh	equ	0FFEh
tosu	equ	0FFFh
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,f
	movf indf1,w
endm
popf macro arg1
	movf postdec1,f
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
	global	__ramtop
	global	__accesstop
# 51 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP0 equ 0F53h ;# 
# 182 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP1 equ 0F54h ;# 
# 313 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP2 equ 0F55h ;# 
# 444 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP3 equ 0F56h ;# 
# 575 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP4 equ 0F57h ;# 
# 706 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP5 equ 0F58h ;# 
# 837 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP6 equ 0F59h ;# 
# 968 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP7 equ 0F5Ah ;# 
# 1099 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEIE equ 0F5Bh ;# 
# 1149 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UADDR equ 0F5Ch ;# 
# 1212 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UFRML equ 0F5Dh ;# 
# 1281 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UFRMH equ 0F5Eh ;# 
# 1320 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEIR equ 0F5Fh ;# 
# 1370 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UIE equ 0F60h ;# 
# 1425 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UCFG equ 0F61h ;# 
# 1487 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UIR equ 0F62h ;# 
# 1542 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
USTAT equ 0F63h ;# 
# 1592 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UCON equ 0F64h ;# 
# 1642 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SRCON0 equ 0F68h ;# 
# 1712 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SRCON1 equ 0F69h ;# 
# 1773 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM2CON0 equ 0F6Bh ;# 
# 1842 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM2CON1 equ 0F6Ch ;# 
# 1903 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM1CON0 equ 0F6Dh ;# 
# 1972 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPMSK equ 0F6Fh ;# 
# 1977 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPMASK equ 0F6Fh ;# 
# 2109 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SLRCON equ 0F76h ;# 
# 2140 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WPUA equ 0F77h ;# 
# 2172 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WPUB equ 0F78h ;# 
# 2210 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IOCA equ 0F79h ;# 
# 2254 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IOCB equ 0F7Ah ;# 
# 2292 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ANSEL equ 0F7Eh ;# 
# 2336 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ANSELH equ 0F7Fh ;# 
# 2373 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTA equ 0F80h ;# 
# 2509 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTB equ 0F81h ;# 
# 2660 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTC equ 0F82h ;# 
# 2956 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATA equ 0F89h ;# 
# 3062 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATB equ 0F8Ah ;# 
# 3171 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATC equ 0F8Bh ;# 
# 3303 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISA equ 0F92h ;# 
# 3308 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRA equ 0F92h ;# 
# 3384 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISB equ 0F93h ;# 
# 3389 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRB equ 0F93h ;# 
# 3513 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISC equ 0F94h ;# 
# 3518 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRC equ 0F94h ;# 
# 3734 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCTUNE equ 0F9Bh ;# 
# 3803 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIE1 equ 0F9Dh ;# 
# 3876 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIR1 equ 0F9Eh ;# 
# 3949 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IPR1 equ 0F9Fh ;# 
# 4022 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIE2 equ 0FA0h ;# 
# 4087 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIR2 equ 0FA1h ;# 
# 4152 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IPR2 equ 0FA2h ;# 
# 4217 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EECON1 equ 0FA6h ;# 
# 4282 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EECON2 equ 0FA7h ;# 
# 4288 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EEDATA equ 0FA8h ;# 
# 4294 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EEADR equ 0FA9h ;# 
# 4355 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCSTA equ 0FABh ;# 
# 4360 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCSTA1 equ 0FABh ;# 
# 4564 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXSTA equ 0FACh ;# 
# 4569 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXSTA1 equ 0FACh ;# 
# 4861 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXREG equ 0FADh ;# 
# 4866 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXREG1 equ 0FADh ;# 
# 4872 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCREG equ 0FAEh ;# 
# 4877 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCREG1 equ 0FAEh ;# 
# 4883 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRG equ 0FAFh ;# 
# 4888 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRG1 equ 0FAFh ;# 
# 4894 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRGH equ 0FB0h ;# 
# 4900 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T3CON equ 0FB1h ;# 
# 5008 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3 equ 0FB2h ;# 
# 5014 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3L equ 0FB2h ;# 
# 5020 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3H equ 0FB3h ;# 
# 5026 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ECCP1AS equ 0FB6h ;# 
# 5107 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PWM1CON equ 0FB7h ;# 
# 5176 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BAUDCON equ 0FB8h ;# 
# 5181 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BAUDCTL equ 0FB8h ;# 
# 5341 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PSTRCON equ 0FB9h ;# 
# 5384 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON0 equ 0FBAh ;# 
# 5389 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON0 equ 0FBAh ;# 
# 5461 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON1 equ 0FBBh ;# 
# 5466 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON1 equ 0FBBh ;# 
# 5596 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON2 equ 0FBCh ;# 
# 5601 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON2 equ 0FBCh ;# 
# 5681 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCP1CON equ 0FBDh ;# 
# 5762 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1 equ 0FBEh ;# 
# 5768 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1L equ 0FBEh ;# 
# 5774 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1H equ 0FBFh ;# 
# 5780 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON2 equ 0FC0h ;# 
# 5850 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON1 equ 0FC1h ;# 
# 5896 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON0 equ 0FC2h ;# 
# 6018 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRES equ 0FC3h ;# 
# 6024 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRESL equ 0FC3h ;# 
# 6030 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRESH equ 0FC4h ;# 
# 6036 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPCON2 equ 0FC5h ;# 
# 6097 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPCON1 equ 0FC6h ;# 
# 6166 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPSTAT equ 0FC7h ;# 
# 6405 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPADD equ 0FC8h ;# 
# 6411 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPBUF equ 0FC9h ;# 
# 6417 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T2CON equ 0FCAh ;# 
# 6487 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PR2 equ 0FCBh ;# 
# 6492 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
MEMCON equ 0FCBh ;# 
# 6596 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR2 equ 0FCCh ;# 
# 6602 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T1CON equ 0FCDh ;# 
# 6706 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1 equ 0FCEh ;# 
# 6712 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1L equ 0FCEh ;# 
# 6718 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1H equ 0FCFh ;# 
# 6724 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCON equ 0FD0h ;# 
# 6856 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WDTCON equ 0FD1h ;# 
# 6883 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCCON2 equ 0FD2h ;# 
# 6914 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCCON equ 0FD3h ;# 
# 6992 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T0CON equ 0FD5h ;# 
# 7061 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0 equ 0FD6h ;# 
# 7067 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0L equ 0FD6h ;# 
# 7073 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0H equ 0FD7h ;# 
# 7079 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
STATUS equ 0FD8h ;# 
# 7157 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2 equ 0FD9h ;# 
# 7163 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2L equ 0FD9h ;# 
# 7169 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2H equ 0FDAh ;# 
# 7175 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW2 equ 0FDBh ;# 
# 7181 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC2 equ 0FDCh ;# 
# 7187 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC2 equ 0FDDh ;# 
# 7193 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC2 equ 0FDEh ;# 
# 7199 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF2 equ 0FDFh ;# 
# 7205 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BSR equ 0FE0h ;# 
# 7211 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1 equ 0FE1h ;# 
# 7217 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1L equ 0FE1h ;# 
# 7223 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1H equ 0FE2h ;# 
# 7229 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW1 equ 0FE3h ;# 
# 7235 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC1 equ 0FE4h ;# 
# 7241 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC1 equ 0FE5h ;# 
# 7247 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC1 equ 0FE6h ;# 
# 7253 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF1 equ 0FE7h ;# 
# 7259 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WREG equ 0FE8h ;# 
# 7270 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0 equ 0FE9h ;# 
# 7276 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0L equ 0FE9h ;# 
# 7282 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0H equ 0FEAh ;# 
# 7288 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW0 equ 0FEBh ;# 
# 7294 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC0 equ 0FECh ;# 
# 7300 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC0 equ 0FEDh ;# 
# 7306 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC0 equ 0FEEh ;# 
# 7312 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF0 equ 0FEFh ;# 
# 7318 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON3 equ 0FF0h ;# 
# 7409 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON2 equ 0FF1h ;# 
# 7478 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON equ 0FF2h ;# 
# 7624 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PROD equ 0FF3h ;# 
# 7630 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PRODL equ 0FF3h ;# 
# 7636 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PRODH equ 0FF4h ;# 
# 7642 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TABLAT equ 0FF5h ;# 
# 7650 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTR equ 0FF6h ;# 
# 7656 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRL equ 0FF6h ;# 
# 7662 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRH equ 0FF7h ;# 
# 7668 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRU equ 0FF8h ;# 
# 7676 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLAT equ 0FF9h ;# 
# 7683 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PC equ 0FF9h ;# 
# 7689 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCL equ 0FF9h ;# 
# 7695 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLATH equ 0FFAh ;# 
# 7701 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLATU equ 0FFBh ;# 
# 7707 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
STKPTR equ 0FFCh ;# 
# 7780 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOS equ 0FFDh ;# 
# 7786 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSL equ 0FFDh ;# 
# 7792 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSH equ 0FFEh ;# 
# 7798 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSU equ 0FFFh ;# 
# 51 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP0 equ 0F53h ;# 
# 182 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP1 equ 0F54h ;# 
# 313 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP2 equ 0F55h ;# 
# 444 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP3 equ 0F56h ;# 
# 575 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP4 equ 0F57h ;# 
# 706 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP5 equ 0F58h ;# 
# 837 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP6 equ 0F59h ;# 
# 968 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP7 equ 0F5Ah ;# 
# 1099 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEIE equ 0F5Bh ;# 
# 1149 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UADDR equ 0F5Ch ;# 
# 1212 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UFRML equ 0F5Dh ;# 
# 1281 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UFRMH equ 0F5Eh ;# 
# 1320 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEIR equ 0F5Fh ;# 
# 1370 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UIE equ 0F60h ;# 
# 1425 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UCFG equ 0F61h ;# 
# 1487 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UIR equ 0F62h ;# 
# 1542 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
USTAT equ 0F63h ;# 
# 1592 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UCON equ 0F64h ;# 
# 1642 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SRCON0 equ 0F68h ;# 
# 1712 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SRCON1 equ 0F69h ;# 
# 1773 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM2CON0 equ 0F6Bh ;# 
# 1842 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM2CON1 equ 0F6Ch ;# 
# 1903 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM1CON0 equ 0F6Dh ;# 
# 1972 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPMSK equ 0F6Fh ;# 
# 1977 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPMASK equ 0F6Fh ;# 
# 2109 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SLRCON equ 0F76h ;# 
# 2140 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WPUA equ 0F77h ;# 
# 2172 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WPUB equ 0F78h ;# 
# 2210 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IOCA equ 0F79h ;# 
# 2254 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IOCB equ 0F7Ah ;# 
# 2292 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ANSEL equ 0F7Eh ;# 
# 2336 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ANSELH equ 0F7Fh ;# 
# 2373 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTA equ 0F80h ;# 
# 2509 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTB equ 0F81h ;# 
# 2660 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTC equ 0F82h ;# 
# 2956 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATA equ 0F89h ;# 
# 3062 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATB equ 0F8Ah ;# 
# 3171 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATC equ 0F8Bh ;# 
# 3303 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISA equ 0F92h ;# 
# 3308 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRA equ 0F92h ;# 
# 3384 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISB equ 0F93h ;# 
# 3389 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRB equ 0F93h ;# 
# 3513 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISC equ 0F94h ;# 
# 3518 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRC equ 0F94h ;# 
# 3734 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCTUNE equ 0F9Bh ;# 
# 3803 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIE1 equ 0F9Dh ;# 
# 3876 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIR1 equ 0F9Eh ;# 
# 3949 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IPR1 equ 0F9Fh ;# 
# 4022 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIE2 equ 0FA0h ;# 
# 4087 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIR2 equ 0FA1h ;# 
# 4152 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IPR2 equ 0FA2h ;# 
# 4217 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EECON1 equ 0FA6h ;# 
# 4282 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EECON2 equ 0FA7h ;# 
# 4288 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EEDATA equ 0FA8h ;# 
# 4294 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EEADR equ 0FA9h ;# 
# 4355 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCSTA equ 0FABh ;# 
# 4360 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCSTA1 equ 0FABh ;# 
# 4564 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXSTA equ 0FACh ;# 
# 4569 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXSTA1 equ 0FACh ;# 
# 4861 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXREG equ 0FADh ;# 
# 4866 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXREG1 equ 0FADh ;# 
# 4872 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCREG equ 0FAEh ;# 
# 4877 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCREG1 equ 0FAEh ;# 
# 4883 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRG equ 0FAFh ;# 
# 4888 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRG1 equ 0FAFh ;# 
# 4894 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRGH equ 0FB0h ;# 
# 4900 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T3CON equ 0FB1h ;# 
# 5008 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3 equ 0FB2h ;# 
# 5014 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3L equ 0FB2h ;# 
# 5020 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3H equ 0FB3h ;# 
# 5026 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ECCP1AS equ 0FB6h ;# 
# 5107 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PWM1CON equ 0FB7h ;# 
# 5176 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BAUDCON equ 0FB8h ;# 
# 5181 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BAUDCTL equ 0FB8h ;# 
# 5341 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PSTRCON equ 0FB9h ;# 
# 5384 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON0 equ 0FBAh ;# 
# 5389 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON0 equ 0FBAh ;# 
# 5461 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON1 equ 0FBBh ;# 
# 5466 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON1 equ 0FBBh ;# 
# 5596 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON2 equ 0FBCh ;# 
# 5601 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON2 equ 0FBCh ;# 
# 5681 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCP1CON equ 0FBDh ;# 
# 5762 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1 equ 0FBEh ;# 
# 5768 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1L equ 0FBEh ;# 
# 5774 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1H equ 0FBFh ;# 
# 5780 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON2 equ 0FC0h ;# 
# 5850 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON1 equ 0FC1h ;# 
# 5896 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON0 equ 0FC2h ;# 
# 6018 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRES equ 0FC3h ;# 
# 6024 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRESL equ 0FC3h ;# 
# 6030 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRESH equ 0FC4h ;# 
# 6036 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPCON2 equ 0FC5h ;# 
# 6097 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPCON1 equ 0FC6h ;# 
# 6166 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPSTAT equ 0FC7h ;# 
# 6405 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPADD equ 0FC8h ;# 
# 6411 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPBUF equ 0FC9h ;# 
# 6417 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T2CON equ 0FCAh ;# 
# 6487 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PR2 equ 0FCBh ;# 
# 6492 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
MEMCON equ 0FCBh ;# 
# 6596 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR2 equ 0FCCh ;# 
# 6602 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T1CON equ 0FCDh ;# 
# 6706 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1 equ 0FCEh ;# 
# 6712 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1L equ 0FCEh ;# 
# 6718 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1H equ 0FCFh ;# 
# 6724 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCON equ 0FD0h ;# 
# 6856 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WDTCON equ 0FD1h ;# 
# 6883 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCCON2 equ 0FD2h ;# 
# 6914 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCCON equ 0FD3h ;# 
# 6992 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T0CON equ 0FD5h ;# 
# 7061 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0 equ 0FD6h ;# 
# 7067 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0L equ 0FD6h ;# 
# 7073 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0H equ 0FD7h ;# 
# 7079 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
STATUS equ 0FD8h ;# 
# 7157 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2 equ 0FD9h ;# 
# 7163 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2L equ 0FD9h ;# 
# 7169 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2H equ 0FDAh ;# 
# 7175 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW2 equ 0FDBh ;# 
# 7181 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC2 equ 0FDCh ;# 
# 7187 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC2 equ 0FDDh ;# 
# 7193 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC2 equ 0FDEh ;# 
# 7199 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF2 equ 0FDFh ;# 
# 7205 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BSR equ 0FE0h ;# 
# 7211 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1 equ 0FE1h ;# 
# 7217 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1L equ 0FE1h ;# 
# 7223 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1H equ 0FE2h ;# 
# 7229 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW1 equ 0FE3h ;# 
# 7235 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC1 equ 0FE4h ;# 
# 7241 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC1 equ 0FE5h ;# 
# 7247 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC1 equ 0FE6h ;# 
# 7253 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF1 equ 0FE7h ;# 
# 7259 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WREG equ 0FE8h ;# 
# 7270 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0 equ 0FE9h ;# 
# 7276 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0L equ 0FE9h ;# 
# 7282 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0H equ 0FEAh ;# 
# 7288 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW0 equ 0FEBh ;# 
# 7294 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC0 equ 0FECh ;# 
# 7300 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC0 equ 0FEDh ;# 
# 7306 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC0 equ 0FEEh ;# 
# 7312 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF0 equ 0FEFh ;# 
# 7318 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON3 equ 0FF0h ;# 
# 7409 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON2 equ 0FF1h ;# 
# 7478 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON equ 0FF2h ;# 
# 7624 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PROD equ 0FF3h ;# 
# 7630 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PRODL equ 0FF3h ;# 
# 7636 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PRODH equ 0FF4h ;# 
# 7642 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TABLAT equ 0FF5h ;# 
# 7650 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTR equ 0FF6h ;# 
# 7656 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRL equ 0FF6h ;# 
# 7662 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRH equ 0FF7h ;# 
# 7668 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRU equ 0FF8h ;# 
# 7676 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLAT equ 0FF9h ;# 
# 7683 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PC equ 0FF9h ;# 
# 7689 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCL equ 0FF9h ;# 
# 7695 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLATH equ 0FFAh ;# 
# 7701 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLATU equ 0FFBh ;# 
# 7707 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
STKPTR equ 0FFCh ;# 
# 7780 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOS equ 0FFDh ;# 
# 7786 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSL equ 0FFDh ;# 
# 7792 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSH equ 0FFEh ;# 
# 7798 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSU equ 0FFFh ;# 
# 51 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP0 equ 0F53h ;# 
# 182 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP1 equ 0F54h ;# 
# 313 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP2 equ 0F55h ;# 
# 444 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP3 equ 0F56h ;# 
# 575 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP4 equ 0F57h ;# 
# 706 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP5 equ 0F58h ;# 
# 837 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP6 equ 0F59h ;# 
# 968 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP7 equ 0F5Ah ;# 
# 1099 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEIE equ 0F5Bh ;# 
# 1149 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UADDR equ 0F5Ch ;# 
# 1212 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UFRML equ 0F5Dh ;# 
# 1281 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UFRMH equ 0F5Eh ;# 
# 1320 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEIR equ 0F5Fh ;# 
# 1370 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UIE equ 0F60h ;# 
# 1425 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UCFG equ 0F61h ;# 
# 1487 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UIR equ 0F62h ;# 
# 1542 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
USTAT equ 0F63h ;# 
# 1592 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UCON equ 0F64h ;# 
# 1642 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SRCON0 equ 0F68h ;# 
# 1712 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SRCON1 equ 0F69h ;# 
# 1773 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM2CON0 equ 0F6Bh ;# 
# 1842 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM2CON1 equ 0F6Ch ;# 
# 1903 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM1CON0 equ 0F6Dh ;# 
# 1972 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPMSK equ 0F6Fh ;# 
# 1977 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPMASK equ 0F6Fh ;# 
# 2109 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SLRCON equ 0F76h ;# 
# 2140 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WPUA equ 0F77h ;# 
# 2172 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WPUB equ 0F78h ;# 
# 2210 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IOCA equ 0F79h ;# 
# 2254 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IOCB equ 0F7Ah ;# 
# 2292 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ANSEL equ 0F7Eh ;# 
# 2336 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ANSELH equ 0F7Fh ;# 
# 2373 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTA equ 0F80h ;# 
# 2509 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTB equ 0F81h ;# 
# 2660 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTC equ 0F82h ;# 
# 2956 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATA equ 0F89h ;# 
# 3062 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATB equ 0F8Ah ;# 
# 3171 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATC equ 0F8Bh ;# 
# 3303 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISA equ 0F92h ;# 
# 3308 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRA equ 0F92h ;# 
# 3384 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISB equ 0F93h ;# 
# 3389 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRB equ 0F93h ;# 
# 3513 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISC equ 0F94h ;# 
# 3518 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRC equ 0F94h ;# 
# 3734 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCTUNE equ 0F9Bh ;# 
# 3803 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIE1 equ 0F9Dh ;# 
# 3876 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIR1 equ 0F9Eh ;# 
# 3949 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IPR1 equ 0F9Fh ;# 
# 4022 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIE2 equ 0FA0h ;# 
# 4087 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIR2 equ 0FA1h ;# 
# 4152 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IPR2 equ 0FA2h ;# 
# 4217 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EECON1 equ 0FA6h ;# 
# 4282 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EECON2 equ 0FA7h ;# 
# 4288 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EEDATA equ 0FA8h ;# 
# 4294 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EEADR equ 0FA9h ;# 
# 4355 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCSTA equ 0FABh ;# 
# 4360 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCSTA1 equ 0FABh ;# 
# 4564 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXSTA equ 0FACh ;# 
# 4569 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXSTA1 equ 0FACh ;# 
# 4861 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXREG equ 0FADh ;# 
# 4866 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXREG1 equ 0FADh ;# 
# 4872 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCREG equ 0FAEh ;# 
# 4877 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCREG1 equ 0FAEh ;# 
# 4883 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRG equ 0FAFh ;# 
# 4888 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRG1 equ 0FAFh ;# 
# 4894 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRGH equ 0FB0h ;# 
# 4900 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T3CON equ 0FB1h ;# 
# 5008 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3 equ 0FB2h ;# 
# 5014 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3L equ 0FB2h ;# 
# 5020 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3H equ 0FB3h ;# 
# 5026 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ECCP1AS equ 0FB6h ;# 
# 5107 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PWM1CON equ 0FB7h ;# 
# 5176 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BAUDCON equ 0FB8h ;# 
# 5181 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BAUDCTL equ 0FB8h ;# 
# 5341 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PSTRCON equ 0FB9h ;# 
# 5384 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON0 equ 0FBAh ;# 
# 5389 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON0 equ 0FBAh ;# 
# 5461 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON1 equ 0FBBh ;# 
# 5466 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON1 equ 0FBBh ;# 
# 5596 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON2 equ 0FBCh ;# 
# 5601 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON2 equ 0FBCh ;# 
# 5681 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCP1CON equ 0FBDh ;# 
# 5762 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1 equ 0FBEh ;# 
# 5768 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1L equ 0FBEh ;# 
# 5774 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1H equ 0FBFh ;# 
# 5780 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON2 equ 0FC0h ;# 
# 5850 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON1 equ 0FC1h ;# 
# 5896 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON0 equ 0FC2h ;# 
# 6018 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRES equ 0FC3h ;# 
# 6024 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRESL equ 0FC3h ;# 
# 6030 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRESH equ 0FC4h ;# 
# 6036 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPCON2 equ 0FC5h ;# 
# 6097 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPCON1 equ 0FC6h ;# 
# 6166 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPSTAT equ 0FC7h ;# 
# 6405 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPADD equ 0FC8h ;# 
# 6411 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPBUF equ 0FC9h ;# 
# 6417 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T2CON equ 0FCAh ;# 
# 6487 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PR2 equ 0FCBh ;# 
# 6492 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
MEMCON equ 0FCBh ;# 
# 6596 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR2 equ 0FCCh ;# 
# 6602 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T1CON equ 0FCDh ;# 
# 6706 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1 equ 0FCEh ;# 
# 6712 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1L equ 0FCEh ;# 
# 6718 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1H equ 0FCFh ;# 
# 6724 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCON equ 0FD0h ;# 
# 6856 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WDTCON equ 0FD1h ;# 
# 6883 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCCON2 equ 0FD2h ;# 
# 6914 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCCON equ 0FD3h ;# 
# 6992 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T0CON equ 0FD5h ;# 
# 7061 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0 equ 0FD6h ;# 
# 7067 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0L equ 0FD6h ;# 
# 7073 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0H equ 0FD7h ;# 
# 7079 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
STATUS equ 0FD8h ;# 
# 7157 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2 equ 0FD9h ;# 
# 7163 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2L equ 0FD9h ;# 
# 7169 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2H equ 0FDAh ;# 
# 7175 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW2 equ 0FDBh ;# 
# 7181 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC2 equ 0FDCh ;# 
# 7187 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC2 equ 0FDDh ;# 
# 7193 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC2 equ 0FDEh ;# 
# 7199 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF2 equ 0FDFh ;# 
# 7205 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BSR equ 0FE0h ;# 
# 7211 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1 equ 0FE1h ;# 
# 7217 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1L equ 0FE1h ;# 
# 7223 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1H equ 0FE2h ;# 
# 7229 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW1 equ 0FE3h ;# 
# 7235 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC1 equ 0FE4h ;# 
# 7241 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC1 equ 0FE5h ;# 
# 7247 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC1 equ 0FE6h ;# 
# 7253 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF1 equ 0FE7h ;# 
# 7259 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WREG equ 0FE8h ;# 
# 7270 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0 equ 0FE9h ;# 
# 7276 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0L equ 0FE9h ;# 
# 7282 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0H equ 0FEAh ;# 
# 7288 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW0 equ 0FEBh ;# 
# 7294 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC0 equ 0FECh ;# 
# 7300 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC0 equ 0FEDh ;# 
# 7306 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC0 equ 0FEEh ;# 
# 7312 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF0 equ 0FEFh ;# 
# 7318 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON3 equ 0FF0h ;# 
# 7409 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON2 equ 0FF1h ;# 
# 7478 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON equ 0FF2h ;# 
# 7624 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PROD equ 0FF3h ;# 
# 7630 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PRODL equ 0FF3h ;# 
# 7636 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PRODH equ 0FF4h ;# 
# 7642 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TABLAT equ 0FF5h ;# 
# 7650 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTR equ 0FF6h ;# 
# 7656 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRL equ 0FF6h ;# 
# 7662 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRH equ 0FF7h ;# 
# 7668 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRU equ 0FF8h ;# 
# 7676 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLAT equ 0FF9h ;# 
# 7683 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PC equ 0FF9h ;# 
# 7689 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCL equ 0FF9h ;# 
# 7695 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLATH equ 0FFAh ;# 
# 7701 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLATU equ 0FFBh ;# 
# 7707 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
STKPTR equ 0FFCh ;# 
# 7780 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOS equ 0FFDh ;# 
# 7786 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSL equ 0FFDh ;# 
# 7792 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSH equ 0FFEh ;# 
# 7798 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSU equ 0FFFh ;# 
# 51 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP0 equ 0F53h ;# 
# 182 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP1 equ 0F54h ;# 
# 313 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP2 equ 0F55h ;# 
# 444 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP3 equ 0F56h ;# 
# 575 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP4 equ 0F57h ;# 
# 706 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP5 equ 0F58h ;# 
# 837 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP6 equ 0F59h ;# 
# 968 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP7 equ 0F5Ah ;# 
# 1099 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEIE equ 0F5Bh ;# 
# 1149 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UADDR equ 0F5Ch ;# 
# 1212 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UFRML equ 0F5Dh ;# 
# 1281 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UFRMH equ 0F5Eh ;# 
# 1320 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEIR equ 0F5Fh ;# 
# 1370 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UIE equ 0F60h ;# 
# 1425 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UCFG equ 0F61h ;# 
# 1487 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UIR equ 0F62h ;# 
# 1542 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
USTAT equ 0F63h ;# 
# 1592 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UCON equ 0F64h ;# 
# 1642 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SRCON0 equ 0F68h ;# 
# 1712 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SRCON1 equ 0F69h ;# 
# 1773 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM2CON0 equ 0F6Bh ;# 
# 1842 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM2CON1 equ 0F6Ch ;# 
# 1903 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM1CON0 equ 0F6Dh ;# 
# 1972 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPMSK equ 0F6Fh ;# 
# 1977 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPMASK equ 0F6Fh ;# 
# 2109 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SLRCON equ 0F76h ;# 
# 2140 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WPUA equ 0F77h ;# 
# 2172 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WPUB equ 0F78h ;# 
# 2210 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IOCA equ 0F79h ;# 
# 2254 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IOCB equ 0F7Ah ;# 
# 2292 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ANSEL equ 0F7Eh ;# 
# 2336 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ANSELH equ 0F7Fh ;# 
# 2373 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTA equ 0F80h ;# 
# 2509 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTB equ 0F81h ;# 
# 2660 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTC equ 0F82h ;# 
# 2956 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATA equ 0F89h ;# 
# 3062 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATB equ 0F8Ah ;# 
# 3171 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATC equ 0F8Bh ;# 
# 3303 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISA equ 0F92h ;# 
# 3308 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRA equ 0F92h ;# 
# 3384 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISB equ 0F93h ;# 
# 3389 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRB equ 0F93h ;# 
# 3513 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISC equ 0F94h ;# 
# 3518 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRC equ 0F94h ;# 
# 3734 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCTUNE equ 0F9Bh ;# 
# 3803 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIE1 equ 0F9Dh ;# 
# 3876 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIR1 equ 0F9Eh ;# 
# 3949 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IPR1 equ 0F9Fh ;# 
# 4022 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIE2 equ 0FA0h ;# 
# 4087 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIR2 equ 0FA1h ;# 
# 4152 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IPR2 equ 0FA2h ;# 
# 4217 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EECON1 equ 0FA6h ;# 
# 4282 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EECON2 equ 0FA7h ;# 
# 4288 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EEDATA equ 0FA8h ;# 
# 4294 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EEADR equ 0FA9h ;# 
# 4355 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCSTA equ 0FABh ;# 
# 4360 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCSTA1 equ 0FABh ;# 
# 4564 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXSTA equ 0FACh ;# 
# 4569 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXSTA1 equ 0FACh ;# 
# 4861 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXREG equ 0FADh ;# 
# 4866 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXREG1 equ 0FADh ;# 
# 4872 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCREG equ 0FAEh ;# 
# 4877 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCREG1 equ 0FAEh ;# 
# 4883 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRG equ 0FAFh ;# 
# 4888 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRG1 equ 0FAFh ;# 
# 4894 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRGH equ 0FB0h ;# 
# 4900 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T3CON equ 0FB1h ;# 
# 5008 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3 equ 0FB2h ;# 
# 5014 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3L equ 0FB2h ;# 
# 5020 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3H equ 0FB3h ;# 
# 5026 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ECCP1AS equ 0FB6h ;# 
# 5107 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PWM1CON equ 0FB7h ;# 
# 5176 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BAUDCON equ 0FB8h ;# 
# 5181 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BAUDCTL equ 0FB8h ;# 
# 5341 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PSTRCON equ 0FB9h ;# 
# 5384 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON0 equ 0FBAh ;# 
# 5389 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON0 equ 0FBAh ;# 
# 5461 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON1 equ 0FBBh ;# 
# 5466 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON1 equ 0FBBh ;# 
# 5596 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON2 equ 0FBCh ;# 
# 5601 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON2 equ 0FBCh ;# 
# 5681 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCP1CON equ 0FBDh ;# 
# 5762 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1 equ 0FBEh ;# 
# 5768 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1L equ 0FBEh ;# 
# 5774 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1H equ 0FBFh ;# 
# 5780 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON2 equ 0FC0h ;# 
# 5850 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON1 equ 0FC1h ;# 
# 5896 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON0 equ 0FC2h ;# 
# 6018 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRES equ 0FC3h ;# 
# 6024 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRESL equ 0FC3h ;# 
# 6030 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRESH equ 0FC4h ;# 
# 6036 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPCON2 equ 0FC5h ;# 
# 6097 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPCON1 equ 0FC6h ;# 
# 6166 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPSTAT equ 0FC7h ;# 
# 6405 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPADD equ 0FC8h ;# 
# 6411 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPBUF equ 0FC9h ;# 
# 6417 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T2CON equ 0FCAh ;# 
# 6487 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PR2 equ 0FCBh ;# 
# 6492 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
MEMCON equ 0FCBh ;# 
# 6596 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR2 equ 0FCCh ;# 
# 6602 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T1CON equ 0FCDh ;# 
# 6706 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1 equ 0FCEh ;# 
# 6712 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1L equ 0FCEh ;# 
# 6718 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1H equ 0FCFh ;# 
# 6724 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCON equ 0FD0h ;# 
# 6856 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WDTCON equ 0FD1h ;# 
# 6883 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCCON2 equ 0FD2h ;# 
# 6914 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCCON equ 0FD3h ;# 
# 6992 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T0CON equ 0FD5h ;# 
# 7061 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0 equ 0FD6h ;# 
# 7067 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0L equ 0FD6h ;# 
# 7073 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0H equ 0FD7h ;# 
# 7079 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
STATUS equ 0FD8h ;# 
# 7157 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2 equ 0FD9h ;# 
# 7163 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2L equ 0FD9h ;# 
# 7169 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2H equ 0FDAh ;# 
# 7175 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW2 equ 0FDBh ;# 
# 7181 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC2 equ 0FDCh ;# 
# 7187 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC2 equ 0FDDh ;# 
# 7193 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC2 equ 0FDEh ;# 
# 7199 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF2 equ 0FDFh ;# 
# 7205 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BSR equ 0FE0h ;# 
# 7211 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1 equ 0FE1h ;# 
# 7217 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1L equ 0FE1h ;# 
# 7223 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1H equ 0FE2h ;# 
# 7229 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW1 equ 0FE3h ;# 
# 7235 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC1 equ 0FE4h ;# 
# 7241 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC1 equ 0FE5h ;# 
# 7247 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC1 equ 0FE6h ;# 
# 7253 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF1 equ 0FE7h ;# 
# 7259 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WREG equ 0FE8h ;# 
# 7270 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0 equ 0FE9h ;# 
# 7276 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0L equ 0FE9h ;# 
# 7282 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0H equ 0FEAh ;# 
# 7288 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW0 equ 0FEBh ;# 
# 7294 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC0 equ 0FECh ;# 
# 7300 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC0 equ 0FEDh ;# 
# 7306 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC0 equ 0FEEh ;# 
# 7312 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF0 equ 0FEFh ;# 
# 7318 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON3 equ 0FF0h ;# 
# 7409 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON2 equ 0FF1h ;# 
# 7478 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON equ 0FF2h ;# 
# 7624 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PROD equ 0FF3h ;# 
# 7630 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PRODL equ 0FF3h ;# 
# 7636 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PRODH equ 0FF4h ;# 
# 7642 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TABLAT equ 0FF5h ;# 
# 7650 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTR equ 0FF6h ;# 
# 7656 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRL equ 0FF6h ;# 
# 7662 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRH equ 0FF7h ;# 
# 7668 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRU equ 0FF8h ;# 
# 7676 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLAT equ 0FF9h ;# 
# 7683 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PC equ 0FF9h ;# 
# 7689 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCL equ 0FF9h ;# 
# 7695 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLATH equ 0FFAh ;# 
# 7701 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLATU equ 0FFBh ;# 
# 7707 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
STKPTR equ 0FFCh ;# 
# 7780 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOS equ 0FFDh ;# 
# 7786 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSL equ 0FFDh ;# 
# 7792 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSH equ 0FFEh ;# 
# 7798 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSU equ 0FFFh ;# 
# 51 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP0 equ 0F53h ;# 
# 182 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP1 equ 0F54h ;# 
# 313 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP2 equ 0F55h ;# 
# 444 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP3 equ 0F56h ;# 
# 575 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP4 equ 0F57h ;# 
# 706 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP5 equ 0F58h ;# 
# 837 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP6 equ 0F59h ;# 
# 968 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEP7 equ 0F5Ah ;# 
# 1099 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEIE equ 0F5Bh ;# 
# 1149 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UADDR equ 0F5Ch ;# 
# 1212 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UFRML equ 0F5Dh ;# 
# 1281 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UFRMH equ 0F5Eh ;# 
# 1320 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UEIR equ 0F5Fh ;# 
# 1370 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UIE equ 0F60h ;# 
# 1425 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UCFG equ 0F61h ;# 
# 1487 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UIR equ 0F62h ;# 
# 1542 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
USTAT equ 0F63h ;# 
# 1592 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
UCON equ 0F64h ;# 
# 1642 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SRCON0 equ 0F68h ;# 
# 1712 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SRCON1 equ 0F69h ;# 
# 1773 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM2CON0 equ 0F6Bh ;# 
# 1842 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM2CON1 equ 0F6Ch ;# 
# 1903 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CM1CON0 equ 0F6Dh ;# 
# 1972 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPMSK equ 0F6Fh ;# 
# 1977 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPMASK equ 0F6Fh ;# 
# 2109 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SLRCON equ 0F76h ;# 
# 2140 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WPUA equ 0F77h ;# 
# 2172 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WPUB equ 0F78h ;# 
# 2210 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IOCA equ 0F79h ;# 
# 2254 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IOCB equ 0F7Ah ;# 
# 2292 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ANSEL equ 0F7Eh ;# 
# 2336 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ANSELH equ 0F7Fh ;# 
# 2373 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTA equ 0F80h ;# 
# 2509 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTB equ 0F81h ;# 
# 2660 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PORTC equ 0F82h ;# 
# 2956 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATA equ 0F89h ;# 
# 3062 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATB equ 0F8Ah ;# 
# 3171 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
LATC equ 0F8Bh ;# 
# 3303 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISA equ 0F92h ;# 
# 3308 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRA equ 0F92h ;# 
# 3384 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISB equ 0F93h ;# 
# 3389 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRB equ 0F93h ;# 
# 3513 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TRISC equ 0F94h ;# 
# 3518 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
DDRC equ 0F94h ;# 
# 3734 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCTUNE equ 0F9Bh ;# 
# 3803 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIE1 equ 0F9Dh ;# 
# 3876 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIR1 equ 0F9Eh ;# 
# 3949 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IPR1 equ 0F9Fh ;# 
# 4022 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIE2 equ 0FA0h ;# 
# 4087 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PIR2 equ 0FA1h ;# 
# 4152 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
IPR2 equ 0FA2h ;# 
# 4217 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EECON1 equ 0FA6h ;# 
# 4282 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EECON2 equ 0FA7h ;# 
# 4288 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EEDATA equ 0FA8h ;# 
# 4294 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
EEADR equ 0FA9h ;# 
# 4355 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCSTA equ 0FABh ;# 
# 4360 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCSTA1 equ 0FABh ;# 
# 4564 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXSTA equ 0FACh ;# 
# 4569 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXSTA1 equ 0FACh ;# 
# 4861 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXREG equ 0FADh ;# 
# 4866 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TXREG1 equ 0FADh ;# 
# 4872 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCREG equ 0FAEh ;# 
# 4877 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCREG1 equ 0FAEh ;# 
# 4883 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRG equ 0FAFh ;# 
# 4888 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRG1 equ 0FAFh ;# 
# 4894 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SPBRGH equ 0FB0h ;# 
# 4900 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T3CON equ 0FB1h ;# 
# 5008 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3 equ 0FB2h ;# 
# 5014 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3L equ 0FB2h ;# 
# 5020 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR3H equ 0FB3h ;# 
# 5026 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ECCP1AS equ 0FB6h ;# 
# 5107 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PWM1CON equ 0FB7h ;# 
# 5176 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BAUDCON equ 0FB8h ;# 
# 5181 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BAUDCTL equ 0FB8h ;# 
# 5341 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PSTRCON equ 0FB9h ;# 
# 5384 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON0 equ 0FBAh ;# 
# 5389 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON0 equ 0FBAh ;# 
# 5461 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON1 equ 0FBBh ;# 
# 5466 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON1 equ 0FBBh ;# 
# 5596 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
REFCON2 equ 0FBCh ;# 
# 5601 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
VREFCON2 equ 0FBCh ;# 
# 5681 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCP1CON equ 0FBDh ;# 
# 5762 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1 equ 0FBEh ;# 
# 5768 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1L equ 0FBEh ;# 
# 5774 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
CCPR1H equ 0FBFh ;# 
# 5780 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON2 equ 0FC0h ;# 
# 5850 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON1 equ 0FC1h ;# 
# 5896 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADCON0 equ 0FC2h ;# 
# 6018 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRES equ 0FC3h ;# 
# 6024 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRESL equ 0FC3h ;# 
# 6030 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
ADRESH equ 0FC4h ;# 
# 6036 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPCON2 equ 0FC5h ;# 
# 6097 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPCON1 equ 0FC6h ;# 
# 6166 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPSTAT equ 0FC7h ;# 
# 6405 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPADD equ 0FC8h ;# 
# 6411 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
SSPBUF equ 0FC9h ;# 
# 6417 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T2CON equ 0FCAh ;# 
# 6487 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PR2 equ 0FCBh ;# 
# 6492 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
MEMCON equ 0FCBh ;# 
# 6596 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR2 equ 0FCCh ;# 
# 6602 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T1CON equ 0FCDh ;# 
# 6706 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1 equ 0FCEh ;# 
# 6712 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1L equ 0FCEh ;# 
# 6718 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR1H equ 0FCFh ;# 
# 6724 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
RCON equ 0FD0h ;# 
# 6856 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WDTCON equ 0FD1h ;# 
# 6883 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCCON2 equ 0FD2h ;# 
# 6914 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
OSCCON equ 0FD3h ;# 
# 6992 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
T0CON equ 0FD5h ;# 
# 7061 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0 equ 0FD6h ;# 
# 7067 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0L equ 0FD6h ;# 
# 7073 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TMR0H equ 0FD7h ;# 
# 7079 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
STATUS equ 0FD8h ;# 
# 7157 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2 equ 0FD9h ;# 
# 7163 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2L equ 0FD9h ;# 
# 7169 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR2H equ 0FDAh ;# 
# 7175 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW2 equ 0FDBh ;# 
# 7181 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC2 equ 0FDCh ;# 
# 7187 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC2 equ 0FDDh ;# 
# 7193 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC2 equ 0FDEh ;# 
# 7199 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF2 equ 0FDFh ;# 
# 7205 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
BSR equ 0FE0h ;# 
# 7211 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1 equ 0FE1h ;# 
# 7217 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1L equ 0FE1h ;# 
# 7223 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR1H equ 0FE2h ;# 
# 7229 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW1 equ 0FE3h ;# 
# 7235 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC1 equ 0FE4h ;# 
# 7241 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC1 equ 0FE5h ;# 
# 7247 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC1 equ 0FE6h ;# 
# 7253 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF1 equ 0FE7h ;# 
# 7259 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
WREG equ 0FE8h ;# 
# 7270 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0 equ 0FE9h ;# 
# 7276 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0L equ 0FE9h ;# 
# 7282 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
FSR0H equ 0FEAh ;# 
# 7288 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PLUSW0 equ 0FEBh ;# 
# 7294 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PREINC0 equ 0FECh ;# 
# 7300 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTDEC0 equ 0FEDh ;# 
# 7306 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
POSTINC0 equ 0FEEh ;# 
# 7312 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INDF0 equ 0FEFh ;# 
# 7318 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON3 equ 0FF0h ;# 
# 7409 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON2 equ 0FF1h ;# 
# 7478 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
INTCON equ 0FF2h ;# 
# 7624 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PROD equ 0FF3h ;# 
# 7630 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PRODL equ 0FF3h ;# 
# 7636 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PRODH equ 0FF4h ;# 
# 7642 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TABLAT equ 0FF5h ;# 
# 7650 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTR equ 0FF6h ;# 
# 7656 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRL equ 0FF6h ;# 
# 7662 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRH equ 0FF7h ;# 
# 7668 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TBLPTRU equ 0FF8h ;# 
# 7676 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLAT equ 0FF9h ;# 
# 7683 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PC equ 0FF9h ;# 
# 7689 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCL equ 0FF9h ;# 
# 7695 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLATH equ 0FFAh ;# 
# 7701 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
PCLATU equ 0FFBh ;# 
# 7707 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
STKPTR equ 0FFCh ;# 
# 7780 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOS equ 0FFDh ;# 
# 7786 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSL equ 0FFDh ;# 
# 7792 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSH equ 0FFEh ;# 
# 7798 "/opt/microchip/xc8/v1.35/include/pic18f14k50.h"
TOSU equ 0FFFh ;# 
	FNCALL	_main,_BootMain
	FNCALL	_BootMain,_BlinkUSBStatus
	FNCALL	_BootMain,_InitializeSystem
	FNCALL	_BootMain,_LowVoltageCheck
	FNCALL	_BootMain,_ProcessIO
	FNCALL	_BootMain,_USBDeviceTasks
	FNCALL	_ProcessIO,_ClearWatchdog
	FNCALL	_ProcessIO,_HIDRxReport
	FNCALL	_ProcessIO,_HIDTxReport
	FNCALL	_ProcessIO,_ResetDeviceCleanly
	FNCALL	_ProcessIO,_SignFlash
	FNCALL	_ProcessIO,_USBDeviceTasks
	FNCALL	_ProcessIO,_UnlockAndActivate
	FNCALL	_ProcessIO,_WriteConfigBits
	FNCALL	_ProcessIO,_WriteEEPROM
	FNCALL	_ProcessIO,_WriteFlashBlock
	FNCALL	_WriteFlashBlock,_UnlockAndActivate
	FNCALL	_WriteEEPROM,_UnlockAndActivate
	FNCALL	_WriteConfigBits,_UnlockAndActivate
	FNCALL	_USBDeviceTasks,_USBCheckBusStatus
	FNCALL	_USBDeviceTasks,_USBCtrlTrfInHandler
	FNCALL	_USBDeviceTasks,_USBCtrlTrfSetupHandler
	FNCALL	_USBDeviceTasks,_USBProtocolResetHandler
	FNCALL	_USBDeviceTasks,_USBSuspend
	FNCALL	_USBDeviceTasks,_USBWakeFromSuspend
	FNCALL	_USBWakeFromSuspend,_USBCBWakeFromSuspend
	FNCALL	_USBCBWakeFromSuspend,_DelayRoutine
	FNCALL	_USBSuspend,_USBCBSuspend
	FNCALL	_USBCtrlTrfSetupHandler,_USBCBCheckOtherReq
	FNCALL	_USBCtrlTrfSetupHandler,_USBCheckStdRequest
	FNCALL	_USBCtrlTrfSetupHandler,_USBCtrlEPServiceComplete
	FNCALL	_USBCtrlEPServiceComplete,_LoadBDTandSetUOWN
	FNCALL	_USBCtrlEPServiceComplete,_USBCtrlTrfTxService
	FNCALL	_USBCheckStdRequest,_USBStdFeatureReqHandler
	FNCALL	_USBCheckStdRequest,_USBStdGetDscHandler
	FNCALL	_USBCheckStdRequest,_USBStdGetStatusHandler
	FNCALL	_USBCheckStdRequest,_USBStdSetCfgHandler
	FNCALL	_USBStdSetCfgHandler,_USBCBInitEP
	FNCALL	_USBCBCheckOtherReq,_USBCheckHIDRequest
	FNCALL	_USBCheckHIDRequest,_HIDGetReportHandler
	FNCALL	_USBCheckHIDRequest,_HIDSetReportHandler
	FNCALL	_USBCtrlTrfInHandler,_USBCtrlTrfTxService
	FNCALL	_SignFlash,_ClearWatchdog
	FNCALL	_SignFlash,_UnlockAndActivate
	FNCALL	_UnlockAndActivate,_LowVoltageCheck
	FNCALL	_ResetDeviceCleanly,_USBDisableWithLongDelay
	FNCALL	_InitializeSystem,_USBDeviceInit
	FNCALL	_InitializeSystem,_UserInit
	FNCALL	_USBDeviceInit,_USBCheckBusStatus
	FNCALL	_USBDeviceInit,_USBDisableWithLongDelay
	FNCALL	_USBCheckBusStatus,_USBSoftAttach
	FNCALL	_USBSoftAttach,_USBDisableWithLongDelay
	FNCALL	_USBSoftAttach,_USBProtocolResetHandler
	FNCALL	_USBProtocolResetHandler,_ClearWatchdog
	FNCALL	_USBProtocolResetHandler,_LoadBDTandSetUOWN
	FNCALL	_USBProtocolResetHandler,_USBCBInitEP
	FNCALL	_USBCBInitEP,_HIDInitEP
	FNCALL	_USBCBInitEP,_UserInit
	FNCALL	_USBDisableWithLongDelay,_DelayRoutine
	FNCALL	_DelayRoutine,_ClearWatchdog
	FNROOT	_main
	global	_USB_SD_Ptr
psect	smallconst,class=SMALLCONST,space=0,reloc=2,noexec
global __psmallconst
__psmallconst:
	db	0
	file	"usb_descriptors.c"
	line	280
_USB_SD_Ptr:
		db	low(_sd000)

		db	low(_sd001)

		db	low(_sd002)

	global __end_of_USB_SD_Ptr
__end_of_USB_SD_Ptr:
	global	_FlashSignatureWord
	global	_FlashSignatureWord_absconstaddr
_FlashSignatureWord_absconstaddr	set	0x1006
	global	_sd001
psect	smallconst
	file	"usb_descriptors.c"
	line	247
_sd001:
	db	low(034h)
	db	low(03h)
	dw	(04Dh)&0ffffh
	dw	(069h)&0ffffh
	dw	(063h)&0ffffh
	dw	(072h)&0ffffh
	dw	(06Fh)&0ffffh
	dw	(063h)&0ffffh
	dw	(068h)&0ffffh
	dw	(069h)&0ffffh
	dw	(070h)&0ffffh
	dw	(020h)&0ffffh
	dw	(054h)&0ffffh
	dw	(065h)&0ffffh
	dw	(063h)&0ffffh
	dw	(068h)&0ffffh
	dw	(06Eh)&0ffffh
	dw	(06Fh)&0ffffh
	dw	(06Ch)&0ffffh
	dw	(06Fh)&0ffffh
	dw	(067h)&0ffffh
	dw	(079h)&0ffffh
	dw	(020h)&0ffffh
	dw	(049h)&0ffffh
	dw	(06Eh)&0ffffh
	dw	(063h)&0ffffh
	dw	(02Eh)&0ffffh
	global __end_of_sd001
__end_of_sd001:
	global	_CFG01
psect	smallconst
	file	"usb_descriptors.c"
	line	191
_CFG01:
	db	low(09h)
	db	low(02h)
	db	low(029h)
	db	low(0)
	db	low(01h)
	db	low(01h)
	db	low(0)
	db	low(080h)
	db	low(032h)
	db	low(09h)
	db	low(04h)
	db	low(0)
	db	low(0)
	db	low(02h)
	db	low(03h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(09h)
	db	low(021h)
	db	low(011h)
	db	low(01h)
	db	low(0)
	db	low(01h)
	db	low(022h)
	db	low(01Dh)
	db	low(0)
	db	low(07h)
	db	low(05h)
	db	low(081h)
	db	low(03h)
	db	low(040h)
	db	low(0)
	db	low(01h)
	db	low(07h)
	db	low(05h)
	db	low(01h)
	db	low(03h)
	db	low(040h)
	db	low(0)
	db	low(01h)
	global __end_of_CFG01
__end_of_CFG01:
	global	_sd002
psect	smallconst
	file	"usb_descriptors.c"
	line	252
_sd002:
	db	low(026h)
	db	low(03h)
	dw	(048h)&0ffffh
	dw	(049h)&0ffffh
	dw	(044h)&0ffffh
	dw	(020h)&0ffffh
	dw	(055h)&0ffffh
	dw	(053h)&0ffffh
	dw	(042h)&0ffffh
	dw	(020h)&0ffffh
	dw	(042h)&0ffffh
	dw	(06Fh)&0ffffh
	dw	(06Fh)&0ffffh
	dw	(074h)&0ffffh
	dw	(06Ch)&0ffffh
	dw	(06Fh)&0ffffh
	dw	(061h)&0ffffh
	dw	(064h)&0ffffh
	dw	(065h)&0ffffh
	dw	(072h)&0ffffh
	global __end_of_sd002
__end_of_sd002:
	global	_hid_rpt01
psect	smallconst
	file	"usb_descriptors.c"
	line	257
_hid_rpt01:
	db	low(06h)
	db	low(0)
	db	low(0FFh)
	db	low(09h)
	db	low(01h)
	db	low(0A1h)
	db	low(01h)
	db	low(019h)
	db	low(01h)
	db	low(029h)
	db	low(040h)
	db	low(015h)
	db	low(0)
	db	low(026h)
	db	low(0FFh)
	db	low(0)
	db	low(075h)
	db	low(08h)
	db	low(095h)
	db	low(040h)
	db	low(081h)
	db	low(0)
	db	low(019h)
	db	low(01h)
	db	low(029h)
	db	low(040h)
	db	low(091h)
	db	low(0)
	db	low(0C0h)
	global __end_of_hid_rpt01
__end_of_hid_rpt01:
	global	_device_dsc
psect	smallconst
	file	"usb_descriptors.c"
	line	172
_device_dsc:
	db	low(012h)
	db	low(01h)
	dw	(0200h)&0ffffh
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(08h)
	dw	(04D8h)&0ffffh
	dw	(03Ch)&0ffffh
	dw	(0101h)&0ffffh
	db	low(01h)
	db	low(02h)
	db	low(0)
	db	low(01h)
	global __end_of_device_dsc
__end_of_device_dsc:
	global	_sd000
psect	smallconst
	file	"usb_descriptors.c"
	line	244
_sd000:
	db	low(04h)
	db	low(03h)
	dw	(0409h)&0ffffh
	global __end_of_sd000
__end_of_sd000:
	global	_USB_SD_Ptr
	global	_FlashSignatureWord
	global	_FlashSignatureWord_absconstaddr
_FlashSignatureWord_absconstaddr	set	0x1006
psect	_FlashSignatureWord_const,class=CODE,space=0,ovrld,reloc=2,noexec
global __p_FlashSignatureWord_const
__p_FlashSignatureWord_const:
	global	_FlashSignatureWord
_FlashSignatureWord:
	dw	(0600Dh)&0ffffh
	global __end_of_FlashSignatureWord
__end_of_FlashSignatureWord:
	global	_sd001
	global	_CFG01
	global	_sd002
	global	_hid_rpt01
	global	_device_dsc
	global	_sd000
	global	_SetupPkt
	global	_ProgrammedPointer
	global	_TempBDT
	global	ProcessIO@pROM
	global	SignFlash@pROM
	global	WriteFlashBlock@pROM
	global	_pDst
	global	_pSrc
	global	BlinkUSBStatus@led_count
	global	LoadBDTandSetUOWN@pBDTEntry
	global	USBDeviceTasks@pBDTEntry
	global	_ErasePageTracker
	global	_wCount
	global	ProcessIO@i
	global	SignFlash@i
	global	USBCtrlTrfTxService@bytes_to_send
	global	USBDeviceTasks@i
	global	USBStdSetCfgHandler@i
	global	USBSuspend@UIESave
	global	WriteConfigBits@i
	global	WriteEEPROM@i
	global	WriteFlashBlock@BytesTakenFromBuffer
	global	WriteFlashBlock@CorrectionFactor
	global	WriteFlashBlock@i
	global	_BootState
	global	_BufferedDataIndex
	global	_ConfigsLockValue
	global	_DeviceIsSoftDetached
	global	_EP0OutOddNeedsArmingNext
	global	_bTRNIFCount
	global	_ctrl_trf_session_owner
	global	_ctrl_trf_state
	global	_hid_rpt_rx_len
	global	_short_pkt_status
	global	_usb_device_state
	global	_usb_stat
	global	_active_protocol
	global	_idle_rate
	global	_usb_active_cfg
	global	_usb_alt_intf
	global	_PacketFromPC
	global	_PacketToPC
	global	_ProgrammingBuffer
	global	_ep0Bi

	DABS	1,520,4,_ep0Bi
	global	_ep1Bi

	DABS	1,528,4,_ep1Bi
	global	_EP0OutEvenBuf

	DABS	1,532,8,_EP0OutEvenBuf
	global	_ep0BoOdd

	DABS	1,516,4,_ep0BoOdd
	global	_ep1Bo

	DABS	1,524,4,_ep1Bo
	global	_ep0BoEven

	DABS	1,512,4,_ep0BoEven
	global	_UADDR
_UADDR	set	0xF5C
	global	_UEIE
_UEIE	set	0xF5B
	global	_UEP0
_UEP0	set	0xF53
	global	_UEP1
_UEP1	set	0xF54
	global	_UEP2
_UEP2	set	0xF55
	global	_UEP3
_UEP3	set	0xF56
	global	_UEP4
_UEP4	set	0xF57
	global	_UEP5
_UEP5	set	0xF58
	global	_UEP6
_UEP6	set	0xF59
	global	_UEP7
_UEP7	set	0xF5A
	global	_ANSEL
_ANSEL	set	0xF7E
	global	_ANSELH
_ANSELH	set	0xF7F
	global	_EEADR
_EEADR	set	0xFA9
	global	_EECON1
_EECON1	set	0xFA6
	global	_EECON1bits
_EECON1bits	set	0xFA6
	global	_EECON2
_EECON2	set	0xFA7
	global	_EEDATA
_EEDATA	set	0xFA8
	global	_INTCON
_INTCON	set	0xFF2
	global	_INTCONbits
_INTCONbits	set	0xFF2
	global	_LATC
_LATC	set	0xF8B
	global	_LATCbits
_LATCbits	set	0xF8B
	global	_OSCCON
_OSCCON	set	0xFD3
	global	_PIE2bits
_PIE2bits	set	0xFA0
	global	_PIR2bits
_PIR2bits	set	0xFA1
	global	_PORTBbits
_PORTBbits	set	0xF81
	global	_RCONbits
_RCONbits	set	0xFD0
	global	_STKPTR
_STKPTR	set	0xFFC
	global	_TABLAT
_TABLAT	set	0xFF5
	global	_TBLPTRH
_TBLPTRH	set	0xFF7
	global	_TBLPTRL
_TBLPTRL	set	0xFF6
	global	_TBLPTRU
_TBLPTRU	set	0xFF8
	global	_TRISB
_TRISB	set	0xF93
	global	_TRISBbits
_TRISBbits	set	0xF93
	global	_TRISC
_TRISC	set	0xF94
	global	_TRISCbits
_TRISCbits	set	0xF94
	global	_UCFG
_UCFG	set	0xF61
	global	_UCON
_UCON	set	0xF64
	global	_UCONbits
_UCONbits	set	0xF64
	global	_UIE
_UIE	set	0xF60
	global	_UIEbits
_UIEbits	set	0xF60
	global	_UIR
_UIR	set	0xF62
	global	_UIRbits
_UIRbits	set	0xF62
	global	_USTAT
_USTAT	set	0xF63
	global	_USTATbits
_USTATbits	set	0xF63
	global	_ANS10
_ANS10	set	0x7BFA
	global	_LATC4
_LATC4	set	0x7C5C
	global	_LATC5
_LATC5	set	0x7C5D
	global	_RB5
_RB5	set	0x7C0D
	global	_TRISC4
_TRISC4	set	0x7CA4
	global	_TRISC5
_TRISC5	set	0x7CA5
	global	_WPUB4
_WPUB4	set	0x7BC4
	global	_WPUB5
_WPUB5	set	0x7BC5
	global	_WPUB6
_WPUB6	set	0x7BC6
	global	_nRABPU
_nRABPU	set	0x7F8F
	global	_hid_report_in

	DABS	1,620,64,_hid_report_in
	global	_hid_report_out

	DABS	1,556,64,_hid_report_out
	global	_CtrlTrfData

	DABS	1,548,8,_CtrlTrfData
	global	_EP0OutOddBuf

	DABS	1,540,8,_EP0OutOddBuf
; #config settings
global __CFG_CPUDIV$NOCLKDIV
__CFG_CPUDIV$NOCLKDIV equ 0x0
global __CFG_USBDIV$OFF
__CFG_USBDIV$OFF equ 0x0
global __CFG_FCMEN$OFF
__CFG_FCMEN$OFF equ 0x0
global __CFG_IESO$OFF
__CFG_IESO$OFF equ 0x0
global __CFG_FOSC$HS
__CFG_FOSC$HS equ 0x0
global __CFG_PLLEN$ON
__CFG_PLLEN$ON equ 0x0
global __CFG_BOREN$ON
__CFG_BOREN$ON equ 0x0
global __CFG_BORV$30
__CFG_BORV$30 equ 0x0
global __CFG_PWRTEN$OFF
__CFG_PWRTEN$OFF equ 0x0
global __CFG_WDTPS$32768
__CFG_WDTPS$32768 equ 0x0
global __CFG_WDTEN$OFF
__CFG_WDTEN$OFF equ 0x0
global __CFG_HFOFST$OFF
__CFG_HFOFST$OFF equ 0x0
global __CFG_MCLRE$OFF
__CFG_MCLRE$OFF equ 0x0
global __CFG_STVREN$ON
__CFG_STVREN$ON equ 0x0
global __CFG_LVP$OFF
__CFG_LVP$OFF equ 0x0
global __CFG_XINST$OFF
__CFG_XINST$OFF equ 0x0
global __CFG_BBSIZ$OFF
__CFG_BBSIZ$OFF equ 0x0
global __CFG_CP0$OFF
__CFG_CP0$OFF equ 0x0
global __CFG_CP1$OFF
__CFG_CP1$OFF equ 0x0
global __CFG_CPB$OFF
__CFG_CPB$OFF equ 0x0
global __CFG_WRT0$OFF
__CFG_WRT0$OFF equ 0x0
global __CFG_WRT1$OFF
__CFG_WRT1$OFF equ 0x0
global __CFG_WRTB$OFF
__CFG_WRTB$OFF equ 0x0
global __CFG_WRTC$OFF
__CFG_WRTC$OFF equ 0x0
global __CFG_EBTR0$OFF
__CFG_EBTR0$OFF equ 0x0
global __CFG_EBTR1$OFF
__CFG_EBTR1$OFF equ 0x0
global __CFG_EBTRB$OFF
__CFG_EBTRB$OFF equ 0x0
	file	"bin/main.as"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMRAM,class=COMRAM,space=1,noexec
global __pbssCOMRAM
__pbssCOMRAM:
	global	_SetupPkt
_SetupPkt:
       ds      8
	global	_ProgrammedPointer
_ProgrammedPointer:
       ds      4
	global	_TempBDT
_TempBDT:
       ds      4
ProcessIO@pROM:
       ds      3
SignFlash@pROM:
       ds      3
WriteFlashBlock@pROM:
       ds      3
	global	_pDst
_pDst:
       ds      3
	global	_pSrc
_pSrc:
       ds      3
BlinkUSBStatus@led_count:
       ds      2
LoadBDTandSetUOWN@pBDTEntry:
       ds      2
USBDeviceTasks@pBDTEntry:
       ds      2
	global	_ErasePageTracker
_ErasePageTracker:
       ds      2
	global	_wCount
_wCount:
       ds      2
ProcessIO@i:
       ds      1
SignFlash@i:
       ds      1
USBCtrlTrfTxService@bytes_to_send:
       ds      1
USBDeviceTasks@i:
       ds      1
USBStdSetCfgHandler@i:
       ds      1
USBSuspend@UIESave:
       ds      1
WriteConfigBits@i:
       ds      1
WriteEEPROM@i:
       ds      1
WriteFlashBlock@BytesTakenFromBuffer:
       ds      1
WriteFlashBlock@CorrectionFactor:
       ds      1
WriteFlashBlock@i:
       ds      1
	global	_BootState
_BootState:
       ds      1
	global	_BufferedDataIndex
_BufferedDataIndex:
       ds      1
	global	_ConfigsLockValue
_ConfigsLockValue:
       ds      1
	global	_DeviceIsSoftDetached
_DeviceIsSoftDetached:
       ds      1
	global	_EP0OutOddNeedsArmingNext
_EP0OutOddNeedsArmingNext:
       ds      1
	global	_bTRNIFCount
_bTRNIFCount:
       ds      1
	global	_ctrl_trf_session_owner
_ctrl_trf_session_owner:
       ds      1
	global	_ctrl_trf_state
_ctrl_trf_state:
       ds      1
	global	_hid_rpt_rx_len
_hid_rpt_rx_len:
       ds      1
	global	_short_pkt_status
_short_pkt_status:
       ds      1
	global	_usb_device_state
_usb_device_state:
       ds      1
	global	_usb_stat
_usb_stat:
       ds      1
	global	_active_protocol
_active_protocol:
       ds      1
	global	_idle_rate
_idle_rate:
       ds      1
	global	_usb_active_cfg
_usb_active_cfg:
       ds      1
	global	_usb_alt_intf
_usb_alt_intf:
       ds      1
psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
	global	_PacketFromPC
_PacketFromPC:
       ds      65
	global	_PacketToPC
_PacketToPC:
       ds      65
psect	bssBANK1,class=BANK1,space=1,noexec
global __pbssBANK1
__pbssBANK1:
	global	_ProgrammingBuffer
_ProgrammingBuffer:
       ds      64
	file	"bin/main.as"
	line	#
psect	cinit
; Clear objects allocated to BANK1 (64 bytes)
	global __pbssBANK1
lfsr	0,__pbssBANK1
movlw	64
clear_0:
clrf	postinc0,c
decf	wreg
bnz	clear_0
; Clear objects allocated to BANK0 (130 bytes)
	global __pbssBANK0
lfsr	0,__pbssBANK0
movlw	130
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
; Clear objects allocated to COMRAM (68 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	68
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
	GLOBAL	__Lmediumconst
	movlw	low highword(__Lmediumconst)
	movwf	tblptru
movlb 0
goto _main	;jump to C main() function
psect	cstackCOMRAM,class=COMRAM,space=1,noexec
global __pcstackCOMRAM
__pcstackCOMRAM:
?_BootMain:	; 0 bytes @ 0x0
?_InitializeSystem:	; 0 bytes @ 0x0
?_USBDeviceTasks:	; 0 bytes @ 0x0
?_BlinkUSBStatus:	; 0 bytes @ 0x0
??_BlinkUSBStatus:	; 0 bytes @ 0x0
?_LowVoltageCheck:	; 0 bytes @ 0x0
??_LowVoltageCheck:	; 0 bytes @ 0x0
?_ProcessIO:	; 0 bytes @ 0x0
?_UserInit:	; 0 bytes @ 0x0
??_UserInit:	; 0 bytes @ 0x0
?_USBDeviceInit:	; 0 bytes @ 0x0
?_DelayRoutine:	; 0 bytes @ 0x0
?_HIDInitEP:	; 0 bytes @ 0x0
??_HIDInitEP:	; 0 bytes @ 0x0
?_USBCheckHIDRequest:	; 0 bytes @ 0x0
??_USBCheckHIDRequest:	; 0 bytes @ 0x0
?_HIDTxReport:	; 0 bytes @ 0x0
?_ClearWatchdog:	; 0 bytes @ 0x0
??_ClearWatchdog:	; 0 bytes @ 0x0
?_UnlockAndActivate:	; 0 bytes @ 0x0
??_UnlockAndActivate:	; 0 bytes @ 0x0
?_WriteConfigBits:	; 0 bytes @ 0x0
?_WriteEEPROM:	; 0 bytes @ 0x0
?_WriteFlashBlock:	; 0 bytes @ 0x0
?_SignFlash:	; 0 bytes @ 0x0
?_ResetDeviceCleanly:	; 0 bytes @ 0x0
?_USBDisableWithLongDelay:	; 0 bytes @ 0x0
?_USBCheckBusStatus:	; 0 bytes @ 0x0
?_USBProtocolResetHandler:	; 0 bytes @ 0x0
?_USBWakeFromSuspend:	; 0 bytes @ 0x0
?_USBSuspend:	; 0 bytes @ 0x0
??_USBSuspend:	; 0 bytes @ 0x0
?_USBCtrlTrfSetupHandler:	; 0 bytes @ 0x0
?_USBCtrlTrfInHandler:	; 0 bytes @ 0x0
??_USBCtrlTrfInHandler:	; 0 bytes @ 0x0
?_LoadBDTandSetUOWN:	; 0 bytes @ 0x0
??_LoadBDTandSetUOWN:	; 0 bytes @ 0x0
?_USBCheckStdRequest:	; 0 bytes @ 0x0
?_USBCtrlEPServiceComplete:	; 0 bytes @ 0x0
?_USBCtrlTrfTxService:	; 0 bytes @ 0x0
??_USBCtrlTrfTxService:	; 0 bytes @ 0x0
?_USBStdGetDscHandler:	; 0 bytes @ 0x0
??_USBStdGetDscHandler:	; 0 bytes @ 0x0
?_USBStdSetCfgHandler:	; 0 bytes @ 0x0
?_USBStdGetStatusHandler:	; 0 bytes @ 0x0
??_USBStdGetStatusHandler:	; 0 bytes @ 0x0
?_USBStdFeatureReqHandler:	; 0 bytes @ 0x0
??_USBStdFeatureReqHandler:	; 0 bytes @ 0x0
?_HIDGetReportHandler:	; 0 bytes @ 0x0
??_HIDGetReportHandler:	; 0 bytes @ 0x0
?_HIDSetReportHandler:	; 0 bytes @ 0x0
??_HIDSetReportHandler:	; 0 bytes @ 0x0
?_main:	; 0 bytes @ 0x0
?_USBCBWakeFromSuspend:	; 0 bytes @ 0x0
?_USBCBSuspend:	; 0 bytes @ 0x0
??_USBCBSuspend:	; 0 bytes @ 0x0
?_USBCBInitEP:	; 0 bytes @ 0x0
??_USBCBInitEP:	; 0 bytes @ 0x0
?_USBCBCheckOtherReq:	; 0 bytes @ 0x0
??_USBCBCheckOtherReq:	; 0 bytes @ 0x0
?_USBSoftAttach:	; 0 bytes @ 0x0
?_HIDRxReport:	; 1 bytes @ 0x0
	global	USBCBInitEP@ConfigurationIndex
USBCBInitEP@ConfigurationIndex:	; 1 bytes @ 0x0
	global	UnlockAndActivate@UnlockKey
UnlockAndActivate@UnlockKey:	; 1 bytes @ 0x0
	global	LoadBDTandSetUOWN@BDTIndexToLoad
LoadBDTandSetUOWN@BDTIndexToLoad:	; 1 bytes @ 0x0
	global	HIDTxReport@len
HIDTxReport@len:	; 1 bytes @ 0x0
	global	HIDRxReport@len
HIDRxReport@len:	; 1 bytes @ 0x0
	global	DelayRoutine@DelayAmount
DelayRoutine@DelayAmount:	; 2 bytes @ 0x0
	ds   1
??_HIDRxReport:	; 0 bytes @ 0x1
??_HIDTxReport:	; 0 bytes @ 0x1
??_WriteConfigBits:	; 0 bytes @ 0x1
??_WriteEEPROM:	; 0 bytes @ 0x1
??_WriteFlashBlock:	; 0 bytes @ 0x1
??_SignFlash:	; 0 bytes @ 0x1
??_USBProtocolResetHandler:	; 0 bytes @ 0x1
??_USBCtrlEPServiceComplete:	; 0 bytes @ 0x1
??_USBStdSetCfgHandler:	; 0 bytes @ 0x1
	ds   1
??_InitializeSystem:	; 0 bytes @ 0x2
??_USBDeviceInit:	; 0 bytes @ 0x2
??_DelayRoutine:	; 0 bytes @ 0x2
??_ResetDeviceCleanly:	; 0 bytes @ 0x2
??_USBDisableWithLongDelay:	; 0 bytes @ 0x2
??_USBCheckBusStatus:	; 0 bytes @ 0x2
??_USBWakeFromSuspend:	; 0 bytes @ 0x2
??_USBCheckStdRequest:	; 0 bytes @ 0x2
??_USBCBWakeFromSuspend:	; 0 bytes @ 0x2
??_USBSoftAttach:	; 0 bytes @ 0x2
	global	HIDTxReport@buffer
HIDTxReport@buffer:	; 1 bytes @ 0x2
	global	HIDRxReport@buffer
HIDRxReport@buffer:	; 1 bytes @ 0x2
	ds   1
??_USBDeviceTasks:	; 0 bytes @ 0x3
??_USBCtrlTrfSetupHandler:	; 0 bytes @ 0x3
	global	HIDTxReport@i
HIDTxReport@i:	; 1 bytes @ 0x3
	ds   2
??_ProcessIO:	; 0 bytes @ 0x5
	ds   2
??_BootMain:	; 0 bytes @ 0x7
??_main:	; 0 bytes @ 0x7
	ds   2
	global	main@u
main@u:	; 2 bytes @ 0x9
	ds   2
	global	main@i
main@i:	; 2 bytes @ 0xB
	ds   2
	global	main@k
main@k:	; 1 bytes @ 0xD
	ds   1
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    185
;!    Data        0
;!    BSS         262
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM           95     14      82
;!    BANK0           160      0     130
;!    BANK1           256      0      64
;!    BANK2h           84      0       0

;!
;!Pointer List with Targets:
;!
;!    ep0BoEven.ADR	PTR unsigned char  size(2) Largest target is 0
;!		 -> hid_report_in(BIGRAMh[64]), hid_report_out(BIGRAMh[64]), EP0OutEvenBuf(ABS[8]), EP0OutOddBuf(BIGRAMh[8]), 
;!		 -> CtrlTrfData(BIGRAMh[8]), 
;!
;!    ep0BoOdd.ADR	PTR unsigned char  size(2) Largest target is 0
;!		 -> hid_report_in(BIGRAMh[64]), hid_report_out(BIGRAMh[64]), EP0OutEvenBuf(ABS[8]), EP0OutOddBuf(BIGRAMh[8]), 
;!		 -> CtrlTrfData(BIGRAMh[8]), 
;!
;!    HIDRxReport@buffer	PTR unsigned char  size(1) Largest target is 65
;!		 -> PacketFromPC(BANK0[65]), 
;!
;!    HIDTxReport@buffer	PTR unsigned char  size(1) Largest target is 65
;!		 -> PacketToPC(BANK0[65]), 
;!
;!    ep1Bi.ADR	PTR unsigned char  size(2) Largest target is 64
;!		 -> hid_report_in(BIGRAMh[64]), hid_report_out(BIGRAMh[64]), EP0OutEvenBuf(ABS[8]), EP0OutOddBuf(BIGRAMh[8]), 
;!		 -> CtrlTrfData(BIGRAMh[8]), 
;!
;!    ep1Bo.ADR	PTR unsigned char  size(2) Largest target is 64
;!		 -> hid_report_in(BIGRAMh[64]), hid_report_out(BIGRAMh[64]), EP0OutEvenBuf(ABS[8]), EP0OutOddBuf(BIGRAMh[8]), 
;!		 -> CtrlTrfData(BIGRAMh[8]), 
;!
;!    LoadBDTandSetUOWN@pBDTEntry	PTR volatile struct _BDT size(2) Largest target is 767
;!		 -> NULL(NULL[0]), RAM(DATA[767]), 
;!
;!    TempBDT.ADR	PTR unsigned char  size(2) Largest target is 64
;!		 -> hid_report_in(BIGRAMh[64]), hid_report_out(BIGRAMh[64]), EP0OutEvenBuf(ABS[8]), EP0OutOddBuf(BIGRAMh[8]), 
;!		 -> CtrlTrfData(BIGRAMh[8]), 
;!
;!    ep0Bi.ADR	PTR unsigned char  size(2) Largest target is 64
;!		 -> hid_report_in(BIGRAMh[64]), hid_report_out(BIGRAMh[64]), EP0OutEvenBuf(ABS[8]), EP0OutOddBuf(BIGRAMh[8]), 
;!		 -> CtrlTrfData(BIGRAMh[8]), 
;!
;!    USBDeviceTasks@pBDTEntry.ADR	PTR unsigned char  size(2) Largest target is 64
;!		 -> hid_report_in(BIGRAMh[64]), hid_report_out(BIGRAMh[64]), EP0OutEvenBuf(ABS[8]), EP0OutOddBuf(BIGRAMh[8]), 
;!		 -> CtrlTrfData(BIGRAMh[8]), 
;!
;!    USBDeviceTasks@pBDTEntry	PTR volatile struct _BDT size(2) Largest target is 5
;!		 -> NULL(NULL[0]), ep0BoOdd(ABS[4]), ep0BoEven(BIGRAMll[4]), 
;!
;!    ep0Bi...ADR	PTR unsigned char  size(2) Largest target is 64
;!		 -> hid_report_in(BIGRAMh[64]), hid_report_out(BIGRAMh[64]), EP0OutEvenBuf(ABS[8]), EP0OutOddBuf(BIGRAMh[8]), 
;!		 -> CtrlTrfData(BIGRAMh[8]), 
;!
;!    ep0BoOdd...ADR	PTR unsigned char  size(2) Largest target is 64
;!		 -> hid_report_in(BIGRAMh[64]), hid_report_out(BIGRAMh[64]), EP0OutEvenBuf(ABS[8]), EP0OutOddBuf(BIGRAMh[8]), 
;!		 -> CtrlTrfData(BIGRAMh[8]), 
;!
;!    ep0BoEven...ADR	PTR unsigned char  size(2) Largest target is 64
;!		 -> hid_report_in(BIGRAMh[64]), hid_report_out(BIGRAMh[64]), EP0OutEvenBuf(ABS[8]), EP0OutOddBuf(BIGRAMh[8]), 
;!		 -> CtrlTrfData(BIGRAMh[8]), 
;!
;!    TempBDT...ADR	PTR unsigned char  size(2) Largest target is 64
;!		 -> hid_report_in(BIGRAMh[64]), hid_report_out(BIGRAMh[64]), EP0OutEvenBuf(ABS[8]), EP0OutOddBuf(BIGRAMh[8]), 
;!		 -> CtrlTrfData(BIGRAMh[8]), 
;!
;!    pDst.wRom	PTR const unsigned short  size(2) Largest target is 0
;!
;!    pDst.bRom	PTR const unsigned char  size(2) Largest target is 0
;!
;!    pDst.wRam	PTR unsigned int  size(2) Largest target is 0
;!
;!    pDst.bRam	PTR unsigned char  size(2) Largest target is 0
;!
;!    S1193_POINTER$wRom	PTR const unsigned short  size(2) Largest target is 0
;!
;!    pSrc.wRom	PTR const unsigned short  size(2) Largest target is 0
;!
;!    S1193_POINTER$bRom	PTR const unsigned char  size(2) Largest target is 0
;!
;!    pSrc.bRom	PTR const unsigned char  size(2) Largest target is 0
;!
;!    S1193_POINTER$wRam	PTR unsigned int  size(2) Largest target is 0
;!
;!    pSrc.wRam	PTR unsigned int  size(2) Largest target is 0
;!
;!    S1193_POINTER$bRam	PTR unsigned char  size(2) Largest target is 0
;!
;!    pSrc.bRam	PTR unsigned char  size(2) Largest target is 0
;!
;!    USB_SD_Ptr	const PTR const unsigned char [3] size(1) Largest target is 52
;!		 -> sd002(CODE[38]), sd001(CODE[52]), sd000(CODE[4]), 
;!
;!    WriteFlashBlock@pROM	PTR const unsigned char  size(3) Largest target is 4095
;!		 -> ROM(CODE[4095]), 
;!
;!    SignFlash@pROM	PTR const unsigned char  size(3) Largest target is 4095
;!		 -> ROM(CODE[4095]), 
;!
;!    ProcessIO@pROM	PTR const unsigned char  size(3) Largest target is 4095
;!		 -> ROM(CODE[4095]), 
;!
;!    ep1Bi...ADR	PTR unsigned char  size(2) Largest target is 64
;!		 -> hid_report_in(BIGRAMh[64]), hid_report_out(BIGRAMh[64]), EP0OutEvenBuf(ABS[8]), EP0OutOddBuf(BIGRAMh[8]), 
;!		 -> CtrlTrfData(BIGRAMh[8]), 
;!
;!    S574$ADR	PTR unsigned char  size(2) Largest target is 64
;!		 -> hid_report_in(BIGRAMh[64]), hid_report_out(BIGRAMh[64]), EP0OutEvenBuf(ABS[8]), EP0OutOddBuf(BIGRAMh[8]), 
;!		 -> CtrlTrfData(BIGRAMh[8]), 
;!
;!    ep1Bo...ADR	PTR unsigned char  size(2) Largest target is 64
;!		 -> hid_report_in(BIGRAMh[64]), hid_report_out(BIGRAMh[64]), EP0OutEvenBuf(ABS[8]), EP0OutOddBuf(BIGRAMh[8]), 
;!		 -> CtrlTrfData(BIGRAMh[8]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _BootMain->_ProcessIO
;!    _ProcessIO->_USBDeviceTasks
;!    _ProcessIO->_WriteFlashBlock
;!    _WriteFlashBlock->_UnlockAndActivate
;!    _WriteEEPROM->_UnlockAndActivate
;!    _WriteConfigBits->_UnlockAndActivate
;!    _USBCBWakeFromSuspend->_DelayRoutine
;!    _USBCtrlTrfSetupHandler->_USBCheckStdRequest
;!    _USBCtrlEPServiceComplete->_LoadBDTandSetUOWN
;!    _USBCheckStdRequest->_USBStdFeatureReqHandler
;!    _USBCheckStdRequest->_USBStdGetStatusHandler
;!    _USBStdSetCfgHandler->_USBCBInitEP
;!    _SignFlash->_UnlockAndActivate
;!    _USBProtocolResetHandler->_LoadBDTandSetUOWN
;!    _USBProtocolResetHandler->_USBCBInitEP
;!    _USBDisableWithLongDelay->_DelayRoutine
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK2h
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 7     7      0    2709
;!                                              7 COMRAM     7     7      0
;!                           _BootMain
;! ---------------------------------------------------------------------------------
;! (1) _BootMain                                             0     0      0    2549
;!                     _BlinkUSBStatus
;!                   _InitializeSystem
;!                    _LowVoltageCheck
;!                          _ProcessIO
;!                     _USBDeviceTasks
;! ---------------------------------------------------------------------------------
;! (2) _ProcessIO                                            2     2      0    1569
;!                                              5 COMRAM     2     2      0
;!                      _ClearWatchdog
;!                        _HIDRxReport
;!                        _HIDTxReport
;!                 _ResetDeviceCleanly
;!                          _SignFlash
;!                     _USBDeviceTasks
;!                  _UnlockAndActivate
;!                    _WriteConfigBits
;!                        _WriteEEPROM
;!                    _WriteFlashBlock
;! ---------------------------------------------------------------------------------
;! (3) _WriteFlashBlock                                      4     4      0      22
;!                                              1 COMRAM     4     4      0
;!                  _UnlockAndActivate
;! ---------------------------------------------------------------------------------
;! (3) _WriteEEPROM                                          0     0      0      22
;!                  _UnlockAndActivate
;! ---------------------------------------------------------------------------------
;! (3) _WriteConfigBits                                      0     0      0      22
;!                  _UnlockAndActivate
;! ---------------------------------------------------------------------------------
;! (2) _USBDeviceTasks                                       2     2      0     534
;!                                              3 COMRAM     2     2      0
;!                  _USBCheckBusStatus
;!                _USBCtrlTrfInHandler
;!             _USBCtrlTrfSetupHandler
;!            _USBProtocolResetHandler
;!                         _USBSuspend
;!                 _USBWakeFromSuspend
;! ---------------------------------------------------------------------------------
;! (3) _USBWakeFromSuspend                                   0     0      0     201
;!               _USBCBWakeFromSuspend
;! ---------------------------------------------------------------------------------
;! (4) _USBCBWakeFromSuspend                                 0     0      0     201
;!                       _DelayRoutine
;! ---------------------------------------------------------------------------------
;! (3) _USBSuspend                                           0     0      0       0
;!                       _USBCBSuspend
;! ---------------------------------------------------------------------------------
;! (4) _USBCBSuspend                                         0     0      0       0
;! ---------------------------------------------------------------------------------
;! (3) _USBCtrlTrfSetupHandler                               0     0      0      44
;!                 _USBCBCheckOtherReq
;!                 _USBCheckStdRequest
;!           _USBCtrlEPServiceComplete
;! ---------------------------------------------------------------------------------
;! (4) _USBCtrlEPServiceComplete                             0     0      0      22
;!                  _LoadBDTandSetUOWN
;!                _USBCtrlTrfTxService
;! ---------------------------------------------------------------------------------
;! (4) _USBCheckStdRequest                                   1     1      0      22
;!                                              2 COMRAM     1     1      0
;!            _USBStdFeatureReqHandler
;!                _USBStdGetDscHandler
;!             _USBStdGetStatusHandler
;!                _USBStdSetCfgHandler
;! ---------------------------------------------------------------------------------
;! (5) _USBStdSetCfgHandler                                  0     0      0      22
;!                        _USBCBInitEP
;! ---------------------------------------------------------------------------------
;! (5) _USBStdGetStatusHandler                               2     2      0       0
;!                                              0 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (5) _USBStdGetDscHandler                                  1     1      0       0
;!                                              0 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (5) _USBStdFeatureReqHandler                              2     2      0       0
;!                                              0 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (4) _USBCBCheckOtherReq                                   0     0      0       0
;!                 _USBCheckHIDRequest
;! ---------------------------------------------------------------------------------
;! (5) _USBCheckHIDRequest                                   0     0      0       0
;!                _HIDGetReportHandler
;!                _HIDSetReportHandler
;! ---------------------------------------------------------------------------------
;! (6) _HIDSetReportHandler                                  0     0      0       0
;! ---------------------------------------------------------------------------------
;! (6) _HIDGetReportHandler                                  0     0      0       0
;! ---------------------------------------------------------------------------------
;! (3) _USBCtrlTrfInHandler                                  0     0      0       0
;!                _USBCtrlTrfTxService
;! ---------------------------------------------------------------------------------
;! (5) _USBCtrlTrfTxService                                  0     0      0       0
;! ---------------------------------------------------------------------------------
;! (3) _SignFlash                                            1     1      0      22
;!                                              1 COMRAM     1     1      0
;!                      _ClearWatchdog
;!                  _UnlockAndActivate
;! ---------------------------------------------------------------------------------
;! (4) _UnlockAndActivate                                    1     1      0      22
;!                                              0 COMRAM     1     1      0
;!                    _LowVoltageCheck
;! ---------------------------------------------------------------------------------
;! (5) _LowVoltageCheck                                      0     0      0       0
;! ---------------------------------------------------------------------------------
;! (3) _ResetDeviceCleanly                                   0     0      0     201
;!            _USBDisableWithLongDelay
;! ---------------------------------------------------------------------------------
;! (3) _HIDTxReport                                          4     3      1     532
;!                                              0 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (3) _HIDRxReport                                          3     2      1     192
;!                                              0 COMRAM     3     2      1
;! ---------------------------------------------------------------------------------
;! (2) _InitializeSystem                                     0     0      0     446
;!                      _USBDeviceInit
;!                           _UserInit
;! ---------------------------------------------------------------------------------
;! (3) _USBDeviceInit                                        0     0      0     446
;!                  _USBCheckBusStatus
;!            _USBDisableWithLongDelay
;! ---------------------------------------------------------------------------------
;! (3) _USBCheckBusStatus                                    0     0      0     245
;!                      _USBSoftAttach
;! ---------------------------------------------------------------------------------
;! (4) _USBSoftAttach                                        0     0      0     245
;!            _USBDisableWithLongDelay
;!            _USBProtocolResetHandler
;! ---------------------------------------------------------------------------------
;! (3) _USBProtocolResetHandler                              0     0      0      44
;!                      _ClearWatchdog
;!                  _LoadBDTandSetUOWN
;!                        _USBCBInitEP
;! ---------------------------------------------------------------------------------
;! (4) _USBCBInitEP                                          1     1      0      22
;!                                              0 COMRAM     1     1      0
;!                          _HIDInitEP
;!                           _UserInit
;! ---------------------------------------------------------------------------------
;! (5) _UserInit                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (5) _HIDInitEP                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (4) _LoadBDTandSetUOWN                                    1     1      0      22
;!                                              0 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (5) _USBDisableWithLongDelay                              0     0      0     201
;!                       _DelayRoutine
;! ---------------------------------------------------------------------------------
;! (5) _DelayRoutine                                         2     0      2     201
;!                                              0 COMRAM     2     0      2
;!                      _ClearWatchdog
;! ---------------------------------------------------------------------------------
;! (6) _ClearWatchdog                                        0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _BlinkUSBStatus                                       1     1      0       0
;!                                              0 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 6
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _BootMain
;!     _BlinkUSBStatus
;!     _InitializeSystem
;!       _USBDeviceInit
;!         _USBCheckBusStatus
;!           _USBSoftAttach
;!             _USBDisableWithLongDelay
;!               _DelayRoutine
;!                 _ClearWatchdog
;!             _USBProtocolResetHandler
;!               _ClearWatchdog
;!               _LoadBDTandSetUOWN
;!               _USBCBInitEP
;!                 _HIDInitEP
;!                 _UserInit
;!         _USBDisableWithLongDelay
;!           _DelayRoutine
;!             _ClearWatchdog
;!       _UserInit
;!     _LowVoltageCheck
;!     _ProcessIO
;!       _ClearWatchdog
;!       _HIDRxReport
;!       _HIDTxReport
;!       _ResetDeviceCleanly
;!         _USBDisableWithLongDelay
;!           _DelayRoutine
;!             _ClearWatchdog
;!       _SignFlash
;!         _ClearWatchdog
;!         _UnlockAndActivate
;!           _LowVoltageCheck
;!       _USBDeviceTasks
;!         _USBCheckBusStatus
;!           _USBSoftAttach
;!             _USBDisableWithLongDelay
;!               _DelayRoutine
;!                 _ClearWatchdog
;!             _USBProtocolResetHandler
;!               _ClearWatchdog
;!               _LoadBDTandSetUOWN
;!               _USBCBInitEP
;!                 _HIDInitEP
;!                 _UserInit
;!         _USBCtrlTrfInHandler
;!           _USBCtrlTrfTxService
;!         _USBCtrlTrfSetupHandler
;!           _USBCBCheckOtherReq
;!             _USBCheckHIDRequest
;!               _HIDGetReportHandler
;!               _HIDSetReportHandler
;!           _USBCheckStdRequest
;!             _USBStdFeatureReqHandler
;!             _USBStdGetDscHandler
;!             _USBStdGetStatusHandler
;!             _USBStdSetCfgHandler
;!               _USBCBInitEP
;!                 _HIDInitEP
;!                 _UserInit
;!           _USBCtrlEPServiceComplete
;!             _LoadBDTandSetUOWN
;!             _USBCtrlTrfTxService
;!         _USBProtocolResetHandler
;!           _ClearWatchdog
;!           _LoadBDTandSetUOWN
;!           _USBCBInitEP
;!             _HIDInitEP
;!             _UserInit
;!         _USBSuspend
;!           _USBCBSuspend
;!         _USBWakeFromSuspend
;!           _USBCBWakeFromSuspend
;!             _DelayRoutine
;!               _ClearWatchdog
;!       _UnlockAndActivate
;!         _LowVoltageCheck
;!       _WriteConfigBits
;!         _UnlockAndActivate
;!           _LowVoltageCheck
;!       _WriteEEPROM
;!         _UnlockAndActivate
;!           _LowVoltageCheck
;!       _WriteFlashBlock
;!         _UnlockAndActivate
;!           _LowVoltageCheck
;!     _USBDeviceTasks
;!       _USBCheckBusStatus
;!         _USBSoftAttach
;!           _USBDisableWithLongDelay
;!             _DelayRoutine
;!               _ClearWatchdog
;!           _USBProtocolResetHandler
;!             _ClearWatchdog
;!             _LoadBDTandSetUOWN
;!             _USBCBInitEP
;!               _HIDInitEP
;!               _UserInit
;!       _USBCtrlTrfInHandler
;!         _USBCtrlTrfTxService
;!       _USBCtrlTrfSetupHandler
;!         _USBCBCheckOtherReq
;!           _USBCheckHIDRequest
;!             _HIDGetReportHandler
;!             _HIDSetReportHandler
;!         _USBCheckStdRequest
;!           _USBStdFeatureReqHandler
;!           _USBStdGetDscHandler
;!           _USBStdGetStatusHandler
;!           _USBStdSetCfgHandler
;!             _USBCBInitEP
;!               _HIDInitEP
;!               _UserInit
;!         _USBCtrlEPServiceComplete
;!           _LoadBDTandSetUOWN
;!           _USBCtrlTrfTxService
;!       _USBProtocolResetHandler
;!         _ClearWatchdog
;!         _LoadBDTandSetUOWN
;!         _USBCBInitEP
;!           _HIDInitEP
;!           _UserInit
;!       _USBSuspend
;!         _USBCBSuspend
;!       _USBWakeFromSuspend
;!         _USBCBWakeFromSuspend
;!           _DelayRoutine
;!             _ClearWatchdog
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BIGRAMll           1FF      0       0      12        0.0%
;!EEDATA             100      0       0       0        0.0%
;!BITBANK1           100      0       0       8        0.0%
;!BANK1              100      0      40       6       25.0%
;!BITBANK0            A0      0       0       4        0.0%
;!BANK0               A0      0      82       5       81.2%
;!BITCOMRAM           5F      0       0       0        0.0%
;!COMRAM              5F      E      52       1       86.3%
;!BIGRAMh             54      0       0      11        0.0%
;!BITBANK2h           54      0       0       9        0.0%
;!BANK2h              54      0       0      10        0.0%
;!BITSFR_1             0      0       0      40        0.0%
;!SFR_1                0      0       0      40        0.0%
;!BITSFR               0      0       0      40        0.0%
;!SFR                  0      0       0      40        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0     114       7        0.0%
;!DATA                 0      0     114       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 323 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   11[COMRAM] unsigned int 
;;  u               2    9[COMRAM] unsigned int 
;;  k               1   13[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         5       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_BootMain
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2
	file	"main.c"
	line	323
global __ptext0
__ptext0:
psect	text0
	file	"main.c"
	line	323
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:
;incstack = 0
	opt	stack 23
	line	325
	
l3462:
	clrf	((c:3988)),c	;volatile
	line	326
	clrf	((c:3979)),c	;volatile
	line	327
	clrf	((c:3966)),c	;volatile
	line	328
	clrf	((c:3967)),c	;volatile
	line	329
	setf	((c:3987)),c	;volatile
	line	330
	bsf	c:(31684/8),(31684)&7	;volatile
	line	331
	bsf	c:(31685/8),(31685)&7	;volatile
	line	332
	bsf	c:(31686/8),(31686)&7	;volatile
	line	334
	clrf	((c:main@k)),c
	
l3464:
		movlw	06h-1
	cpfsgt	((c:main@k)),c
	goto	u2341
	goto	u2340

u2341:
	goto	l3468
u2340:
	goto	l80
	line	335
	
l3468:
	movff	(c:main@k),??_main+0+0
	movlw	(01h)&0ffh
	movwf	(??_main+1+0)&0ffh,c
	incf	(??_main+0+0),c
	goto	u2354
u2355:
	bcf	status,0
	rlcf	((??_main+1+0)),c
u2354:
	decfsz	(??_main+0+0),c
	goto	u2355
	movf	((??_main+1+0)),c,w
	movwf	((c:3979)),c	;volatile
	line	336
	
l3470:
	clrf	((c:main@u)),c
	clrf	((c:main@u+1)),c
	
l81:
	line	337
	clrf	((c:main@i)),c
	clrf	((c:main@i+1)),c
	
l3478:
	infsnz	((c:main@i)),c
	incf	((c:main@i+1)),c
	
l3480:
		movlw	250
	subwf	 ((c:main@i)),c,w
	movlw	255
	subwfb	((c:main@i+1)),c,w
	btfss	status,0
	goto	u2361
	goto	u2360

u2361:
	goto	l3478
u2360:
	line	336
	
l3482:
	infsnz	((c:main@u)),c
	incf	((c:main@u+1)),c
	
l3484:
		movf	((c:main@u+1)),c,w
	bnz	u2370
	movlw	4
	subwf	 ((c:main@u)),c,w
	btfss	status,0
	goto	u2371
	goto	u2370

u2371:
	goto	l81
u2370:
	line	334
	
l3486:
	incf	((c:main@k)),c
	goto	l3464
	
l80:
	line	340
	clrf	((c:3979)),c	;volatile
	line	348
	bcf	c:(31738/8),(31738)&7	;volatile
	bcf	c:(32655/8),(32655)&7	;volatile
	bsf	((c:3987)),c,4	;volatile
	bsf	c:(31684/8),(31684)&7	;volatile
	opt	asmopt_off
	nop
	opt	asmopt_on
	line	352
	btfss	((c:3969)),c,4	;volatile
	goto	u2381
	goto	u2380
u2381:
	goto	l85
u2380:
	goto	l3496
	line	363
	
l85:
	line	365
	bcf	c:(31908/8),(31908)&7	;volatile
	line	366
	bsf	c:(31836/8),(31836)&7	;volatile
	line	368
	
l3494:
	call	_BootMain	;wreg free
	line	374
	
l3496:
	movlw	low((4102))
	movwf	tblptrl
	if	1	;There is more than 1 active tblptr byte
	movlw	high((4102))
	movwf	tblptrh
	endif
	if	0	;There are less than 3 active tblptr bytes
	movlw	low highword((4102))
	movwf	tblptru
	endif
	tblrd	*+
	movlw	13
	xorwf	tablat,w
	bnz	u2391
tblrd	*+
	movlw	96
	xorwf	tablat,w
	btfss	status,2
	goto	u2391
	goto	u2390

u2391:
	goto	l88
u2390:
	line	381
	
l3498:
	movlw	low((4096))
	movwf	tblptrl
	if	1	;There is more than 1 active tblptr byte
	movlw	high((4096))
	movwf	tblptrh
	endif
	if	0	;There are less than 3 active tblptr bytes
	movlw	low highword((4096))
	movwf	tblptru
	endif
	tblrd	*+
	incf	tablat,w
	bnz	u2400
tblrd	*+
	incf	tablat,w
	btfsc	status,2
	goto	u2401
	goto	u2400

u2401:
	goto	l88
u2400:
	line	386
	
l3500:
# 386 "main.c"
goto 0x1000 ;# 
psect	text0
	line	392
	
l88:
	line	393
	bcf	c:(31909/8),(31909)&7	;volatile
	line	394
	bsf	c:(31837/8),(31837)&7	;volatile
	line	401
	
l3502:
	call	_BootMain	;wreg free
	line	403
	
l90:
	global	start
	goto	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,88
	global	_BootMain

;; *************** function _BootMain *****************
;; Defined at:
;;		line 430 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_BlinkUSBStatus
;;		_InitializeSystem
;;		_LowVoltageCheck
;;		_ProcessIO
;;		_USBDeviceTasks
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	_BootMain_text,class=CODE,space=0,ovrld,reloc=2
	line	430
global __p_BootMain_text
__p_BootMain_text:
psect	_BootMain_text
	file	"main.c"
	line	430
	global	__size_of_BootMain
	__size_of_BootMain	equ	__end_of_BootMain-_BootMain
	
_BootMain:
;incstack = 0
	global _BootMain_absaddr
	_BootMain_absaddr equ 0x30
	opt	stack 23
	line	447
	
l3446:
	clrf	((c:4082)),c	;volatile
	line	461
	clrf	((c:4092)),c	;volatile
	line	470
	
l3448:
	call	_InitializeSystem	;wreg free
	line	473
	
l93:
	line	475
# 475 "main.c"
clrwdt ;# 
psect	_BootMain_text
	line	480
	
l3450:
	call	_USBDeviceTasks	;wreg free
	line	482
	
l3452:
	call	_BlinkUSBStatus	;wreg free
	line	484
	
l3454:
	call	_LowVoltageCheck	;wreg free
	line	488
	
l3456:
	call	_ProcessIO	;wreg free
	line	490
	
l3458:
	btfsc	c:(31757/8),(31757)&7	;volatile
	goto	u2331
	goto	u2330
u2331:
	goto	l93
u2330:
	line	491
	
l3460:
# 491 "main.c"
reset ;# 
psect	_BootMain_text
	goto	l93
	return	;funcret
	opt stack 0
	line	494
GLOBAL	__end_of_BootMain
	__end_of_BootMain:
	signat	_BootMain,88
	global	_ProcessIO

;; *************** function _ProcessIO *****************
;; Defined at:
;;		line 359 in file "BootPIC18NonJ.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_ClearWatchdog
;;		_HIDRxReport
;;		_HIDTxReport
;;		_ResetDeviceCleanly
;;		_SignFlash
;;		_USBDeviceTasks
;;		_UnlockAndActivate
;;		_WriteConfigBits
;;		_WriteEEPROM
;;		_WriteFlashBlock
;; This function is called by:
;;		_BootMain
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2
	file	"BootPIC18NonJ.c"
	line	359
global __ptext2
__ptext2:
psect	text2
	file	"BootPIC18NonJ.c"
	line	359
	global	__size_of_ProcessIO
	__size_of_ProcessIO	equ	__end_of_ProcessIO-_ProcessIO
	
_ProcessIO:
;incstack = 0
	opt	stack 23
	line	367
	
l3238:
		movlw	6
	xorwf	((c:_usb_device_state)),c,w
	btfss	status,2
	goto	u2141
	goto	u2140

u2141:
	goto	l214
u2140:
	
l3240:
	btfss	((c:3940)),c,1	;volatile
	goto	u2151
	goto	u2150
u2151:
	goto	l3242
u2150:
	goto	l214
	line	377
	
l3242:
	movf	((c:_BootState)),c,w
	btfss	status,2
	goto	u2161
	goto	u2160
u2161:
	goto	l3444
u2160:
	line	381
	
l3244:
	movlb	2	; () banked
	btfsc	((524))&0ffh,7	;volatile
	goto	u2171
	goto	u2170
u2171:
	goto	l214
u2170:
	line	385
	
l3246:; BSR set to: 2

	movlw	low(040h)
	movwf	((c:HIDRxReport@len)),c
	movlw	(_PacketFromPC)&0ffh
	
	call	_HIDRxReport
	line	386
	
l3248:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_BootState)),c
	line	389
	
l3250:; BSR set to: 2

	clrf	((c:ProcessIO@i)),c
	line	390
	
l3256:
	movf	((c:ProcessIO@i)),c,w
	addlw	low(_PacketToPC)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(0)
	movwf	indf2
	line	389
	
l3258:
	incf	((c:ProcessIO@i)),c
	
l3260:
		movlw	040h-1
	cpfsgt	((c:ProcessIO@i)),c
	goto	u2181
	goto	u2180

u2181:
	goto	l3256
u2180:
	goto	l214
	line	399
	
l221:; BSR set to: 0

	line	402
	movlb	2	; () banked
	btfsc	((528))&0ffh,7	;volatile
	goto	u2191
	goto	u2190
u2191:
	goto	l214
u2190:
	line	405
	
l3262:; BSR set to: 2

	movlw	low(02h)
	movlb	0	; () banked
	movwf	((_PacketToPC))&0ffh
	line	406
	movlw	low(03Ah)
	movwf	(0+(_PacketToPC+01h))&0ffh
	line	407
	movlw	low(01h)
	movwf	(0+(_PacketToPC+02h))&0ffh
	line	408
	movlw	low(01h)
	movwf	(0+(_PacketToPC+03h))&0ffh
	line	409
	movlw	low(01000h)
	movwf	(0+(_PacketToPC+04h))&0ffh
	movlw	high(01000h)
	movwf	(1+(_PacketToPC+04h))&0ffh
	movlw	low highword(01000h)
	movwf	(2+(_PacketToPC+04h))&0ffh
	movlw	high highword(01000h)
	movwf	(3+(_PacketToPC+04h))&0ffh
	line	410
	movlw	low(03000h)
	movwf	(0+(_PacketToPC+08h))&0ffh
	movlw	high(03000h)
	movwf	(1+(_PacketToPC+08h))&0ffh
	movlw	low highword(03000h)
	movwf	(2+(_PacketToPC+08h))&0ffh
	movlw	high highword(03000h)
	movwf	(3+(_PacketToPC+08h))&0ffh
	line	411
	movlw	low(03h)
	movwf	(0+(_PacketToPC+0Ch))&0ffh
	line	412
	movlw	low(0300000h)
	movwf	(0+(_PacketToPC+0Dh))&0ffh
	movlw	high(0300000h)
	movwf	(1+(_PacketToPC+0Dh))&0ffh
	movlw	low highword(0300000h)
	movwf	(2+(_PacketToPC+0Dh))&0ffh
	movlw	high highword(0300000h)
	movwf	(3+(_PacketToPC+0Dh))&0ffh
	line	413
	movlw	low(0Eh)
	movwf	(0+(_PacketToPC+011h))&0ffh
	movlw	high(0Eh)
	movwf	(1+(_PacketToPC+011h))&0ffh
	movlw	low highword(0Eh)
	movwf	(2+(_PacketToPC+011h))&0ffh
	movlw	high highword(0Eh)
	movwf	(3+(_PacketToPC+011h))&0ffh
	line	414
	movlw	low(04h)
	movwf	(0+(_PacketToPC+015h))&0ffh
	line	415
	movlw	low(0200000h)
	movwf	(0+(_PacketToPC+016h))&0ffh
	movlw	high(0200000h)
	movwf	(1+(_PacketToPC+016h))&0ffh
	movlw	low highword(0200000h)
	movwf	(2+(_PacketToPC+016h))&0ffh
	movlw	high highword(0200000h)
	movwf	(3+(_PacketToPC+016h))&0ffh
	line	416
	movlw	low(08h)
	movwf	(0+(_PacketToPC+01Ah))&0ffh
	movlw	high(08h)
	movwf	(1+(_PacketToPC+01Ah))&0ffh
	movlw	low highword(08h)
	movwf	(2+(_PacketToPC+01Ah))&0ffh
	movlw	high highword(08h)
	movwf	(3+(_PacketToPC+01Ah))&0ffh
	line	417
	
l3264:; BSR set to: 0

	setf	(0+(_PacketToPC+01Eh))&0ffh
	line	419
	movlw	low(02h)
	movwf	(0+(_PacketToPC+01Eh))&0ffh
	line	420
	movlw	low(0F00000h)
	movwf	(0+(_PacketToPC+01Fh))&0ffh
	movlw	high(0F00000h)
	movwf	(1+(_PacketToPC+01Fh))&0ffh
	movlw	low highword(0F00000h)
	movwf	(2+(_PacketToPC+01Fh))&0ffh
	movlw	high highword(0F00000h)
	movwf	(3+(_PacketToPC+01Fh))&0ffh
	line	421
	movlw	low(0100h)
	movwf	(0+(_PacketToPC+023h))&0ffh
	movlw	high(0100h)
	movwf	(1+(_PacketToPC+023h))&0ffh
	movlw	low highword(0100h)
	movwf	(2+(_PacketToPC+023h))&0ffh
	movlw	high highword(0100h)
	movwf	(3+(_PacketToPC+023h))&0ffh
	line	422
	
l3266:; BSR set to: 0

	setf	(0+(_PacketToPC+027h))&0ffh
	line	424
	movlw	low(0A5h)
	movwf	(0+(_PacketToPC+039h))&0ffh
	line	428
	
l3268:; BSR set to: 0

	movlw	low(040h)
	movwf	((c:HIDTxReport@len)),c
	movlw	(_PacketToPC)&0ffh
	
	call	_HIDTxReport
	line	429
	
l3270:
	clrf	((c:_BootState)),c
	goto	l214
	line	433
	
l3272:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:_ConfigsLockValue)),c
	line	434
	movf	(0+(_PacketFromPC+01h))&0ffh,w
	btfss	status,2
	goto	u2201
	goto	u2200
u2201:
	goto	l3270
u2200:
	line	436
	
l3274:; BSR set to: 0

	clrf	((c:_ConfigsLockValue)),c
	goto	l3270
	line	442
	
l3276:; BSR set to: 0

	movlw	high(040h)
	movwf	((c:_ErasePageTracker+1)),c
	movlw	low(040h)
	movwf	((c:_ErasePageTracker)),c
	line	444
	
l3282:
	call	_ClearWatchdog	;wreg free
	line	446
	
l3284:
	clrf	((c:4088)),c	;volatile
	line	447
	
l3286:
	movff	(c:_ErasePageTracker),??_ProcessIO+0+0
	movff	(c:_ErasePageTracker+1),??_ProcessIO+0+0+1
	bcf	status,0
	rrcf	(??_ProcessIO+0+1),c
	rrcf	(??_ProcessIO+0+0),c
	bcf	status,0
	rrcf	(??_ProcessIO+0+1),c
	rrcf	(??_ProcessIO+0+0),c
	movf	(??_ProcessIO+0+0),c,w
	movwf	((c:4087)),c	;volatile
	line	448
	
l3288:
	rrncf	((c:_ErasePageTracker)),c,w
	rrncf	wreg,c
	andlw	(0ffh shl 6) & 0ffh
	movwf	((c:4086)),c	;volatile
	line	452
	
l3290:
	movlw	low(094h)
	movwf	((c:4006)),c	;volatile
	line	453
	
l3292:
	movlw	(0B5h)&0ffh
	
	call	_UnlockAndActivate
	line	454
	
l3294:
	call	_USBDeviceTasks	;wreg free
	line	442
	
l3296:
	infsnz	((c:_ErasePageTracker)),c
	incf	((c:_ErasePageTracker+1)),c
	
l3298:
		decf	((c:_ErasePageTracker+1)),c,w
	btfss	status,0
	goto	u2211
	goto	u2210

u2211:
	goto	l3282
u2210:
	
l228:
	line	459
	clrf	((c:ProcessIO@i)),c
	line	460
	
l229:
	line	461
	movff	(c:ProcessIO@i),(c:4009)	;volatile
	line	462
	setf	((c:4008)),c	;volatile
	line	463
	
l3300:
	movlw	low(04h)
	movwf	((c:4006)),c	;volatile
	line	464
	
l3302:
	call	_USBDeviceTasks	;wreg free
	line	465
	
l3304:
	movlw	(0B5h)&0ffh
	
	call	_UnlockAndActivate
	line	466
	
l3306:
	incfsz	((c:ProcessIO@i)),c
	
	goto	l229
	line	471
	
l3308:
	movlw	low(020h)
	movwf	((c:4088)),c	;volatile
	line	472
	
l3310:
	clrf	((c:4087)),c	;volatile
	line	473
	
l3312:
	clrf	((c:4086)),c	;volatile
	line	474
	movlw	low(094h)
	movwf	((c:4006)),c	;volatile
	line	475
	
l3314:
	movlw	(0B5h)&0ffh
	
	call	_UnlockAndActivate
	goto	l3270
	line	481
	
l3318:; BSR set to: 0

		movlw	48
	xorwf	(0+(_PacketFromPC+03h))&0ffh,w
	btfss	status,2
	goto	u2221
	goto	u2220

u2221:
	goto	l3326
u2220:
	line	483
	
l3320:; BSR set to: 0

	movf	((c:_ConfigsLockValue)),c,w
	btfss	status,2
	goto	u2231
	goto	u2230
u2231:
	goto	l3270
u2230:
	line	485
	
l3322:; BSR set to: 0

	call	_WriteConfigBits	;wreg free
	goto	l3270
	line	493
	
l3326:; BSR set to: 0

		movlw	240
	xorwf	(0+(_PacketFromPC+03h))&0ffh,w
	btfss	status,2
	goto	u2241
	goto	u2240

u2241:
	goto	l3332
u2240:
	line	495
	
l3328:; BSR set to: 0

	call	_WriteEEPROM	;wreg free
	goto	l3270
	line	501
	
l3332:; BSR set to: 0

		incf	((c:_ProgrammedPointer)),c,w
	bnz	u2251
	incf	((c:_ProgrammedPointer+1)),c,w
	bnz	u2251
	incf	((c:_ProgrammedPointer+2)),c,w
	bnz	u2251
	incf	((c:_ProgrammedPointer+3)),c,w
	btfss	status,2
	goto	u2251
	goto	u2250

u2251:
	goto	l3336
u2250:
	line	502
	
l3334:; BSR set to: 0

	movff	0+(_PacketFromPC+01h),(c:_ProgrammedPointer)
	movff	1+(_PacketFromPC+01h),(c:_ProgrammedPointer+1)
	movff	2+(_PacketFromPC+01h),(c:_ProgrammedPointer+2)
	movff	3+(_PacketFromPC+01h),(c:_ProgrammedPointer+3)
	line	504
	
l3336:; BSR set to: 0

	movf	((c:_ProgrammedPointer)),c,w
xorwf	(0+(_PacketFromPC+01h))&0ffh,w
	bnz	u2261
movf	((c:_ProgrammedPointer+1)),c,w
xorwf	(1+(_PacketFromPC+01h))&0ffh,w
	bnz	u2261
movf	((c:_ProgrammedPointer+2)),c,w
xorwf	(2+(_PacketFromPC+01h))&0ffh,w
	bnz	u2261
movf	((c:_ProgrammedPointer+3)),c,w
xorwf	(3+(_PacketFromPC+01h))&0ffh,w
	btfss	status,2
	goto	u2261
	goto	u2260

u2261:
	goto	l3270
u2260:
	line	506
	
l3338:; BSR set to: 0

	clrf	((c:ProcessIO@i)),c
	goto	l3352
	line	508
	
l3340:; BSR set to: 0

	movf	(0+(_PacketFromPC+05h))&0ffh,w
	sublw	low(_PacketFromPC+040h)
	addwf	((c:ProcessIO@i)),c,w
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(_ProgrammingBuffer)
	addwf	((c:_BufferedDataIndex)),c,w
	movwf	c:fsr1l
	clrf	1+c:fsr1l
	movlw	high(_ProgrammingBuffer)
	addwfc	1+c:fsr1l
	movff	indf2,indf1
	line	509
	
l3342:; BSR set to: 0

	incf	((c:_BufferedDataIndex)),c
	line	510
	
l3344:; BSR set to: 0

	movlw	low(01h)
	addwf	((c:_ProgrammedPointer)),c
	movlw	0
	addwfc	((c:_ProgrammedPointer+1)),c
	addwfc	((c:_ProgrammedPointer+2)),c
	addwfc	((c:_ProgrammedPointer+3)),c
	line	511
	
l3346:; BSR set to: 0

		movlw	16
	xorwf	((c:_BufferedDataIndex)),c,w
	btfss	status,2
	goto	u2271
	goto	u2270

u2271:
	goto	l3350
u2270:
	line	513
	
l3348:; BSR set to: 0

	call	_WriteFlashBlock	;wreg free
	line	506
	
l3350:
	incf	((c:ProcessIO@i)),c
	
l3352:
	movlb	0	; () banked
		movf	(0+(_PacketFromPC+05h))&0ffh,w
	subwf	((c:ProcessIO@i)),c,w
	btfss	status,0
	goto	u2281
	goto	u2280

u2281:
	goto	l3340
u2280:
	goto	l3270
	line	523
	
l3354:; BSR set to: 0

	call	_WriteFlashBlock	;wreg free
	line	524
	
l3356:
	setf	((c:_ProgrammedPointer)),c
	setf	((c:_ProgrammedPointer+1)),c
	setf	((c:_ProgrammedPointer+2)),c
	setf	((c:_ProgrammedPointer+3)),c
	goto	l3270
	line	529
	
l3360:; BSR set to: 0

	movlw	low(07h)
	movwf	((_PacketToPC))&0ffh
	line	530
	
l3362:; BSR set to: 0

	movff	0+(_PacketFromPC+01h),0+(_PacketToPC+01h)
	movff	1+(_PacketFromPC+01h),1+(_PacketToPC+01h)
	movff	2+(_PacketFromPC+01h),2+(_PacketToPC+01h)
	movff	3+(_PacketFromPC+01h),3+(_PacketToPC+01h)
	line	531
	
l3364:; BSR set to: 0

	movff	0+(_PacketFromPC+05h),0+(_PacketToPC+05h)
	line	533
	
l3366:; BSR set to: 0

		movff	0+(_PacketFromPC+01h),(c:ProcessIO@pROM)
	movff	1+(_PacketFromPC+01h),(c:ProcessIO@pROM+1)
	movff	2+(_PacketFromPC+01h),(c:ProcessIO@pROM+2)

	line	534
	
l3368:; BSR set to: 0

	clrf	((c:ProcessIO@i)),c
	goto	l3386
	line	536
	
l3370:; BSR set to: 0

		movlw	240
	xorwf	(0+(_PacketFromPC+03h))&0ffh,w
	btfss	status,2
	goto	u2291
	goto	u2290

u2291:
	goto	l3380
u2290:
	line	539
	
l3372:; BSR set to: 0

	movf	(0+(_PacketFromPC+01h))&0ffh,w
	addwf	((c:ProcessIO@i)),c,w
	movwf	((c:4009)),c	;volatile
	line	540
	
l3374:; BSR set to: 0

	clrf	((c:4006)),c	;volatile
	line	541
	
l3376:; BSR set to: 0

	bsf	((c:4006)),c,0	;volatile
	line	542
	
l3378:; BSR set to: 0

	movf	(0+(_PacketFromPC+05h))&0ffh,w
	sublw	low(_PacketToPC+040h)
	addwf	((c:ProcessIO@i)),c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	(c:4008),indf2	;volatile

	line	544
	goto	l3384
	line	547
	
l3380:; BSR set to: 0

	movff	(c:ProcessIO@pROM),tblptrl
	movff	(c:ProcessIO@pROM+1),tblptrh
	movff	(c:ProcessIO@pROM+2),tblptru
	movf	(0+(_PacketFromPC+05h))&0ffh,w
	sublw	low(_PacketToPC+040h)
	addwf	((c:ProcessIO@i)),c,w
	movwf	fsr2l
	clrf	fsr2h
	tblrd	*
	
	movff	tablat,indf2
	
l3382:; BSR set to: 0

	movlw	low(01h)
	addwf	((c:ProcessIO@pROM)),c
	movlw	high(01h)
	addwfc	((c:ProcessIO@pROM+1)),c
	movlw	low highword(01h)
	addwfc	((c:ProcessIO@pROM+2)),c
	line	534
	
l3384:; BSR set to: 0

	incf	((c:ProcessIO@i)),c
	
l3386:; BSR set to: 0

		movf	(0+(_PacketFromPC+05h))&0ffh,w
	subwf	((c:ProcessIO@i)),c,w
	btfss	status,0
	goto	u2301
	goto	u2300

u2301:
	goto	l3370
u2300:
	
l247:; BSR set to: 0

	line	553
	movlb	2	; () banked
	btfsc	((528))&0ffh,7	;volatile
	goto	u2311
	goto	u2310
u2311:
	goto	l214
u2310:
	line	555
	
l3388:; BSR set to: 2

	movlw	low(040h)
	movwf	((c:HIDTxReport@len)),c
	movlw	(_PacketToPC)&0ffh
	
	call	_HIDTxReport
	goto	l3270
	line	560
	
l3392:; BSR set to: 0

	call	_SignFlash	;wreg free
	goto	l3270
	line	569
	
l3396:; BSR set to: 0

	movlw	low(0Ch)
	movwf	((_PacketToPC))&0ffh
	line	570
	movlw	high(0102h)
	movwf	(1+(_PacketToPC+01h))&0ffh
	movlw	low(0102h)
	movwf	(0+(_PacketToPC+01h))&0ffh
	line	571
	
l3398:; BSR set to: 0

	movlw	low((4118))
	movwf	tblptrl
	if	1	;There is more than 1 active tblptr byte
	movlw	high((4118))
	movwf	tblptrh
	endif
	if	0	;There are less than 3 active tblptr bytes
	movlw	low highword((4118))
	movwf	tblptru
	endif
	tblrd*+
	
	movff	tablat,0+(_PacketToPC+03h)
	tblrd*-
	
	movff	tablat,1+(_PacketToPC+03h)

	line	572
	
l3400:; BSR set to: 0

	movlw	low(01006h)
	movwf	(0+(_PacketToPC+05h))&0ffh
	movlw	high(01006h)
	movwf	(1+(_PacketToPC+05h))&0ffh
	movlw	low highword(01006h)
	movwf	(2+(_PacketToPC+05h))&0ffh
	movlw	high highword(01006h)
	movwf	(3+(_PacketToPC+05h))&0ffh
	line	573
	
l3402:; BSR set to: 0

	movlw	high(0600Dh)
	movwf	(1+(_PacketToPC+09h))&0ffh
	movlw	low(0600Dh)
	movwf	(0+(_PacketToPC+09h))&0ffh
	line	574
	
l3404:; BSR set to: 0

	movlw	low(040h)
	movwf	(0+(_PacketToPC+0Bh))&0ffh
	movlw	high(040h)
	movwf	(1+(_PacketToPC+0Bh))&0ffh
	movlw	low highword(040h)
	movwf	(2+(_PacketToPC+0Bh))&0ffh
	movlw	high highword(040h)
	movwf	(3+(_PacketToPC+0Bh))&0ffh
	line	575
	
l3406:; BSR set to: 0

	setf	(0+(_PacketToPC+0Fh))&0ffh
	line	576
	
l3408:; BSR set to: 0

	setf	(0+(_PacketToPC+010h))&0ffh
	line	577
	
l3410:; BSR set to: 0

	setf	(0+(_PacketToPC+011h))&0ffh
	line	578
	
l3412:; BSR set to: 0

	setf	(0+(_PacketToPC+012h))&0ffh
	line	579
	
l3414:; BSR set to: 0

	clrf	(0+(_PacketToPC+013h))&0ffh
	line	580
	
l3416:; BSR set to: 0

	setf	(0+(_PacketToPC+014h))&0ffh
	line	581
	
l3418:; BSR set to: 0

	setf	(0+(_PacketToPC+015h))&0ffh
	line	582
	
l3420:; BSR set to: 0

	clrf	(0+(_PacketToPC+016h))&0ffh
	line	583
	
l3422:; BSR set to: 0

	setf	(0+(_PacketToPC+017h))&0ffh
	line	584
	
l3424:; BSR set to: 0

	setf	(0+(_PacketToPC+018h))&0ffh
	line	585
	
l3426:; BSR set to: 0

	setf	(0+(_PacketToPC+019h))&0ffh
	line	586
	
l3428:; BSR set to: 0

	setf	(0+(_PacketToPC+01Ah))&0ffh
	line	587
	
l3430:; BSR set to: 0

	setf	(0+(_PacketToPC+01Bh))&0ffh
	line	588
	
l3432:; BSR set to: 0

	setf	(0+(_PacketToPC+01Ch))&0ffh
	line	591
	
l3434:; BSR set to: 0

	movlb	2	; () banked
	btfsc	((528))&0ffh,7	;volatile
	goto	u2321
	goto	u2320
u2321:
	goto	l214
u2320:
	line	593
	
l3436:; BSR set to: 2

	movlw	low(040h)
	movwf	((c:HIDTxReport@len)),c
	movlw	(_PacketToPC)&0ffh
	
	call	_HIDTxReport
	goto	l3270
	line	598
	
l3440:; BSR set to: 0

	call	_ResetDeviceCleanly	;wreg free
	goto	l3270
	line	397
	
l3444:
	movlb	0	; () banked
	movf	((_PacketFromPC))&0ffh,w
	; Switch size 1, requested type "space"
; Number of cases is 9, Range of values is 2 to 12
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           28    15 (average)
;	Chosen strategy is simple_byte

	xorlw	2^0	; case 2
	skipnz
	goto	l221
	xorlw	3^2	; case 3
	skipnz
	goto	l3272
	xorlw	4^3	; case 4
	skipnz
	goto	l3276
	xorlw	5^4	; case 5
	skipnz
	goto	l3318
	xorlw	6^5	; case 6
	skipnz
	goto	l3354
	xorlw	7^6	; case 7
	skipnz
	goto	l3360
	xorlw	8^7	; case 8
	skipnz
	goto	l3440
	xorlw	9^8	; case 9
	skipnz
	goto	l3392
	xorlw	12^9	; case 12
	skipnz
	goto	l3396
	goto	l3270

	line	606
	
l214:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_ProcessIO
	__end_of_ProcessIO:
	signat	_ProcessIO,88
	global	_WriteFlashBlock

;; *************** function _WriteFlashBlock *****************
;; Defined at:
;;		line 722 in file "BootPIC18NonJ.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          4       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_UnlockAndActivate
;; This function is called by:
;;		_ProcessIO
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2
	line	722
global __ptext3
__ptext3:
psect	text3
	file	"BootPIC18NonJ.c"
	line	722
	global	__size_of_WriteFlashBlock
	__size_of_WriteFlashBlock	equ	__end_of_WriteFlashBlock-_WriteFlashBlock
	
_WriteFlashBlock:
;incstack = 0
	opt	stack 26
	line	731
	
l3136:
	movf	((c:_BufferedDataIndex)),c,w
	subwf	((c:_ProgrammedPointer)),c,w
	movwf	(??_WriteFlashBlock+0+0)&0ffh,c
	movlw	0
	subwfb	((c:_ProgrammedPointer+1)),c,w
	movwf	1+(??_WriteFlashBlock+0+0)&0ffh,c
	
	movlw	0
	subwfb	((c:_ProgrammedPointer+2)),c,w
	movwf	2+(??_WriteFlashBlock+0+0)&0ffh,c
	
	movlw	0
	subwfb	((c:_ProgrammedPointer+3)),c,w
	movwf	3+(??_WriteFlashBlock+0+0)&0ffh,c
	movf	(??_WriteFlashBlock+0+0),c,w
	movwf	((c:WriteFlashBlock@pROM)),c
	movff	(??_WriteFlashBlock+0+1),1+((c:WriteFlashBlock@pROM))
	
	movff	(??_WriteFlashBlock+0+2),2+((c:WriteFlashBlock@pROM))
	
	line	732
	
l3138:
	clrf	((c:4088)),c	;volatile
	line	733
	
l3140:
	movff	0+((c:WriteFlashBlock@pROM)+01h),(c:4087)	;volatile
	line	734
	
l3142:
	movff	(c:WriteFlashBlock@pROM),(c:4086)	;volatile
	line	739
	
l3144:
	clrf	((c:WriteFlashBlock@BytesTakenFromBuffer)),c
	line	758
	movf	((c:4086)),c,w	;volatile
	andlw	low(0Fh)
	movwf	((c:WriteFlashBlock@CorrectionFactor)),c
	line	759
	movlw	(0F0h)&0ffh
	andwf	((c:4086)),c	;volatile
	line	767
	
l3146:
	clrf	((c:WriteFlashBlock@i)),c
	line	769
	
l3150:
	movf	((c:WriteFlashBlock@CorrectionFactor)),c,w
	btfss	status,2
	goto	u2071
	goto	u2070
u2071:
	goto	l283
u2070:
	line	771
	
l3152:
	movf	((c:_BufferedDataIndex)),c,w
	btfsc	status,2
	goto	u2081
	goto	u2080
u2081:
	goto	l284
u2080:
	line	773
	
l3154:
	movlw	low(_ProgrammingBuffer)
	addwf	((c:WriteFlashBlock@BytesTakenFromBuffer)),c,w
	movwf	c:fsr2l
	clrf	1+c:fsr2l
	movlw	high(_ProgrammingBuffer)
	addwfc	1+c:fsr2l
	movf	indf2,w
	movwf	((c:4085)),c	;volatile
	line	776
# 776 "BootPIC18NonJ.c"
tblwtpostinc ;# 
psect	text3
	line	782
	
l3156:
	incf	((c:WriteFlashBlock@BytesTakenFromBuffer)),c
	line	783
	
l3158:
	decf	((c:_BufferedDataIndex)),c
	line	784
	goto	l286
	line	785
	
l284:
	line	787
	setf	((c:4085)),c	;volatile
	line	790
# 790 "BootPIC18NonJ.c"
tblwtpostinc ;# 
psect	text3
	goto	l286
	line	799
	
l283:
	line	801
	setf	((c:4085)),c	;volatile
	line	804
# 804 "BootPIC18NonJ.c"
tblwtpostinc ;# 
psect	text3
	line	809
	
l3160:
	decf	((c:WriteFlashBlock@CorrectionFactor)),c
	line	810
	
l286:
	line	767
	incf	((c:WriteFlashBlock@i)),c
	
l3162:
		movlw	010h-1
	cpfsgt	((c:WriteFlashBlock@i)),c
	goto	u2091
	goto	u2090

u2091:
	goto	l3150
u2090:
	
l282:
	line	816
# 816 "BootPIC18NonJ.c"
tblrdpostdec ;# 
psect	text3
	line	822
	
l3164:
	movlw	low(0A4h)
	movwf	((c:4006)),c	;volatile
	line	823
	
l3166:
	movlw	(0B5h)&0ffh
	
	call	_UnlockAndActivate
	line	827
	
l3168:
	clrf	((c:WriteFlashBlock@i)),c
	goto	l3174
	line	829
	
l3170:
	movlw	low((_ProgrammingBuffer))
	movwf	(??_WriteFlashBlock+0+0)&0ffh,c
	movlw	high((_ProgrammingBuffer))
	movwf	1+(??_WriteFlashBlock+0+0)&0ffh,c
	movf	((c:WriteFlashBlock@BytesTakenFromBuffer)),c,w
	addwf	(??_WriteFlashBlock+0+0),c
	movlw	0
	addwfc	(??_WriteFlashBlock+0+1),c
	movf	((c:WriteFlashBlock@i)),c,w
	addwf	(??_WriteFlashBlock+0+0),c,w
	movwf	c:fsr2l
	movlw	0
	addwfc	(??_WriteFlashBlock+0+1),c,w
	movwf	1+c:fsr2l
	movlw	low(_ProgrammingBuffer)
	addwf	((c:WriteFlashBlock@i)),c,w
	movwf	c:fsr1l
	clrf	1+c:fsr1l
	movlw	high(_ProgrammingBuffer)
	addwfc	1+c:fsr1l
	movff	indf2,indf1
	line	827
	
l3172:
	incf	((c:WriteFlashBlock@i)),c
	
l3174:
		movf	((c:_BufferedDataIndex)),c,w
	subwf	((c:WriteFlashBlock@i)),c,w
	btfss	status,0
	goto	u2101
	goto	u2100

u2101:
	goto	l3170
u2100:
	line	831
	
l290:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_WriteFlashBlock
	__end_of_WriteFlashBlock:
	signat	_WriteFlashBlock,88
	global	_WriteEEPROM

;; *************** function _WriteEEPROM *****************
;; Defined at:
;;		line 871 in file "BootPIC18NonJ.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : F/0
;;		On exit  : F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_UnlockAndActivate
;; This function is called by:
;;		_ProcessIO
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2
	line	871
global __ptext4
__ptext4:
psect	text4
	file	"BootPIC18NonJ.c"
	line	871
	global	__size_of_WriteEEPROM
	__size_of_WriteEEPROM	equ	__end_of_WriteEEPROM-_WriteEEPROM
	
_WriteEEPROM:
;incstack = 0
	opt	stack 26
	line	875
	
l3122:; BSR set to: 0

	clrf	((c:WriteEEPROM@i)),c
	goto	l3134
	line	877
	
l3124:; BSR set to: 0

	movf	(0+(_PacketFromPC+01h))&0ffh,w
	addwf	((c:WriteEEPROM@i)),c,w
	movwf	((c:4009)),c	;volatile
	line	878
	
l3126:; BSR set to: 0

	movf	(0+(_PacketFromPC+05h))&0ffh,w
	sublw	low(_PacketFromPC+040h)
	addwf	((c:WriteEEPROM@i)),c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:4008)),c	;volatile
	line	880
	
l3128:; BSR set to: 0

	movlw	low(04h)
	movwf	((c:4006)),c	;volatile
	line	881
	
l3130:; BSR set to: 0

	movlw	(0B5h)&0ffh
	
	call	_UnlockAndActivate
	line	875
	
l3132:
	incf	((c:WriteEEPROM@i)),c
	
l3134:
	movlb	0	; () banked
		movf	(0+(_PacketFromPC+05h))&0ffh,w
	subwf	((c:WriteEEPROM@i)),c,w
	btfss	status,0
	goto	u2061
	goto	u2060

u2061:
	goto	l3124
u2060:
	line	884
	
l306:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_WriteEEPROM
	__end_of_WriteEEPROM:
	signat	_WriteEEPROM,88
	global	_WriteConfigBits

;; *************** function _WriteConfigBits *****************
;; Defined at:
;;		line 834 in file "BootPIC18NonJ.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : F/0
;;		On exit  : F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_UnlockAndActivate
;; This function is called by:
;;		_ProcessIO
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2
	line	834
global __ptext5
__ptext5:
psect	text5
	file	"BootPIC18NonJ.c"
	line	834
	global	__size_of_WriteConfigBits
	__size_of_WriteConfigBits	equ	__end_of_WriteConfigBits-_WriteConfigBits
	
_WriteConfigBits:; BSR set to: 0

;incstack = 0
	opt	stack 26
	line	839
	
l3106:; BSR set to: 0

	movlw	low(030h)
	movwf	((c:4088)),c	;volatile
	line	840
	movf	(1+(_PacketFromPC+01h))&0ffh,w
	movwf	((c:4087)),c	;volatile
	line	841
	
l3108:; BSR set to: 0

	movff	0+(_PacketFromPC+01h),(c:4087)	;volatile
	line	846
	
l3110:; BSR set to: 0

	clrf	((c:WriteConfigBits@i)),c
	goto	l3120
	line	848
	
l3112:; BSR set to: 0

	movf	(0+(_PacketFromPC+05h))&0ffh,w
	sublw	low(_PacketFromPC+040h)
	addwf	((c:WriteConfigBits@i)),c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:4085)),c	;volatile
	line	851
# 851 "BootPIC18NonJ.c"
tblwt ;# 
psect	text5
	line	857
	
l3114:
	movlw	low(0C4h)
	movwf	((c:4006)),c	;volatile
	line	858
	
l3116:
	movlw	(0B5h)&0ffh
	
	call	_UnlockAndActivate
	line	862
# 862 "BootPIC18NonJ.c"
tblrdpostinc ;# 
psect	text5
	line	846
	
l3118:
	incf	((c:WriteConfigBits@i)),c
	
l3120:
	movlb	0	; () banked
		movf	(0+(_PacketFromPC+05h))&0ffh,w
	subwf	((c:WriteConfigBits@i)),c,w
	btfss	status,0
	goto	u2051
	goto	u2050

u2051:
	goto	l3112
u2050:
	line	868
	
l298:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_WriteConfigBits
	__end_of_WriteConfigBits:
	signat	_WriteConfigBits,88
	global	_USBDeviceTasks

;; *************** function _USBDeviceTasks *****************
;; Defined at:
;;		line 472 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_USBCheckBusStatus
;;		_USBCtrlTrfInHandler
;;		_USBCtrlTrfSetupHandler
;;		_USBProtocolResetHandler
;;		_USBSuspend
;;		_USBWakeFromSuspend
;; This function is called by:
;;		_BootMain
;;		_ProcessIO
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2
	file	"usb_device.c"
	line	472
global __ptext6
__ptext6:
psect	text6
	file	"usb_device.c"
	line	472
	global	__size_of_USBDeviceTasks
	__size_of_USBDeviceTasks	equ	__end_of_USBDeviceTasks-_USBDeviceTasks
	
_USBDeviceTasks:; BSR set to: 0

;incstack = 0
	opt	stack 24
	line	478
	
l2990:
	call	_USBCheckBusStatus	;wreg free
	line	483
	
l2992:
	movf	((c:_usb_device_state)),c,w
	btfss	status,2
	goto	u1821
	goto	u1820
u1821:
	goto	l500
u1820:
	goto	l501
	
l500:
	line	489
	btfss	((c:3938)),c,2	;volatile
	goto	u1831
	goto	u1830
u1831:
	goto	l2998
u1830:
	
l2996:
	call	_USBWakeFromSuspend	;wreg free
	line	494
	
l2998:
	btfss	((c:3940)),c,1	;volatile
	goto	u1841
	goto	u1840
u1841:
	goto	l503
u1840:
	goto	l501
	
l503:
	line	502
	btfss	((c:3938)),c,0	;volatile
	goto	u1851
	goto	u1850
u1851:
	goto	l3004
u1850:
	
l3002:
	call	_USBProtocolResetHandler	;wreg free
	line	507
	
l3004:
	btfss	((c:3938)),c,4	;volatile
	goto	u1861
	goto	u1860
u1861:
	goto	l3008
u1860:
	
l3006:
	call	_USBSuspend	;wreg free
	line	524
	
l3008:
		movlw	03h-0
	cpfslt	((c:_usb_device_state)),c
	goto	u1871
	goto	u1870

u1871:
	goto	l506
u1870:
	goto	l501
	
l506:
	line	529
	clrf	((c:_bTRNIFCount)),c
	line	530
	
l507:
	line	531
	btfss	((c:3938)),c,3	;volatile
	goto	u1881
	goto	u1880
u1881:
	goto	l501
u1880:
	line	534
	
l3016:
	movf	((c:3939)),c,w	;volatile
	line	535
	
l3018:
	movff	(c:3939),??_USBDeviceTasks+0+0	;volatile
	movlw	07Ch
	andwf	(??_USBDeviceTasks+0+0),c
	btfss	status,2
	goto	u1891
	goto	u1890
u1891:
	goto	l3046
u1890:
	line	538
	
l3020:
	btfsc	((c:3939)),c,1	;volatile
	goto	u1901
	goto	u1900
u1901:
	goto	l3024
u1900:
	line	541
	
l3022:
		movlw	low(512)
	movwf	((c:USBDeviceTasks@pBDTEntry)),c
	movlw	high(512)
	movwf	((c:USBDeviceTasks@pBDTEntry+1)),c

	line	542
	goto	l3026
	line	546
	
l3024:
		movlw	low(516)
	movwf	((c:USBDeviceTasks@pBDTEntry)),c
	movlw	high(516)
	movwf	((c:USBDeviceTasks@pBDTEntry+1)),c

	line	550
	
l3026:
	bcf	((c:3938)),c,3	;volatile
	line	553
	
l3028:
	movff	(c:USBDeviceTasks@pBDTEntry),fsr2l
	movff	(c:USBDeviceTasks@pBDTEntry+1),fsr2h
	rrcf	(c:indf2),c,w
	rrcf	wreg,f
	andlw	(1<<4)-1
	xorlw	0Dh
	btfss	status,2
	goto	u1911
	goto	u1910
u1911:
	goto	l517
u1910:
	line	557
	
l3030:
	clrf	((c:USBDeviceTasks@i)),c
	line	559
	
l3036:
	lfsr	2,02h
	movf	((c:USBDeviceTasks@pBDTEntry)),c,w
	addwf	fsr2l
	movf	((c:USBDeviceTasks@pBDTEntry+1)),c,w
	addwfc	fsr2h
	movff	postinc2,??_USBDeviceTasks+0+0
	movff	postdec2,??_USBDeviceTasks+0+0+1
	movff	??_USBDeviceTasks+0+0,fsr2l
	movff	??_USBDeviceTasks+0+1,fsr2h
	movf	((c:USBDeviceTasks@i)),c,w
	addlw	low(_SetupPkt)
	movwf	fsr1l
	clrf	fsr1h
	movff	indf2,indf1
	
l3038:
	lfsr	2,02h
	movf	((c:USBDeviceTasks@pBDTEntry)),c,w
	addwf	fsr2l
	movf	((c:USBDeviceTasks@pBDTEntry+1)),c,w
	addwfc	fsr2h
	incf	postinc2
	movlw	0
	addwfc	postdec2
	line	557
	
l3040:
	incf	((c:USBDeviceTasks@i)),c
	
l3042:
		movlw	08h-1
	cpfsgt	((c:USBDeviceTasks@i)),c
	goto	u1921
	goto	u1920

u1921:
	goto	l3036
u1920:
	line	564
	
l3044:
	call	_USBCtrlTrfSetupHandler	;wreg free
	line	565
	goto	l3052
	line	572
	
l3046:
		movlw	4
	xorwf	((c:3939)),c,w	;volatile
	btfss	status,2
	goto	u1931
	goto	u1930

u1931:
	goto	l518
u1930:
	line	575
	
l3048:
	bcf	((c:3938)),c,3	;volatile
	line	576
	
l3050:
	call	_USBCtrlTrfInHandler	;wreg free
	line	577
	goto	l3052
	line	578
	
l518:
	line	584
	bcf	((c:3938)),c,3	;volatile
	goto	l3052
	line	585
	
l517:
	line	529
	
l3052:
	incf	((c:_bTRNIFCount)),c
	
l3054:
		movlw	04h-1
	cpfsgt	((c:_bTRNIFCount)),c
	goto	u1941
	goto	u1940

u1941:
	goto	l507
u1940:
	line	593
	
l501:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBDeviceTasks
	__end_of_USBDeviceTasks:
	signat	_USBDeviceTasks,88
	global	_USBWakeFromSuspend

;; *************** function _USBWakeFromSuspend *****************
;; Defined at:
;;		line 710 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_USBCBWakeFromSuspend
;; This function is called by:
;;		_USBDeviceTasks
;; This function uses a non-reentrant model
;;
psect	text7,class=CODE,space=0,reloc=2
	line	710
global __ptext7
__ptext7:
psect	text7
	file	"usb_device.c"
	line	710
	global	__size_of_USBWakeFromSuspend
	__size_of_USBWakeFromSuspend	equ	__end_of_USBWakeFromSuspend-_USBWakeFromSuspend
	
_USBWakeFromSuspend:
;incstack = 0
	opt	stack 25
	line	715
	
l2918:
	call	_USBCBWakeFromSuspend	;wreg free
	line	718
	
l2920:
	bcf	((c:3940)),c,1	;volatile
	line	719
	
l2922:
	bcf	((c:3936)),c,2	;volatile
	line	720
	goto	l528
	
l529:
	bcf	((c:3938)),c,2	;volatile
	
l528:
	btfsc	((c:3938)),c,2	;volatile
	goto	u1741
	goto	u1740
u1741:
	goto	l529
u1740:
	line	722
	
l531:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBWakeFromSuspend
	__end_of_USBWakeFromSuspend:
	signat	_USBWakeFromSuspend,88
	global	_USBCBWakeFromSuspend

;; *************** function _USBCBWakeFromSuspend *****************
;; Defined at:
;;		line 695 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DelayRoutine
;; This function is called by:
;;		_USBWakeFromSuspend
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2
	file	"main.c"
	line	695
global __ptext8
__ptext8:
psect	text8
	file	"main.c"
	line	695
	global	__size_of_USBCBWakeFromSuspend
	__size_of_USBCBWakeFromSuspend	equ	__end_of_USBCBWakeFromSuspend-_USBCBWakeFromSuspend
	
_USBCBWakeFromSuspend:
;incstack = 0
	opt	stack 25
	line	701
	
l2774:
	movlw	high(0300h)
	movwf	((c:DelayRoutine@DelayAmount+1)),c
	movlw	low(0300h)
	movwf	((c:DelayRoutine@DelayAmount)),c
	call	_DelayRoutine	;wreg free
	line	712
	
l114:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCBWakeFromSuspend
	__end_of_USBCBWakeFromSuspend:
	signat	_USBCBWakeFromSuspend,88
	global	_USBSuspend

;; *************** function _USBSuspend *****************
;; Defined at:
;;		line 618 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_USBCBSuspend
;; This function is called by:
;;		_USBDeviceTasks
;; This function uses a non-reentrant model
;;
psect	text9,class=CODE,space=0,reloc=2
	file	"usb_device.c"
	line	618
global __ptext9
__ptext9:
psect	text9
	file	"usb_device.c"
	line	618
	global	__size_of_USBSuspend
	__size_of_USBSuspend	equ	__end_of_USBSuspend-_USBSuspend
	
_USBSuspend:
;incstack = 0
	opt	stack 27
	line	655
	
l2924:
	movff	(c:3936),(c:USBSuspend@UIESave)	;volatile
	line	656
	
l2926:
	movlw	low(04h)
	movwf	((c:3936)),c	;volatile
	line	660
	
l2928:
	bcf	((c:3938)),c,4	;volatile
	line	661
	
l2930:
	bsf	((c:3940)),c,1	;volatile
	line	668
	
l2932:
	bcf	((c:4001)),c,2	;volatile
	line	672
	
l2934:
	bsf	((c:4000)),c,2	;volatile
	line	681
	
l2936:
	call	_USBCBSuspend	;wreg free
	line	688
	
l2938:
	bcf	((c:4000)),c,2	;volatile
	line	689
	
l2940:
	movf	((c:USBSuspend@UIESave)),c,w
	iorwf	((c:3936)),c	;volatile
	line	693
	
l525:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBSuspend
	__end_of_USBSuspend:
	signat	_USBSuspend,88
	global	_USBCBSuspend

;; *************** function _USBCBSuspend *****************
;; Defined at:
;;		line 731 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBSuspend
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2
	file	"main.c"
	line	731
global __ptext10
__ptext10:
psect	text10
	file	"main.c"
	line	731
	global	__size_of_USBCBSuspend
	__size_of_USBCBSuspend	equ	__end_of_USBCBSuspend-_USBCBSuspend
	
_USBCBSuspend:
;incstack = 0
	opt	stack 27
	line	735
	
l2776:
	bcf	((c:3979)),c,3	;volatile
	line	738
# 738 "main.c"
sleep ;# 
psect	text10
	line	740
	goto	l117
	
l118:
	line	742
# 742 "main.c"
sleep ;# 
psect	text10
	line	743
	
l117:
	line	740
	btfsc	((c:4001)),c,2	;volatile
	goto	u1591
	goto	u1590
u1591:
	goto	l122
u1590:
	
l2778:
	btfss	((c:4048)),c,3	;volatile
	goto	u1601
	goto	u1600
u1601:
	goto	l118
u1600:
	line	750
	
l122:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCBSuspend
	__end_of_USBCBSuspend:
	signat	_USBCBSuspend,88
	global	_USBCtrlTrfSetupHandler

;; *************** function _USBCtrlTrfSetupHandler *****************
;; Defined at:
;;		line 821 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_USBCBCheckOtherReq
;;		_USBCheckStdRequest
;;		_USBCtrlEPServiceComplete
;; This function is called by:
;;		_USBDeviceTasks
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2
	file	"usb_device.c"
	line	821
global __ptext11
__ptext11:
psect	text11
	file	"usb_device.c"
	line	821
	global	__size_of_USBCtrlTrfSetupHandler
	__size_of_USBCtrlTrfSetupHandler	equ	__end_of_USBCtrlTrfSetupHandler-_USBCtrlTrfSetupHandler
	
_USBCtrlTrfSetupHandler:
;incstack = 0
	opt	stack 24
	line	828
	
l2942:
	movlb	2	; () banked
	clrf	((520))&0ffh	;volatile
	line	829
	clrf	((c:_short_pkt_status)),c
	line	834
	btfss	((512))&0ffh,7	;volatile
	goto	u1751
	goto	u1750
u1751:
	goto	l540
u1750:
	line	836
	
l2944:; BSR set to: 2

	clrf	((512))&0ffh	;volatile
	line	837
	clrf	((c:_EP0OutOddNeedsArmingNext)),c
	line	838
	
l540:; BSR set to: 2

	line	839
	btfss	((516))&0ffh,7	;volatile
	goto	u1761
	goto	u1760
u1761:
	goto	l2950
u1760:
	line	841
	
l2946:; BSR set to: 2

	clrf	((516))&0ffh	;volatile
	line	842
	
l2948:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_EP0OutOddNeedsArmingNext)),c
	line	844
	
l2950:; BSR set to: 2

	clrf	((c:_ctrl_trf_state)),c
	line	845
	
l2952:; BSR set to: 2

	clrf	((c:_ctrl_trf_session_owner)),c
	line	846
	
l2954:; BSR set to: 2

	clrf	((c:_wCount)),c
	clrf	((c:_wCount+1)),c
	line	847
	
l2956:; BSR set to: 2

	bcf	((c:3940)),c,4	;volatile
	line	853
	
l2958:; BSR set to: 2

	call	_USBCheckStdRequest	;wreg free
	line	854
	
l2960:
	call	_USBCBCheckOtherReq	;wreg free
	line	857
	
l2962:
	call	_USBCtrlEPServiceComplete	;wreg free
	line	859
	
l542:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCtrlTrfSetupHandler
	__end_of_USBCtrlTrfSetupHandler:
	signat	_USBCtrlTrfSetupHandler,88
	global	_USBCtrlEPServiceComplete

;; *************** function _USBCtrlEPServiceComplete *****************
;; Defined at:
;;		line 1178 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_LoadBDTandSetUOWN
;;		_USBCtrlTrfTxService
;; This function is called by:
;;		_USBCtrlTrfSetupHandler
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2
	line	1178
global __ptext12
__ptext12:
psect	text12
	file	"usb_device.c"
	line	1178
	global	__size_of_USBCtrlEPServiceComplete
	__size_of_USBCtrlEPServiceComplete	equ	__end_of_USBCtrlEPServiceComplete-_USBCtrlEPServiceComplete
	
_USBCtrlEPServiceComplete:
;incstack = 0
	opt	stack 26
	line	1182
	
l2838:
	movf	((c:_ctrl_trf_session_owner)),c,w
	btfss	status,2
	goto	u1631
	goto	u1630
u1631:
	goto	l574
u1630:
	line	1187
	
l2840:
	movlw	low(04h)
	movlb	2	; () banked
	movwf	((520))&0ffh	;volatile
	line	1188
	
l2842:; BSR set to: 2

	bsf	(0+(7/8)+(520))&0ffh,(7)&7	;volatile
	line	1189
	
l2844:; BSR set to: 2

	movlw	low(04h)
	movwf	((c:_TempBDT)),c
	line	1190
	
l2846:; BSR set to: 2

		decf	((c:_EP0OutOddNeedsArmingNext)),c,w
	btfss	status,2
	goto	u1641
	goto	u1640

u1641:
	goto	l2852
u1640:
	line	1192
	
l2848:; BSR set to: 2

	movlw	(01h)&0ffh
	
	call	_LoadBDTandSetUOWN
	line	1193
	
l2850:
	clrf	((c:_EP0OutOddNeedsArmingNext)),c
	line	1194
	goto	l585
	line	1197
	
l2852:; BSR set to: 2

	movlw	(0)&0ffh
	
	call	_LoadBDTandSetUOWN
	line	1198
	
l2854:
	movlw	low(01h)
	movwf	((c:_EP0OutOddNeedsArmingNext)),c
	goto	l585
	line	1201
	
l574:
	line	1203
	btfss	((c:_SetupPkt)),c,7
	goto	u1651
	goto	u1650
u1651:
	goto	l2876
u1650:
	line	1228
	
l2856:
	movlw	low(01h)
	movwf	((c:_ctrl_trf_state)),c
	line	1233
	
l2858:
		movf	((c:_wCount)),c,w
	subwf	(0+((c:_SetupPkt)+06h)),c,w
	movf	((c:_wCount+1)),c,w
	subwfb	(1+((c:_SetupPkt)+06h)),c,w
	btfsc	status,0
	goto	u1661
	goto	u1660

u1661:
	goto	l2862
u1660:
	line	1234
	
l2860:
	movff	0+((c:_SetupPkt)+06h),(c:_wCount)
	movff	1+((c:_SetupPkt)+06h),(c:_wCount+1)
	line	1238
	
l2862:
	call	_USBCtrlTrfTxService	;wreg free
	line	1242
	
l2864:
	movlw	low(048h)
	movwf	((c:_TempBDT)),c
	line	1243
	
l2866:
	movlw	(01h)&0ffh
	
	call	_LoadBDTandSetUOWN
	line	1244
	
l2868:
	movlw	(0)&0ffh
	
	call	_LoadBDTandSetUOWN
	line	1249
	
l2870:
		movlw	low(548)
	movlb	2	; () banked
	movwf	(0+(520+02h))&0ffh	;volatile
	movlw	high(548)
	movwf	(1+(520+02h))&0ffh	;volatile

	line	1250
	
l2872:; BSR set to: 2

	movlw	low(048h)
	movwf	((520))&0ffh	;volatile
	line	1251
	
l2874:; BSR set to: 2

	bsf	(0+(7/8)+(520))&0ffh,(7)&7	;volatile
	line	1252
	goto	l585
	line	1265
	
l2876:
	movlw	low(02h)
	movwf	((c:_ctrl_trf_state)),c
	line	1270
	movlw	low(04h)
	movwf	((c:_TempBDT)),c
	line	1272
	
l2878:
	movf	(0+((c:_SetupPkt)+06h)),c,w
iorwf	(1+((c:_SetupPkt)+06h)),c,w
	btfss	status,2
	goto	u1671
	goto	u1670

u1671:
	goto	l2882
u1670:
	line	1274
	
l2880:
	movlw	low(048h)
	movwf	((c:_TempBDT)),c
	line	1277
	
l2882:
		decf	((c:_EP0OutOddNeedsArmingNext)),c,w
	btfss	status,2
	goto	u1681
	goto	u1680

u1681:
	goto	l2888
u1680:
	line	1279
	
l2884:
	movlw	(01h)&0ffh
	
	call	_LoadBDTandSetUOWN
	line	1280
	
l2886:
	clrf	((c:_EP0OutOddNeedsArmingNext)),c
	line	1281
	goto	l2892
	line	1284
	
l2888:
	movlw	(0)&0ffh
	
	call	_LoadBDTandSetUOWN
	line	1285
	
l2890:
	movlw	low(01h)
	movwf	((c:_EP0OutOddNeedsArmingNext)),c
	line	1290
	
l2892:
	movf	(0+((c:_SetupPkt)+06h)),c,w
iorwf	(1+((c:_SetupPkt)+06h)),c,w
	btfss	status,2
	goto	u1691
	goto	u1690

u1691:
	goto	l585
u1690:
	line	1293
	
l2894:
	movlb	2	; () banked
	clrf	(0+(520+01h))&0ffh	;volatile
	line	1294
	
l2896:; BSR set to: 2

	movlw	low(048h)
	movwf	((520))&0ffh	;volatile
	line	1295
	
l2898:; BSR set to: 2

	bsf	(0+(7/8)+(520))&0ffh,(7)&7	;volatile
	line	1305
	
l585:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCtrlEPServiceComplete
	__end_of_USBCtrlEPServiceComplete:
	signat	_USBCtrlEPServiceComplete,88
	global	_USBCheckStdRequest

;; *************** function _USBCheckStdRequest *****************
;; Defined at:
;;		line 1325 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : F/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_USBStdFeatureReqHandler
;;		_USBStdGetDscHandler
;;		_USBStdGetStatusHandler
;;		_USBStdSetCfgHandler
;; This function is called by:
;;		_USBCtrlTrfSetupHandler
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2
	line	1325
global __ptext13
__ptext13:
psect	text13
	file	"usb_device.c"
	line	1325
	global	__size_of_USBCheckStdRequest
	__size_of_USBCheckStdRequest	equ	__end_of_USBCheckStdRequest-_USBCheckStdRequest
	
_USBCheckStdRequest:
;incstack = 0
	opt	stack 24
	line	1327
	
l2800:; BSR set to: 2

	swapf	((c:_SetupPkt)),c,w
	rrcf	wreg,f
	andlw	(1<<2)-1
	iorlw	0
	btfsc	status,2
	goto	u1621
	goto	u1620
u1621:
	goto	l2836
u1620:
	goto	l589
	
l2802:; BSR set to: 2

	goto	l589
	line	1332
	
l2804:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	1333
	movlw	low(04h)
	movwf	((c:_usb_device_state)),c
	line	1335
	goto	l589
	line	1337
	
l2806:; BSR set to: 2

	call	_USBStdGetDscHandler	;wreg free
	line	1338
	goto	l589
	line	1340
	
l2808:; BSR set to: 2

	call	_USBStdSetCfgHandler	;wreg free
	line	1341
	goto	l589
	line	1343
	
l2810:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	1344
	
l2812:; BSR set to: 2

		movlw	low(_usb_active_cfg)
	movwf	((c:_pSrc)),c
	clrf	((c:_pSrc+1)),c

	line	1345
	
l2814:; BSR set to: 2

	bcf	((c:_usb_stat)),c,1
	line	1347
	
l2816:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_wCount)),c
	line	1348
	goto	l589
	line	1350
	
l2818:; BSR set to: 2

	call	_USBStdGetStatusHandler	;wreg free
	line	1351
	goto	l589
	line	1354
	
l2820:; BSR set to: 2

	call	_USBStdFeatureReqHandler	;wreg free
	line	1355
	goto	l589
	line	1357
	
l2822:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	1358
	
l2824:; BSR set to: 2

	movf	(0+((c:_SetupPkt)+04h)),c,w
	addlw	low(_usb_alt_intf)
	movwf	(??_USBCheckStdRequest+0+0)&0ffh,c
		movff	(??_USBCheckStdRequest+0+0),(c:_pSrc)
	clrf	((c:_pSrc+1)),c

	goto	l2814
	line	1363
	
l2830:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	1364
	
l2832:; BSR set to: 2

	movf	(0+((c:_SetupPkt)+04h)),c,w
	addlw	low(_usb_alt_intf)
	movwf	fsr2l
	clrf	fsr2h
	movff	0+((c:_SetupPkt)+02h),indf2

	line	1365
	goto	l589
	line	1329
	
l2836:; BSR set to: 2

	movf	(0+((c:_SetupPkt)+01h)),c,w
	; Switch size 1, requested type "space"
; Number of cases is 11, Range of values is 0 to 12
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           34    18 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l2818
	xorlw	1^0	; case 1
	skipnz
	goto	l2820
	xorlw	3^1	; case 3
	skipnz
	goto	l2820
	xorlw	5^3	; case 5
	skipnz
	goto	l2804
	xorlw	6^5	; case 6
	skipnz
	goto	l2806
	xorlw	7^6	; case 7
	skipnz
	goto	l2802
	xorlw	8^7	; case 8
	skipnz
	goto	l2810
	xorlw	9^8	; case 9
	skipnz
	goto	l2808
	xorlw	10^9	; case 10
	skipnz
	goto	l2822
	xorlw	11^10	; case 11
	skipnz
	goto	l2830
	xorlw	12^11	; case 12
	skipnz
	goto	l589
	goto	l589

	line	1372
	
l589:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCheckStdRequest
	__end_of_USBCheckStdRequest:
	signat	_USBCheckStdRequest,88
	global	_USBStdSetCfgHandler

;; *************** function _USBStdSetCfgHandler *****************
;; Defined at:
;;		line 1440 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : F/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_USBCBInitEP
;; This function is called by:
;;		_USBCheckStdRequest
;; This function uses a non-reentrant model
;;
psect	text14,class=CODE,space=0,reloc=2
	line	1440
global __ptext14
__ptext14:
psect	text14
	file	"usb_device.c"
	line	1440
	global	__size_of_USBStdSetCfgHandler
	__size_of_USBStdSetCfgHandler	equ	__end_of_USBStdSetCfgHandler-_USBStdSetCfgHandler
	
_USBStdSetCfgHandler:
;incstack = 0
	opt	stack 24
	line	1444
	
l2676:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	1446
	
l2678:; BSR set to: 2

	movlb	15	; () banked
	clrf	((3924))&0ffh	;volatile
	
l2680:; BSR set to: 15

	clrf	((3925))&0ffh	;volatile
	
l2682:; BSR set to: 15

	clrf	((3926))&0ffh	;volatile
	
l2684:; BSR set to: 15

	clrf	((3927))&0ffh	;volatile
	
l2686:; BSR set to: 15

	clrf	((3928))&0ffh	;volatile
	
l2688:; BSR set to: 15

	clrf	((3929))&0ffh	;volatile
	
l2690:; BSR set to: 15

	clrf	((3930))&0ffh	;volatile
	line	1448
	
l2692:; BSR set to: 15

	clrf	((c:USBStdSetCfgHandler@i)),c
	line	1450
	
l2696:
	movf	((c:USBStdSetCfgHandler@i)),c,w
	addlw	low(_usb_alt_intf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(0)
	movwf	indf2
	line	1448
	
l2698:
	incf	((c:USBStdSetCfgHandler@i)),c
	
l2700:
	movf	((c:USBStdSetCfgHandler@i)),c,w
	btfsc	status,2
	goto	u1441
	goto	u1440
u1441:
	goto	l2696
u1440:
	
l619:
	line	1454
	movff	0+((c:_SetupPkt)+02h),(c:_usb_active_cfg)
	line	1461
	
l2702:
	movf	((c:_usb_active_cfg)),c,w
	
	call	_USBCBInitEP
	line	1463
	
l2704:
	movf	(0+((c:_SetupPkt)+02h)),c,w
	btfss	status,2
	goto	u1451
	goto	u1450
u1451:
	goto	l2708
u1450:
	line	1465
	
l2706:
	movlw	low(05h)
	movwf	((c:_usb_device_state)),c
	line	1466
	goto	l622
	line	1469
	
l2708:
	movlw	low(06h)
	movwf	((c:_usb_device_state)),c
	line	1471
	
l622:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBStdSetCfgHandler
	__end_of_USBStdSetCfgHandler:
	signat	_USBStdSetCfgHandler,88
	global	_USBStdGetStatusHandler

;; *************** function _USBStdGetStatusHandler *****************
;; Defined at:
;;		line 1489 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : F/2
;;		On exit  : F/2
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBCheckStdRequest
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2
	line	1489
global __ptext15
__ptext15:
psect	text15
	file	"usb_device.c"
	line	1489
	global	__size_of_USBStdGetStatusHandler
	__size_of_USBStdGetStatusHandler	equ	__end_of_USBStdGetStatusHandler-_USBStdGetStatusHandler
	
_USBStdGetStatusHandler:
;incstack = 0
	opt	stack 26
	line	1491
	
l2710:; BSR set to: 2

	clrf	((548))&0ffh	;volatile
	line	1492
	clrf	(0+(548+01h))&0ffh	;volatile
	line	1494
	goto	l2732
	line	1497
	
l2712:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	1505
	
l2716:; BSR set to: 2

	btfss	((c:_usb_stat)),c,0
	goto	u1461
	goto	u1460
u1461:
	goto	l2734
u1460:
	line	1506
	
l2718:; BSR set to: 2

	bsf	(0+(1/8)+(548))&0ffh,(1)&7	;volatile
	goto	l2734
	line	1509
	
l2720:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	1510
	goto	l2734
	line	1512
	
l2722:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	1516
	
l2724:; BSR set to: 2

	movf	(0+((c:_SetupPkt)+04h)),c,w
	andlw	(1<<4)-1
	mullw	08h
	movlw	low((512))
	movwf	(??_USBStdGetStatusHandler+0+0)&0ffh,c
	movlw	high((512))
	movwf	1+(??_USBStdGetStatusHandler+0+0)&0ffh,c
	movlw	04h
	addwf	(??_USBStdGetStatusHandler+0+0),c
	movlw	0
	addwfc	(??_USBStdGetStatusHandler+0+1),c
	movf	(prodl),c,w
	addwf	(??_USBStdGetStatusHandler+0+0),c
	movf	(prodh),c,w
	addwfc	(??_USBStdGetStatusHandler+0+1),c
	btfsc	(0+((c:_SetupPkt)+04h)),c,7
	goto	u1471
	goto	u1470
u1471:
	movlw	1
	goto	u1476
u1470:
	movlw	0
u1476:
	mullw	04h
	movf	(prodl),c,w
	addwf	(??_USBStdGetStatusHandler+0+0),c,w
	movwf	((c:_pDst)),c
	movf	(prodh),c,w
	addwfc	(??_USBStdGetStatusHandler+0+1),c,w
	movwf	1+((c:_pDst)),c
	line	1517
	
l2726:; BSR set to: 2

	movff	(c:_pDst),fsr2l
	movff	(c:_pDst+1),fsr2h
	btfss	indf2,(2)&7
	goto	u1481
	goto	u1480
u1481:
	goto	l2734
u1480:
	line	1518
	
l2728:; BSR set to: 2

	movlw	low(01h)
	movwf	((548))&0ffh	;volatile
	goto	l2734
	line	1494
	
l2732:; BSR set to: 2

	movf	((c:_SetupPkt)),c,w
	andlw	(1<<5)-1
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l2712
	xorlw	1^0	; case 1
	skipnz
	goto	l2720
	xorlw	2^1	; case 2
	skipnz
	goto	l2722
	goto	l2734

	line	1522
	
l2734:; BSR set to: 2

		decf	((c:_ctrl_trf_session_owner)),c,w
	btfss	status,2
	goto	u1491
	goto	u1490

u1491:
	goto	l634
u1490:
	line	1524
	
l2736:; BSR set to: 2

		movlw	low(548)
	movwf	((c:_pSrc)),c
	movlw	high(548)
	movwf	((c:_pSrc+1)),c

	line	1525
	
l2738:; BSR set to: 2

	bcf	((c:_usb_stat)),c,1
	line	1526
	
l2740:; BSR set to: 2

	movlw	low(02h)
	movwf	((c:_wCount)),c
	line	1528
	
l634:; BSR set to: 2

	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBStdGetStatusHandler
	__end_of_USBStdGetStatusHandler:
	signat	_USBStdGetStatusHandler,88
	global	_USBStdGetDscHandler

;; *************** function _USBStdGetDscHandler *****************
;; Defined at:
;;		line 1392 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : F/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBCheckStdRequest
;; This function uses a non-reentrant model
;;
psect	text16,class=CODE,space=0,reloc=2
	line	1392
global __ptext16
__ptext16:
psect	text16
	file	"usb_device.c"
	line	1392
	global	__size_of_USBStdGetDscHandler
	__size_of_USBStdGetDscHandler	equ	__end_of_USBStdGetDscHandler-_USBStdGetDscHandler
	
_USBStdGetDscHandler:; BSR set to: 2

;incstack = 0
	opt	stack 26
	line	1394
	
l2648:; BSR set to: 2

		movlw	128
	xorwf	((c:_SetupPkt)),c,w
	btfss	status,2
	goto	u1411
	goto	u1410

u1411:
	goto	l613
u1410:
	goto	l2674
	line	1399
	
l2652:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	1400
	
l2654:; BSR set to: 2

		movlw	low(_device_dsc)
	movwf	((c:_pSrc)),c
	movf	((c:_pSrc)),c,w
	btfss	status,2
	movlw	high(__smallconst)
	movwf	((c:_pSrc+1)),c

	line	1401
	
l2656:; BSR set to: 2

	movlw	low(012h)
	movwf	((c:_wCount)),c
	line	1402
	goto	l609
	line	1405
	
l2658:; BSR set to: 2

	movf	(0+((c:_SetupPkt)+02h)),c,w
	btfss	status,2
	goto	u1421
	goto	u1420
u1421:
	goto	l609
u1420:
	line	1407
	
l2660:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	1408
	
l2662:; BSR set to: 2

		movlw	low(_CFG01)
	movwf	((c:_pSrc)),c
	movf	((c:_pSrc)),c,w
	btfss	status,2
	movlw	high(__smallconst)
	movwf	((c:_pSrc+1)),c

	line	1409
	
l2664:; BSR set to: 2

	movlw	high(029h)
	movwf	((c:_wCount+1)),c
	movlw	low(029h)
	movwf	((c:_wCount)),c
	goto	l609
	line	1413
	
l2666:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	1414
	
l2668:; BSR set to: 2

	movf	(0+((c:_SetupPkt)+02h)),c,w
	addlw	low(_USB_SD_Ptr)
	movwf	(??_USBStdGetDscHandler+0+0)&0ffh,c
	movff	(??_USBStdGetDscHandler+0+0),tblptrl
	if	1	;There is more than 1 active tblptr byte
	global __smallconst
movlw	high(__smallconst)
	movwf	tblptrh
	endif
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	movlw	low highword(__smallconst)
	movwf	tblptru
	endif
	tblrd*+
	
	movff	tablat,(c:_pSrc)
	global __smallconst
movlw	high(__smallconst)
	movwf	((c:_pSrc+1)),c

	line	1415
	
l2670:; BSR set to: 2

	movff	(c:_pSrc),tblptrl
	movff	(c:_pSrc+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1437
	tblrd	*
	
	movf	tablat,w
	bra	u1430
u1437:
	movff	tblptrl,fsr1l
	movff	tblptrh,fsr1h
	movf	indf1,w
u1430:
	movwf	((c:_wCount)),c
	clrf	((c:_wCount+1)),c
	line	1416
	goto	l609
	line	1396
	
l2674:; BSR set to: 2

	movf	(0+((c:_SetupPkt)+03h)),c,w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l2652
	xorlw	2^1	; case 2
	skipnz
	goto	l2658
	xorlw	3^2	; case 3
	skipnz
	goto	l2666
	goto	l609

	line	1417
	
l609:
	line	1419
	bsf	((c:_usb_stat)),c,1
	line	1421
	
l613:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBStdGetDscHandler
	__end_of_USBStdGetDscHandler:
	signat	_USBStdGetDscHandler,88
	global	_USBStdFeatureReqHandler

;; *************** function _USBStdFeatureReqHandler *****************
;; Defined at:
;;		line 1547 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : F/2
;;		On exit  : F/2
;;		Unchanged: F/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBCheckStdRequest
;; This function uses a non-reentrant model
;;
psect	text17,class=CODE,space=0,reloc=2
	line	1547
global __ptext17
__ptext17:
psect	text17
	file	"usb_device.c"
	line	1547
	global	__size_of_USBStdFeatureReqHandler
	__size_of_USBStdFeatureReqHandler	equ	__end_of_USBStdFeatureReqHandler-_USBStdFeatureReqHandler
	
_USBStdFeatureReqHandler:
;incstack = 0
	opt	stack 26
	line	1550
	
l2742:; BSR set to: 2

		decf	(0+((c:_SetupPkt)+02h)),c,w
	btfss	status,2
	goto	u1501
	goto	u1500

u1501:
	goto	l2752
u1500:
	
l2744:; BSR set to: 2

	movf	((c:_SetupPkt)),c,w
	andlw	(1<<5)-1
	iorlw	0
	btfss	status,2
	goto	u1511
	goto	u1510
u1511:
	goto	l2752
u1510:
	line	1552
	
l2746:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	1553
	
l2748:; BSR set to: 2

		movlw	3
	xorwf	(0+((c:_SetupPkt)+01h)),c,w
	btfss	status,2
	goto	u1521
	goto	u1520

u1521:
	goto	l638
u1520:
	line	1554
	
l2750:; BSR set to: 2

	bsf	((c:_usb_stat)),c,0
	goto	l2752
	line	1555
	
l638:; BSR set to: 2

	line	1556
	bcf	((c:_usb_stat)),c,0
	line	1560
	
l2752:; BSR set to: 2

	movf	(0+((c:_SetupPkt)+02h)),c,w
	btfss	status,2
	goto	u1531
	goto	u1530
u1531:
	goto	l645
u1530:
	
l2754:; BSR set to: 2

	movf	((c:_SetupPkt)),c,w
	andlw	(1<<5)-1
	xorlw	02h
	btfss	status,2
	goto	u1541
	goto	u1540
u1541:
	goto	l645
u1540:
	
l2756:; BSR set to: 2

	movf	(0+((c:_SetupPkt)+04h)),c,w
	andlw	(1<<4)-1
	iorlw	0
	btfsc	status,2
	goto	u1551
	goto	u1550
u1551:
	goto	l645
u1550:
	line	1562
	
l2758:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	1564
	
l2760:; BSR set to: 2

	movf	(0+((c:_SetupPkt)+04h)),c,w
	andlw	(1<<4)-1
	mullw	08h
	movlw	low((512))
	movwf	(??_USBStdFeatureReqHandler+0+0)&0ffh,c
	movlw	high((512))
	movwf	1+(??_USBStdFeatureReqHandler+0+0)&0ffh,c
	movlw	04h
	addwf	(??_USBStdFeatureReqHandler+0+0),c
	movlw	0
	addwfc	(??_USBStdFeatureReqHandler+0+1),c
	movf	(prodl),c,w
	addwf	(??_USBStdFeatureReqHandler+0+0),c
	movf	(prodh),c,w
	addwfc	(??_USBStdFeatureReqHandler+0+1),c
	btfsc	(0+((c:_SetupPkt)+04h)),c,7
	goto	u1561
	goto	u1560
u1561:
	movlw	1
	goto	u1566
u1560:
	movlw	0
u1566:
	mullw	04h
	movf	(prodl),c,w
	addwf	(??_USBStdFeatureReqHandler+0+0),c,w
	movwf	((c:_pDst)),c
	movf	(prodh),c,w
	addwfc	(??_USBStdFeatureReqHandler+0+1),c,w
	movwf	1+((c:_pDst)),c
	line	1566
	
l2762:; BSR set to: 2

		movlw	3
	xorwf	(0+((c:_SetupPkt)+01h)),c,w
	btfss	status,2
	goto	u1571
	goto	u1570

u1571:
	goto	l641
u1570:
	line	1568
	
l2764:; BSR set to: 2

	movff	(c:_pDst),fsr2l
	movff	(c:_pDst+1),fsr2h
	movlw	low(04h)
	movwf	indf2
	line	1569
	
l2766:; BSR set to: 2

	movff	(c:_pDst),fsr2l
	movff	(c:_pDst+1),fsr2h
	movlw	0+(7/8)
	bsf	plusw2,(7)&7
	line	1570
	goto	l645
	line	1571
	
l641:; BSR set to: 2

	line	1573
	btfss	(0+((c:_SetupPkt)+04h)),c,7
	goto	u1581
	goto	u1580
u1581:
	goto	l2770
u1580:
	line	1574
	
l2768:; BSR set to: 2

	movff	(c:_pDst),fsr2l
	movff	(c:_pDst+1),fsr2h
	movlw	low(040h)
	movwf	indf2
	goto	l645
	line	1577
	
l2770:; BSR set to: 2

	movff	(c:_pDst),fsr2l
	movff	(c:_pDst+1),fsr2h
	movlw	low(08h)
	movwf	indf2
	line	1578
	
l2772:; BSR set to: 2

	movff	(c:_pDst),fsr2l
	movff	(c:_pDst+1),fsr2h
	movlw	0+(7/8)
	bsf	plusw2,(7)&7
	line	1582
	
l645:; BSR set to: 2

	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBStdFeatureReqHandler
	__end_of_USBStdFeatureReqHandler:
	signat	_USBStdFeatureReqHandler,88
	global	_USBCBCheckOtherReq

;; *************** function _USBCBCheckOtherReq *****************
;; Defined at:
;;		line 829 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_USBCheckHIDRequest
;; This function is called by:
;;		_USBCtrlTrfSetupHandler
;; This function uses a non-reentrant model
;;
psect	text18,class=CODE,space=0,reloc=2
	file	"main.c"
	line	829
global __ptext18
__ptext18:
psect	text18
	file	"main.c"
	line	829
	global	__size_of_USBCBCheckOtherReq
	__size_of_USBCBCheckOtherReq	equ	__end_of_USBCBCheckOtherReq-_USBCBCheckOtherReq
	
_USBCBCheckOtherReq:; BSR set to: 2

;incstack = 0
	opt	stack 25
	line	831
	
l2780:
	call	_USBCheckHIDRequest	;wreg free
	line	832
	
l129:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCBCheckOtherReq
	__end_of_USBCBCheckOtherReq:
	signat	_USBCBCheckOtherReq,88
	global	_USBCheckHIDRequest

;; *************** function _USBCheckHIDRequest *****************
;; Defined at:
;;		line 73 in file "usb_device_hid.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_HIDGetReportHandler
;;		_HIDSetReportHandler
;; This function is called by:
;;		_USBCBCheckOtherReq
;; This function uses a non-reentrant model
;;
psect	text19,class=CODE,space=0,reloc=2
	file	"usb_device_hid.c"
	line	73
global __ptext19
__ptext19:
psect	text19
	file	"usb_device_hid.c"
	line	73
	global	__size_of_USBCheckHIDRequest
	__size_of_USBCheckHIDRequest	equ	__end_of_USBCheckHIDRequest-_USBCheckHIDRequest
	
_USBCheckHIDRequest:
;incstack = 0
	opt	stack 25
	line	75
	
l2492:
	movf	((c:_SetupPkt)),c,w
	andlw	(1<<5)-1
	decf	wreg
	btfsc	status,2
	goto	u1261
	goto	u1260
u1261:
	goto	l2496
u1260:
	goto	l704
	line	76
	
l2496:
	movf	(0+((c:_SetupPkt)+04h)),c,w
	btfsc	status,2
	goto	u1271
	goto	u1270
u1271:
	goto	l2500
u1270:
	goto	l704
	line	83
	
l2500:
		movlw	6
	xorwf	(0+((c:_SetupPkt)+01h)),c,w
	btfss	status,2
	goto	u1281
	goto	u1280

u1281:
	goto	l2522
u1280:
	goto	l2520
	line	88
	
l2504:
	movlw	low(02h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	89
	
l2506:
		movlw	low(_CFG01+012h)
	movwf	((c:_pSrc)),c
	movf	((c:_pSrc)),c,w
	btfss	status,2
	movlw	high(__smallconst)
	movwf	((c:_pSrc+1)),c

	line	90
	
l2508:
	movlw	high(09h)
	movwf	((c:_wCount+1)),c
	movlw	low(09h)
	movwf	((c:_wCount)),c
	line	91
	goto	l709
	line	93
	
l2510:
	movlw	low(02h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	94
	
l2512:
		decf	((c:_usb_active_cfg)),c,w
	btfss	status,2
	goto	u1291
	goto	u1290

u1291:
	goto	l711
u1290:
	
l2514:
		movlw	low(_hid_rpt01)
	movwf	((c:_pSrc)),c
	movf	((c:_pSrc)),c,w
	btfss	status,2
	movlw	high(__smallconst)
	movwf	((c:_pSrc+1)),c

	
l711:
	line	95
		decf	((c:_usb_active_cfg)),c,w
	btfss	status,2
	goto	u1301
	goto	u1300

u1301:
	goto	l709
u1300:
	
l2516:
	movlw	high(01Dh)
	movwf	((c:_wCount+1)),c
	movlw	low(01Dh)
	movwf	((c:_wCount)),c
	goto	l709
	line	85
	
l2520:
	movf	(0+((c:_SetupPkt)+03h)),c,w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 33 to 35
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
;	Chosen strategy is simple_byte

	xorlw	33^0	; case 33
	skipnz
	goto	l2504
	xorlw	34^33	; case 34
	skipnz
	goto	l2510
	xorlw	35^34	; case 35
	skipnz
	goto	l709
	goto	l709

	line	100
	
l709:
	line	101
	bsf	((c:_usb_stat)),c,1
	line	104
	
l2522:
	swapf	((c:_SetupPkt)),c,w
	rrcf	wreg,f
	andlw	(1<<2)-1
	decf	wreg
	btfsc	status,2
	goto	u1311
	goto	u1310
u1311:
	goto	l2556
u1310:
	goto	l704
	line	108
	
l2526:
	call	_HIDGetReportHandler	;wreg free
	line	109
	goto	l704
	line	111
	
l2528:
	call	_HIDSetReportHandler	;wreg free
	line	112
	goto	l704
	line	114
	
l2530:
	movlw	low(02h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	115
	
l2532:
		movlw	low(_idle_rate)
	movwf	((c:_pSrc)),c
	clrf	((c:_pSrc+1)),c

	line	116
	
l2534:
	bcf	((c:_usb_stat)),c,1
	line	117
	
l2536:
	movlw	low(01h)
	movwf	((c:_wCount)),c
	line	118
	goto	l704
	line	120
	
l2538:
	movlw	low(02h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	122
	
l2540:
	movff	0+((c:_SetupPkt)+03h),(c:_idle_rate)
	line	123
	goto	l704
	line	125
	
l2542:
	movlw	low(02h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	126
	
l2544:
		movlw	low(_active_protocol)
	movwf	((c:_pSrc)),c
	clrf	((c:_pSrc+1)),c

	goto	l2534
	line	131
	
l2550:
	movlw	low(02h)
	movwf	((c:_ctrl_trf_session_owner)),c
	line	133
	
l2552:
	movff	0+((c:_SetupPkt)+02h),(c:_active_protocol)
	line	134
	goto	l704
	line	105
	
l2556:
	movf	(0+((c:_SetupPkt)+01h)),c,w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 1 to 11
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           19    10 (average)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l2526
	xorlw	2^1	; case 2
	skipnz
	goto	l2530
	xorlw	3^2	; case 3
	skipnz
	goto	l2542
	xorlw	9^3	; case 9
	skipnz
	goto	l2528
	xorlw	10^9	; case 10
	skipnz
	goto	l2538
	xorlw	11^10	; case 11
	skipnz
	goto	l2550
	goto	l704

	line	137
	
l704:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCheckHIDRequest
	__end_of_USBCheckHIDRequest:
	signat	_USBCheckHIDRequest,88
	global	_HIDSetReportHandler

;; *************** function _HIDSetReportHandler *****************
;; Defined at:
;;		line 144 in file "usb_device_hid.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBCheckHIDRequest
;; This function uses a non-reentrant model
;;
psect	text20,class=CODE,space=0,reloc=2
	line	144
global __ptext20
__ptext20:
psect	text20
	file	"usb_device_hid.c"
	line	144
	global	__size_of_HIDSetReportHandler
	__size_of_HIDSetReportHandler	equ	__end_of_HIDSetReportHandler-_HIDSetReportHandler
	
_HIDSetReportHandler:
;incstack = 0
	opt	stack 25
	line	148
	
l728:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_HIDSetReportHandler
	__end_of_HIDSetReportHandler:
	signat	_HIDSetReportHandler,88
	global	_HIDGetReportHandler

;; *************** function _HIDGetReportHandler *****************
;; Defined at:
;;		line 139 in file "usb_device_hid.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBCheckHIDRequest
;; This function uses a non-reentrant model
;;
psect	text21,class=CODE,space=0,reloc=2
	line	139
global __ptext21
__ptext21:
psect	text21
	file	"usb_device_hid.c"
	line	139
	global	__size_of_HIDGetReportHandler
	__size_of_HIDGetReportHandler	equ	__end_of_HIDGetReportHandler-_HIDGetReportHandler
	
_HIDGetReportHandler:
;incstack = 0
	opt	stack 25
	line	142
	
l725:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_HIDGetReportHandler
	__end_of_HIDGetReportHandler:
	signat	_HIDGetReportHandler,88
	global	_USBCtrlTrfInHandler

;; *************** function _USBCtrlTrfInHandler *****************
;; Defined at:
;;		line 1024 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_USBCtrlTrfTxService
;; This function is called by:
;;		_USBDeviceTasks
;; This function uses a non-reentrant model
;;
psect	text22,class=CODE,space=0,reloc=2
	file	"usb_device.c"
	line	1024
global __ptext22
__ptext22:
psect	text22
	file	"usb_device.c"
	line	1024
	global	__size_of_USBCtrlTrfInHandler
	__size_of_USBCtrlTrfInHandler	equ	__end_of_USBCtrlTrfInHandler-_USBCtrlTrfInHandler
	
_USBCtrlTrfInHandler:
;incstack = 0
	opt	stack 27
	line	1029
	
l2964:
		movlw	4
	xorwf	((c:_usb_device_state)),c,w
	btfss	status,2
	goto	u1771
	goto	u1770

u1771:
	goto	l2974
u1770:
	line	1031
	
l2966:
	movff	0+((c:_SetupPkt)+02h),(3932)	;volatile
	line	1032
	
l2968:
	movlb	15	; () banked
	movf	((3932))&0ffh,w	;volatile
	btfsc	status,2
	goto	u1781
	goto	u1780
u1781:
	goto	l2972
u1780:
	line	1033
	
l2970:; BSR set to: 15

	movlw	low(05h)
	movwf	((c:_usb_device_state)),c
	goto	l2974
	line	1035
	
l2972:; BSR set to: 15

	movlw	low(03h)
	movwf	((c:_usb_device_state)),c
	line	1040
	
l2974:
		decf	((c:_ctrl_trf_state)),c,w
	btfss	status,2
	goto	u1791
	goto	u1790

u1791:
	goto	l554
u1790:
	line	1044
	
l2976:
	call	_USBCtrlTrfTxService	;wreg free
	line	1047
	
l2978:
		movlw	2
	xorwf	((c:_short_pkt_status)),c,w
	btfss	status,2
	goto	u1801
	goto	u1800

u1801:
	goto	l549
u1800:
	line	1051
	
l2980:
	movlw	low(04h)
	movlb	2	; () banked
	movwf	((520))&0ffh	;volatile
	line	1052
	
l2982:; BSR set to: 2

	bsf	(0+(7/8)+(520))&0ffh,(7)&7	;volatile
	line	1053
	goto	l554
	line	1054
	
l549:
	line	1057
	movlb	2	; () banked
	btfsc	((520))&0ffh,6	;volatile
	goto	u1811
	goto	u1810
u1811:
	goto	l2986
u1810:
	line	1058
	
l2984:; BSR set to: 2

	movlw	low(048h)
	movwf	((520))&0ffh	;volatile
	goto	l2988
	line	1060
	
l2986:; BSR set to: 2

	movlw	low(08h)
	movwf	((520))&0ffh	;volatile
	line	1062
	
l2988:; BSR set to: 2

	bsf	(0+(7/8)+(520))&0ffh,(7)&7	;volatile
	line	1072
	
l554:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCtrlTrfInHandler
	__end_of_USBCtrlTrfInHandler:
	signat	_USBCtrlTrfInHandler,88
	global	_USBCtrlTrfTxService

;; *************** function _USBCtrlTrfTxService *****************
;; Defined at:
;;		line 1094 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBCtrlTrfInHandler
;;		_USBCtrlEPServiceComplete
;; This function uses a non-reentrant model
;;
psect	text23,class=CODE,space=0,reloc=2
	line	1094
global __ptext23
__ptext23:
psect	text23
	file	"usb_device.c"
	line	1094
	global	__size_of_USBCtrlTrfTxService
	__size_of_USBCtrlTrfTxService	equ	__end_of_USBCtrlTrfTxService-_USBCtrlTrfTxService
	
_USBCtrlTrfTxService:
;incstack = 0
	opt	stack 26
	line	1101
	
l2604:
	movlw	low(08h)
	movwf	((c:USBCtrlTrfTxService@bytes_to_send)),c
	line	1102
	
l2606:
		movf	((c:_wCount+1)),c,w
	bnz	u1331
	movlw	8
	subwf	 ((c:_wCount)),c,w
	btfsc	status,0
	goto	u1331
	goto	u1330

u1331:
	goto	l2618
u1330:
	line	1106
	
l2608:
	movff	(c:_wCount),(c:USBCtrlTrfTxService@bytes_to_send)
	line	1107
	
l2610:
	movf	((c:_short_pkt_status)),c,w
	btfss	status,2
	goto	u1341
	goto	u1340
u1341:
	goto	l2614
u1340:
	line	1109
	
l2612:
	movlw	low(01h)
	movwf	((c:_short_pkt_status)),c
	line	1110
	goto	l2618
	line	1111
	
l2614:
		decf	((c:_short_pkt_status)),c,w
	btfss	status,2
	goto	u1351
	goto	u1350

u1351:
	goto	l2618
u1350:
	line	1113
	
l2616:
	movlw	low(02h)
	movwf	((c:_short_pkt_status)),c
	line	1118
	
l2618:
	movff	(c:USBCtrlTrfTxService@bytes_to_send),0+(520+01h)	;volatile
	line	1121
	
l2620:
	movf	((c:USBCtrlTrfTxService@bytes_to_send)),c,w
	subwf	((c:_wCount)),c
	movlw	0
	subwfb	((c:_wCount+1)),c
	line	1126
	
l2622:
		movlw	low(548)
	movwf	((c:_pDst)),c
	movlw	high(548)
	movwf	((c:_pDst+1)),c

	line	1127
	
l2624:
	btfss	((c:_usb_stat)),c,1
	goto	u1361
	goto	u1360
u1361:
	goto	l2646
u1360:
	goto	l2636
	line	1131
	
l2628:
	movff	(c:_pSrc),tblptrl
	movff	(c:_pSrc+1),tblptrh
	clrf	tblptru
	
	movff	(c:_pDst),fsr2l
	movff	(c:_pDst+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1377
	tblrd	*
	
	movf	tablat,w
	bra	u1370
u1377:
	movff	tblptrl,fsr1l
	movff	tblptrh,fsr1h
	movf	indf1,w
u1370:
	movwf	indf2
	line	1132
	
l2630:
	infsnz	((c:_pDst)),c
	incf	((c:_pDst+1)),c
	line	1133
	
l2632:
	infsnz	((c:_pSrc)),c
	incf	((c:_pSrc+1)),c
	line	1134
	
l2634:
	decf	((c:USBCtrlTrfTxService@bytes_to_send)),c
	line	1129
	
l2636:
	movf	((c:USBCtrlTrfTxService@bytes_to_send)),c,w
	btfss	status,2
	goto	u1381
	goto	u1380
u1381:
	goto	l2628
u1380:
	goto	l571
	line	1141
	
l2638:
	movff	(c:_pSrc),tblptrl
	movff	(c:_pSrc+1),tblptrh
	clrf	tblptru
	
	movff	(c:_pDst),fsr2l
	movff	(c:_pDst+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1397
	tblrd	*
	
	movf	tablat,w
	bra	u1390
u1397:
	movff	tblptrl,fsr1l
	movff	tblptrh,fsr1h
	movf	indf1,w
u1390:
	movwf	indf2
	line	1142
	
l2640:
	infsnz	((c:_pDst)),c
	incf	((c:_pDst+1)),c
	line	1143
	
l2642:
	infsnz	((c:_pSrc)),c
	incf	((c:_pSrc+1)),c
	line	1144
	
l2644:
	decf	((c:USBCtrlTrfTxService@bytes_to_send)),c
	line	1139
	
l2646:
	movf	((c:USBCtrlTrfTxService@bytes_to_send)),c,w
	btfss	status,2
	goto	u1401
	goto	u1400
u1401:
	goto	l2638
u1400:
	line	1148
	
l571:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCtrlTrfTxService
	__end_of_USBCtrlTrfTxService:
	signat	_USBCtrlTrfTxService,88
	global	_SignFlash

;; *************** function _SignFlash *****************
;; Defined at:
;;		line 618 in file "BootPIC18NonJ.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_ClearWatchdog
;;		_UnlockAndActivate
;; This function is called by:
;;		_ProcessIO
;; This function uses a non-reentrant model
;;
psect	text24,class=CODE,space=0,reloc=2
	file	"BootPIC18NonJ.c"
	line	618
global __ptext24
__ptext24:
psect	text24
	file	"BootPIC18NonJ.c"
	line	618
	global	__size_of_SignFlash
	__size_of_SignFlash	equ	__end_of_SignFlash-_SignFlash
	
_SignFlash:
;incstack = 0
	opt	stack 26
	line	625
	
l3176:
		movlw	low(01000h)
	movwf	((c:SignFlash@pROM)),c
	movlw	high(01000h)
	movwf	((c:SignFlash@pROM+1)),c
	movlw	low highword(01000h)
	movwf	((c:SignFlash@pROM+2)),c

	line	626
	
l3178:
	clrf	((c:SignFlash@i)),c
	line	628
	
l3182:
	movff	(c:SignFlash@pROM),tblptrl
	movff	(c:SignFlash@pROM+1),tblptrh
	movff	(c:SignFlash@pROM+2),tblptru
	movlw	low(_ProgrammingBuffer)
	addwf	((c:SignFlash@i)),c,w
	movwf	c:fsr2l
	clrf	1+c:fsr2l
	movlw	high(_ProgrammingBuffer)
	addwfc	1+c:fsr2l
	tblrd	*
	
	movff	tablat,indf2
	
l3184:
	movlw	low(01h)
	addwf	((c:SignFlash@pROM)),c
	movlw	high(01h)
	addwfc	((c:SignFlash@pROM+1)),c
	movlw	low highword(01h)
	addwfc	((c:SignFlash@pROM+2)),c
	line	626
	
l3186:
	incf	((c:SignFlash@i)),c
	
l3188:
		movlw	040h-1
	cpfsgt	((c:SignFlash@i)),c
	goto	u2111
	goto	u2110

u2111:
	goto	l3182
u2110:
	line	632
	
l3190:
	movlw	low(0Dh)
	movlb	1	; () banked
	movwf	(0+(_ProgrammingBuffer+06h))&0ffh
	line	633
	movlw	low(060h)
	movwf	(0+(_ProgrammingBuffer+07h))&0ffh
	line	637
	
l3192:; BSR set to: 1

	clrf	((c:4088)),c	;volatile
	line	638
	movlw	low(010h)
	movwf	((c:4087)),c	;volatile
	line	639
	
l3194:; BSR set to: 1

	clrf	((c:4086)),c	;volatile
	line	641
	movlw	low(094h)
	movwf	((c:4006)),c	;volatile
	line	642
	
l3196:; BSR set to: 1

	movlw	(0B5h)&0ffh
	
	call	_UnlockAndActivate
	line	650
	
l3198:
		movlw	low(0103Fh)
	movwf	((c:SignFlash@pROM)),c
	movlw	high(0103Fh)
	movwf	((c:SignFlash@pROM+1)),c
	movlw	low highword(0103Fh)
	movwf	((c:SignFlash@pROM+2)),c

	line	652
	
l3200:
	movlw	low(03Fh)
	movwf	((c:SignFlash@i)),c
	line	656
	
l3202:
	movff	0+((c:SignFlash@pROM)+02h),(c:4088)	;volatile
	line	657
	
l3204:
	movff	0+((c:SignFlash@pROM)+01h),(c:4087)	;volatile
	line	658
	
l3206:
	movff	(c:SignFlash@pROM),(c:4086)	;volatile
	line	662
	
l3208:
	movlw	low(_ProgrammingBuffer)
	addwf	((c:SignFlash@i)),c,w
	movwf	c:fsr2l
	clrf	1+c:fsr2l
	movlw	high(_ProgrammingBuffer)
	addwfc	1+c:fsr2l
	movf	indf2,w
	movwf	((c:4085)),c	;volatile
	line	666
# 666 "BootPIC18NonJ.c"
tblwt ;# 
psect	text24
	line	673
	
l3210:
	movff	(c:SignFlash@i),??_SignFlash+0+0
	movlw	0Fh
	andwf	(??_SignFlash+0+0),c
	btfss	status,2
	goto	u2121
	goto	u2120
u2121:
	goto	l3218
u2120:
	line	676
	
l3212:
	call	_ClearWatchdog	;wreg free
	line	677
	
l3214:
	movlw	low(0A4h)
	movwf	((c:4006)),c	;volatile
	line	678
	
l3216:
	movlw	(0B5h)&0ffh
	
	call	_UnlockAndActivate
	line	681
	
l3218:
	movlw	low(01h)
	subwf	((c:SignFlash@pROM)),c
	movlw	high(01h)
	subwfb	((c:SignFlash@pROM+1)),c
	movlw	low highword(01h)
	subwfb	((c:SignFlash@pROM+2)),c
	line	684
# 684 "BootPIC18NonJ.c"
tblrdpostdec ;# 
psect	text24
	line	691
	movf	((c:SignFlash@i)),c,w
	btfss	status,2
	goto	u2131
	goto	u2130
u2131:
	goto	l3222
u2130:
	goto	l267
	line	695
	
l3222:
	decf	((c:SignFlash@i)),c
	goto	l3202
	line	697
	
l267:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_SignFlash
	__end_of_SignFlash:
	signat	_SignFlash,88
	global	_UnlockAndActivate

;; *************** function _UnlockAndActivate *****************
;; Defined at:
;;		line 893 in file "BootPIC18NonJ.c"
;; Parameters:    Size  Location     Type
;;  UnlockKey       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  UnlockKey       1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_LowVoltageCheck
;; This function is called by:
;;		_ProcessIO
;;		_SignFlash
;;		_WriteFlashBlock
;;		_WriteConfigBits
;;		_WriteEEPROM
;; This function uses a non-reentrant model
;;
psect	text25,class=CODE,space=0,reloc=2
	line	893
global __ptext25
__ptext25:
psect	text25
	file	"BootPIC18NonJ.c"
	line	893
	global	__size_of_UnlockAndActivate
	__size_of_UnlockAndActivate	equ	__end_of_UnlockAndActivate-_UnlockAndActivate
	
_UnlockAndActivate:
;incstack = 0
	opt	stack 26
	movwf	((c:UnlockAndActivate@UnlockKey)),c
	line	895
	
l2900:
	bcf	((c:4082)),c,7	;volatile
	line	898
	
l2902:
	call	_LowVoltageCheck	;wreg free
	line	902
	
l2904:
		movlw	181
	xorwf	((c:UnlockAndActivate@UnlockKey)),c,w
	btfsc	status,2
	goto	u1701
	goto	u1700

u1701:
	goto	l2908
u1700:
	line	911
	
l2906:
	movlw	low(03h)
	movwf	((c:4051)),c	;volatile
	line	912
	
l310:
	line	914
# 914 "BootPIC18NonJ.c"
sleep ;# 
psect	text25
	goto	l310
	line	920
	
l2908:
	movlw	low(055h)
	movwf	((c:4007)),c	;volatile
	line	921
	movlw	low(0AAh)
	movwf	((c:4007)),c	;volatile
	line	922
	
l2910:
	bsf	((c:4006)),c,1	;volatile
	line	934
	
l313:
	btfsc	((c:4006)),c,1	;volatile
	goto	u1711
	goto	u1710
u1711:
	goto	l313
u1710:
	
l315:
	line	935
	bcf	((c:4006)),c,2	;volatile
	line	936
	
l316:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_UnlockAndActivate
	__end_of_UnlockAndActivate:
	signat	_UnlockAndActivate,4216
	global	_LowVoltageCheck

;; *************** function _LowVoltageCheck *****************
;; Defined at:
;;		line 637 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_BootMain
;;		_UnlockAndActivate
;; This function uses a non-reentrant model
;;
psect	text26,class=CODE,space=0,reloc=2
	file	"main.c"
	line	637
global __ptext26
__ptext26:
psect	text26
	file	"main.c"
	line	637
	global	__size_of_LowVoltageCheck
	__size_of_LowVoltageCheck	equ	__end_of_LowVoltageCheck-_LowVoltageCheck
	
_LowVoltageCheck:
;incstack = 0
	opt	stack 26
	line	640
	
l111:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_LowVoltageCheck
	__end_of_LowVoltageCheck:
	signat	_LowVoltageCheck,88
	global	_ResetDeviceCleanly

;; *************** function _ResetDeviceCleanly *****************
;; Defined at:
;;		line 709 in file "BootPIC18NonJ.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_USBDisableWithLongDelay
;; This function is called by:
;;		_ProcessIO
;; This function uses a non-reentrant model
;;
psect	text27,class=CODE,space=0,reloc=2
	file	"BootPIC18NonJ.c"
	line	709
global __ptext27
__ptext27:
psect	text27
	file	"BootPIC18NonJ.c"
	line	709
	global	__size_of_ResetDeviceCleanly
	__size_of_ResetDeviceCleanly	equ	__end_of_ResetDeviceCleanly-_ResetDeviceCleanly
	
_ResetDeviceCleanly:
;incstack = 0
	opt	stack 25
	line	711
	
l3224:
	call	_USBDisableWithLongDelay	;wreg free
	line	712
# 712 "BootPIC18NonJ.c"
reset ;# 
psect	text27
	line	713
	
l3226:
	opt	asmopt_off
	nop
	opt	asmopt_on
	line	714
	
l3228:
	opt	asmopt_off
	nop
	opt	asmopt_on
	line	715
	
l270:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_ResetDeviceCleanly
	__end_of_ResetDeviceCleanly:
	signat	_ResetDeviceCleanly,88
	global	_HIDTxReport

;; *************** function _HIDTxReport *****************
;; Defined at:
;;		line 229 in file "usb_device_hid.c"
;; Parameters:    Size  Location     Type
;;  buffer          1    wreg     PTR unsigned char 
;;		 -> PacketToPC(65), 
;;  len             1    0[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  buffer          1    2[COMRAM] PTR unsigned char 
;;		 -> PacketToPC(65), 
;;  i               1    3[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0
;; Tracked objects:
;;		On entry : D/0
;;		On exit  : F/2
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         1       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ProcessIO
;; This function uses a non-reentrant model
;;
psect	text28,class=CODE,space=0,reloc=2
	file	"usb_device_hid.c"
	line	229
global __ptext28
__ptext28:
psect	text28
	file	"usb_device_hid.c"
	line	229
	global	__size_of_HIDTxReport
	__size_of_HIDTxReport	equ	__end_of_HIDTxReport-_HIDTxReport
	
_HIDTxReport:
;incstack = 0
	opt	stack 28
	movwf	((c:HIDTxReport@buffer)),c
	line	237
	
l3088:
		movlw	041h-1
	cpfsgt	((c:HIDTxReport@len)),c
	goto	u2011
	goto	u2010

u2011:
	goto	l3092
u2010:
	line	238
	
l3090:
	movlw	low(040h)
	movwf	((c:HIDTxReport@len)),c
	line	243
	
l3092:
	clrf	((c:HIDTxReport@i)),c
	goto	l3098
	line	244
	
l3094:
	movf	((c:HIDTxReport@buffer)),c,w
	addwf	((c:HIDTxReport@i)),c,w
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(620)
	addwf	((c:HIDTxReport@i)),c,w
	movwf	c:fsr1l
	clrf	1+c:fsr1l
	movlw	high(620)
	addwfc	1+c:fsr1l
	movff	indf2,indf1
	line	243
	
l3096:
	incf	((c:HIDTxReport@i)),c
	
l3098:
		movf	((c:HIDTxReport@len)),c,w
	subwf	((c:HIDTxReport@i)),c,w
	btfss	status,0
	goto	u2021
	goto	u2020

u2021:
	goto	l3094
u2020:
	
l737:
	line	246
	movff	(c:HIDTxReport@len),0+(528+01h)	;volatile
	line	247
	
l3100:
	movlw	(040h)&0ffh
	movlb	2	; () banked
	andwf	((528))&0ffh	;volatile
	btfss	((528))&0ffh,6	;volatile
	goto	u2031
	goto	u2030
u2031:
	clrf	(??_HIDTxReport+0+0)&0ffh,c
	incf	(??_HIDTxReport+0+0)&0ffh,c
	goto	u2048
u2030:
	clrf	(??_HIDTxReport+0+0)&0ffh,c
u2048:
	swapf	(??_HIDTxReport+0+0),c
	rlncf	(??_HIDTxReport+0+0),c
	rlncf	(??_HIDTxReport+0+0),c
	movlb	2	; () banked
	movf	((528))&0ffh,w	;volatile
	xorwf	(??_HIDTxReport+0+0),c,w
	andlw	not (((1<<1)-1)<<6)
	xorwf	(??_HIDTxReport+0+0),c,w
	movwf	((528))&0ffh	;volatile
	
l3102:; BSR set to: 2

	bsf	(0+(3/8)+(528))&0ffh,(3)&7	;volatile
	
l3104:; BSR set to: 2

	bsf	(0+(7/8)+(528))&0ffh,(7)&7	;volatile
	line	249
	
l738:; BSR set to: 2

	return	;funcret
	opt stack 0
GLOBAL	__end_of_HIDTxReport
	__end_of_HIDTxReport:
	signat	_HIDTxReport,8312
	global	_HIDRxReport

;; *************** function _HIDRxReport *****************
;; Defined at:
;;		line 284 in file "usb_device_hid.c"
;; Parameters:    Size  Location     Type
;;  buffer          1    wreg     PTR unsigned char 
;;		 -> PacketFromPC(65), 
;;  len             1    0[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  buffer          1    2[COMRAM] PTR unsigned char 
;;		 -> PacketFromPC(65), 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0
;; Tracked objects:
;;		On entry : F/2
;;		On exit  : F/2
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         1       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ProcessIO
;; This function uses a non-reentrant model
;;
psect	text29,class=CODE,space=0,reloc=2
	line	284
global __ptext29
__ptext29:
psect	text29
	file	"usb_device_hid.c"
	line	284
	global	__size_of_HIDRxReport
	__size_of_HIDRxReport	equ	__end_of_HIDRxReport-_HIDRxReport
	
_HIDRxReport:; BSR set to: 2

;incstack = 0
	opt	stack 28
	movwf	((c:HIDRxReport@buffer)),c
	line	286
	
l3064:
	clrf	((c:_hid_rpt_rx_len)),c
	line	288
	movlb	2	; () banked
	btfsc	((524))&0ffh,7	;volatile
	goto	u1961
	goto	u1960
u1961:
	goto	l746
u1960:
	line	294
	
l3066:; BSR set to: 2

		movf	((c:HIDRxReport@len)),c,w
	subwf	(0+(524+01h))&0ffh,w	;volatile
	btfsc	status,0
	goto	u1971
	goto	u1970

u1971:
	goto	l742
u1970:
	line	295
	
l3068:; BSR set to: 2

	movff	0+(524+01h),(c:HIDRxReport@len)	;volatile
	
l742:; BSR set to: 2

	line	300
	clrf	((c:_hid_rpt_rx_len)),c
	goto	l3074
	line	301
	
l3070:
	movlw	low(556)
	addwf	((c:_hid_rpt_rx_len)),c,w
	movwf	c:fsr2l
	clrf	1+c:fsr2l
	movlw	high(556)
	addwfc	1+c:fsr2l
	movf	((c:HIDRxReport@buffer)),c,w
	addwf	((c:_hid_rpt_rx_len)),c,w
	movwf	fsr1l
	clrf	fsr1h
	movff	indf2,indf1
	line	300
	
l3072:
	incf	((c:_hid_rpt_rx_len)),c
	
l3074:
		movf	((c:HIDRxReport@len)),c,w
	subwf	((c:_hid_rpt_rx_len)),c,w
	btfss	status,0
	goto	u1981
	goto	u1980

u1981:
	goto	l3070
u1980:
	line	306
	
l3076:
	movlw	low(040h)
	movlb	2	; () banked
	movwf	(0+(524+01h))&0ffh	;volatile
	line	307
	
l3078:; BSR set to: 2

	movlw	(040h)&0ffh
	andwf	((524))&0ffh	;volatile
	
l3080:; BSR set to: 2

	btfss	((524))&0ffh,6	;volatile
	goto	u1991
	goto	u1990
u1991:
	clrf	(??_HIDRxReport+0+0)&0ffh,c
	incf	(??_HIDRxReport+0+0)&0ffh,c
	goto	u2008
u1990:
	clrf	(??_HIDRxReport+0+0)&0ffh,c
u2008:
	swapf	(??_HIDRxReport+0+0),c
	rlncf	(??_HIDRxReport+0+0),c
	rlncf	(??_HIDRxReport+0+0),c
	movlb	2	; () banked
	movf	((524))&0ffh,w	;volatile
	xorwf	(??_HIDRxReport+0+0),c,w
	andlw	not (((1<<1)-1)<<6)
	xorwf	(??_HIDRxReport+0+0),c,w
	movwf	((524))&0ffh	;volatile
	
l3082:; BSR set to: 2

	bsf	(0+(3/8)+(524))&0ffh,(3)&7	;volatile
	
l3084:; BSR set to: 2

	bsf	(0+(7/8)+(524))&0ffh,(7)&7	;volatile
	line	312
	
l746:; BSR set to: 2

	return	;funcret
	opt stack 0
GLOBAL	__end_of_HIDRxReport
	__end_of_HIDRxReport:
	signat	_HIDRxReport,8313
	global	_InitializeSystem

;; *************** function _InitializeSystem *****************
;; Defined at:
;;		line 520 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_USBDeviceInit
;;		_UserInit
;; This function is called by:
;;		_BootMain
;; This function uses a non-reentrant model
;;
psect	text30,class=CODE,space=0,reloc=2
	file	"main.c"
	line	520
global __ptext30
__ptext30:
psect	text30
	file	"main.c"
	line	520
	global	__size_of_InitializeSystem
	__size_of_InitializeSystem	equ	__end_of_InitializeSystem-_InitializeSystem
	
_InitializeSystem:; BSR set to: 2

;incstack = 0
	opt	stack 23
	line	573
	
l3230:
	call	_UserInit	;wreg free
	line	575
	
l3232:
	bcf	((c:3979)),c,3	;volatile
	line	576
	
l3234:
	bcf	((c:3988)),c,3	;volatile
	line	580
	
l3236:
	call	_USBDeviceInit	;wreg free
	line	582
	
l100:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_InitializeSystem
	__end_of_InitializeSystem:
	signat	_InitializeSystem,88
	global	_USBDeviceInit

;; *************** function _USBDeviceInit *****************
;; Defined at:
;;		line 326 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_USBCheckBusStatus
;;		_USBDisableWithLongDelay
;; This function is called by:
;;		_InitializeSystem
;; This function uses a non-reentrant model
;;
psect	text31,class=CODE,space=0,reloc=2
	file	"usb_device.c"
	line	326
global __ptext31
__ptext31:
psect	text31
	file	"usb_device.c"
	line	326
	global	__size_of_USBDeviceInit
	__size_of_USBDeviceInit	equ	__end_of_USBDeviceInit-_USBDeviceInit
	
_USBDeviceInit:
;incstack = 0
	opt	stack 23
	line	332
	
l3056:
	btfss	((c:3940)),c,3	;volatile
	goto	u1951
	goto	u1950
u1951:
	goto	l3060
u1950:
	line	337
	
l3058:
	call	_USBDisableWithLongDelay	;wreg free
	line	339
	
l3060:
	clrf	((c:_DeviceIsSoftDetached)),c
	line	347
	
l3062:
	call	_USBCheckBusStatus	;wreg free
	line	348
	
l481:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBDeviceInit
	__end_of_USBDeviceInit:
	signat	_USBDeviceInit,88
	global	_USBCheckBusStatus

;; *************** function _USBCheckBusStatus *****************
;; Defined at:
;;		line 406 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_USBSoftAttach
;; This function is called by:
;;		_USBDeviceInit
;;		_USBDeviceTasks
;; This function uses a non-reentrant model
;;
psect	text32,class=CODE,space=0,reloc=2
	line	406
global __ptext32
__ptext32:
psect	text32
	file	"usb_device.c"
	line	406
	global	__size_of_USBCheckBusStatus
	__size_of_USBCheckBusStatus	equ	__end_of_USBCheckBusStatus-_USBCheckBusStatus
	
_USBCheckBusStatus:
;incstack = 0
	opt	stack 24
	line	411
	
l2912:
		decf	((c:_DeviceIsSoftDetached)),c,w
	btfss	status,2
	goto	u1721
	goto	u1720

u1721:
	goto	l491
u1720:
	goto	l492
	line	414
	
l491:
	line	440
	btfsc	((c:3940)),c,3	;volatile
	goto	u1731
	goto	u1730
u1731:
	goto	l492
u1730:
	line	441
	
l2916:
	call	_USBSoftAttach	;wreg free
	line	443
	
l492:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCheckBusStatus
	__end_of_USBCheckBusStatus:
	signat	_USBCheckBusStatus,88
	global	_USBSoftAttach

;; *************** function _USBSoftAttach *****************
;; Defined at:
;;		line 354 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_USBDisableWithLongDelay
;;		_USBProtocolResetHandler
;; This function is called by:
;;		_USBCheckBusStatus
;; This function uses a non-reentrant model
;;
psect	text33,class=CODE,space=0,reloc=2
	line	354
global __ptext33
__ptext33:
psect	text33
	file	"usb_device.c"
	line	354
	global	__size_of_USBSoftAttach
	__size_of_USBSoftAttach	equ	__end_of_USBSoftAttach-_USBSoftAttach
	
_USBSoftAttach:
;incstack = 0
	opt	stack 24
	line	361
	
l2782:
		decf	((c:_DeviceIsSoftDetached)),c,w
	btfss	status,2
	goto	u1611
	goto	u1610

u1611:
	goto	l2786
u1610:
	line	363
	
l2784:
	call	_USBDisableWithLongDelay	;wreg free
	line	366
	
l2786:
	clrf	((c:3940)),c	;volatile
	line	367
	
l2788:
	movlw	low(015h)
	movwf	((c:3937)),c	;volatile
	line	368
	
l2790:
	clrf	((c:3936)),c	;volatile
	line	369
	
l2792:
	bsf	((c:3940)),c,3	;volatile
	line	371
	
l2794:
	call	_USBProtocolResetHandler	;wreg free
	line	372
	
l2796:
	movlw	low(01h)
	movwf	((c:_usb_device_state)),c
	line	373
	
l2798:
	clrf	((c:_DeviceIsSoftDetached)),c
	line	374
	
l485:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBSoftAttach
	__end_of_USBSoftAttach:
	signat	_USBSoftAttach,88
	global	_USBProtocolResetHandler

;; *************** function _USBProtocolResetHandler *****************
;; Defined at:
;;		line 753 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_ClearWatchdog
;;		_LoadBDTandSetUOWN
;;		_USBCBInitEP
;; This function is called by:
;;		_USBSoftAttach
;;		_USBDeviceTasks
;; This function uses a non-reentrant model
;;
psect	text34,class=CODE,space=0,reloc=2
	line	753
global __ptext34
__ptext34:
psect	text34
	file	"usb_device.c"
	line	753
	global	__size_of_USBProtocolResetHandler
	__size_of_USBProtocolResetHandler	equ	__end_of_USBProtocolResetHandler-_USBProtocolResetHandler
	
_USBProtocolResetHandler:
;incstack = 0
	opt	stack 26
	line	755
	
l2564:
	movlw	low(03h)
	movwf	((c:_usb_device_state)),c
	line	756
	
l2566:
	movlb	15	; () banked
	clrf	((3931))&0ffh	;volatile
	line	757
	
l2568:; BSR set to: 15

	clrf	((c:3938)),c	;volatile
	line	758
	movlw	low(07Bh)
	movwf	((c:3936)),c	;volatile
	line	759
	
l2570:; BSR set to: 15

	clrf	((3932))&0ffh	;volatile
	line	760
	
l2572:; BSR set to: 15

	clrf	((3924))&0ffh	;volatile
	
l2574:; BSR set to: 15

	clrf	((3925))&0ffh	;volatile
	
l2576:; BSR set to: 15

	clrf	((3926))&0ffh	;volatile
	
l2578:; BSR set to: 15

	clrf	((3927))&0ffh	;volatile
	
l2580:; BSR set to: 15

	clrf	((3928))&0ffh	;volatile
	
l2582:; BSR set to: 15

	clrf	((3929))&0ffh	;volatile
	
l2584:; BSR set to: 15

	clrf	((3930))&0ffh	;volatile
	line	761
	movlw	low(016h)
	movwf	((3923))&0ffh	;volatile
	line	762
	
l2586:; BSR set to: 15

	bsf	((c:3940)),c,6	;volatile
	line	763
	goto	l2590
	
l535:
	line	765
	bcf	((c:3938)),c,3	;volatile
	line	766
	
l2588:
	call	_ClearWatchdog	;wreg free
	line	763
	
l2590:
	btfsc	((c:3938)),c,3	;volatile
	goto	u1321
	goto	u1320
u1321:
	goto	l535
u1320:
	
l536:
	line	768
	bcf	((c:3940)),c,6	;volatile
	line	769
	bcf	((c:3940)),c,4	;volatile
	line	772
	
l2592:
	movlw	low(04h)
	movwf	((c:_TempBDT)),c
	line	773
	
l2594:
	movlw	(0)&0ffh
	
	call	_LoadBDTandSetUOWN
	line	774
	
l2596:
	movlw	low(01h)
	movwf	((c:_EP0OutOddNeedsArmingNext)),c
	line	775
	
l2598:
	clrf	((c:_usb_stat)),c
	line	776
	
l2600:
	clrf	((c:_usb_active_cfg)),c
	line	777
	
l2602:
	movlw	(0)&0ffh
	
	call	_USBCBInitEP
	line	779
	
l537:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBProtocolResetHandler
	__end_of_USBProtocolResetHandler:
	signat	_USBProtocolResetHandler,88
	global	_USBCBInitEP

;; *************** function _USBCBInitEP *****************
;; Defined at:
;;		line 778 in file "main.c"
;; Parameters:    Size  Location     Type
;;  Configuratio    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Configuratio    1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/F
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_HIDInitEP
;;		_UserInit
;; This function is called by:
;;		_USBProtocolResetHandler
;;		_USBStdSetCfgHandler
;; This function uses a non-reentrant model
;;
psect	text35,class=CODE,space=0,reloc=2
	file	"main.c"
	line	778
global __ptext35
__ptext35:
psect	text35
	file	"main.c"
	line	778
	global	__size_of_USBCBInitEP
	__size_of_USBCBInitEP	equ	__end_of_USBCBInitEP-_USBCBInitEP
	
_USBCBInitEP:
;incstack = 0
	opt	stack 26
	movwf	((c:USBCBInitEP@ConfigurationIndex)),c
	line	787
	
l2474:
		decf	((c:USBCBInitEP@ConfigurationIndex)),c,w
	btfss	status,2
	goto	u1241
	goto	u1240

u1241:
	goto	l126
u1240:
	line	793
	
l2476:
	call	_HIDInitEP	;wreg free
	line	796
	
l2478:; BSR set to: 2

	call	_UserInit	;wreg free
	line	803
	
l126:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCBInitEP
	__end_of_USBCBInitEP:
	signat	_USBCBInitEP,4216
	global	_UserInit

;; *************** function _UserInit *****************
;; Defined at:
;;		line 333 in file "BootPIC18NonJ.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_InitializeSystem
;;		_USBCBInitEP
;; This function uses a non-reentrant model
;;
psect	text36,class=CODE,space=0,reloc=2
	file	"BootPIC18NonJ.c"
	line	333
global __ptext36
__ptext36:
psect	text36
	file	"BootPIC18NonJ.c"
	line	333
	global	__size_of_UserInit
	__size_of_UserInit	equ	__end_of_UserInit-_UserInit
	
_UserInit:
;incstack = 0
	opt	stack 26
	line	336
	
l2446:
	clrf	((c:_BootState)),c
	line	337
	setf	((c:_ProgrammedPointer)),c
	setf	((c:_ProgrammedPointer+1)),c
	setf	((c:_ProgrammedPointer+2)),c
	setf	((c:_ProgrammedPointer+3)),c
	line	338
	clrf	((c:_BufferedDataIndex)),c
	line	339
	
l2448:
	movlw	low(01h)
	movwf	((c:_ConfigsLockValue)),c
	line	340
	
l204:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_UserInit
	__end_of_UserInit:
	signat	_UserInit,88
	global	_HIDInitEP

;; *************** function _HIDInitEP *****************
;; Defined at:
;;		line 171 in file "usb_device_hid.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/F
;;		On exit  : F/2
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBCBInitEP
;; This function uses a non-reentrant model
;;
psect	text37,class=CODE,space=0,reloc=2
	file	"usb_device_hid.c"
	line	171
global __ptext37
__ptext37:
psect	text37
	file	"usb_device_hid.c"
	line	171
	global	__size_of_HIDInitEP
	__size_of_HIDInitEP	equ	__end_of_HIDInitEP-_HIDInitEP
	
_HIDInitEP:
;incstack = 0
	opt	stack 26
	line	173
	
l2450:
	clrf	((c:_hid_rpt_rx_len)),c
	line	175
	
l2452:
	movlw	low(01Eh)
	movlb	15	; () banked
	movwf	((3924))&0ffh	;volatile
	line	178
	movlw	low(040h)
	movlb	2	; () banked
	movwf	(0+(524+01h))&0ffh	;volatile
	line	179
	
l2454:; BSR set to: 2

		movlw	low(556)
	movwf	(0+(524+02h))&0ffh	;volatile
	movlw	high(556)
	movwf	(1+(524+02h))&0ffh	;volatile

	line	180
	
l2456:; BSR set to: 2

	movlw	low(08h)
	movwf	((524))&0ffh	;volatile
	line	181
	
l2458:; BSR set to: 2

	bsf	(0+(7/8)+(524))&0ffh,(7)&7	;volatile
	line	194
	
l2460:; BSR set to: 2

		movlw	low(620)
	movwf	(0+(528+02h))&0ffh	;volatile
	movlw	high(620)
	movwf	(1+(528+02h))&0ffh	;volatile

	line	195
	
l2462:; BSR set to: 2

	movlw	low(040h)
	movwf	((528))&0ffh	;volatile
	line	197
	
l731:; BSR set to: 2

	return	;funcret
	opt stack 0
GLOBAL	__end_of_HIDInitEP
	__end_of_HIDInitEP:
	signat	_HIDInitEP,88
	global	_LoadBDTandSetUOWN

;; *************** function _LoadBDTandSetUOWN *****************
;; Defined at:
;;		line 1592 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;  BDTIndexToLo    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  BDTIndexToLo    1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBProtocolResetHandler
;;		_USBCtrlEPServiceComplete
;; This function uses a non-reentrant model
;;
psect	text38,class=CODE,space=0,reloc=2
	file	"usb_device.c"
	line	1592
global __ptext38
__ptext38:
psect	text38
	file	"usb_device.c"
	line	1592
	global	__size_of_LoadBDTandSetUOWN
	__size_of_LoadBDTandSetUOWN	equ	__end_of_LoadBDTandSetUOWN-_LoadBDTandSetUOWN
	
_LoadBDTandSetUOWN:; BSR set to: 2

;incstack = 0
	opt	stack 27
	movwf	((c:LoadBDTandSetUOWN@BDTIndexToLoad)),c
	line	1600
	
l2480:
	movlw	low(08h)
	movwf	(0+((c:_TempBDT)+01h)),c
	line	1601
		movlw	low(540)
	movwf	(0+((c:_TempBDT)+02h)),c
	movlw	high(540)
	movwf	(1+((c:_TempBDT)+02h)),c

	line	1602
	
l2482:
	movf	((c:LoadBDTandSetUOWN@BDTIndexToLoad)),c,w
	btfss	status,2
	goto	u1251
	goto	u1250
u1251:
	goto	l2486
u1250:
	line	1604
	
l2484:
		movlw	low(532)
	movwf	(0+((c:_TempBDT)+02h)),c
	movlw	high(532)
	movwf	(1+((c:_TempBDT)+02h)),c

	line	1605
		movlw	low(0200h)
	movwf	((c:LoadBDTandSetUOWN@pBDTEntry)),c
	movlw	high(0200h)
	movwf	((c:LoadBDTandSetUOWN@pBDTEntry+1)),c

	line	1606
	goto	l2488
	line	1609
	
l2486:
		movlw	low(0204h)
	movwf	((c:LoadBDTandSetUOWN@pBDTEntry)),c
	movlw	high(0204h)
	movwf	((c:LoadBDTandSetUOWN@pBDTEntry+1)),c

	line	1613
	
l2488:
	movff	(c:LoadBDTandSetUOWN@pBDTEntry),fsr2l
	movff	(c:LoadBDTandSetUOWN@pBDTEntry+1),fsr2h
	movff	(c:_TempBDT),postinc2
	movff	(c:_TempBDT+1),postinc2
	movff	(c:_TempBDT+2),postinc2
	movff	(c:_TempBDT+3),postinc2

	line	1616
	
l2490:
	movff	(c:LoadBDTandSetUOWN@pBDTEntry),fsr2l
	movff	(c:LoadBDTandSetUOWN@pBDTEntry+1),fsr2h
	bsf	c:indf2,7
	line	1617
	
l652:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_LoadBDTandSetUOWN
	__end_of_LoadBDTandSetUOWN:
	signat	_LoadBDTandSetUOWN,4216
	global	_USBDisableWithLongDelay

;; *************** function _USBDisableWithLongDelay *****************
;; Defined at:
;;		line 1624 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DelayRoutine
;; This function is called by:
;;		_ResetDeviceCleanly
;;		_USBDeviceInit
;;		_USBSoftAttach
;; This function uses a non-reentrant model
;;
psect	text39,class=CODE,space=0,reloc=2
	line	1624
global __ptext39
__ptext39:
psect	text39
	file	"usb_device.c"
	line	1624
	global	__size_of_USBDisableWithLongDelay
	__size_of_USBDisableWithLongDelay	equ	__end_of_USBDisableWithLongDelay-_USBDisableWithLongDelay
	
_USBDisableWithLongDelay:
;incstack = 0
	opt	stack 24
	line	1626
	
l2558:
	bcf	((c:3940)),c,1	;volatile
	line	1627
	clrf	((c:3940)),c	;volatile
	line	1628
	
l2560:
	movlw	high(0FFFFh)
	movwf	((c:DelayRoutine@DelayAmount+1)),c
	setf	((c:DelayRoutine@DelayAmount)),c
	call	_DelayRoutine	;wreg free
	line	1629
	
l2562:
	clrf	((c:_usb_device_state)),c
	line	1630
	
l655:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBDisableWithLongDelay
	__end_of_USBDisableWithLongDelay:
	signat	_USBDisableWithLongDelay,88
	global	_DelayRoutine

;; *************** function _DelayRoutine *****************
;; Defined at:
;;		line 1634 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;  DelayAmount     2    0[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         2       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_ClearWatchdog
;; This function is called by:
;;		_USBCBWakeFromSuspend
;;		_USBDisableWithLongDelay
;; This function uses a non-reentrant model
;;
psect	text40,class=CODE,space=0,reloc=2
	line	1634
global __ptext40
__ptext40:
psect	text40
	file	"usb_device.c"
	line	1634
	global	__size_of_DelayRoutine
	__size_of_DelayRoutine	equ	__end_of_DelayRoutine-_DelayRoutine
	
_DelayRoutine:
;incstack = 0
	opt	stack 25
	line	1636
	
l2466:
	goto	l2472
	line	1638
	
l2468:
	call	_ClearWatchdog	;wreg free
	line	1639
	
l2470:
	decf	((c:DelayRoutine@DelayAmount)),c
	btfss	status,0
	decf	((c:DelayRoutine@DelayAmount+1)),c
	line	1636
	
l2472:
	movf	((c:DelayRoutine@DelayAmount)),c,w
iorwf	((c:DelayRoutine@DelayAmount+1)),c,w
	btfss	status,2
	goto	u1231
	goto	u1230

u1231:
	goto	l2468
u1230:
	line	1641
	
l661:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_DelayRoutine
	__end_of_DelayRoutine:
	signat	_DelayRoutine,4216
	global	_ClearWatchdog

;; *************** function _ClearWatchdog *****************
;; Defined at:
;;		line 1651 in file "usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ProcessIO
;;		_SignFlash
;;		_USBProtocolResetHandler
;;		_DelayRoutine
;; This function uses a non-reentrant model
;;
psect	text41,class=CODE,space=0,reloc=2
	line	1651
global __ptext41
__ptext41:
psect	text41
	file	"usb_device.c"
	line	1651
	global	__size_of_ClearWatchdog
	__size_of_ClearWatchdog	equ	__end_of_ClearWatchdog-_ClearWatchdog
	
_ClearWatchdog:
;incstack = 0
	opt	stack 25
	line	1653
	
l2464:
# 1653 "usb_device.c"
clrwdt ;# 
psect	text41
	line	1654
	
l664:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_ClearWatchdog
	__end_of_ClearWatchdog:
	signat	_ClearWatchdog,88
	global	_BlinkUSBStatus

;; *************** function _BlinkUSBStatus *****************
;; Defined at:
;;		line 606 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1  BANK2h
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_BootMain
;; This function uses a non-reentrant model
;;
psect	text42,class=CODE,space=0,reloc=2
	file	"main.c"
	line	606
global __ptext42
__ptext42:
psect	text42
	file	"main.c"
	line	606
	global	__size_of_BlinkUSBStatus
	__size_of_BlinkUSBStatus	equ	__end_of_BlinkUSBStatus-_BlinkUSBStatus
	
_BlinkUSBStatus:
;incstack = 0
	opt	stack 29
	line	611
	
l2168:
	decf	((c:BlinkUSBStatus@led_count)),c
	btfss	status,0
	decf	((c:BlinkUSBStatus@led_count+1)),c
	line	612
	
l2170:
	movf	((c:BlinkUSBStatus@led_count)),c,w
iorwf	((c:BlinkUSBStatus@led_count+1)),c,w
	btfss	status,2
	goto	u921
	goto	u920

u921:
	goto	l108
u920:
	line	614
	
l2172:
	movlw	high(04E00h)
	movwf	((c:BlinkUSBStatus@led_count+1)),c
	movlw	low(04E00h)
	movwf	((c:BlinkUSBStatus@led_count)),c
	line	615
	
l2174:
		movlw	06h-0
	cpfslt	((c:_usb_device_state)),c
	goto	u931
	goto	u930

u931:
	goto	l2178
u930:
	line	617
	
l2176:
	bsf	((c:3979)),c,3	;volatile
	line	618
	goto	l108
	line	621
	
l2178:
	btfss	((c:3979)),c,3	;volatile
	goto	u941
	goto	u940
u941:
	clrf	(??_BlinkUSBStatus+0+0)&0ffh,c
	incf	(??_BlinkUSBStatus+0+0)&0ffh,c
	goto	u958
u940:
	clrf	(??_BlinkUSBStatus+0+0)&0ffh,c
u958:
	rlncf	(??_BlinkUSBStatus+0+0),c
	rlncf	(??_BlinkUSBStatus+0+0),c
	rlncf	(??_BlinkUSBStatus+0+0),c
	movf	((c:3979)),c,w	;volatile
	xorwf	(??_BlinkUSBStatus+0+0),c,w
	andlw	not (((1<<1)-1)<<3)
	xorwf	(??_BlinkUSBStatus+0+0),c,w
	movwf	((c:3979)),c	;volatile
	line	625
	
l108:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_BlinkUSBStatus
	__end_of_BlinkUSBStatus:
	signat	_BlinkUSBStatus,88
psect	smallconst
	db 0	; dummy byte at the end
	global	__smallconst
	global	__mediumconst
	GLOBAL	__activetblptr
__activetblptr	EQU	2
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
	GLOBAL	___rparam_used
	___rparam_used EQU 1
	GLOBAL	___param_bank
	___param_bank EQU 16
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
	end
