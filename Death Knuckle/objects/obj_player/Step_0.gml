/// @description Insert description here
// You can write your code in this editor
mask_index = sp_player
if ignorewall=1 { walljumpframes=0}

if hp<=0 then {staggerTime = 1

	global.deathx = (x - camera_get_view_x(view_camera[0]))
	global.deathy = (y - camera_get_view_y(view_camera[0]))
	//if place_meeting(x,y,obj_trigger_horizPlayerFollow) then global.deathx
//if place_meeting(x,y,obj_trigger_vertPlayerFollow) then global.deathy=.5
room_goto(rm_DeathAnimation)
}
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
	fistID.spd = 15
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
if ((keyboard_check(ord(leftKey)) xor keyboard_check(ord(rightKey)) )||(walljump=1&&ignorewall=0)){ 
	
	if staggerTime = 0 {lastxInput = -keyboard_check(ord(leftKey))+keyboard_check(ord(rightKey))}}
	
xInput = -keyboard_check(ord(leftKey))+keyboard_check(ord(rightKey))
if hp<=0 then xInput = 0
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

if walljump &&walljumpframes>0&&ignorewall=0 &&keyboard_check_pressed(ord(upKey)){


lastxInput=-facingwall
xInput=-facingwall
jumpInput = -facingwall*walljump


walljumptime=25
}
if walljumptime>0{
walljumptime--

hspeed = timeHeld*jumpInput
}


if place_meeting(x,y+1,obj_obstacle)&&ignorewall!=0{ignorewall=1} else ignorewall=1
if vspeed>0 then ignorewall=0
	
//if place_meeting(x,y+1,obj_obstacle) { walljumpframes=0;ignorewall=1}else ignorewall=0;//WHERE I LAST LEFT OFF FSDAFADJSKLFSDJFJAS;FJAS;LFJ;ADSLKFASDFSDFDSF
if ignorewall=1 { walljumpframes=0; }


#region inital horiz collision 
if (place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
	yy= vspeed
	for (i=0;i<17;i=i+1){
		
		if !place_meeting(x+hspeed,y+yy,obj_obstacle) {y= y+yy; break;} else yy--
	}
}

if (place_meeting(x+hspeed,y,obj_obstacle)&&ignorewall=0&&walljump=1){
	ymom=2
walljump=1
walljumpframes=5
facingwall=sign(hspeed)


}/*else {walljump=0;
	if walljumpframes>0 { walljumpframes-- ymom=2;
		walljump=1 fuk
		}}*/
while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
hspeed-= sign(hspeed)}

#endregion
#endregion

#region vertical movement
if((place_meeting(x,y+abs(hspeed)+5,obj_obstacle) || place_meeting(x,y+abs(hspeed)+5,obj_jumpThru))||(ignorewall=0&&walljump=1&& (walljumpframes>0))){ extraFrames=7
	} else if extraFrames>0 { extraFrames--}
yInput = -(keyboard_check_pressed(ord(upKey))*(extraFrames>0))
if yInput !=0 then walljumpframes=0
if hp<=0 then yInput =0
if(yInput!=0){ymom=yInput*jump}
	//if yInput <0 then extraFrames = 0
	//}
	
	//if extraFrames>0 {yInput = -(keyboard_check_pressed(ord(upKey)))}
if staggerTime>0 then yInput =0



vspeed = ymom
while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0){
vspeed-= vspeed/abs(vspeed)
ymom=0
}
jtID = instance_nearest(x,y,obj_jumpThru)
while(place_meeting(x,y+vspeed,jtID)&&vspeed!=0&&/*!place_meeting(x,y,jtID)&&*/y+55<jtID.y){
vspeed-= vspeed/abs(vspeed)
ymom=0
}

if(ymom<=ymax){ymom++}


#region vetical collsion

// vert and horiz collision
while place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&hspeed!=0&&vspeed!=0{

speed = round(speed -1)
hspeed = floor(abs(hspeed))*sign(hspeed)
vspeed = floor(abs(vspeed))*sign(vspeed)


}

#endregion#


#endregion

#region getting hit
if invulTime = 0{
if place_meeting(x,y,prnt_enemy){
	// argument 0 = obj_enemy_yaddayadda
	// arg 1 = invul time
	// arg 2 = stagger time
	// arg 3 damage to hp
	// arg 4 ymom 
	var hitID=instance_nearest(x,y,prnt_enemy)
	var hitDT = hitID.damage
	var hitKB = hitID.knockback
	var hitST = hitID.stagger
	hitID.atkAnim=hitID.maxAtkAnim
		EnemyCollision(hitID,40,hitST,hitDT,hitKB)
		obj_cameraFollowing.screenshake = random_range(hitDT,hitDT+10)
		
	audio_sound_pitch(snd_ouchie,1+random_range(-0.1,+0.1))
	audio_play_sound(snd_ouchie,1,0)

}
if(place_meeting(x,y,obj_killzone)){hp -=10}
if(place_meeting(x,y,obj_boss_projectile_vert)){
		invulTime = 60
		staggerTime = 10
		setHitAnim = 1
		if place_meeting(x,y,obj_boss_projectile_vert){
		var enemyid = instance_place(x,y,obj_boss_projectile_vert)
		if (enemyid.x-x)!=0{
			hitDirection = (enemyid.x-x)/abs(enemyid.x - x)} else hitDirection=0
		hp=hp-20
		ymom=ymom-15
		}
}
//else flash = 0
//if flash =0 then image_alpha=1
//} //else {
	//invulTime --
	
}
#endregion
#region triggers

