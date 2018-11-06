if place_meeting(x,y,obj_cameraFollowing){
	image_xscale = -sign(hspeed)
	image_yscale = max(1,-vspeed/12)
	draw_self()
}
