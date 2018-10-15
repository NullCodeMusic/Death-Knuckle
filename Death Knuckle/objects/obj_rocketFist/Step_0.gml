//dir
//speed
//image angle

DrawIfOnScreenStep()
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
	
	speed = spd + 0.1 * point_distance(x,y,mouse_x,mouse_y)
	
	image_angle=direction
	curve_point(mouse_x,mouse_y,5)
	if point_distance(x,y,mouse_x,mouse_y) < spd {
		speed = 0
	
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
	

#region hitting enemy
if place_meeting(x,y,prnt_enemy){
if place_meeting(x,y,obj_enemy_warg){
	 enemyID= instance_place(x,y,obj_enemy_warg)
	//object_get_name(enemyID)
	if enemyID.invulTime<=0{
		enemyID.staggerTime =6
		enemyID.invulTime=8
		enemyID.ymom=-5
		enemyID.hitDirection = (x-enemyID.x)/abs(x - enemyID.x)
		enemyID.hp -= floor(obj_player.attackDamage/2)
		
	}
}
}
#endregion





	//tick = -1
	//speed = speed -1
	//if speed <0 || speed = 0{
	//speed = 0; }
	
	
	//if lifetime < 3 {tooEarly = 1}

}
#endregion 


if tick > 0 {
tick= tick - 1












while(place_meeting(x+hspeed,y+vspeed,obj_obstacle)||place_meeting(x+hspeed,y+vspeed,obj_interactableButton)){
#region hitting button

if place_meeting(x+hspeed,y+vspeed,obj_interactableButton){
	var buttonID = instance_place(x+hspeed,y+vspeed,obj_interactableButton) 
for (var i=0;i<= ds_list_size(obj_interactableController.interactableList);i++){
var interactID = ds_list_find_value(obj_interactableController.interactableList,i)
show_debug_message(string(buttonID)+"button")
show_debug_message(string(interactID)+"interact")

if buttonID.keyID = interactID.keyID {interactID.activated = 1; break;}		
	}
	}
#endregion


	speed = speed -1
	if speed <0 {
	speed = 0; break;}
	
}
} else {
	//if distance = 0 then 
	distance = point_distance(x,y,obj_player.x,obj_player.y)
tick = - distance* 0.1	
}


//if tick <= -distance {
if place_meeting(x,y,obj_player) && tick< 0{
obj_player.attacking = 0
instance_destroy()
}







