/// @description Insert description here
// You can write your code in this editor

#region reset


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

hspeed+=xInput + irandom_range(-2.1,2.1)
vspeed+=yInput + irandom_range(-2.1,2.1)

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

var bounceh =0
var bouncev =0
while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
hspeed-= hspeed/abs(hspeed)
bounceh=1
}
while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0){
vspeed-= vspeed/abs(vspeed)
bouncev=1
}
y+=vspeed
while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
hspeed-= hspeed/abs(hspeed)
bounceh=1
}
y-=vspeed

x+=hspeed
while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0){
vspeed-= vspeed/abs(vspeed)
bouncev=1
}
x-=hspeed

if (bounceh) then hspeed = -hspeed
if (bouncev) then vspeed = -vspeed
if hp <=0 {
	if irandom(4)=3{ var pickup = instance_create_depth(-1,x,y,obj_pickup_smallHealth)
	pickup.dir = irandom_range(-1,1)}
	KillMe(spr_part_bugRubble)
}

if ((floor(x/1152) != floor(obj_player.x/1152) || floor(y/672) !=floor(obj_player.y/672)) && !place_meeting(x,y,obj_trigger_vertPlayerFollow) && !place_meeting(x,y,obj_trigger_horizPlayerFollow)){
//&& !place_meeting(x,y,obj_trigger_vertPlayerFollow) && !if place_meeting(x,y,obj_trigger_horizPlayerFollow)){

y=yOrigin
x=xOrigin
hp = 5

hspeed=0
vspeed=0

}
if !place_meeting(x+hspeed,y+vspeed,obj_cameraPlace){
hspeed=0
vspeed=0
y=yOrigin
x=xOrigin
}
if(obj_player.x>x){image_xscale = -1}else{image_xscale = 1}