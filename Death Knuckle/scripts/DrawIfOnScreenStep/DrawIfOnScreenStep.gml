//if camera_get_view_x(view_camera[0]) - hborder < x < camera_get_view_x(view_camera[0]) + hborder +camera_get_view_width(view_camera[0]) && camera_get_view_y(view_camera[0]) - vborder < y < camera_get_view_y(view_camera[0]) + vborder +camera_get_view_width(view_camera[0]){
//visible = true} else { visible = false}

//if point_distance(x,y,obj_player.x,obj_player.y) > 1152 then visible = false
//else visible = true

//if camera_get_view_x(view_camera[0]) - hborder < x && x < camera_get_view_x(view_camera[0]) + hborder +camera_get_view_width(view_camera[0]) 
//&& camera_get_view_y(view_camera[0]) - vborder < y && y < camera_get_view_y(view_camera[0]) + vborder +camera_get_view_width(view_camera[0]){
//visible = true} else { visible = false}

if floor(x/1152)= floor(obj_player.x/1152) && floor(y/672) = floor(obj_player.y/672){
visible = true} else visible = false
