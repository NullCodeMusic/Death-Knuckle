//attack 1: Beast dashes across the battlefield, smashing into the player
//attack 2: Beast will try to jump and land on the player with short hops,
//just tall enough to clear the player's height
//attack 3: Beast summons a horde of beasts to swarm the bottom floor of the arena
//in a stampede, forcing the player to get to the 2nd level
//attack 4: if player is standing on the platform the beast can't get to, it smashes through the platfrom from below, launching the player up and damaging them if they land on the beast


if atkAnim>0{
		atkAnim--
sprite_index=sp_wargAtk
image_speed=1
} else sprite_index=sp_warg

//phase 0 
switch (phase){
	#region start, case 0
case 0: //start
	if startingFrames = 0 { phase = 1;chargeWindup=40;break;}
	startingFrames --;
	//set the sprite to be screeching or something and do some visual effects
	obj_player.staggerTime=1
	break;
	#endregion
	
	#region run into walls, case 1
case 1: //running into walls
// 40 frame windup
//charges at player, when they hit stands in place and launches the player upwards
xInput=0
if chargeWindup <= 0{
	damage = 10
	knockback = 50
	stagger = 10
	if(instance_exists(obj_player)){
		if (obj_player.x-x)/(abs(obj_player.x-x)) !=0{
		//distanceToPlayer = abs(obj_player.x-x)
		xInput = (obj_player.x - x)/(abs(obj_player.x - x))}
	} else xInput = 1
	break;
	} else {
		chargeWindup--
		damage = 5
knockback = 5
stagger = 10
#region collision
{
	boolcheck1=0
	hspeed +=xInput*3
if(hspeed>=15){hspeed = 15}
if(hspeed<=-15){hspeed = -15}
}

//vert
while((place_meeting(x+hspeed,y,obj_obstacle)||(place_meeting(x+hspeed,y,obj_obstacle)))&&hspeed!=0){
hspeed-= hspeed/abs(hspeed)
}
yInput = 0

vspeed = ymom
while((place_meeting(x,y+vspeed,obj_obstacle)||(place_meeting(x+hspeed,y,obj_obstacle)))&&vspeed!=0){
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
}
#endregion
	
}







//if staggerTime>0 {
//staggerTime --} 
//if invulTime>0{
//	invulTime--}



#region horizontal movement

//if(instance_exists(obj_player)){
//	if (obj_player.x-x)/(abs(obj_player.x-x)) !=0{
//		distanceToPlayer = abs(obj_player.x-x)
//xInput = (obj_player.x - x)/(abs(obj_player.x - x))}
//} else xInput = 1

//if staggerTime > 0 {
//	xInput = -hitDirection
//	lastxInput= -hitDirection
//	if boolcheck1 = 0 {
//	timeHeld = 10
//	hspeed =xInput*15
	
//	if(hspeed>=10){hspeed -= 0.5}
//	if(hspeed<=-10){hspeed -= 0.5}
//	boolcheck1 =1 }
//} else 

//horiz

#endregion



//yInput = -((y-obj_player.y)>32)*place_meeting(x,y+1,obj_obstacle)


if hp <=0 then KillMe(spr_part_wargRubble)




//show_debug_message(string(x)+" , "+string(y))