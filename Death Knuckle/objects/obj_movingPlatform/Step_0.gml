/// @description Insert description here
// You can write your code in this editor
motion_add(direction,speed)
speed+=accel
speed=min(maxspeed,speed)
if(instance_place(x,y-maxspeed-1,obj_player)){with(obj_player){
	var moverID=obj_movingPlatform
	x+=moverID.hspeed
	y+=moverID.vspeed
	}}
if(instance_place(x,y,obj_pathDirection)){
	var dirID = instance_nearest(x,y,obj_pathDirection)
	direction=dirID.image_angle
	}
if(instance_place(x+hspeed,y+vspeed,obj_obstacle)){
direction=direction+180
while(instance_place(x+hspeed,y,obj_obstacle)){hspeed-=sign(hspeed)}
while(instance_place(x,y+vspeed,obj_obstacle)){vspeed-=sign(vspeed)}
}
