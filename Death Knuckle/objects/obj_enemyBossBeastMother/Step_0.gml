


#region move x
if bounce =1 {
bounce = 0
if obj_player.x != x{
hspeed =  (obj_player.x - x)/(abs(obj_player.x - x))*15} else{
	var tempX = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])	
hspeed = (tempX - x)/(abs(tempX - x))*15

}
} else {
	if hspeed !=0 {hspeed -= sign(hspeed)}
}

#region state1
if state = 1{
if chargeWarmup <=0 {
	
	hspeed += chargeInput*5 
	if vspeed=0 && jump=1 &&place_meeting(x,y+1,obj_obstacle){ ymom = round(heightDif/12); jump = 0;}
	
} else {
if place_meeting(x,y+1,obj_obstacle)&&hspeed = 0 then chargeWarmup--	

if chargeWarmup== 1{
	if obj_player.x = x then chargeInput = -1 else{
	chargeInput = (obj_player.x - x)/(abs(obj_player.x - x))}
	image_xscale = -sign(chargeInput)
	heightDif = obj_player.y - y
	jump=1
	show_debug_message(heightDif)
	
} else if (chargeWarmup < 35 && chargeWarmup>20 && hspeed = 0){
if obj_player.x = x then chargeInput = -1 else{
	chargeInput = (obj_player.x - x)/(abs(obj_player.x - x))}
	image_xscale = -sign(chargeInput)	
}
}
#endregion

#endregion
#region state 2
} else if state = 2{
	
//some sort of thing that creates something on whatever layer the player's on (vertially)	
	
}
#endregion

	//cap speed
if(hspeed>=20){hspeed = 20}
if(hspeed<=-20){hspeed = -20}


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
while(place_meeting(x,y+vspeed,obj_boss1Wall)&&vspeed!=0){
vspeed-= vspeed/abs(vspeed)
ymom=0
}
//momenutum
if ymom < ymax then ymom ++
//if(ymom<=ymax){ymom++}


//h and v speed collision
x+=hspeed
while(place_meeting(x,y+vspeed,obj_boss1Wall)){
if hspeed!=0{hspeed= -hspeed/abs(hspeed)
ymom = -12
chargeWarmup=chargemax
bounce=1
ymom=0
}
if vspeed!=0{vspeed-= vspeed/abs(vspeed)}
//spd -= spd/abs(spd)
ymom=0
}
x-=hspeed

y+=vspeed
while(place_meeting(x+hspeed,y,obj_boss1Wall)&&hspeed!=0){
hspeed-=hspeed/abs(hspeed)

if hspeed = 0{
ymom = -12
chargeWarmup=chargemax
bounce =1
}
}
y-=vspeed


//death
if hp <=0 KillMe(spr_part_wargRubble)

show_debug_message(string(x) +"  "+ string(y))