
randomize()

if obj_fade.image_alpha = 1 {
ini_open("save.data")
	 roomName = ini_read_real("data","roomName",rm_Cave)
ini_close()
room_goto(roomName)
	

}
	
	



