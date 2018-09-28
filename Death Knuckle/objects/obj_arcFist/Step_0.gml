//dir
//speed
//image angle


//if i = 0 {
	//image_angle = 180+image_angle 
//} 
// !!!!!!!!!!!!
// set image angle from the curve script 

if tick < 0 {
	direction = point_direction(x,y,obj_player.x,obj_player.y)
	speed = -tick
	image_angle = direction +180
}
else {
	speed = tick
	direction = image_angle}
hspeed = round(hspeed)
vspeed = round(vspeed)
//x=x+xx
//y=y+yy





tick= tick - distance/time
//if tick <= -distance {
if place_meeting(x,y,obj_player) && tick< 0{
obj_player.attacking = 0
instance_destroy()
}