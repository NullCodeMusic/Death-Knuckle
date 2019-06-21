if place_meeting(x,y,obj_cameraFollowing){
	
	//image_yscale = max(1,-vspeed/12)
	//if vspeed!=0{lastYScale=-sign(vspeed)} else image_yscale = lastYScale
	image_yscale=(logHspeed>0)*2-1
	image_xscale=(logHspeed>0)*-2+1
	draw_self()

}

