;gives player the ability to float like Princess Peach, like in SMB2.

arch nes.cpu
header
banksize $2000

;this freeram is for peach float. 0 - can float, $FF - already floated, need to be grounded to reset, other values - timer for the float
define FREERAM $0104				;part of the stack, hopefully the game's stack doesnt get this high
define FloatTimer $40

bank 57
org $AF47
JSR Floating					;normal jumping

org $AF7B					;spinjumping
JSR Floating

org $B426
JSR ResetFloat

org $BF35					;hopefully unimportant (i haven't found a way to trigger the code, i don't even know what it is)
Floating:
LDA {FREERAM}
BEQ .CheckStuff
BMI .Re

;check if still holding the A/B buttons
LDA $030A
AND #$80
BEQ .NoFloat

LDA #$00
STA $15

LDA $19
ORA #$04
STA $19

;LDA $0B

LDA {FREERAM}
LSR
LSR
LSR
AND #$03
TAY
;LDY #$01
;BCS .MoveUp

;DEY

.MoveUp:
;STA $0F

;LDA $19
;AND #$FB
;ORA $0F
;STA $19

LDA $0D
CLC
ADC YDisp,y
STA $0D

LDA $0C
ADC YDispHi,y
STA $0C

DEC {FREERAM}
BNE .Re

.NoFloat:
LDA #$FF
STA {FREERAM}

.Re:
JMP $B3A5					;restore

.CheckStuff:
LDA $19					;check if started falling
AND #$04
BNE .Re

LDA $030A
AND #$80
BEQ .Re

LDA #{FloatTimer}
STA {FREERAM}
JMP $B3A5					;restore

YDisp:
db $01,$00,$FF,$00

YDispHi:
db $00,$00,$FF,$00

ResetFloat:
LDA #$00
STA {FREERAM}

LDA $030C				;RESTORE
RTS