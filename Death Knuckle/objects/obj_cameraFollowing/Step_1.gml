x=xOrigin
y=yOrigin

hspeed = ((obj_cameraPlace.x-x)/spd)
vspeed = ((obj_cameraPlace.y-y)/spd)

if horizFollowPlayer = 1 {
hspeed = ((obj_player.x-x)/spd)
}
x += (mouse_x - x )*0.005
if vertFollowPlayer = 1 {
vspeed = ((obj_player.y-y)/spd)	
}
y += (mouse_y - y)*0.005
horizFollowPlayer = 0
vertFollowPlayer = 0


xOrigin = x +hspeed
yOrigin = y +vspeed





