if atkTimeHeld>0&&cursorspeed>1{
cursorspeed --;	
	
} else if cursorspeed<4 cursorspeed++

if cursorspeed=4&&frame!=0{
cursortick++	
}

if cursortick<4 then cursortick++
if cursortick>cursorspeed{
	cursortick=2
	frame++
	if frame = 10 then frame=0
	switch(frame){
	case 0: cursor_sprite=sp_cursor0;break;	
	case 1: cursor_sprite=sp_cursor1;break;	
	case 2: cursor_sprite=sp_cursor2;break;	
	case 3: cursor_sprite=sp_cursor3;break;	
	case 4: cursor_sprite=sp_cursor4;break;	
	case 5: cursor_sprite=sp_cursor5;break;	
	case 6: cursor_sprite=sp_cursor6;break;	
	case 7: cursor_sprite=sp_cursor7;break;	
	case 8: cursor_sprite=sp_cursor8;break;	
	case 9: cursor_sprite=sp_cursor9;break;	
	}
	
}

var platlist = ds_list_create()
instance_place_list(x,y+1,obj_breakingPlatform,platlist,false)

for(var i = 0;i<ds_list_size(platlist);i++){
	
	plat=ds_list_find_value(platlist,i)
	plat.str --
	plat.offtime=30
if plat.str<=0{
plat.refresh=240
plat.str=plat.startingstr
part_type_sprite(global.partTypEnemyRubble,spr_particle_rubble,1,1,0)
with(plat){
part_emitter_region(global.partSys,global.partEmtSmallBurst,x-sprite_width/2,x+sprite_width/2,y-sprite_height,y,ps_shape_rectangle,ps_distr_linear)
	part_emitter_burst(global.partSys,global.partEmtSmallBurst,global.partTypEnemyRubble,5)
}
}
	
}


if place_meeting(x,y+1,obj_crumblingPlatform){
var plat= instance_place(x,y+1,obj_crumblingPlatform)
plat.touched=1
}


//if place_meeting(x,y,obj_movingPlatform){
	
//	for(var count=0; place_meeting(x,y,obj_movingPlatform)&&count<50;count++){
//if place_meeting(x,y-1,obj_movingPlatform){
//	y--
//}

//}



//}
