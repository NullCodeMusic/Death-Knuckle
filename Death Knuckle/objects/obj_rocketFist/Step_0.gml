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
		if place_meeting(x,y,obj_cursor) {
			speed = 0
		}
	}
	
	
hspeed = round(hspeed)
vspeed = round(vspeed)
//x=x+xx
//y=y+yy

if tick > 0 {
tick= tick - 1
while(place_meeting(x+hspeed,y+vspeed,obj_obstacle)||place_meeting(x+hspeed,y+vspeed,obj_interactableButton)){
	if place_meeting(x+hspeed,y+vspeed,obj_interactableButton){ 
	buttonID = instance_place(x+hspeed,y+vspeed,obj_interactableButton) 
		if buttonID != 0 {
		buttonID.activated=1}	
	}
	
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







