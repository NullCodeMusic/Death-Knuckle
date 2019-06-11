if refresh>0{
	
refresh--
sprite_index=noone
if refresh=0 { refresh=-1
	str=30
	touched=0}
}else{
sprite_index=sp_breakingPlatform
}

if touched=1 {
	image_speed=5
	if str>0 {str--}else{
	str=-1
	refresh=360
	part_type_sprite(global.partTypEnemyRubble,spr_particle_rubble,1,1,0)
	part_emitter_region(global.partSys,global.partEmtSmallBurst,x-sprite_width/2,x+sprite_width/2,y-sprite_height,y,ps_shape_rectangle,ps_distr_linear)
	part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypEnemyRubble,5)
	touched=0
}
}

