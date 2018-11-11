draw_sprite(sprDark,0,x,y)
if fadein > 0{
draw_sprite_ext(spr_darkRoomCentered,0,obj_cameraFollowing.x,obj_cameraFollowing.y,1,1,0,c_white,fadein/50)
fadein--
}
///draw_sprite(sprLight,0,x,y)
