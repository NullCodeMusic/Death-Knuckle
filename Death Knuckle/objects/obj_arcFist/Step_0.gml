//dir
//speed
//image angle


//if i = 0 {
	//image_angle = 180+image_angle 
//} 
// !!!!!!!!!!!!
// set image angle from the curve script 

if tick < 0 {
	direction =point_direction(x,y,obj_player.x,obj_player.y)
	speed = -tick
	image_angle = direction +180
}
else {
	speed = tick
	image_angle=direction
	curve_point(mouse_x,mouse_y,5)}
	if round(x) = round(mouse_x) {
		speed = 0
		
	}
hspeed = round(hspeed)
vspeed = round(vspeed)
//x=x+xx
//y=y+yy

if tick > 0 {
tick= tick - distance/time
} else {
tick = tick - distance *0.2	
}


//if tick <= -distance {
if place_meeting(x,y,obj_player) && tick< 0{
obj_player.attacking2 = 0
instance_destroy()
}