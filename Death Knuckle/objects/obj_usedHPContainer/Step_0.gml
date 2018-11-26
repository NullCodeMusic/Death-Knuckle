image_alpha=image_alpha-0.01
if image_alpha < 0.1 then instance_destroy()
time=time+0.1
show_debug_message("borg")

x+=(obj_player.x-x)/2
y+=(obj_player.y-y)/2