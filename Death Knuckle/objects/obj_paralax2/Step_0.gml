/// @description Insert description here
// You can write your code in this editor

//if(instance_exists(obj_player)){x = (xOrigin + obj_cameraFollowing.x mod 1152 - 576)
//	y = (yOrigin + obj_cameraFollowing.y mod 672 - 336)
//	}

x= xOrigin //+ mouse_x*0.5)
y= yOrigin //+ mouse_y*0.5)

//speed =  0.5* point_distance(x,y,mouse_x,mouse_y)
//direction = point_direction(x,y,mouse_x,mouse_y)
h = (mouse_x - obj_cameraFollowing.x )/// obj_cameraFollowing.sprite_width

x=x+h