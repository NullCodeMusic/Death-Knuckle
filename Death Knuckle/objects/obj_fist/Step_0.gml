//dir
//speed
//image angle


//if i = 0 {
	//image_angle = 180+image_angle 
//} 
direction = image_angle
if tick < 0 {
	direction = point_direction(x,y,obj_player.x,obj_player.y)
	speed = -tick
}
else speed = tick
hspeed = round(hspeed)
vspeed = round(vspeed)
//x=x+xx
//y=y+yy



tick= tick - distance/time
if tick <= -distance {
obj_player.attacking = 0
instance_destroy()
}