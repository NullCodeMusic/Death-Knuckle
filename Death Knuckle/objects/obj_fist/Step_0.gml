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
if place_meeting(x,y,obj_player) && tick< 0{
obj_player.attacking = 0
if tooEarly = 1 {obj_player.staggerTime = obj_player.startingStaggerTime}
instance_destroy()
}

if frame1done = 0 then {
frame1done = 1
//x=x+hspeed
//y=y+vspeed
visible = 1
}