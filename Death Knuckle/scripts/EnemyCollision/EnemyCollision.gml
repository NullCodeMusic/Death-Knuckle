
	
	
	// argument 0 = obj_enemy_yaddayadda
	// arg 1 = invul time
	// arg 2 = stagger time
	// arg 3 damage to hp
	// arg 4 ymom 
	

		invulTime = argument[1]
		staggerTime = argument[2]
		setHitAnim = 1
		if place_meeting(x,y,argument[0]){
		var enemyid = instance_place(x,y,argument[0])
		if (enemyid.x-x)!=0{
			hitDirection = (enemyid.x-x)/abs(enemyid.x - x)} else hitDirection=0
		hp=hp-argument[3]
		ymom=-argument[4]
		}

	