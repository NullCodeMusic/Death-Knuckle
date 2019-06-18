

ini_open("save.data")
	activated=ini_read_real("unlocks","minibosskilled",0)
	if activated=1{
		instance_destroy(obj_minibossFall)
	}
		
ini_close()