


//wspd = abs(w-576)/spd
//hspd = abs(h-324)/spd

//w=w-wspd
//h=h-hspd


//camera_set_view_size(view_camera[0],w,h)


hspeed = ((camera_get_view_width(view_camera[0])/2)-x)/spd
vspeed = ((camera_get_view_height(view_camera[0])/2)-y)/spd

image_xscale += (3-image_xscale)/spd
image_yscale += (3-image_yscale)/spd
//x= camera_get_view_width(view_camera[0])/2
//y= camera_get_view_height(view_camera[0])/2

if image_index=11{
	part_type_sprite(global.partTypEnemyRubble,spr_checkpoint,1,1,0)
part_emitter_region(global.partSys,global.partEmtSmallBurst,x-sprite_width/2,x+sprite_width/2,y-sprite_height,y,ps_shape_ellipse,ps_distr_invgaussian)
	part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypEnemyRubble,20)
}