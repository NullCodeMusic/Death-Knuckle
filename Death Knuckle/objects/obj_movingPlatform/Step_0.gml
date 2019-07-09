/// @description Insert description here
// You can write your code in this editor


motion_add(direction,speed)
speed+=accel
speed=min(maxspeed,speed)
//if(instance_place(x,y-1,obj_player)){
//	with(obj_player){
//	var moverID=obj_movingPlatform
//	x+=moverID.hspeed
//	y+=moverID.vspeed
//	}}
if(instance_place(x+hspeed,y+vspeed,obj_obstacle))&&!instance_place(x+hspeed,y+vspeed,obj_movingPlatform)&&!instance_place(x,y,obj_obstacle){
direction=direction+180
speed=1
while(instance_place(x+hspeed,y,obj_obstacle)&&round(abs(hspeed))!=0){hspeed-=sign(hspeed)}
while(instance_place(x,y+vspeed,obj_obstacle)&&round(abs(vspeed))!=0){vspeed-=sign(vspeed)}
}

if place_meeting(x+hspeed,y+vspeed,obj_pathDirection){
	var dirobj = instance_place(x+hspeed,y+vspeed,obj_pathDirection)
	direction=dirobj.image_angle
	
}
