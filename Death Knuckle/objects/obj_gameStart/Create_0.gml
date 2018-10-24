global.extraHPContainers = 0

show_debug_message("yeet")
ini_open("save.data")
	 roomName = ini_read_real("data","roomName",rm_Cave)
ini_close()
room_goto(roomName)
	randomize()
	
	



