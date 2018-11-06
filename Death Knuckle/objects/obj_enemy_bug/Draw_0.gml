if place_meeting(x,y,obj_cameraFollowing){
	image_yscale = max(1,-vspeed/12)
	image_xscale = -sign(hspeed)
	draw_self()
}
