/// @description Insert description here
// You can write your code in this editor

#region drop projectile


if droptime=0||(droptime<80&&abs(x-obj_player.x)<200&&sign(x-obj_player.x)=-xInput){
	droptime=irandom_range(100,130)
	instance_create_depth(x,y,0,obj_crawler_projectile)
}else{
droptime--	
}
#endregion



if staggerTime>0 {
	xInput=0
staggerTime --} 
if invulTime>0{
	invulTime--}

if atkAnim>0{
	atkAnim--
sprite_index=sp_bugAtk
image_speed=1
staggerTime=15
} else sprite_index=sp_bug


if spdup<maxSpd then spdup++// spd up until max
hspeed=xInput*spdup

hspeed = round(hspeed)




if(hspeed>0){hspeed = min(maxSpd,hspeed)}else{hspeed = max(-maxSpd,hspeed)}
if(vspeed>0){vspeed = min(maxSpd,vspeed)}else{vspeed = max(-maxSpd,vspeed)}

if hp <=0 {
	if irandom(4)=3{ var pickup = instance_create_depth(-1,x,y,obj_pickup_smallHealth)
	pickup.dir = irandom_range(-1,1)}
	KillMe(spr_part_bugRubble)
}


//if(xInput=1){image_xscale = -1}else{image_xscale = 1}

if hspeed!=0{

image_xscale = -sign(hspeed)

} 


if place_meeting(x+hspeed,y,obj_trigger_crawlerBoundry){ //hitting boundry, turn around
spdup=0
xInput=-xInput
hspeed=-hspeed
}

