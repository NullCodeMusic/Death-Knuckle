var percent = obj_player.atkTimeHeld/60
if (percent){
	draw_sprite_ext(sp_fist1,mouse_x>x,x,y,percent*2,percent*2,point_direction(x,y,mouse_x,mouse_y),c_white,1)
}

if instance_exists(obj_fist)||instance_exists(obj_grapplefist)||instance_exists(obj_fistWave){
image_alpha=0	
}else image_alpha=1

draw_self()