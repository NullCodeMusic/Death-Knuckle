/// @description Insert description here
// You can write your code in this editor
image_yscale = max(1,-vspeed/15)
image_xscale = (x<mouse_x)*2-1
if(xInput!=0){sprite_index = sp_player_walk}else{sprite_index =sp_player}
draw_self()