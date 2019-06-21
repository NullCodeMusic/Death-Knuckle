if (DrawIfOnScreen(100,100)){
	
	
	time = time +1
	if time = 16*spd then time = 0
	
	yscl = .4*sin((time*pi)/(8*spd))+1
	xscl = .25*cos((time*pi)/(2*spd))+1
	
	bluralpha = sin((time*pi)/(5*spd))
	
	y = startingy+2*sin((time*pi)/(2*spd))+1
	if ds_list_find_index(obj_player.toolsList,"grapple")!=-1{
	instance_destroy()	
	}
}