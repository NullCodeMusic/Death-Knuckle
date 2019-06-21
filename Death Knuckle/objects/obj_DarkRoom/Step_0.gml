if playerIn =1 {
if image_alpha > 0 then image_alpha = image_alpha - 0.05 else image_alpha = 0
playerIn = 0

} else if image_alpha <1 then image_alpha = image_alpha +0.02 else image_alpha=1

//if place_meeting(x,y,obj_player){
//image_alpha=image_alpha - 0.01
//} else image_alpha = image_alpha +0.2