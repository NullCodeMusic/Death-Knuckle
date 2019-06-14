/// @description Insert description here
// You can write your code in this editor

#region Tool Select

if(toolsSelect>ds_list_size(toolsList)){toolsSelect=0}
if(toolsSelect<0){toolsSelect=ds_list_size(toolsList)}
/*
Draw code
Step 1: Draw list of tool icons using loop
	Draw selection box around selected one
*/

#endregion

mask_index = sp_player
if ignorewall=1 { walljumpframes=0}

if cooldown>0 then cooldown--

	var platform = instance_place(x,y+vspeed+1,obj_movingPlatform)
if platform=noone then platform=0 else{
}

//if platform!=0{ymom=platform.vspeed}
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
if attacking = 1 && atkTimeHeld<60*3 && !instance_exists(obj_fist)&&cooldown=0{
	atkTimeHeld++
	
}



//if mouse_check_button_released(mb_left) && atkTimeHeld>29{ // time is over the treshold needed
//	//if !instance_exists(obj_fist) && !instance_exists(obj_rocketFist){
//	//if(global.fists<5){
//	//mousex = mouse_x ;
//	//mousey = mouse_y;
//	//mouseAngle = point_direction(x,y,mousex,mousey);
//	//fistID = instance_create_depth(x,y,-1,obj_fist);
//	//fistID.charged=1
//	//fistID.dir = mouseAngle
//	//fistID.spd = 30
//	//fistID.direction = mouseAngle;
//	//fistID.image_angle = mouseAngle;
//	//fistID.time = fistTime
//	//distPercentage = atkTimeHeld/60
//	//if distPercentage > 1 then distPercentage = 1
//	//Dist = (point_distance(x,y,x+maxDist,y+maxDist)/((fistID.time/2)))*(distPercentage)
//	//if Dist > maxDist then Dist = maxDist
//	//fistID.tick = Dist*.75
//	//fistID.startingDist=Dist
//	//fistID.distance = Dist
//	//atkTimeHeld = 0
//	//}
//	//}
//}else 
if mouse_check_button(mb_left) and attacking = 0 &&cooldown=0{
	
	attacking = 1;
	atkTimeHeld = 15;
	
}else if attacking = 1 && !mouse_check_button(mb_left) && atkTimeHeld >=30 { //charged fist
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
	fistID.damage=obj_player.attackDamage*2+obj_player.attackDamage*atkTimeHeld/60*1.25
	fistID.tick = Dist*2
	fistID.distance = Dist/4
	atkTimeHeld = 0
	fistID.setcooldown=5
	}
	}
}else if attacking = 1 && !mouse_check_button(mb_left) && atkTimeHeld <30 { // melee fist
	if !instance_exists(obj_fist) && !instance_exists(obj_rocketFist){
	if(global.fists<5){
	mousex = mouse_x ;
	mousey = mouse_y;
	mouseAngle = point_direction(x,y,mousex,mousey);
	
	fistID = instance_create_depth(x,y,-1,obj_fist);
	fistID.damage=obj_player.attackDamage
	fistID.dir = mouseAngle
	fistID.spd = 80
	fistID.direction = mouseAngle;
	fistID.image_angle = mouseAngle;
	fistID.time = fistTime
	fistID.setcooldown=5
	//distPercentage = atkTimeHeld/60
	//if distPercentage > 1 then distPercentage = 1
	
	fistID.tick = 80
	fistID.distance = 15
	atkTimeHeld = 0
	}
	}
}

#region Aiden's Grapple

#region momenutm for launching

