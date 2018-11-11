draw_sprite(spr_Dark,0,x,y)
if fadein > 0{
draw_sprite_ext(spr_darkRoom1,0,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),1,1,0,c_white,fadein/50)
fadein--
}
///draw_sprite(sprLight,0,x,y)
