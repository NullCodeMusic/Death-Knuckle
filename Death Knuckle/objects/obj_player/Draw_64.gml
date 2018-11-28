draw_healthbar(10,10,310,30,hp,c_black,c_red,c_green,1,1,1)
draw_text(310,15,string(hp))
if extraHPContainers >0{
	for( var i =0;i<extraHPContainers;i++;){
	
	draw_sprite_ext(spr_square,0,310+((i+1)*60),30,1,1,0,c_white,1)
	}
}