if place_meeting(x,y,obj_trigger_horizPlayerFollow) then obj_cameraFollowing.horizFollowPlayer=1
if place_meeting(x,y,obj_trigger_vertPlayerFollow) then obj_cameraFollowing.vertFollowPlayer=1


#endregion

if jojosmode =1 {
borg++ 
if borg = 8 then {
borg = 0
part_emitter_region(global.partSys,global.partEmtStream,x-sprite_width/2,x+sprite_width/2,y+sprite_height/2,y-sprite_height/2,ps_shape_rectangle,ps_distr_linear)
	part_emitter_burst(global.partSys,global.partEmtStream,global.partTypMenacing,1)
}
}

#region easter eggs
if keyboard_check_pressed(ord("J")) { jojosmode = !jojosmode
if jojosmode=0 then part_type_sprite(global.partTypFistTrail,spr_particle_fistTrail,1,1,0)
}
#endregion

#region checkpoints
if place_meeting(x,y,obj_checkpoint)&&keyboard_check_pressed(ord("E")){
show_debug_message("saved" + string(instance_place(x,y,obj_checkpoint).pointID) + string(room))
ini_open("save.data")
		ini_write_real("data","checkpoint",instance_place(x,y,obj_checkpoint).pointID)
		ini_write_string("data","roomName",string(room))
		ini_write_string("unlocks","walljump",walljump)
		ini_write_real("unlocks","hpcontainers",extraHPContainers)
		ini_write_string("data","usedHPcontainers",ds_list_write(obj_checkpointList.hpList))
		hp = 100 + extraHPContainers * hpcontainervalue
		//get number of health objects then make an array using their ID's and their uniqe ID's given in creation code
ini_close()
if !instance_exists(obj_checkpointLight){
var checkpointID = instance_place(x,y,obj_checkpoint)
instance_create_depth(checkpointID.x,checkpointID.y,-1,obj_checkpointLight)	
checkpointID.image_index = 1
checkpointID.image_speed = 1
}


hp = 100 + extraHPContainers * hpcontainervalue
}
#endregion

#region pickups
while place_meeting(x,y,prnt_pickup){
	if place_meeting(x,y,obj_pickup_smallHealth){
		var pickupID = instance_place(x,y,obj_pickup_smallHealth)
		hpAlpha=1
		hp = hp + 10
		part_emitter_region(global.partSys,global.partEmtSmallBurst,pickupID.x-pickupID.sprite_width/2,pickupID.x+pickupID.sprite_width/2,pickupID.y-pickupID.sprite_height/2,pickupID.y+pickupID.sprite_height/2,ps_shape_rectangle,ps_distr_linear)
		part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypPlantRubble,10)	
		// make sure to change this if max hp is changed or the containers are changed
		if hp > 100 + extraHPContainers *10 then hp = 100 +extraHPContainers*10
		instance_destroy(pickupID)
	} else if place_meeting(x,y,obj_hpContainer){
		var pickupID = instance_place(x,y,obj_hpContainer)
		ds_list_add(obj_checkpointList.hpList,pickupID.pointID)
		part_emitter_region(global.partSys,global.partEmtSmallBurst,pickupID.x-pickupID.sprite_width/2,pickupID.x+pickupID.sprite_width/2,pickupID.y-pickupID.sprite_height/2,pickupID.y+pickupID.sprite_height/2,ps_shape_rectangle,ps_distr_linear)
		part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypPlantRubble,25)	
		extraHPContainers++
		instance_create_depth(pickupID.x,pickupID.y,-500,obj_usedHPContainer)
		instance_destroy(pickupID)
	} else if place_meeting(x,y,obj_walljumpPowerup){
		var pickupID = instance_place(x,y,obj_walljumpPowerup)
		walljump=1
		
		part_emitter_region(global.partSys,global.partEmtSmallBurst,pickupID.x-pickupID.sprite_width*2,pickupID.x+pickupID.sprite_width*2,pickupID.y-pickupID.sprite_height*2,pickupID.y+pickupID.sprite_height*2,ps_shape_rectangle,ps_distr_linear)
		part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypSparks,25)
		instance_destroy(pickupID)
		
	}
}
#endregion


if place_meeting(x,y,obj_DarkRoom){
//var darkList = ds_list_create()
darkID = instance_place(x,y,obj_DarkRoom)
darkID.playerIn =1	
}


if hpAlpha>0 hpAlpha=hpAlpha-0.01
alphaHP += (hpAlpha-alphaHP)/8

//ticka++
//if atkTimeHeld>29 && framerate >1 then framerate --
//else if framerate <30 then framerate ++


// if framerate=0&&frame!=0{
// if ticka >= framerate {ticka=0;frame++;if frame=NUMBEROFSPRITES frame = 0}
// switch(frame){
// 1:
// cursor_sprite = fjkdlsa;
// break;
// }

if place_meeting(x,y,obj_endgame) then room=rm_WinGame


if keyboard_check_pressed(vk_escape) then game_end()

if keyboard_check_pressed(ord("M")) { if window_get_fullscreen() then window_set_fullscreen(0)else window_set_fullscreen(1)}


if keyboard_check(vk_up) {x+=(mouse_x-x)/2;y+=(mouse_y-y)/2}
