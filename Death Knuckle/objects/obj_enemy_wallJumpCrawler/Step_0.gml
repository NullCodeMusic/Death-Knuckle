/// @description Insert description here
// You can write your code in this editor


#region Launch at player

if jumping=1{
	hspeed=facing*horizspd
	horizspd++

	
 if(place_meeting(x+hspeed,y,obj_obstacle)){
	 hspeed=0
facing=-facing
horizspd=0
jumping=0
cooldown=20
for(var hspd=hspeed; place_meeting(x+hspeed,y,obj_obstacle);hspd--){
	hspeed-=sign(hspeed)
}
 }
}


if(jumping=0&&cooldown=0&&(abs(obj_player.y-y)<50)&&!collision_line(x,obj_player.y,obj_player.x,obj_player.y,obj_obstacle,true,false))||place_meeting(x,y,obj_walljumpCrawlerJumpTrigger){
	
	jumping=1
	
	horizspd=1
	vspeed=0
	spdup=0
	
}
if cooldown>0{
cooldown--	
}


#endregion


if staggerTime>0 {
	yInput=0
staggerTime --} 
if invulTime>0{
	invulTime--}

//if atkAnim>0{
//	atkAnim--
//sprite_index=sp_bugAtk
//image_speed=1
//staggerTime=15
//} else sprite_index=sp_bug


if spdup<maxSpd then spdup++// spd up until max
vspeed=yInput*spdup
if jumping=1||cooldown>0 then vspeed=0

vspeed = round(vspeed)





if(vspeed>0){vspeed = min(maxSpd,vspeed)}else{vspeed = max(-maxSpd,vspeed)}

if hp <=0 {
	if irandom(4)=3{ var pickup = instance_create_depth(-1,x,y,obj_pickup_smallHealth)
	pickup.dir = irandom_range(-1,1)}
	audio_play_sound(snd_boog,1,0)
	KillMe(spr_part_bugRubble)
}


//if(xInput=1){image_xscale = -1}else{image_xscale = 1}

if vspeed!=0{

image_yscale = -sign(vspeed)

} 


if place_meeting(x,y+vspeed+5*sign(vspeed),obj_trigger_crawlerBoundry){ //hitting boundry, turn around
spdup=0
yInput=-yInput
vspeed=-vspeed
}


show_debug_message("vspeed"+string(vspeed)+"hspeed"+string(hspeed))