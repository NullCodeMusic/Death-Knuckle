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
frame1done=1
}