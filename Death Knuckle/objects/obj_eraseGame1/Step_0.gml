

	keyboard_check_pressed(vk_numpad1){
	global.extraHPContainers = 0
ini_open("save.data")
	 ini_write_real("data","roomName",rm_Cave)
	 ini_write_real("data","checkpoint",1)
ini_close()
}

	keyboard_check_pressed(vk_numpad2){
	global.extraHPContainers = 0
ini_open("save.data")
	 ini_write_real("data","roomName",rm_Cave)
	 ini_write_real("data","checkpoint",2)
ini_close()
}
	keyboard_check_pressed(vk_numpad3){
	global.extraHPContainers = 0
ini_open("save.data")
	 ini_write_real("data","roomName",rm_Cave)
	 ini_write_real("data","checkpoint",3)
ini_close()
}



