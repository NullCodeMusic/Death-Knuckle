var percent = obj_player.atkTimeHeld/60
if (percent){
	draw_sprite_ext(sp_cursor,0,x,y,percent*2,percent*2,0,c_white,1)
}

draw_self()