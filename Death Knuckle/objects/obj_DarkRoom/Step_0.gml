if floor(x/1152) = floor(obj_player.x/1152) && floor(y/672) = floor(obj_player.y/672){
if image_alpha > 0 then image_alpha = image_alpha - 0.05 else image_alpha = 0

show_debug_message("eyafefea")
} else if image_alpha < 0.8 then image_alpha = image_alpha +0.02 else image_alpha=0.8

//if place_meeting(x,y,obj_player){
//image_alpha=image_alpha - 0.01
//} else image_alpha = image_alpha +0.2