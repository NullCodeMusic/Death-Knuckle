if activated = 0 {
	if SpawnIfOnScreen(1,1) = 1 {
		activated = 1
		instance_create_layer(x,y,"Mobs",obj_enemy_miniBossBug)
		}
} 	


if distance_to_object(obj_player)>2000&&instance_exists(obj_enemy_miniBossBug){
instance_destroy(obj_enemy_miniBossBug)
activated=0
}