if momentumTime>0{
	
	var momentx = lengthdir_x(momentumSpd*momentumTime/40,momentumDir)
	var momenty = lengthdir_y(momentumSpd*momentumTime/40,momentumDir)
	show_debug_message("x"+string(momentx)+" y"+string(momenty)+" "+string(momentumDir)+" time"+string(momentumTime))
	if !place_meeting(x+momentx,y+momenty,obj_obstacle){
	
	x+=momentx*.75
	y+=momenty*.75
	
	momentumTime--
	
	} else {
	momentumTime=0	
	}
}
/*
momenutmTime=0
momenutmDir=0
momentumSpd=0
*/
#endregion
if(instance_exists(obj_grappleSpot))&&(ds_list_find_value(toolsList,toolsSelect)="grapple"){ //if tool is selected and grapple is unlocked
#region grapple fist


if mouse_check_button_pressed(mb_right) && attacking = 0 { //if can attack
	grappletime=10
	grappleheld=10
	if grappletomouse=1{
	var targetSpot = instance_nearest(mouse_x,mouse_y,obj_grappleSpot)//checks for a grappleable spot relative to mouse
	} else{
	var targetSpot = instance_nearest(x,y,obj_grappleSpot)//checks for a grappleable spot relative to player	
	}
	
	if distance_to_object(targetSpot)<450&&!collision_line(x,y,targetSpot.x,targetSpot.y,obj_obstacle,true,false){
	grappledist=200
		attacking =2
		if targetSpot.type=1 then attacking=3
		
		var grapplefist = instance_create_depth(x,y,-1,obj_grapplefist)
		grapplefist.targetSpot=targetSpot
		var grappleDir = point_direction(x,y,targetSpot.x,targetSpot.y)*pi/180
		grappledir = -point_direction(x,y,targetSpot.x,targetSpot.y)+180
		grapplefist.x += cos(grappleDir)*5
		grapplefist.y += sin(grappleDir)*5
		spdDecay=2
	}

} else if attacking=2 && !mouse_check_button(mb_right) &&obj_grapplefist.grappled=1{//if let go
obj_grapplefist.comeBack=1
grappled=0
if obj_grapplefist.grappled=1{
hspeed=xtarg
vspeed=ytarg
//do something to make sure that the momentum carries
	momentumSpd=point_distance(x,y,x+xtarg,y+ytarg)
	momentumDir=point_direction(x,y,x+xtarg,y+ytarg)
	
	momentumTime=40
ymom=1
obj_grapplefist.grappled=0
}else{
momentumSpd=0	
}
}
#endregion

#region grappled

if grappled=1&&grappletime=0{
	var grappledirRad = grappledir*pi/180
	var targGrappleX = obj_grapplefist.x + cos(grappledirRad)*grappledist
	var targGrappleY = obj_grapplefist.y + sin(grappledirRad)*grappledist
draw_sprite(spr_checkpoint,0,targGrappleX,targGrappleY)
	
	grappledist= clamp(grappledist + (keyboard_check(ord(downKey))-keyboard_check(ord(upKey))),50,350)
	xtarg= (targGrappleX-x) /5
	ytarg= (targGrappleY-y) /5
	
	if place_meeting(x+xtarg,y+ytarg,obj_obstacle){
	/*
	grappled=0
	obj_grapplefist.comeBack=1
	hspeed=xtarg
	vspeed=ytarg
		momentumSpd=point_distance(x,y,xtarg,ytarg)
		momentumDir=point_direction(x,y,xtarg,ytarg)
		momentumTime=0
		*/
		while place_meeting(x+xtarg,y+ytarg,obj_obstacle){
		xtarg-=	cos(grappledirRad)
		ytarg-= sin(grappledirRad)
		}
		
		
	//}else{
	
	}
	x+=xtarg
	y+=ytarg
	
	var dirInput = -(-keyboard_check(ord(leftKey))+keyboard_check(ord(rightKey)))//directional input
	if dirInput!=0 {//if left or right held
		
		spdDecay= max(2,spdDecay-0.1)
		if sign(dirInput)==sign(grapplegrav2){ // if direction and gravity are working together
			
			grappleheld = min(30,grappleheld+1)
		}
	}else{
	grappleheld = max(floor(grappleheld-1),1)	
	}
	grapplespd+=(dirInput)*(grappleheld/30)+grapplegrav2
	grapplespd=min(abs(grapplespd),10)*sign(grapplespd)
	grapplegrav+=(90-grappledir)/180
	grapplegrav=min(abs(grapplegrav),1)*sign(grapplegrav)
	grapplegrav2+=grapplegrav
	grapplegrav2=grapplegrav2/spdDecay
	spdDecay+=0.01
	

	var possibledir = grappledir+grapplespd*2+(90-grappledir)/10*spdDecay
	show_debug_message(string(grappledir)+string(possibledir))
	if possibledir>180{possibledir=179}
	if possibledir<0{possibledir=1}
	if possibledir>180||possibledir<0{
		
		grapplespd=grapplespd*2
	}
	
	if possibledir>=0 && possibledir<=180{
	grappledir	=possibledir
	}
	show_debug_message(string(grappledir)+string(possibledir))
	
	
} else if grappletime>0&&instance_exists(obj_grapplefist)&&obj_grapplefist.comeBack=0&&attacking=2{ //stationary point
	var grappledirRad = grappledir*pi/180
	var targGrappleX = obj_grapplefist.x + cos(grappledirRad)*grappledist
	var targGrappleY = obj_grapplefist.y + sin(grappledirRad)*grappledist
	
	
	var hgrapple= (targGrappleX-x)/max(grappletime,1)
	var vgrapple= (targGrappleY-y)/max(grappletime,1)
	if !place_meeting(x+hgrapple,y+vgrapple,obj_obstacle){
	x+=hgrapple	
	y+=vgrapple
	}
	grappletime--
}else if attacking=3&&obj_grapplefist.grappled=1{//grabs point
	ymom=0
	var hgrapple= (obj_grapplefist.x-x)/10
	var vgrapple= (obj_grapplefist.y-y)/10
	if !place_meeting(x+hgrapple,y+vgrapple,obj_obstacle){
	x+=hgrapple	
	y+=vgrapple
	}
	if attacking=3 && !mouse_check_button(mb_right) {//if let go
obj_grapplefist.comeBack=1
grappled=0
if obj_grapplefist.grappled=1{
	obj_grapplefist.grappled=0
hspeed=hgrapple*40
vspeed=vgrapple*40
//hgrapple*=4
///vgrapple*=4
//do something to make sure that the momentum carries
	momentumSpd=point_distance(x,y,x+hgrapple,y+vgrapple)
	momentumDir=point_direction(x,y,x+hgrapple,y+vgrapple)
	
	momentumTime=40
ymom=1}else{
momentumSpd=0	
}
}
}

#endregion
}
#endregion 
/*
#region Ryan's Grapple
if(mouse_check_button_pressed(mb_right) && attacking = 0){
	var grapID = instance_nearest(mouse_x,mouse_y,obj_grapplePoint)
	grapID.grapTrig=1
	}
#endregion
*/
#region old rocketfist

	//if rocketFist =1 {
		
	//	if mouse_check_button(mb_right) && attacking =2 {
	//		//if atkTimeHeld < 59 { atkTimeHeld ++}
	//		}
	//	else if mouse_check_button(mb_right) && attacking = 0{
	//		attacking = 2 }
	//	if mouse_check_button_released(mb_right) && attacking = 2 {
	//		if(!instance_exists(obj_rocketFist)){
	//	fistID = instance_create_depth(x,y,-1,obj_rocketFist)	
	//	fistID.tick = 120
	//	fistID.spd = 8
	//		}
	//	}
	//}
