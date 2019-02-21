x=xOrigin
y=yOrigin

hspeed = ((obj_cameraPlace.x-x)/spd)
vspeed = ((obj_cameraPlace.y-y)/spd)

if horizFollowPlayer = 1 {
hspeed = ((obj_player.x-x)/spd)
}
x += (mouse_x - x  + (obj_player.x-obj_cameraPlace.x))*0.005
if vertFollowPlayer = 1 {
vspeed = ((obj_player.y-y)/spd)	
}
y += (mouse_y - y + (obj_player.y-obj_cameraPlace.y))*0.005
horizFollowPlayer = 0
vertFollowPlayer = 0


xOrigin = x +hspeed
yOrigin = y +vspeed




if screenshake > 0{
	x+= (2-random(2))*screenshake
	y+= (2-random(2))*screenshake
screenshake-= screenshake/15
if screenshake<0.1 then screenshake=0
}
