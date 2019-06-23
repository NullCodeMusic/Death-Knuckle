/// @description Insert description here
// You can write your code in this editor
toolsList= ds_list_create()
jumplist = ds_list_create()
room_speed = 60
fallRecx=x
fallRecy=y
fallRecTimer=0
upKey = "W";
downKey = "S";
leftKey = "A";
rightKey = "D";
keyboard_set_map(vk_up,ord("W"))
keyboard_set_map(vk_down,ord("S"))
keyboard_set_map(vk_left,ord("A"))
keyboard_set_map(vk_right,ord("D"))
keyboard_set_map(vk_space,ord("W"))
spd = 9
ymom = 0
ymax = 20
jumpheight = 20
diagonal = 0
timeHeld = 0
lastxInput=1
attacking = 0
atkTimeHeld=0
distPercentage=1
maxDist=230
fistTime = 10
global.fists = 0
staggerTime = 0
startingStaggerTime = 20
grappleheld=0
//upgrades
hpcontainervalue = 10
red=0
grappletime=0
extraJump=0
cooldown=0

platList=ds_list_create()
toolAlpha=1
platTimer = 0

momentumTime=0
momentumDir=0
momentumSpd=0

alphaHP=0
xtarg=0
ytarg=0
audio_stop_all()
grapplegrav=0
grapplegrav2=0
spdDecay=1
grappledist=200
grappledir=0
grapplespd=0
grappled=0
hpAlpha=0
invulTime = 0
hitDirection = 0
extraFrames=0
setHitAnim=0
walljump=0 
walljumptime=0
walljumpframes=0
ignorewall=0
//lastxInput=0
//xInput=0
facingwall=0
attackDamage=8 // full damage of a charged fist


grappletomouse=1
cursor_sprite=sp_cursor0
window_set_cursor(cr_none)
boolcheck1=0
frame1done=0
fadein = 80

cursorspeed=40
frame=0
cursortick=0

randomize()
borg = 0
jojosmode = 0

ini_open("save.data")
	 roomName = ini_read_real("data","roomName",rm_Cave2)

ini_open("save.data")
	 walljump = ini_read_real("unlocks","walljump",0)
	 extraHPContainers = ini_read_real("unlocks","hpcontainers",0)
	 extraJumps = ini_read_real("unlocks","jumps",0)
	 ds_list_read(toolsList,ini_read_real("unlocks", "tools", 0))
	 
	// extraJump
	// grapple hook
	// swing hook
	// large melee
ini_close()

toolsSelect = 0

hp = 100 + extraHPContainers * hpcontainervalue

changingHPrange = 100+hpcontainervalue*extraHPContainers
changingHP = 100+hpcontainervalue*extraHPContainers

if(ds_list_find_value(toolsList,0)=0){ds_list_delete(toolsList,0)}
