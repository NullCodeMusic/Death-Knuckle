global.extraHPContainers = 0

if obj_fade.image_alpha = 1 {
ini_open("save.data")
	 roomName = ini_read_real("data","roomName",rm_Cave)
ini_close()
	randomize()
room_goto(roomName)
}
	
	



