//attack 1: Beast dashes across the battlefield, smashing into the player
//attack 2: Beast will try to jump and land on the player with short hops,
//just tall enough to clear the player's height
//attack 3: Beast summons a horde of beasts to swarm the bottom floor of the arena
//in a stampede, forcing the player to get to the 2nd level
//attack 4: if player is standing on the platform the beast can't get to, it smashes through the platfrom from below, launching the player up and damaging them if they land on the beast
DrawIfOnScreenStep()
if staggerTime>0 {
staggerTime --} 
if invulTime>0{
	invulTime--}
if wallSlamTime>0{
	wallSlamTime--}

//phase 0 
switch (phase){
case 0: //start
	if startingFrames = 0 { phase = 1;break;}
	startingFrames --;
	//set the sprite to be screeching or something and do some visual effects
	obj_player.staggerTime=1
	break;
case 1: //running into walls
#region xinput
	if(instance_exists(obj_player)){
		if (obj_player.x-x)/(abs(obj_player.x-x)) !=0{
			distanceToPlayer = abs(obj_player.x-x)
	xInput = (obj_player.x - x)/(abs(obj_player.x - x))
	if staggerTime>0&&wallSlamTime<=0 then lastxInput=xInput}
	} else xInput = 1
#endregion
#region yinput
	yInput=0


if(yInput!=0){ymom=yInput*jump
}
yInput = 0
if wallSlamTime>0{
	xInput=lastxInput
}
#endregion














#region horizontal movement

//if(instance_exists(obj_player)){
//	if (obj_player.x-x)/(abs(obj_player.x-x)) !=0{
//		distanceToPlayer = abs(obj_player.x-x)
//xInput = (obj_player.x - x)/(abs(obj_player.x - x))}
//} else xInput = 1


if staggerTime > 0 {
	xInput = -hitDirection
	lastxInput= -hitDirection
	if boolcheck1 = 0 {
	timeHeld = 10
	hspeed =xInput*15
	
	if(hspeed>=10){hspeed -= 0.5}
	if(hspeed<=-10){hspeed -= 0.5}
	boolcheck1 =1 }
} else {
	boolcheck1=0
	if distanceToPlayer<300 then hspeed += xInput*0.5
	else hspeed +=xInput*1.5
if(hspeed>=13){hspeed = 13}
if(hspeed<=-13){hspeed = -13}
}

if(place_meeting(x+hspeed,y,obj_boss1Wall)){
	if wallSlamTime>0 {
xInput=lastxInput
hspeed = 0
}
	while(place_meeting(x+hspeed,y,obj_boss1Wall)&&hspeed!=0){
		hspeed-= hspeed/abs(hspeed)
	}
	wallSlamTime=20
	
}

while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
hspeed-= hspeed/abs(hspeed)
}
#endregion
#region vertical movement
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
#endregion



if hp <=0 {
hp = 40
phase++
}




//show_debug_message(string(x)+" , "+string(y))