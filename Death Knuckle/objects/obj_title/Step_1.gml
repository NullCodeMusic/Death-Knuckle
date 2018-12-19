/// @description Insert description here
// You can write your code in this editor
tick ++
if tick = 240 then tick = 0

ywave= -20*(sin((pi*tick)/120))

y= camera_get_view_height(view_camera[0])/3 + ywave 
x= camera_get_view_width(view_camera[0])/2

