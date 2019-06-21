speed =  0.05* point_distance(x,y,mouse_x,mouse_y)
direction = point_direction(x,y,mouse_x,mouse_y)

if timer > 0 then timer -- else image_speed =imgspd

if keyboard_check_pressed(vk_escape) then game_end()

if keyboard_check_pressed(ord("M")) { 
	
	window_set_cursor(cr_none)
	if window_get_fullscreen() then{ window_set_fullscreen(0)
	room_set_viewport(room,0,1,0,0,1440,810)
	} else {
	window_set_fullscreen(1)
	room_set_viewport(room,0,1,0,0,display_get_width(),display_get_height())
	}
}

image_angle= 10*(sin((pi*tick)/240))
image_xscale=2+0.20*(sin((pi*tick)/480))
image_yscale=image_xscale