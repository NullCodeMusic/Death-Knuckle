/// @description Insert description here
// You can write your code in this editor
image_yscale = max(1,-vspeed/15)
image_xscale = (x<mouse_x)*2-1
image_speed = image_xscale*xInput




draw_sprite_ext(spr_greenCircle,0,x,y,1,1,0,c_white,alphaHP)


if setHitAnim=1 && staggerTime>0{
	if sprite_index!=sp_playerHurt then sprite_index=sp_playerHurt
} else {
	
	if(xInput!=0){sprite_index = sp_player_walk}else{sprite_index =sp_player}
}

draw_self()


