# Donkey Kong: Fair Maiden Edition
This is a source code for the Fair Maiden Edition Romhack. You can see how it works and stuff.

If you want to compile it yourself, you'll need some files from the original DK Disassembly repository (found here: https://github.com/RussianManSMWC/Donkey-Kong-NES-Disassembly), specifically:
1) JPRemap.asm
2) iNES_Header.asm

You'll also need to extract graphics from the hack (don't want to make it too easy to compile). For that, grab the original REV A (PRG1) ROM of Donkey Kong, and apply a BPS file that can be found here: https://www.smwcentral.net/?p=viewthread&t=124996

Then, grab the graphical data and save it as a separate file named DKGFX.bin (python script from the original repository can help you extract that).
