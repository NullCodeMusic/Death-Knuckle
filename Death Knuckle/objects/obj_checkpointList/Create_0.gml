checkpointList = ds_list_create()
hpList = ds_list_create()
allhpList = ds_list_create()
alldoorsList = ds_list_create()
doorsList = ds_list_create()

ini_open("save.data")


	 ds_list_read(doorsList,ini_read_string("unlocks","doorsList",0))
	 
	// extraJump
	// grapple hook
	// swing hook
	// large melee
ini_close()