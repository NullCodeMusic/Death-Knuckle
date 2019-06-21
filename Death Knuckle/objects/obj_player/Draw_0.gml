/// @description Insert description here
// You can write your code in this editor
image_yscale = max(1,-vspeed/15)
image_xscale = (x<mouse_x)*2-1
image_speed = image_xscale*xInput




draw_sprite_ext(spr_greenCircle,0,x,y,1,1,0,c_white,alphaHP)


if setHitAnim=1 && staggerTime>0{
	if sprite_index!=sp_playerHurt then sprite_index=sp_playerHurt
} else {
	
	if(xInput!=0){sprite_index = sp_player_walk; image_speed = 1
		if(!place_meeting(x,y+5,obj_obstacle)&&!place_meeting(x,y+5,obj_jumpThru)){image_speed=0}
		}else{sprite_index =sp_player}
}
if(grappled=1){

	sprite_index=sp_player_jump
}
//default red 150 goes down

if red<255{image_blend =make_color_rgb(255,red,red)
	red+= (255-red)/80}
draw_self()



if grappled=1&&grappletime=0{
	var grappledirRad = grappledir*pi/180
	var targGrappleX = obj_grapplefist.x + cos(grappledirRad)*grappledist
	var targGrappleY = obj_grapplefist.y + sin(grappledirRad)*grappledist

draw_sprite(spr_checkpoint,0,targGrappleX,targGrappleY)}

draw_set_alpha(min(toolAlpha*3,1))
toolAlpha/=1.03
#region tools

i=0
iVOffset = 0
repeat(ds_list_size(toolsList)){
var drawTool = 9999
switch(ds_list_find_value(toolsList,i)){
case "grapple" :
drawTool = sp_grappleIcon
break
case "fistWave" :
drawTool = sp_waveIcon
break
}

if(sprite_exists(drawTool)){
iVOffset+=72
if(i=toolsSelect){draw_sprite(sp_selectedIcon,0,x-64,y-iVOffset)}
draw_sprite(drawTool,1,x-64,y-iVOffset)
}
i++

}
#endregion

draw_set_alpha(1)