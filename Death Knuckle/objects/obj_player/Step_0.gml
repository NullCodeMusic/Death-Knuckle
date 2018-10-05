/// @description Insert description here
// You can write your code in this editor

// {
if staggerTime>0 {
staggerTime --
attacking = -1
} else if attacking = -1 {attacking = 0}

#region attacks


if attacking = 1 and !instance_exists(obj_fist){
	atkTimeHeld = atkTimeHeld + 1
	show_debug_message("FIST");
}
if mouse_check_button_released(mb_left) && atkTimeHeld>29{ // time is over the treshold needed
	
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
}else if mouse_check_button_pressed(mb_left) and attacking = 0
{
	attacking = 1;
	atkTimeHeld = 29
}else if attacking = 1 && !mouse_check_button(mb_left) && atkTimeHeld >29 {
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

// arc attack

	if rocketFist =1 {
		
		if mouse_check_button(mb_right) && attacking =2 {
			if atkTimeHeld < 59 { atkTimeHeld ++}}
		else if mouse_check_button(mb_right) && attacking = 0{
			attacking = 2 atkTimeHeld=20}
		if mouse_check_button_released(mb_right) && attacking = 2 {
			if(!instance_exists(obj_rocketFist)){
		fistID = instance_create_depth(x,y,-1,obj_rocketFist)	
		fistID.tick = 120
		fistID.spd = 8
			}
		}
	}


#endregion


#region horizontal movement
if keyboard_check(ord(leftKey)) xor keyboard_check(ord(rightKey)) { 
	lastxInput = -keyboard_check(ord(leftKey))+keyboard_check(ord(rightKey))}
xInput = -keyboard_check(ord(leftKey))+keyboard_check(ord(rightKey))

if(xInput!=0){
timeHeld+=2
}else{
timeHeld--
}
if(timeHeld>=spd){timeHeld=spd }
if(timeHeld<=0){timeHeld=0 }
if xInput = 0{hspeed = round(lastxInput*timeHeld)}
else {hspeed = round(xInput*timeHeld)}


while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0&&diagonal = 0&& !place_meeting(x,y,obj_transObstacle)){
hspeed-= hspeed/abs(hspeed)
}

#endregion

yInput = -(keyboard_check_pressed(ord(upKey))*place_meeting(x,y+1,obj_obstacle))+keyboard_check(ord(downKey))
if(yInput!=0){ymom=yInput*jump
	}

vspeed = ymom
while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0&&!place_meeting(x,y,obj_transObstacle)){
vspeed-= vspeed/abs(vspeed)
ymom=0
}

if(ymom<=ymax){ymom++}

while(place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&hspeed!=0&&diagonal = 0&&!place_meeting(x,y,obj_transObstacle)){
hspeed-= hspeed/abs(hspeed)
vspeed-= vspeed/abs(vspeed)
ymom=0
}

#region triggers

if place_meeting(x,y,obj_trigger_horizPlayerFollow) then obj_cameraFollowing.horizFollowPlayer=1
if place_meeting(x,y,obj_trigger_vertPlayerFollow) then obj_cameraFollowing.vertFollowPlayer=1

#endregion

//}