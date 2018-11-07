/// @description Insert description here
// You can write your code in this editor
image_yscale = max(1,-vspeed/15)
image_xscale = (x<mouse_x)*2-1
image_speed = image_xscale*xInput




if setHitAnim=1 && staggerTime>0{
	if sprite_index!=sp_playerHurt then sprite_index=sp_playerHurt
} else {
	
	if(xInput!=0){sprite_index = sp_player_walk}else{sprite_index =sp_player}
}
shader_set(shader_Outline)
//texelW = texture_get_texel_width(sprite_get_texture(sprite_index,image_index))
//texelH = texture_get_texel_height(sprite_get_texture(sprite_index,image_index))
//shader_set_uniform_f(upixelW,texelW)
//shader_set_uniform_f(upixelH,texelH)
draw_self()
shader_reset()
