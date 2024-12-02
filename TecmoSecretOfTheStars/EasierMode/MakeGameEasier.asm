;slash encounter rate by half and increase money/EXP gain by 2 times
;apply using Asar

;encounter rate
org $019FB6
LDA $0541                                       ;slightly rearranged the code
CLC
autoclean JSL LessEncounters

;sloppy hijacks, I would've included a large table for each enemy, but:
;1) I don't know the game well enough to determine how many enemies there are and therefore entries to edit, and
;2) I think it would be more suitable for a different patch to allow anyone to customize drop tables.

org $00BA5F
autoclean JSL DoubleEXP
NOP

org $00BA71
autoclean JSL DoubleMoney
NOP

;this may break something I don't know what
;if there's an issue, I'll have to find a fixed location to put custom code in instead of relying on asar's freespace finding capabilities.
freespacebyte $FF
freecode
 
;note: A is 16-bit (this goes for money too)
DoubleEXP:
LDA [$13]                            ;pointer to monster's exp reward
ASL                                  ;this doubles the value (EXP)
CLC                                  ;
ADC $21                              ;currently accumulated EXP (from all defeated monsters)
RTL                                  ;

DoubleMoney:
LDA [$13],y                          ;pointer to monster's money reward (Y = 2)
ASL                                  ;this doubles the value (MONEY IN ME MONEY BIN)
CLC                                  ;
ADC $1F                              ;currently accumulated money (from all defeated mons)
RTL

;to be honest, I would've straight up recoded the way encounter rate works, because how it works... it's not amazing.
;But that's a topic for another day.
;A is 8-bit here
LessEncounters:
ADC $01A086,x                       ;idk what this table is, encounter modifier or something
LSR                                 ;2 times less chance
BNE .YesEncounters                  ;if it's not zero, continue as normal

LDA #$01                            ;leave a miniscule chance of encounters (this is probably not necessary tbh)

.YesEncounters
RTL