#endregion

	}

#endregion


#region horizontal movement
if ((keyboard_check(ord(leftKey)) xor keyboard_check(ord(rightKey)) )||(walljump=1&&ignorewall=0)){ 
	
	if staggerTime = 0 {lastxInput = -keyboard_check(ord(leftKey))+keyboard_check(ord(rightKey))}}
	
xInput = -keyboard_check(ord(leftKey))+keyboard_check(ord(rightKey))
if hp<=0 || grappled=1 then xInput = 0
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


if place_meeting(x,y+3,obj_obstacle)&&ignorewall!=0{ignorewall=1} else ignorewall=1
if vspeed>0 then ignorewall=0
	
//if place_meeting(x,y+1,obj_obstacle) { walljumpframes=0;ignorewall=1}else ignorewall=0;//WHERE I LAST LEFT OFF FSDAFADJSKLFSDJFJAS;FJAS;LFJ;ADSLKFASDFSDFDSF
if ignorewall=1 { walljumpframes=0; }


#region inital horiz collision 
//moving platform
if platform!=0{
	
}

#region moving up slopes
if (place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0)&&vspeed<5{//&&place_meeting(x,y+2,obj_obstacle)
	yy= vspeed
	
	for (i=0;i<17;i=i+1){
		
		if !place_meeting(x+hspeed,y+yy,obj_obstacle) {
			
			y= y+yy;
			break;
			} else yy--
	}
}
#endregion

if (place_meeting(x+hspeed,y,obj_obstacle)&&ignorewall=0&&walljump=1){
	ymom=2
walljump=1
walljumpframes=5
facingwall=sign(hspeed)


}/*else {walljump=0;
	if walljumpframes>0 { walljumpframes-- ymom=2;
		walljump=1 fuk
		}}*/
		if platform!=0 {
		hspeed+=platform.hspeed}
while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
hspeed-= sign(hspeed)}

#endregion
#endregion

#region vertical movement
if((place_meeting(x,y+3,obj_obstacle) || place_meeting(x,y+3,obj_jumpThru))&&vspeed<=0){ //touching ground   ||(ignorewall=0&&walljump=1&& (walljumpframes>0))
	extraFrames=8
	
	
	
	///!!
	
	
	///!!!
	
	
	//if extra jump is unlocked then extraJump=1							
	if extraJumps!=0 then extraJump=extraJumps
	
	
	///!!!
	
	
	///!!!
	} else if extraFrames>0 { extraFrames-- 
		}
	
	
	
