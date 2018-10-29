//dir
//speed
//image angle


//if i = 0 {
	//image_angle = 180+image_angle 
//} 
// !!!!!!!!!!!!
// set image angle from the curve script 

if tick <= 0 {
	direction =point_direction(x,y,obj_player.x,obj_player.y)
	tick--
	tick--
	speed = -tick
	image_angle = direction +180
}
else if tick > 0 {
	
	if(instance_exists(obj_player)){
	
xInput = (mouse_x - x)/(abs(mouse_x - x))*accl
yInput = (mouse_y - y)/(abs(mouse_y - y))*accl

}

hspeed+=xInput
vspeed+=yInput
//hspeed = ceil(abs(hspeed)) * hspeed/abs(hspeed) 
//vspeed = ceil(abs(vspeed)) * vspeed/abs(vspeed) 

//hspeed = round(hspeed)
//vspeed = round(vspeed)

if(abs(mouse_x - x)<=threshwobble){ hspeed = hspeed/dewobble
	round(hspeed)
	}
if(abs(mouse_y - y)<=threshwobble){ vspeed = vspeed/dewobble
	round(vspeed)
	}
	//					help me so mcyhsdafjsdalfkasdlkfasdjklfefafasdjkl;fsdafaksdfsadjfl;ksadfasdfsd
if(hspeed>0){hspeed = min(15,hspeed)}else{hspeed = max(-15,hspeed)}
if(vspeed>0){vspeed = min(15,vspeed)}else{vspeed = max(-15,vspeed)}

while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0){
vspeed=-vspeed}//-= vspeed/abs(vspeed)}
while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
hspeed=-hspeed}//-= hspeed/abs(hspeed)}




//while(place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&hspeed!=0){
//hspeed-= hspeed/abs(hspeed)
//vspeed-= vspeed/abs(vspeed)
//}
	if point_distance(x,y,mouse_x,mouse_y) <= 15 {
		/*
		hspeed = 0
		vspeed =0
		*/
	
	}
		//if place_meeting(x,y,obj_cursor) {
		//if round(x)=round(mouse_x) &&round(y)=round(mouse_y){
		//	speed = 0
		//}
	}
	




//hspeed = round(hspeed)
//vspeed = round(vspeed)
//x=x+xx
//y=y+yy


#region punchables
if place_meeting(x,y,prnt_punchable)&&tick>0{
	

//#region hitting enemy
//if place_meeting(x,y,prnt_enemy){
//if place_meeting(x,y,obj_enemy_warg){
//	 enemyID= instance_place(x,y,obj_enemy_warg)
//	//object_get_name(enemyID)
//	if enemyID.invulTime<=0{
//		enemyID.staggerTime =6
//		enemyID.invulTime=8
//		enemyID.ymom=-5
//		enemyID.hitDirection = (x-enemyID.x)/abs(x - enemyID.x)
//		enemyID.hp -= floor(obj_player.attackDamage/2)
		
//	}
//}
//}
//#endregion





	//tick = -1
	//speed = speed -1
	//if speed <0 || speed = 0{
	//speed = 0; }
	
	
	//if lifetime < 3 {tooEarly = 1}

}
#endregion 


if tick > 0 {
tick= tick - 1








#region punchables
if place_meeting(x,y,prnt_punchable)&&tick>0{
	
#region hitting button

if place_meeting(x,y,obj_interactableButton){
	var buttonID = instance_place(x,y,obj_interactableButton) 
for (var i=0;i<= ds_list_size(obj_interactableController.interactableList);i++){
	var interactID = ds_list_find_value(obj_interactableController.interactableList,i)
	show_debug_message(string(buttonID)+"button")
	show_debug_message(string(interactID)+"interact")

	if buttonID.keyID = interactID.keyID {interactID.activated = 1; break;}		
	}
}
#endregion
#region hitting enemy
if place_meeting(x,y,prnt_enemy){
	 var enemyID= instance_place(x,y,prnt_enemy)
	//object_get_name(enemyID)
	if enemyID.invulTime<=0{
		enemyID.staggerTime =10
		enemyID.invulTime=5
		enemyID.ymom=-10
		enemyID.hitDirection = (x-enemyID.x)/abs(x - enemyID.x)
		enemyID.hp -= floor(obj_player.attackDamage*(distance/obj_player.maxDist))
		//enemyID.hp -= //obj_player.attackDamage

}
part_emitter_region(global.partSys,global.partEmtSmallBurst,enemyID.x-enemyID.sprite_width/2,enemyID.x+enemyID.sprite_width/2,enemyID.y-enemyID.sprite_height,enemyID.y,ps_shape_rectangle,ps_distr_linear)
	part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypSparks,1)
}
#endregion





	tick = -1
	speed = speed -1
	if speed <0 || speed = 0{
	speed = 0; }
	//if lifetime < 3 {tooEarly = 1}

}
#endregion 



