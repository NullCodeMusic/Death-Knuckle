/// @description Insert description here
// You can write your code in this editor

#region drop projectile

//sets a timer, when it hits zero plays a startup animation before spawning
// projectile

if droptime=0{
	//SET ANIMATION HERE
	sprite_index=sp_bugAtk
	image_index=0
	image_speed=1
	//make sure animation lasts 30 frames
	animateTime=30
	droptime=-1
}else{
if droptime>0&&distance_to_object(obj_player)<600 then droptime--	
}

if animateTime=0{
	sprite_index=sp_bug
	animateTime=-1
	droptime=irandom_range(60,200)
	var proj = instance_create_depth(x,y,0,obj_miniBossBug_projectile)
	proj.pointv = y-obj_player.y
	proj.pointh = -x+obj_player.x
}else if animateTime>0{
	animateTime--
}


#endregion



if staggerTime>0 {
	xInput=0
staggerTime --} 
if invulTime>0{
	invulTime--}

//if atkAnim>0{
//	atkAnim--
//sprite_index=sp_bugAtk
//image_speed=1
//staggerTime=15
//} else sprite_index=sp_bug





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


hspeed=0
vspeed=0