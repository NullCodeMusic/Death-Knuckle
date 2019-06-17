if comeBack=1 { 

direction=point_direction(x,y,obj_player.x,obj_player.y)
speed=point_distance(x,y,obj_player.x,obj_player.y)/(2-speedup/20)
if speedup!=20 then speedup++
if place_meeting(x,y,obj_player){
obj_player.attacking=0
instance_destroy()
}
}else if grappled =0{
	//obj_player.grappletime--
	direction=point_direction(x,y,targetSpot.x,targetSpot.y)
	speed=point_distance(x,y,targetSpot.x,targetSpot.y)/2
	
	if place_meeting(x,y,targetSpot){
	speed=0	
	grappled=1
	obj_player.grappled=1
	}
	
}

if grappled=1{
	
x=targetSpot.x
y=targetSpot.y

}