

#region reset
if floor(x/1152) != floor(obj_player.x/1152) || floor(y/672) !=floor(obj_player.y/672){
if place_meeting(x,y,obj_trigger_horizPlayerFollow) ||  place_meeting(x,y,obj_trigger_vertPlayerFollow) {
	
} else{
y=yOrigin
x=xOrigin
hp = 20
}
}
if(abs(obj_cameraPlace.x-x)>=532){
hspeed = 0
}
#endregion

if staggerTime>0 {
	staggerTime --
	if (obj_player.x-x)/(abs(obj_player.x-x)) !=0{
		if abs(obj_player.x-x)>400 then jumpIn = 5} 
	}
if invulTime>0{
	invulTime--}

if atkAnim>0{
	atkAnim--
sprite_index=sp_wargAtk
image_speed=1
} else sprite_index=sp_warg

if jumpIn > -1{
	jumpIn--}
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
	else {
	if abs(xInput*3/floor(distanceToPlayer/100)) < 1 then hspeed +=xInput
	else { hspeed +=xInput*3/floor(distanceToPlayer/100)}
	}
if(hspeed>=14){hspeed = 14}
if(hspeed<=-14){hspeed = -14}
}

while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
hspeed-= sign(hspeed)
}

#endregion


yInput = -((y-obj_player.y)>32)*place_meeting(x,y+1,obj_obstacle)
//for (var n=1; n <jump;n++){
if place_meeting(x,y+5,obj_obstacle)&&distanceToPlayer<=abs(jump*(2*hspeed+jump)/2){
	yInput = -1
	
}

if place_meeting(x,y+1,obj_obstacle)&&(jumpIn=0) then yInput = -1
if(yInput!=0){ymom=yInput*jump
}
yInput = 0

vspeed = ymom
while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0){
vspeed-= sign(vspeed)
ymom=0
}

if(ymom<=ymax){ymom++}
x+=hspeed
while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0){
vspeed-= sign(vspeed)
ymom=0
}
x-=hspeed
y+=vspeed
while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
hspeed-= sign(hspeed)
}
y-=vspeed
if hp <=0 KillMe(spr_part_wargRubble)



if(obj_player.x>x){image_xscale = -1}else{image_xscale = 1}
//show_debug_message(string(x)+" , "+string(y))