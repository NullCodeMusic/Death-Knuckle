if place_meeting(x,y,obj_cameraFollowing){
	
	
	time = time +1
	if time = 16*spd then time = 0
	
	yscl = .4*sin((time*pi)/(8*spd))+1
	xscl = .25*cos((time*pi)/(2*spd))+1
	
	bluralpha = sin((time*pi)/(5*spd))
	
	y = startingy+2*sin((time*pi)/(2*spd))+1
}