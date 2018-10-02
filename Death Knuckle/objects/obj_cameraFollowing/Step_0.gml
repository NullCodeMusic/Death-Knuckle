
hspeed = round((obj_cameraPlace.x-x)/spd)
vspeed = round((obj_cameraPlace.y-y)/spd)

if horizFollowPlayer = 1 {
hspeed = round((obj_player.x-x)/spd)
}
if vertFollowPlayer = 1 {
vspeed = round((obj_player.y-y)/spd)	
}
horizFollowPlayer = 0
vertFollowPlayer = 0