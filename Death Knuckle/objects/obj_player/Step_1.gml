if frame1done =0{
	ini_open("save.data")
	ds_list_read(toolsList,ini_read_string("unlocks","toolsList",noone))
	ini_close()
	
	

	
	
	
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
//Loads a string and for each characer, adds to a temporary string and adds it to the hplist until it reaches "," and stops at ""
ini_open("save.data")

ds_list_read(obj_checkpointList.hpList,ini_read_string("data","usedHPcontainers",""))

ini_close()
//change hp containers to read a compressed list and use the items on that list to destroy




for (var i=0; i <  ds_list_size(obj_checkpointList.doorsList); i++){
	show_debug_message("doorsList "+string(ds_list_find_value(obj_checkpointList.doorsList,i)))
	
	for (var ii =0; ii< ds_list_size(obj_checkpointList.alldoorsList);ii++){
		show_debug_message("alldoorslist "+string(ds_list_find_value(obj_checkpointList.alldoorsList,ii)))
	var tempObj = ds_list_find_value(obj_checkpointList.alldoorsList,ii)
	//if variable_instance_exists(tempObj,obj_hpContainer){
	if tempObj=noone||!instance_exists(tempObj) then break;
	if ds_list_find_value(obj_checkpointList.doorsList,i) = noone then break;
	show_debug_message("wants "+string(ds_list_find_value(obj_checkpointList.doorsList,i)) + " got "+ string(tempObj.pointID))
	if string(tempObj.pointID) = string(ds_list_find_value(obj_checkpointList.doorsList,i)){
	tempObj.used=1
	}
	//}
	}
}	

//for each item in the list, checks all checkpoint items and deletes the ones on it
for (var i=0; i <  ds_list_size(obj_checkpointList.hpList); i++){
	show_debug_message("hpList "+string(ds_list_find_value(obj_checkpointList.hpList,i)))
	
	for (var ii =0; ii< ds_list_size(obj_checkpointList.allhpList);ii++){
		show_debug_message("allHPlist "+string(ds_list_find_value(obj_checkpointList.allhpList,ii)))
	var tempObj = ds_list_find_value(obj_checkpointList.allhpList,ii)
	//if variable_instance_exists(tempObj,obj_hpContainer){
	if tempObj=noone||!instance_exists(tempObj) then break;
	if ds_list_find_value(obj_checkpointList.hpList,i) = noone then break;
	show_debug_message("wants "+string(ds_list_find_value(obj_checkpointList.hpList,i)) + " got "+ string(tempObj.pointID))
	if string(tempObj.pointID) = string(ds_list_find_value(obj_checkpointList.hpList,i)){
	instance_destroy(tempObj)	
	}
	//}
	}
}
	//Doorslist is opened doors
	// alldoorslist is all doors

	
/*
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
	}*/

frame1done=1
}