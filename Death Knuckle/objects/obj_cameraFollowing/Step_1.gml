x=xOrigin
y=yOrigin

hspeed = min(abs((obj_player.x-x)/spd),10) * sign(obj_player.x-x)
vspeed = min(abs((obj_player.y-y-200)/spd),10) * sign(obj_player.y-y-200)

//if horizFollowPlayer = 1 {
//hspeed = ((obj_player.x-x)/spd)
//}
////
//if vertFollowPlayer = 1 {
//vspeed = ((obj_player.y-y)/spd)	
//}
//
horizFollowPlayer = 0
vertFollowPlayer = 0




x += (mouse_x - x  + (obj_player.x-x)*2)/spd2
y += (mouse_y - y + (obj_player.y-y-200)*2)/spd2
xOrigin = x +hspeed
yOrigin = y +vspeed
if screenshake > 0{
	x+= (2-random(2))*screenshake
	y+= (2-random(2))*screenshake
screenshake-= screenshake/15
if screenshake<0.1 then screenshake=0
}
