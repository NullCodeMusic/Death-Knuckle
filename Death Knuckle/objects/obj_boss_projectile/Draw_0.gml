
hscl =1//0.25*sin((time*pi)/10)+.25
vscl =1//0.25*sin((time*pi)/10)+.25
image_angle++
alp =1// 0.25*sin((time*pi)/10)


if time = room_speed then time = 0
if frame1 = 1 {
	draw_sprite_ext(spr_square,0,startingx+pointh,startingy+pointv,hscl,vscl,image_angle,c_white,alp)
	show_debug_message("DJFJKL")
}
time ++
draw_self()

