if place_meeting(x,y,obj_cameraFollowing){
	image_xscale = -sign(hspeed)
	if hspeed!=0{lastXScale=-sign(hspeed)} else image_xscale = lastXScale
	image_yscale = max(1,-vspeed/12)
	if vspeed!=0{lastYScale=-sign(vspeed)} else image_yscale = lastYScale
	shader_set(BlackOutline)
	shader_set_uniform_f(upixelW,texelW)
	shader_set_uniform_f(upixelH,texelH)
	draw_self()
	shader_reset()
}
