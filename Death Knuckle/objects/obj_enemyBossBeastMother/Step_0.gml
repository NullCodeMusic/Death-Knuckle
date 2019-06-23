
if mode=2{
chargemax=10
damage=20
}

if hp<=100 then mode=2

if !place_meeting(x,y+1,obj_obstacle){timeInAir++
	if timeInAir >=120{
	invulTime=60
	vspeed+=2
	chargeWarmup=1
	sprite_index=sp_wargBossRed
	mode=2
	}
}else { timeInAir=0}

#region move x
if bounce =1 {
bounce = 0
if obj_player.x != x{
hspeed =  (obj_player.x - x)/(abs(obj_player.x - x))*10
} else{
	var tempX = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2	
hspeed = (tempX - x)/(abs(tempX - x))*15

}
} else {
	if hspeed !=0 {hspeed -= sign(hspeed)}
}

#region state1
if state = 1{
if chargeWarmup <=0 {
	
	hspeed += chargeInput*2 
	if vspeed=0 && jump=1 &&place_meeting(x,y+1,obj_obstacle){ ymom = round(heightDif/11); jump = 0;}
	image_index = 0
	image_speed = 1
} else {
if hspeed = 0&&chargeWarmup>0 then chargeWarmup--	
if invulTime>0{invulTime--}
if chargeWarmup== 1{
	if obj_player.x = x then chargeInput = -1 else{
	chargeInput = (obj_player.x - x)/(abs(obj_player.x - x))}
	image_xscale = -sign(chargeInput)
	heightDif = obj_player.y - y
	jump=1
	show_debug_message(heightDif)
	
	
	if staggerTime>0 then staggerTime-=3
	if staggerTime<0 then staggerTime=0
	
	if invulTime=0{
	sprite_index=sp_wargBoss	
	}
	
	
} else if (chargeWarmup < 35 && chargeWarmup>10 && hspeed = 0){
if obj_player.x = x {
	var tempX = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])	
chargeInput= sign((tempX - x)/(abs(tempX - x)))
}else{
	chargeInput = (obj_player.x - x)/(abs(obj_player.x - x))}
	image_xscale = -sign(chargeInput)	
}
}
#endregion

#endregion


if  chargeWarmup=chargemax-1 { 
	if mode=2{
		sprite_index=sp_wargBossRed
	if irandom(4) >1 then state = 2
	}else{
		if irandom(2) =2 then state = 2
	}
	
}


#region state 2
} else if state = 2{
	
	if obj_player.x != x{
image_xscale =  sign((obj_player.x - x)/(abs(obj_player.x - x)))} else{
	var tempX = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])	
image_xscale = sign((tempX - x)/(abs(tempX - x)))

}
	
	
hspeed = hspeed - sign(hspeed)
//if image_xscale > 1

 var increment = (abs(x-obj_player.x)+1500/2)/8//8 sections on each side
var dontuse = irandom_range(0,8)
var dontuse2 = irandom_range(0,8)
var dontuse3 = irandom_range(0,8)
while dontuse2 = dontuse {
	var dontuse2 = irandom_range(0,8)
}
while dontuse3 = dontuse || dontuse3 = dontuse{
var dontuse3 = irandom_range(0,8)	
}
 var height = 500/2
 var camX = camera_get_view_x(view_camera[0])
//set pointv and pointh
	for ( var i = 1;i<8;i++){
		if( (i != dontuse) && (i !=dontuse2)&&(i!=dontuse3)){
		  var tempID = instance_create_depth(x,y,-1,obj_boss_projectile)
		tempID.pointv = height
		tempID.pointh = increment*i * sign(image_xscale)
		}
	}
	state=1
}
#endregion

	//cap speed
if abs(hspeed)>spdmax{
hspeed-=sign(hspeed)	
}


//hspeed collision
while(place_meeting(x+hspeed,y,obj_boss1Wall)&&hspeed!=0&&vspeed>-1){
hspeed-=hspeed/abs(hspeed)

if hspeed = 0{
ymom = -10
chargeWarmup=chargemax
bounce =1
}
}




//yinput
yInput = 0
//move y
vspeed = ymom
//vspeed collision
while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0){
vspeed-= vspeed/abs(vspeed)
ymom=0
}

//while(place_meeting(x,y,obj_boss1Wall)){
//x-= round(image_xscale)	
//}
//momenutum
if ymom < -ymax*1.25 then ymom = -ymax*1.25
if ymom < ymax then ymom ++
//if(ymom<=ymax){ymom++}


y+=vspeed
while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
	//for (var i = 0; i < abs(hspeed)+1; i++){
if hspeed != 0{hspeed-=hspeed/abs(hspeed)} else{
//ymom = -12
chargeWarmup=chargemax
bounce =1
break;
}
//}
}
y-=vspeed

//emergency debug kill
if keyboard_check(ord("J"))&&keyboard_check(ord("P")) then hp=hp-100


//death
if hp <=0 {
	KillMe(spr_part_wargRubble);
	}

show_debug_message("HP"+string(hp))
