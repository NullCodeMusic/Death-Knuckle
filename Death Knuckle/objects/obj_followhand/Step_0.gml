/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_player)){
targ = obj_player
if(mouse_check_button(mb_left)){click++}else{click=0}
if click>10 {click = 12}
x = targ.x-15 +random_range(-click,click)
y = targ.y +random_range(-click,click)
image_angle = point_direction(x,y,mouse_x,mouse_y)
image_alpha = 1-(instance_exists(obj_fist) or instance_exists(obj_rocketFist) )
image_index = 1+(targ.x>mouse_x)
depth= -5+(targ.x>mouse_x)*5
}