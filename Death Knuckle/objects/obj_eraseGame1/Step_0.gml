image_speed =0

if keyboard_check_pressed(ord("P")){
presses ++	
}
if presses = 7 && pass = false{
	if keyboard_check_pressed(ord("Q")) { pass = true
	show_debug_message("Welcome back Master Wayne")}
}
if pass = true{
	if keyboard_check_pressed(vk_numpad1){
	global.extraHPContainers = 0
ini_open("save.data")
	 ini_write_real("data","roomName",rm_Cave)
	 ini_write_real("data","checkpoint",1)
ini_close()
show_debug_message("set to 1")
}
	if keyboard_check_pressed(vk_numpad2){
	global.extraHPContainers = 0
ini_open("save.data")
	 ini_write_real("data","roomName",rm_Cave)
	 ini_write_real("data","checkpoint",2)
ini_close()
show_debug_message("set to 2")
}
	if keyboard_check_pressed(vk_numpad3){
	global.extraHPContainers = 0
ini_open("save.data")
	 ini_write_real("data","roomName",rm_Cave)
	 ini_write_real("data","checkpoint",3)
ini_close()
show_debug_message("set to 3")
}
}



		//ini_write_real("data","checkpoint",instance_place(x,y,obj_checkpoint).pointID)
		//ini_write_string("data","roomName",string(room))
