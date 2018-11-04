//jfkadjflkdfjkl;asaejklsfsdlk;jfsdjkl;
#region determine xInput

//if(instance_exists(obj_player)){
//	if (obj_player.x-x)/(abs(obj_player.x-x)) !=0{
//		distanceToPlayer = abs(obj_player.x-x)
//xInput = (obj_player.x - x)/(abs(obj_player.x - x))*0.5}
//} else xInput = 1

#endregion


#region move x

if chargeWarmup <=0 {
	
	hspeed += chargeInput*5 
} else {
chargeWarmup--	
if hspeed !=0{
hspeed = -hspeed/abs(hspeed)/2	
}
}
if chargeWarmup== 20{
	chargeInput = (obj_player.x - x)/(abs(obj_player.x - x))
}
#endregion
	
	//cap speed
if(hspeed>=20){hspeed = 20}
if(hspeed<=-20){hspeed = -20}


//hspeed collision
while(place_meeting(x,y,obj_boss1Wall)&&hspeed!=0){
hspeed-= hspeed/abs(hspeed)
ymom = -10
chargeWarmup=40
slowdown =1
}

if slowdown =1 && hspeed !=0{
hspeed += -hspeed/abs(hspeed)	
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
//momenutum
if(ymom<=ymax){ymom++}


//h and v speed collision
while(place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&hspeed!=0){
hspeed-= hspeed/abs(hspeed)
vspeed-= vspeed/abs(vspeed)
//spd -= spd/abs(spd)
ymom=0
}
//death
if hp <=0 KillMe(spr_part_wargRubble)