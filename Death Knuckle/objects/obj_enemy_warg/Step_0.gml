DrawIfOnScreenStep()


if staggerTime>0 {
staggerTime --} 
if invulTime>0{
	invulTime--}

#region horizontal movement
//if keyboard_check(ord(leftKey)) xor keyboard_check(ord(rightKey)) { 
//	lastxInput = -keyboard_check(ord(leftKey))+keyboard_check(ord(rightKey))}
//xInput = -keyboard_check(ord(leftKey))+keyboard_check(ord(rightKey))
if(instance_exists(obj_player)){
	if (obj_player.x-x)/(abs(obj_player.x-x)) !=0{
xInput = (obj_player.x - x)/(abs(obj_player.x - x))}
} else xInput = 1

if staggerTime > 0 {
	xInput = -hitDirection
	lastxInput= -hitDirection
	if boolcheck1 = 0 {
	timeHeld = 10
	hspeed =xInput*20
	if(hspeed>=10){hspeed -= 0.5}
	if(hspeed<=-10){hspeed -= 0.5}
	boolcheck1 =1 }
} else {
	boolcheck1=0
hspeed +=xInput*0.5
if(hspeed>=10){hspeed = 10}
if(hspeed<=-10){hspeed = -10}
}
/*
if abs(obj_player.x - x) < spd then spd = abs(obj_player.x - x) else spd = maxSpd
spd = round(spd)

if lastxInput != xInput && xInput != 0 && spd != 0{
	tick --
	spd = spd - tick
} else if lastxInput != xInput && xInput != 0 && spd < maxSpd{
	tick++
	spd= spd +tick
}
else if lastxInput != xInput && xInput != 0 && spd = 0{
lastxInput = xInput
tick++
spd = tick 
}else if xInput !=0 then lastxInput = xInput

if spd = maxSpd then tick = 0




if(xInput!=0){
timeHeld+=2
}else{
timeHeld--
}
if(timeHeld>=spd){timeHeld=spd }
if(timeHeld<=0){timeHeld=0 }
if xInput = 0{hspeed = round(lastxInput*timeHeld)}
else {hspeed = round(xInput*timeHeld)}
*/
wall = false
while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
hspeed-= hspeed/abs(hspeed)
wall = true
}

#endregion

yInput = -((y-obj_player.y)>32)*place_meeting(x,y+1,obj_obstacle)*wall
if(yInput!=0){ymom=yInput*jump
}
yInput = 0

vspeed = ymom
while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0){
vspeed-= vspeed/abs(vspeed)
ymom=0
}

if(ymom<=ymax){ymom++}

while(place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&hspeed!=0){
hspeed-= hspeed/abs(hspeed)
vspeed-= vspeed/abs(vspeed)
//spd -= spd/abs(spd)
ymom=0
}

if hp <=0 KillMe(spr_part_wargRubble)


//show_debug_message(string(x)+" , "+string(y))