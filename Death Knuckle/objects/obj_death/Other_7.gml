
ini_open("save.data")
		var roomName = ini_read_string("data","roomName","rm_Cave")
ini_close()
room_goto(roomName)