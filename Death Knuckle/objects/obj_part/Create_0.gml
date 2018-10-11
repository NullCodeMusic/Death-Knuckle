global.partSys = part_system_create()
global.partEmtSmallBurst = part_emitter_create(global.partSys)
global.partTypRubble = part_type_create()
part_type_sprite(global.partTypRubble,spr_particle_rubble,true,true,false)
part_type_gravity(global.partTypRubble,0.75,270)
part_type_direction(global.partTypRubble,0,180, 0,0);
part_type_speed(global.partTypRubble,6,8,0,0);
part_type_life(global.partTypRubble,15,25)