if activated = 0 {
	if floor(x/1152) = floor(obj_player.x/1152) && floor(y/672) = floor(obj_player.y/672) {
		activated = 1
		instance_create_layer(x,y,"Mobs",obj_enemy_warg)
		instance_destroy()}
}