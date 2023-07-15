;code for a completely unique (albeit basic) options screen
;moved to a separate file cuz I'm too lazy to scroll all the way to edit the options code

OptionsTilemap:
db $20,$4A
db $06
;OPTIONS
db $18,$19,$1D,$12,$18,$17,$1C

db $20,$84
db $0B

;SWORD COUNT 
db $1C,$20,$18,$1B,$0D,$24,$0C,$18,$1E,$17,$1D

db $20,$A4
db $13

;REFRESH AFTER STAGE
db $1B,$0E,$0F,$1B,$0E,$1C,$11,$24,$0A,$0F,$1D,$0E,$1B,$24,$1C,$1D,$0A,$10,$0E

YESSlashNoText:
db $20,$BC
;YES
db $22,$0E,$1C
db $00


db $20,$BC
;NO 
db $17,$18,$24
db $00

;code here:
OPTIONS_CODE:
LDA OptionsScreenState
BEQ @Draw

;actual option code (up/down to change option values, select to change the option