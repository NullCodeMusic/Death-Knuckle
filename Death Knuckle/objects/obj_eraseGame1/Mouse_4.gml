global.extraHPContainers = 0
ini_open("save.data")
var emptyList = ds_list_create()
	 ini_write_real("data","roomName",rm_Cave2)
	 ini_write_real("data","checkpoint",1)
	 ini_write_real("unlocks","walljump",0)
	 ini_write_real("unlocks","hpcontainers",0)
	 
	 ini_write_real("unlocks","jumps",0)
	 ini_write_real("unlocks","grapple",0)
	 ini_write_real("unlocks","aoeMelee",0)
	 ini_write_real("unlocks","minibosskilled",0)
	 ini_write_string("unlocks","toolsList", ds_list_write(emptyList))
	 
	

     ini_write_string("unlocks","doorsList",ds_list_write(emptyList))
	 ini_write_string("data","usedHPcontainers",ds_list_write(emptyList))
	 ini_write_string("unlocks","tools",ds_list_write(emptyList))
	  ds_list_add(emptyList,0)
ini_close()
show_debug_message("save reset")
image_index = 2