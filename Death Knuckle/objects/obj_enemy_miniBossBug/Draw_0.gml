if place_meeting(x,y,obj_cameraFollowing){
	
	//image_yscale = max(1,-vspeed/12)
	//if vspeed!=0{lastYScale=-sign(vspeed)} else image_yscale = lastYScale

	draw_self()

}

if red<255{image_blend =make_color_rgb(255,red,red)
	red+= (255-red)/80}
draw_self()