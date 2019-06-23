
if instance_exists(obj_enemyBossBeastMother) then activated =1  else activated = 0

if activated = 0{
	
while place_meeting(x,y,obj_player)
obj_player.x++
}

if activated=0 then mask_index = spr_null else mask_index = sp_waterfall


if activated=0 then image_alpha=0 else if activated=1 then image_alpha=1