if frame1done =0{
for (var i=0; i !=  ds_list_size(obj_checkpointList.checkpointList); i++){

	 var checkpointID = ds_list_find_value(obj_checkpointList.checkpointList,i)
	ini_open("save.data")
		var readPointID = ini_read_real("data","checkpoint",1)
		//var readPointID = ds_list_find_value(obj_checkpointList.checkpointList,i)
	ini_close()

	if checkpointID.pointID = readPointID {
		x=checkpointID.x
		y=checkpointID.y
		obj_cameraFollowing.xOrigin = checkpointID.x
		obj_cameraFollowing.yOrigin = checkpointID.y
		obj_cameraFollowing.x = checkpointID.x
		obj_cameraFollowing.y = checkpointID.y
		obj_cameraPlace.x = checkpointID.x
		obj_cameraPlace.y = checkpointID.y
		obj_cameraFollowing.speed = 0
		
	}
}
for (var i=0; i !=  ds_list_size(obj_checkpointList.hpList); i++){

	 var checkpointID = ds_list_find_value(obj_checkpointList.hpList,i)
	ini_open("save.data")
	
	var list = ds_list_create()
	var collectedstring=""
	
	for(i=0;i< ds_list_size(obj_checkpointList.hpList);i++){
			HPstring=HPstring+string(ds_list_find_value(obj_checkpointList.hpList,i))+","
		}//each item in the list add to a string then save it   ds_list_add(obj_checkpointList.checkpointList,pickupID)
		//var readPointID = ini_read_real("data","usedHPcontainers",0)
		var HPstring = ini_read_string("data","usedHPcontainers","")
	for(var ii = 0; i<string_length(HPstring);i++){
	if string_char_at(HPstring,i)=" "{break;}
	if string_char_at(HPstring,i)!=","{collectedstring+=string_char_at(HPstring,i)} else{
	ds_list_add(list,collectedstring)
	collectedstring=""
	}
	}
	
	
		//var readPointID = ini_read_real("data","usedHPcontainers",0)
		
		//var readPointID = ds_list_find_value(obj_checkpointList.checkpointList,i)
		
	ini_close()
	
	for(i=0;i<ds_list_size(list);i++){
	var readPointID = ds_list_find_value(list,i)
	if checkpointID.pointID = readPointID {
		instance_destroy(checkpointID)
		
	}
	}
}
frame1done=1
}