yInput = -(keyboard_check_pressed(ord(upKey)))
if yInput =-1 {
		walljumpframes=0
	if extraFrames=0 && extraJump=0 { 
		yInput=0
	}
	
	if extraFrames=0{
		if extraJump>0{
			extraJump--	
		}
	}else if extraFrames>0{
		extraFrames=1	
	} 
	


	//if extraFrames!=0 then extraFrames=0
}



if hp<=0||grappled=1 then yInput =0
if(yInput!=0){ymom=yInput*jumpheight}
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

if platform!=0 {
	with (platform){
			//obj_player.vspeed+=vspeed
			obj_player.y+=vspeed
			//if vspeed>0 then 
			
		
	}
}

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
	red=0
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
if(place_meeting(x,y,obj_killzone)){hp -=10
	red=0}
if(place_meeting(x,y,obj_spikes)){
hp-=20
red=0
invulTime=60
ymom=-10
staggerTime=20
setHitAnim = 1
hitDirection=-sign(hspeed)
}
if(place_meeting(x+hspeed,y+vspeed,obj_fall)){
hp-=10
x=fallRecx
y=fallRecy-15
red=0
invulTime=5
//staggerTime=50
fadein=55
}
if(place_meeting(x,y,obj_boss_projectile_vert)){
		invulTime = 60
		staggerTime = 10
		setHitAnim = 1
		var enemyid = instance_place(x,y,obj_boss_projectile_vert)
		if (enemyid.x-x)!=0{
			hitDirection = (enemyid.x-x)/abs(enemyid.x - x)} else hitDirection=0
		hp=hp-20
		red=0
		ymom=ymom-15
		}

if place_meeting(x,y,prnt_projectile){
	red=0
var hitID=instance_nearest(x,y,prnt_projectile)
	var hitDT = hitID.damage
	var hitKB = hitID.knockback
	var hitST = hitID.stagger
		EnemyCollision(hitID,40,hitST,hitDT,hitKB)
		obj_cameraFollowing.screenshake = random_range(hitDT,hitDT+10)
		
	audio_sound_pitch(snd_ouchie,1+random_range(-0.1,+0.1))
	audio_play_sound(snd_ouchie,1,0)
		
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
		
		ini_write_real("unlocks","jumps",extraJumps)
	    ini_write_real("unlocks","tools",ds_list_write(toolsList))
	 
		ini_write_string("data","usedHPcontainers",ds_list_write(obj_checkpointList.hpList))
		hp = 100 + extraHPContainers * hpcontainervalue
		if instance_exists(prnt_enemy){
		instance_destroy(prnt_enemy)
		}
		if instance_exists(prnt_trigger_summon){
			prnt_trigger_summon.activated=0
		}
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
	
	#region upgrades items

	if place_meeting(x,y,obj_grappleItem){
		var itemID = instance_place(x,y,obj_grappleItem)	
		ds_list_add(toolsList,"grapple")
	}

	#endregion
	
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

if keyboard_check_pressed(ord("M")) { 
	
	window_set_cursor(cr_none)
	if window_get_fullscreen() then{ window_set_fullscreen(0)
	room_set_viewport(room,0,1,0,0,1440,810)
	} else {
	window_set_fullscreen(1)
	room_set_viewport(room,0,1,0,0,display_get_width(),display_get_height())
	}
}


/*
rm	The index of the room to set
vind	The index of the view port to set
vis	The visibility of the view port (true is visible, false is invisible)
xport	The x position for the view port in the room
yport	The y position of the view port in the room
wport	The width (in pixels) of the view port
hport	The height (in pixels) of the view port
*/
if keyboard_check(vk_up) {x+=(mouse_x-x)/2;y+=(mouse_y-y)/2}

if fallRecTimer=0&&place_meeting(x,y+1,obj_obstacle)&&!place_meeting(x,y+1,obj_crumblingPlatform)&&!place_meeting(x,y+1,obj_breakingPlatform)&&!place_meeting(x+hspeed,y+vspeed,obj_fall)&&!place_meeting(x,y+1,obj_movingPlatform){ //checks if player is on ground and timer is out
fallRecx=x
fallRecy=y
fallRecTimer=300

} else if fallRecTimer>0 then fallRecTimer--


if place_meeting(x,y,obj_movingPlatform){
var platform = instance_place(x,y,obj_movingPlatform)
hspeed+=sign(platform.hspeed)*(abs(platform.hspeed))
vspeed+=sign(platform.vspeed)*(abs(platform.vspeed))
vspeed+=10
if place_meeting(x+hspeed,y+vspeed,obj_obstacle){
hspeed=0
vspeed=0
}
}

if place_meeting(x,y+ymom,obj_obstacle) then extraFrames=10



