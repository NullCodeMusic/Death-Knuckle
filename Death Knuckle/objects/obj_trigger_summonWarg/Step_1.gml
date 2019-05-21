if activated = 0 {
	if SpawnIfOnScreen(1,1) = 1 {
		activated = 1
		instance_create_layer(x,y,"Mobs",obj_enemy_warg)
		}
}