instance_destroy()
part_type_sprite(global.partTypEnemyRubble,argument[0],1,1,0)
part_emitter_region(global.partSys,global.partEmtSmallBurst,x-sprite_width/2,x+sprite_width/2,y-sprite_height,y,ps_shape_rectangle,ps_distr_linear)
	part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypEnemyRubble,5)