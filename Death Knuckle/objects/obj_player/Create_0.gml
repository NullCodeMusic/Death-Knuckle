/// @description Insert description here
// You can write your code in this editor
room_speed = 60
upKey = "W";
downKey = "S";
leftKey = "A";
rightKey = "D";
spd = 9
ymom = 0
ymax = 20
jump = 20
diagonal = 0
timeHeld = 0
lastxInput=1
attacking = 0
atkTimeHeld=0
distPercentage=1
maxDist=250
fistTime = 10
global.fists = 0
staggerTime = 0
startingStaggerTime = 20
//upgrades
hpcontainervalue = 10
rocketFist=1

flash = 0
invulTime = 0
hitDirection = 0
extraFrames=0
setHitAnim=0
walljump=0 //unnesisary? remove?
walljumptime=0
walljumpframes=0
ignorewall=0
//lastxInput=0
//xInput=0
facingwall=0
attackDamage=20 // full damage of a charged fist

boolcheck1=0
frame1done=0
fadein = 80

cursorspeed=40
frame=0
cursortick=0

ticka=0
tickb=0
framerate=0

randomize()
borg = 0
jojosmode = 0


ini_open("save.data")
	 walljump = ini_read_real("unlocks","walljump",0)
	 extraHPContainers = ini_read_real("unlocks","hpcontainers",0)
ini_close()


hp = 100 + extraHPContainers * hpcontainervalue

