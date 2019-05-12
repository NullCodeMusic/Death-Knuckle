if camera_get_view_x(view_camera[0]) - argument[0] < x && x < camera_get_view_x(view_camera[0]) + argument[0] +camera_get_view_width(view_camera[0]) 
&& camera_get_view_y(view_camera[0]) - argument[1] < y && y < camera_get_view_y(view_camera[0]) + argument[1] +camera_get_view_width(view_camera[0]){
return(1);} else { return(0);}

//arg 0 is hborder
//arg 1 is vborder