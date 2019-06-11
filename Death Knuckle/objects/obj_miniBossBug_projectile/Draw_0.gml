
hscl =0.25*sin((time2*pi)/10)+3.75
vscl =0.25*sin((time2*pi)/10)+3.75

alp = 0.25*sin((time2*pi)/10)

time2++

if time = room_speed then time = 0
if frame1 = 1 {
	angle ++
	draw_sprite_ext(spr_part_bugRubble,0,startingx+pointh,startingy-pointv,hscl,vscl,angle,c_white,alp)
	//draw_sprite(spr_square,0,x+h,y-v)
	
}

draw_self()

