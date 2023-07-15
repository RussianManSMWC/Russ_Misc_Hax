;allows to change the jump type in air (press A to change from normal jump to spinjump and vice versa)

arch nes.cpu
header
banksize $2000

bank 57
org $AF47
JSR JumpChange					;normal jumping

org $AF7B					;spinjumping
JSR JumpChange

org $BFE3					;a seemingly freespace (all zeroes)
JumpChange:
JSR $B3A5					;restore

LDA $030C					;check for A press
BPL .Re

;probably wouldve added up check for spinjump but idk

LDA $1D						;jumping or spinjumping state?
CMP #$05
BEQ .ChangeJmp

;LDA #$05
;STA $1D

INC $1D

;sound
LDY #$01					;spinjump SFX (by default)

.Sound:
STY $8F

.Re:
RTS

.ChangeJmp:
;LDA #$04					;normal jump state
;STA $1D
DEC $1D

LDY #$03					;normal jump SFX
BNE .Sound