if obj_player.grappletomouse=1{
	var targetspot=instance_nearest(mouse_x,mouse_y,obj_grappleSpot)
	x=targetspot.x
	y=targetspot.y
image_alpha=max(0,50/point_distance(mouse_x,mouse_y,targetspot.x,targetspot.y))	
image_yscale = 2/max((point_distance(mouse_x,mouse_y,targetspot.x,targetspot.y)-100)/50,1)
//image_yscale=1/(point_distance(mouse_x,mouse_y,targetspot.x,targetspot.y)/4-100)
image_xscale=image_yscale
image_angle+=10/max((point_distance(mouse_x,mouse_y,targetspot.x,targetspot.y)-100)/50,1)	
}

if obj_player.grappled=1 then image_alpha=0