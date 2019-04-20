/// @description Insert description here
// You can write your code in this editor

#region Trigger Grapple
if(grapTrig){
grapRadius=150
if(distance_to_object(obj_player)<250){
grapToggle = 1
}
grapTrig=false
}
#endregion

#region Active Grapple
if(grapToggle=1){

targX = obj_player.x
targY = obj_player.y
distSpeed = distance_to_object(obj_player)
distAng = point_direction(targX,targY,x,y)
hAdd+=sign(lengthdir_x(distSpeed-grapRadius,distAng))
hAdd=sign(hAdd)*min(abs(maxSpd),abs(hAdd))

if(abs(x-targX)>grapRadius){
obj_player.hspeed=0
}
if(distSpeed>grapRadius){
obj_player.hspeed+=hAdd
obj_player.vspeed+=lengthdir_y(distSpeed-grapRadius,distAng)
}
}
#endregion

#region End Grapple

if(grapToggle>0&&mouse_check_button_released(mb_right)){
grapToggle=0
obj_player.ymom=-abs(hAdd)*1.5
obj_player.hspeed = hAdd*1.5
hAdd=0
}

#endregion