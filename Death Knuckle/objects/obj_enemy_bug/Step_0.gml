/// @description Insert description here
// You can write your code in this editor

#region reset
if(abs(xOrigin-obj_cameraPlace.x)>=700){

y=yOrigin
x=xOrigin
hp = 20

}

if(abs(obj_cameraPlace.x-x)>=532){
hspeed = 0
}

#endregion



if staggerTime>0 {
staggerTime --} 
if invulTime>0{
	invulTime--}

if atkAnim>0{
	atkAnim--
sprite_index=sp_bugAtk
image_speed=1
staggerTime=15
} else sprite_index=sp_bug

/*
    argument[0] bounce condition
    argument[1] inaccuracy
    argument[2] curve amount
    argument[3] target object
    argument[4] gravity
    argument[5] speed
    argument[6] acceleration
*/

if(instance_exists(obj_player)){
	
xInput = (obj_player.x - x)/(abs(obj_player.x - x))
yInput = (obj_player.y-40 - y)/(abs(obj_player.y-40 - y))
if staggerTime>0 {
xInput = -xInput 
//yInput = -yInput 

//if (atkAnim>0) { 
yInput = -2*abs(yInput)
hspeed = -abs(hspeed)	
}

}

hspeed+=xInput
vspeed+=yInput

hspeed = round(hspeed)
vspeed = round(vspeed)

while abs((hspeed*hspeed)+(vspeed*vspeed)) >0 && speed > sqrt(abs(hspeed*hspeed)+abs(vspeed*vspeed)){
if hspeed != vspeed {
	if hspeed > vspeed {
		if speed > sqrt(abs(hspeed)^2+abs(vspeed)^2){
			hspeed =hspeed -(hspeed/abs(hspeed))
			}
	}else {
		if speed > sqrt(abs(hspeed)^2+abs(vspeed)^2){
			vspeed =vspeed -(vspeed/abs(vspeed))
			}
	}
} else {
	if speed > sqrt(abs(hspeed)^2+abs(vspeed)^2){
			vspeed =vspeed -(vspeed/abs(vspeed))
			hspeed =hspeed -(hspeed/abs(hspeed))
			}
}
if (abs(hspeed*hspeed)+abs(vspeed*vspeed)) <=0 then break;

}



if(hspeed>0){hspeed = min(maxSpd,hspeed)}else{hspeed = max(-maxSpd,hspeed)}
if(vspeed>0){vspeed = min(maxSpd,vspeed)}else{vspeed = max(-maxSpd,vspeed)}

while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
hspeed-= hspeed/abs(hspeed)
}
while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0){
vspeed-= vspeed/abs(vspeed)
}
while(place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&hspeed!=0){
hspeed-= hspeed/abs(hspeed)
vspeed-= vspeed/abs(vspeed)
}

if hp <=0 KillMe(spr_part_bugRubble)

