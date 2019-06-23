alpha = sin((tick * pi )/ 80)-.5
xscl = sin((tick*pi)/80)+0.5
yscl = .5*sin((tick*pi)/80)+0.5

image_xscale = 1*sin((tick * pi )/ 80)+1
image_yscale = 1*sin((tick * pi )/ 80)+1
image_index = ceil((15*tick)/80)
tick ++
if tick = 70{
part_type_sprite(global.partTypEnemyRubble,spr_checkpoint,1,1,0)
part_emitter_region(global.partSys,global.partEmtSmallBurst,x-sprite_width/2,x+sprite_width/2,y-sprite_height,y,ps_shape_ellipse,ps_distr_invgaussian)
	part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypEnemyRubble,15)	
}
if tick > 80 then instance_destroy()

