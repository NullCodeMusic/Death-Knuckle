/// @description Insert description here
// You can write your code in this editor

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
if xInput = 0 then xInput = lastxInput
// I added a check just to make sure if we screw up and timeHeld is negative it's still good
if timeHeld>0{hspeed = round(xInput*timeHeld)} else hspeed = 0

while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0&&diagonal = 0){
	hspeed-= hspeed/abs(hspeed)
}

#endregion

yInput = -keyboard_check_pressed(ord(upKey))+keyboard_check(ord(downKey))
if(yInput!=0){ymom=yInput*jump
	}

vspeed = ymom
while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0){
	vspeed-= vspeed/abs(vspeed)
	ymom=0
}

if(ymom<=ymax){ymom++}

while(place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&hspeed!=0&&diagonal = 0){
	hspeed-= hspeed/abs(hspeed)
	vspeed-= vspeed/abs(vspeed)
	ymom=0
}
