
hscl =0.5*sin((time2*pi)/10)+.5
vscl =0.5*sin((time2*pi)/10)+.5

alp = 0.25*sin((time2*pi)/10)+.5

time2++

if time = room_speed then time = 0
if frame1 = 1 {
	angle ++
	draw_sprite_ext(sp_acidProjectile_2,0,startingx+pointh,startingy-pointv,hscl,vscl,angle,c_white,alp)
	//draw_sprite(spr_square,0,x+h,y-v)
	
}

draw_self()

