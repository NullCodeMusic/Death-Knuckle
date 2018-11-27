x=xOrigin
y=yOrigin

hspeed = ((obj_cameraPlace.x-x)/spd)
vspeed = ((obj_cameraPlace.y-y)/spd)

if horizFollowPlayer = 1 {
hspeed = ((obj_player.x-x)/spd)
}
if vertFollowPlayer = 1 {
vspeed = ((obj_player.y-y)/spd)	
}
horizFollowPlayer = 0
vertFollowPlayer = 0


xOrigin = x +hspeed
yOrigin = y +vspeed

x -= (mouse_x - x )*0.03/// obj_cameraFollowing.sprite_width
y -= (mouse_y - y)*0.03

