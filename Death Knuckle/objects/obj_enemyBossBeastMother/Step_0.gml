//jfkadjflkdfjkl;asaejklsfsdlk;jfsdjkl;
#region determine xInput

//if(instance_exists(obj_player)){
//	if (obj_player.x-x)/(abs(obj_player.x-x)) !=0{
//		distanceToPlayer = abs(obj_player.x-x)
//xInput = (obj_player.x - x)/(abs(obj_player.x - x))*0.5}
//} else xInput = 1

#endregion


#region move x
if bounce =1 {
bounce = 0
hspeed =  (obj_player.x - x)/(abs(obj_player.x - x))*20
} else {
	hspeed -= hspeed/abs(hspeed)	
}

if chargeWarmup <=0 {
	
	hspeed += chargeInput*5 
	if vspeed=0 && jump =1 { ymom = -15; jump = 0}
	
} else {
chargeWarmup--	

if chargeWarmup== 20{
	chargeInput = (obj_player.x - x)/(abs(obj_player.x - x))
	jump=1
}
}
#endregion
	
	//cap speed
if(hspeed>=20){hspeed = 20}
if(hspeed<=-20){hspeed = -20}


//hspeed collision
while(place_meeting(x+hspeed,y,obj_boss1Wall)&&hspeed!=0){
hspeed-=hspeed/abs(hspeed)

if hspeed = 0{
ymom = -15
chargeWarmup=60
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
if ymom < -ymax then ymom ++
//if(ymom<=ymax){ymom++}


//h and v speed collision

while(place_meeting(x,y+vspeed,obj_boss1Wall)){
if hspeed!=0{hspeed= -hspeed/abs(hspeed)
ymom = -15
chargeWarmup=60
bounce=1
ymom=0
}
if vspeed!=0{vspeed-= vspeed/abs(vspeed)}
//spd -= spd/abs(spd)
ymom=0
}

//death
if hp <=0 KillMe(spr_part_wargRubble)

show_debug_message(string(x) +"  "+ string(y))