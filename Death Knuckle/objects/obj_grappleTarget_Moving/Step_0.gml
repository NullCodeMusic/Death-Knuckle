if obj_player.grappletomouse=1{
	var targetspot=instance_nearest(mouse_x,mouse_y,obj_grappleSpot)
	x=targetspot.x
	y=targetspot.y
image_alpha=max(0,50/point_distance(mouse_x,mouse_y,targetspot.x,targetspot.y)+400)	
image_yscale = 1.5/max((point_distance(mouse_x,mouse_y,targetspot.x,targetspot.y)-300)/50,1)
//image_yscale=1/(point_distance(mouse_x,mouse_y,targetspot.x,targetspot.y)/4-100)
image_xscale=image_yscale
image_angle+=8/max((point_distance(mouse_x,mouse_y,targetspot.x,targetspot.y)-100)/50,1)	
}

if obj_player.grappled=1 then image_alpha=0

if place_meeting(x+hspeed,y+vspeed,obj_obstacle){
direction+=180	
}

if place_meeting(x,y,obj_pathDirectionGrapple){
var pathDirObj = instance_place(x,y,obj_pathDirectionGrapple)
direction=pathDirObj.image_angle	
}