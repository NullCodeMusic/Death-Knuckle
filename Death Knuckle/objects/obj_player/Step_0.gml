/// @description Insert description here
// You can write your code in this editor
if spd != 9 then spd = 9
// {
if staggerTime>0 {
staggerTime --
attacking = -1
atkTimeHeld=0
} else if attacking = -1 {attacking = 0
	atkTimeHeld=0}
if invulTime>0 {invulTime--}

#region attacks

if staggerTime=0{
if attacking = 1 and !instance_exists(obj_fist){
	atkTimeHeld = atkTimeHeld + 1
	
}
if mouse_check_button_released(mb_left) && atkTimeHeld>29{ // time is over the treshold needed
	if !instance_exists(obj_fist) && !instance_exists(obj_rocketFist){
	if(global.fists<5){
	mousex = mouse_x ;
	mousey = mouse_y;
	mouseAngle = point_direction(x,y,mousex,mousey);
	fistID = instance_create_depth(x,y,-1,obj_fist);
	fistID.dir = mouseAngle
	fistID.spd = 30
	fistID.direction = mouseAngle;
	fistID.image_angle = mouseAngle;
	fistID.time = fistTime
	distPercentage = atkTimeHeld/60
	if distPercentage > 1 then distPercentage = 1
	Dist = (point_distance(x,y,x+maxDist,y+maxDist)/((fistID.time/2)))*(distPercentage)
	if Dist > maxDist then Dist = maxDist
	fistID.tick = Dist
	fistID.distance = Dist
	atkTimeHeld = 0
	}
	}
}else if mouse_check_button(mb_left) and attacking = 0
{
	attacking = 1;
	atkTimeHeld = 29
}else if attacking = 1 && !mouse_check_button(mb_left) && atkTimeHeld >29 {
	if !instance_exists(obj_fist) && !instance_exists(obj_rocketFist){
	if(global.fists<5){
	mousex = mouse_x ;
	mousey = mouse_y;
	mouseAngle = point_direction(x,y,mousex,mousey);
	fistID = instance_create_depth(x,y,-1,obj_fist);
	fistID.dir = mouseAngle
	fistID.spd = 30
	fistID.direction = mouseAngle;
	fistID.image_angle = mouseAngle;
	fistID.time = fistTime
	distPercentage = atkTimeHeld/60
	if distPercentage > 1 then distPercentage = 1
	Dist = (point_distance(x,y,x+maxDist,y+maxDist)/((fistID.time/2)))*(distPercentage)
	if Dist > maxDist then Dist = maxDist
	fistID.tick = Dist
	fistID.distance = Dist
	atkTimeHeld = 0
	}
	}
}

// arc attack

	if rocketFist =1 {
		
		if mouse_check_button(mb_right) && attacking =2 {
			//if atkTimeHeld < 59 { atkTimeHeld ++}
			}
		else if mouse_check_button(mb_right) && attacking = 0{
			attacking = 2 }
		if mouse_check_button_released(mb_right) && attacking = 2 {
			if(!instance_exists(obj_rocketFist)){
		fistID = instance_create_depth(x,y,-1,obj_rocketFist)	
		fistID.tick = 120
		fistID.spd = 8
			}
		}
	}
	}


#endregion


#region horizontal movement
if keyboard_check(ord(leftKey)) xor keyboard_check(ord(rightKey)) { 
	
	if staggerTime = 0 {lastxInput = -keyboard_check(ord(leftKey))+keyboard_check(ord(rightKey))}}
xInput = -keyboard_check(ord(leftKey))+keyboard_check(ord(rightKey))
if staggerTime > 0 {
	xInput = -hitDirection
	lastxInput= -hitDirection
	if boolcheck1 = 0 {
	timeHeld = 10
	spd = 15
	boolcheck1 =1 }
} else boolcheck1=0
if(xInput!=0){
timeHeld+=2
}else{
timeHeld--
}
if(timeHeld>=spd){timeHeld=spd }
if(timeHeld<=0){timeHeld=0 }
if xInput = 0{hspeed = round(lastxInput*timeHeld)}
else {hspeed = round(xInput*timeHeld)}

#region inital horiz collision 
if (place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&hspeed!=0&&!place_meeting(x,y,obj_transObstacle)){
	yy= vspeed
	for (i=0;i<17;i=i+1){
		
		if !place_meeting(x+hspeed,y+yy,obj_obstacle) {y= y+yy; break;} else yy--
	}
}
while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0&& !place_meeting(x,y,obj_transObstacle)){
hspeed-= hspeed/abs(hspeed)
}
#endregion
#endregion
#region vertical movement
if place_meeting(x,y+abs(hspeed)+5,obj_obstacle) then extraFrames=50 else if extraFrames>0 then extraFrames--
yInput = -(keyboard_check_pressed(ord(upKey))*place_meeting(x,y+abs(hspeed)+5,obj_obstacle))+keyboard_check(ord(downKey))
if(yInput!=0){ymom=yInput*jump
	if yInput <0 then extraFrames = 0
	}
	
	if extraFrames>0 {yInput = -(keyboard_check_pressed(ord(upKey)))}
if staggerTime>0 then yInput =0


vspeed = ymom
while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0&&!place_meeting(x,y,obj_transObstacle)){
vspeed-= vspeed/abs(vspeed)
ymom=0
}

if(ymom<=ymax){ymom++}


#region vetical collsion

while(place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&hspeed!=0&&diagonal = 0&&!place_meeting(x,y,obj_transObstacle)){
hspeed-= hspeed/abs(hspeed)
vspeed-= vspeed/abs(vspeed)
ymom=0
}
#endregion#
#endregion

#region getting hit
if invulTime = 0{
if place_meeting(x,y,prnt_enemy){
	show_debug_message(string(x)+","+string(y))
		show_debug_message(string(obj_enemy_warg.x)+","+string(obj_enemy_warg.y))
	if place_meeting(x,y,obj_enemy_warg) {
		invulTime=40
		staggerTime=10
		setHitAnim = 1
		var enemyid = instance_place(x,y,obj_enemy_warg)
		if (enemyid.x-x)!=0{
		hitDirection = (enemyid.x-x)/abs(enemyid.x - x)} else hitDirection=0
		hp=hp-10
		ymom=-10
	}
}//else flash = 0
//if flash =0 then image_alpha=1
//} //else {
	//invulTime --
	
}
#endregion
#region triggers

if place_meeting(x,y,obj_trigger_horizPlayerFollow) then obj_cameraFollowing.horizFollowPlayer=1
if place_meeting(x,y,obj_trigger_vertPlayerFollow) then obj_cameraFollowing.vertFollowPlayer=1

#endregion







//global speed cap 

//}