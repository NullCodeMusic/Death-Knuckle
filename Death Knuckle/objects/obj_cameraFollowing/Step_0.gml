
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