speed =  0.05* point_distance(x,y,mouse_x,mouse_y)
direction = point_direction(x,y,mouse_x,mouse_y)

if timer > 0 then timer -- else image_speed =imgspd

if keyboard_check_pressed(vk_escape) then game_end()

if keyboard_check_pressed(ord("M")) { if window_get_fullscreen() then window_set_fullscreen(0)else window_set_fullscreen(1)}