i=i+.025
image_angle+=i
time += h/(spd)

targety=  ((4*v)/(h*h))*(-time*(time-h +(pointh/2)*(v<0))) *-sign(v) 
vspeed = round( targety+startingy -y)
//y= startingy + ((4*v)/(h*h))*(time*(time-h))

 // add a horizontal derivitive if you can

hspeed =round(  startingx+time -x)


//																	USE THIS FOR ANIMATION
//image_index = ceil(abs(time)*FRAMES IN ANIMATION)/abs(pointh)
// image_angle = direction
if abs(time) > abs(pointh)  {
	if irandom(1)=1{
	instance_create_depth(x,y,-1,obj_enemy_bug)}else{
	instance_create_depth(x,y,-1,obj_enemy_floorBug)}
instance_destroy()	
}

if !instance_exists(obj_enemy_miniBossBug){
instance_destroy()	
}