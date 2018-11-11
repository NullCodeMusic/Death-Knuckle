
	time = time +spd*sign(h)//abs(h)/(spd*sign(h))

targety=  ((4*v)/(h*h))*(-time*(time-h +(pointh/2)*(v<0))) *-sign(v) 
vspeed = round( targety+startingy -y)
//y= startingy + ((4*v)/(h*h))*(time*(time-h))

 // add a horizontal derivitive if you can

hspeed =round(  startingx+time -x)

if abs(time) > abs(pointh) {
instance_destroy()	
}

