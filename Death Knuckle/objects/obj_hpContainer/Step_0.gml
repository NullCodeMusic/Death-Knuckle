if place_meeting(x,y,obj_cameraFollowing){
	
	
	time = time +1
	if time = 16*spd then time = 0
	
	yscl = .5*sin((time*pi)/(8*spd))+1
	xscl = .25*cos((time*pi)/(2*spd))+1
	
	y = startingy+2*sin((time*pi)/16)+1
}