#region breakables
if place_meeting(x,y,prnt_breakable)&&tick>0{
	//if place_meeting(x,y,obj_breakableWall){
	//	var doorID= instance_place(x,y,obj_breakableWall)
	//	doorID.hits++
	//	if doorID.hits >=3 {	
	//	part_emitter_region(global.partSys,global.partEmtSmallBurst,doorID.x-doorID.sprite_width/2,doorID.x+doorID.sprite_width/2,doorID.y-doorID.sprite_height/2,doorID.y+doorID.sprite_height/2,ps_shape_rectangle,ps_distr_linear)
	//	part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypRubble,100)		
	//		instance_destroy(doorID)
	//	} else{
	//	//part_emitter_region(global.partSys,global.partEmtSmallBurst,doorID.x-2,doorID.x+2,doorID.y-2,doorID.y+2,ps_shape_ellipse,ps_distr_gaussian)
	//	part_emitter_region(global.partSys,global.partEmtSmallBurst,doorID.x-doorID.sprite_width/2,doorID.x+doorID.sprite_width/2,doorID.y-doorID.sprite_height/2,doorID.y+doorID.sprite_height/2,ps_shape_rectangle,ps_distr_linear)
	
	//	part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypRubble,4)	
	//	}
	//}
}
if place_meeting(x,y,prnt_scruff){
	if place_meeting(x,y,obj_breakablePlantFloor)&& !place_meeting(x,y,obj_breakablePlantWall){
		var plantID = instance_place(x,y,obj_breakablePlantFloor)
		part_emitter_region(global.partSys,global.partEmtSmallBurst,plantID.x-plantID.sprite_width/2,plantID.x+plantID.sprite_width/2,plantID.y-plantID.sprite_height/2,plantID.y+plantID.sprite_height/2,ps_shape_rectangle,ps_distr_linear)
		part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypPlantRubble,5)		
		with (instance_create_layer(plantID.x,plantID.y,"pickups",obj_pickup_smallHealth)) {
		dir = 1 - irandom(2)
		}
			instance_destroy(plantID)
	} else if place_meeting(x,y,obj_breakablePlantWall){
		var plantID = instance_place(x,y,obj_breakablePlantFloor)
		part_emitter_region(global.partSys,global.partEmtSmallBurst,plantID.x-plantID.sprite_width/2,plantID.x+plantID.sprite_width/2,plantID.y-plantID.sprite_height/2,plantID.y+plantID.sprite_height/2,ps_shape_rectangle,ps_distr_linear)
		part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypPlantRubble,5)		
		if irandom(5) = 1 {//1 in 5 chance to spawn small healing pickup
			with (instance_create_layer(plantID.x,plantID.y,"pickups",obj_pickup_smallHealth)) {
		dir = plantID.image_xscale/abs(image_xscale)
		}
		}
			instance_destroy(plantID)
	}
}
#endregion



//while(place_meeting(x+hspeed,y+vspeed,obj_obstacle)){
//	speed = speed -1
//	if speed <0 {
//	speed = 0; break;}
//}


//if (place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&hspeed!=0){
	//while(place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&(hspeed!=0&&vspeed!=0)){
		//if (place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&(hspeed!=0&&vspeed!=0)) then hspeed-= hspeed/abs(hspeed)
		//if (place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&(hspeed!=0&&vspeed!=0)) then vspeed-= vspeed/abs(vspeed)}
	//while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
	//	hspeed-= hspeed/abs(hspeed)}
	//while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0){
	//	vspeed-= vspeed/abs(vspeed)}
	
//}
} else {
	//if distance = 0 then 
//	distance = point_distance(x,y,obj_player.x,obj_player.y)
//tick = - distance* 0.1	
}


//if tick <= -distance {
if place_meeting(x,y,obj_player) && tick< 0{
obj_player.attacking = 0
instance_destroy()
}







