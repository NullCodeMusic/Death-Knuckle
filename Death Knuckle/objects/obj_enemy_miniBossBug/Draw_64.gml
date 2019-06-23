/// @description Insert description here
// You can write your code in this editor

newhp+= (hp-newhp)/20
var perc=4
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(c_black)
draw_sprite_stretched(sp_bgTile,0,(1920-300*perc)/2-2,798,300*perc+4,34)
draw_set_color(c_white)
draw_sprite_stretched(spr_squareR,0,(1920-300*perc)/2,800,newhp*perc,30)
draw_sprite_stretched(spr_square,0,(1920-300*perc)/2,800,hp*perc,30)

draw_set_color(c_black)
draw_text_transformed((1920)/2,818,"Bug Hive: "+string(hp)+"/"+string(200),2,2,0)
draw_set_color(c_white)
draw_text_transformed((1920)/2,814,"Bug Hive: "+string(hp)+"/"+string(200),2,2,0)




