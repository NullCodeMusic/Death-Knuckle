if(instance_exists(obj_player)){
targ = obj_player
//image_angle = point_direction(x,y,mouse_x,mouse_y)
image_index = 1+(targ.x>mouse_x)
depth= -5+(targ.x>mouse_x)*5
}