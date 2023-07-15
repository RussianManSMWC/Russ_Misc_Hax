;defines specific to this hack
Player_ButtonPress = $0D		;holds a button press without the need for to load which player presesd the button
Timer_Sword = Timer_Hammer
Sword_Position = $D1			;how long the sword has extended
OptionsScreenState = $A2		;0 - drawing screen, 1 - selecting options
Enemy_Destruct_WhichEnemy = $30		;0 - barrel, 1 - flame enemy

Sword_Count = Jumpman_HeldHammerIndex	;counts down until all swords are used (repurposed RAM)

Sword_OAM_Y = OAM_Y+(4*Hammer_OAM_Slot)
Sword_OAM_Tile = OAM_Tile+(4*Hammer_OAM_Slot)
Sword_OAM_Prop = OAM_Prop+(4*Hammer_OAM_Slot)
Sword_OAM_X = OAM_X+(4*Hammer_OAM_Slot)

;this
SwordCount_OAM_Y = OAM_Y+(4*Hammer_OAM_Slot)+8
SwordCount_OAM_Tile = OAM_Tile+(4*Hammer_OAM_Slot)+8
SwordCount_OAM_Prop = OAM_Prop+(4*Hammer_OAM_Slot)+8
SwordCount_OAM_X = OAM_X+(4*Hammer_OAM_Slot)+8


;constants
Link_GFXFrame_Sword = $18
Link_GFXFrame_Standing = $04		;when sword timer runs out, revert to normal standing frame
SwordOutTime = $05			;it decreases every few frames (i think 10 frames? I don't remember)

Sword_GFXFrame = $FA
Sword_YDisp = $06			;relative to the player's position
Sword_Prop = OAMProp_Palette0

Sword_MaxExtension = 13			;decimal pixels

Sword_OutButton = Input_B		;normally unused button, now pressing it will bring out the sword

Sword_HowManyUses = 3			;how many swords can be used in a level/game? (visual counter and options about this to be added)

Sword_Count_SwordTile = $EA