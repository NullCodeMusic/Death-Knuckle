/// @description Insert description here
// You can write your code in this editor
if(ds_list_find_value(obj_player.toolsList,obj_player.toolsSelect)="grapple") {
draw_self()
draw_set_alpha(max(0,50/point_distance(mouse_x,mouse_y,x,y)+400))
draw_circle(x,y,range,1)
}