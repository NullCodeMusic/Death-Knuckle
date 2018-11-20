global.extraHPContainers = 0
ini_open("save.data")
	 ini_write_real("data","roomName",rm_Cave)
	 ini_write_real("data","checkpoint",1)
	 ini_write_real("unlocks","walljump",0)
	 ini_write_real("unlocks","hpcontainers",0)
ini_close()
show_debug_message("save reset")
image_index = 2