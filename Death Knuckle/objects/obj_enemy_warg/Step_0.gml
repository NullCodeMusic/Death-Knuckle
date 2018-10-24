DrawIfOnScreenStep()

#region reset
if(abs(xOrigin-obj_cameraPlace.x)>=700){


x=xOrigin
hp = 20

}
#endregion

if staggerTime>0 {
staggerTime --} 
if invulTime>0{
	invulTime--}

if atkAnim>0{
	atkAnim--
sprite_index=sp_wargAtk
image_speed=1
} else sprite_index=sp_warg

#region horizontal movement

if(instance_exists(obj_player)){
	if (obj_player.x-x)/(abs(obj_player.x-x)) !=0{
		distanceToPlayer = abs(obj_player.x-x)
xInput = (obj_player.x - x)/(abs(obj_player.x - x))*0.5}
} else xInput = 1

if staggerTime > 0 {
	xInput = -hitDirection
	lastxInput= -hitDirection
	if boolcheck1 = 0 {
	timeHeld = 10
	hspeed =xInput*15
	

	boolcheck1 =1 }
} else {
	boolcheck1=0
	if distanceToPlayer<300 then hspeed += xInput*0.5
	else hspeed +=xInput*3/floor(distanceToPlayer/100)
if(hspeed>=10){hspeed = 10}
if(hspeed<=-10){hspeed = -10}
}

wall = false
while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
hspeed-= hspeed/abs(hspeed)
wall = true
}

#endregion



yInput = -((y-obj_player.y)>32)*place_meeting(x,y+1,obj_obstacle)*wall
if place_meeting(x,y+5,obj_obstacle)&&distanceToPlayer<230&&distanceToPlayer>200{
	yInput = -1
}
if(yInput!=0){ymom=yInput*jump
}
yInput = 0

vspeed = ymom
while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0){
vspeed-= vspeed/abs(vspeed)
ymom=0
}

if(ymom<=ymax){ymom++}

while(place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&hspeed!=0){
hspeed-= hspeed/abs(hspeed)
vspeed-= vspeed/abs(vspeed)
//spd -= spd/abs(spd)
ymom=0
}

if hp <=0 KillMe(spr_part_wargRubble)




//show_debug_message(string(x)+" , "+string(y))