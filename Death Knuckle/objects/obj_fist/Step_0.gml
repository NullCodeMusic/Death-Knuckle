//dir
//speed
//image angle

DrawIfOnScreenStep()
//if i = 0 {
	//image_angle = 180+image_angle 
//} 
lifetime = lifetime +1
if tick < 0 {
	direction =point_direction(x,y,obj_player.x,obj_player.y)
	tick--
	speed = -tick
	image_angle = direction + 180
}
else {
	speed = tick
	image_angle =direction  }
//hspeed = round(hspeed)
//vspeed = round(vspeed)
//x=x+xx
//y=y+yy
if frame1done= 0 {
x = x+hspeed
y = y+vspeed
}





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
if place_meeting(x,y,obj_enemy_warg){
	 var enemyID= instance_place(x,y,obj_enemy_warg)
	//object_get_name(enemyID)
	if enemyID.invulTime<=0{
		enemyID.staggerTime =10
		enemyID.invulTime=5
		enemyID.ymom=-10
		enemyID.hitDirection = (x-enemyID.x)/abs(x - enemyID.x)
		enemyID.hp -= floor(obj_player.attackDamage*(distance/obj_player.maxDist))
		//enemyID.hp -= //obj_player.attackDamage
			
		
	}
}
part_emitter_region(global.partSys,global.partEmtSmallBurst,enemyID.x-enemyID.sprite_width/2,enemyID.x+enemyID.sprite_width/2,enemyID.y-enemyID.sprite_height/2,enemyID.y+enemyID.sprite_height/2,ps_shape_rectangle,ps_distr_linear)
	part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypSparks,2)
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
	if place_meeting(x,y,obj_breakableWall){
	var doorID= instance_place(x,y,obj_breakableWall)
	doorID.hits++
	if doorID.hits >=3 {	
	part_emitter_region(global.partSys,global.partEmtSmallBurst,doorID.x-doorID.sprite_width/2,doorID.x+doorID.sprite_width/2,doorID.y-doorID.sprite_height/2,doorID.y+doorID.sprite_height/2,ps_shape_rectangle,ps_distr_linear)
	part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypRubble,10)		
		instance_destroy(doorID)
	} else{
	//part_emitter_region(global.partSys,global.partEmtSmallBurst,doorID.x-2,doorID.x+2,doorID.y-2,doorID.y+2,ps_shape_ellipse,ps_distr_gaussian)
	part_emitter_region(global.partSys,global.partEmtSmallBurst,doorID.x-doorID.sprite_width/2,doorID.x+doorID.sprite_width/2,doorID.y-doorID.sprite_height/2,doorID.y+doorID.sprite_height/2,ps_shape_rectangle,ps_distr_linear)
	
	part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypRubble,3)	
	}
	}
}
#endregion



if tick > 0 {
tick= tick - 5*(40/distance)
if frame1done=1 {
while(place_meeting(x,y,obj_obstacle)){
	

	tick = -1
	speed = speed -1
	if speed <0 || speed = 0{
	speed = 0; break;}
	if lifetime < 3 {tooEarly = 1}

}






}
} else {
	distance = point_distance(x,y,obj_player.x,obj_player.y)
tick =  - distance *0.2	
}
//if tick <= -distance {
if place_meeting(x+hspeed,y+vspeed,obj_player) && tick< 0{
obj_player.attacking = 0
//if tooEarly = 1 {obj_player.staggerTime = obj_player.startingStaggerTime}
instance_destroy()
}

if frame1done = 0 then {
frame1done = 1
//x=x+hspeed
//y=y+vspeed
visible = 1
}