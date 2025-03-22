;Changes the way shot counter works to use a numerical value instead of the visual amount of bullets.
;Allows for more than 3 shots, up to 9.

arch nes.cpu
header
banksize $4000

define ShotAmount 3     ;how many shots does the player have. 3 is the default.

define ShotCounter $BA  ;RAM address

;alter bullet counter update to be numeric
org $C6FD
LDA #$11
STA $0500               ;prepare buffer. uploading just 1 tile on 1 row.

LDA {ShotCounter}
STA $0501               ;will draw this tile, which is the amount of bullets

LDX #$45                ;
LDY #$23                ;PPU location ($2345)
BNE $C71D               ;update shot counter

;16 bytes of unused space go here

;hex edit
org $CCDF
db {ShotAmount}

;hex edit 2
org $CDA3
db {ShotAmount}

;hex edit 3 (Clay Shooting)
org $D581
db {ShotAmount}

;slightly alter the tilemap. add equals sign and empty space which will be filled with the shot amount 
;Duck Hunt tilemap
org $E1EF
db $27,$B7

;Clay Shooting tilemap
org $E3A2
db $27,$B7