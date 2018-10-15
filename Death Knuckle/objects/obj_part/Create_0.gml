global.partSys = part_system_create()
global.partEmtSmallBurst = part_emitter_create(global.partSys)

global.partTypRubble = part_type_create()
part_type_sprite(global.partTypRubble,spr_particle_rubble,true,true,false)
part_type_gravity(global.partTypRubble,0.75,270)
part_type_direction(global.partTypRubble,0,180, 0,0);
part_type_speed(global.partTypRubble,6,8,0,0);
part_type_life(global.partTypRubble,15,25)

global.partTypSparks = part_type_create()
part_type_sprite(global.partTypSparks,spr_particle_sparks,true,true,false)
part_type_direction(global.partTypSparks,0,180, 0,0);
//part_type_orientation(global.partTypSparks,0,0,0,0,true)

part_type_life(global.partTypSparks,13,20)

global.partTypPlantRubble = part_type_create()
part_type_sprite(global.partTypPlantRubble,spr_particle_plantRubble,false,false,true)
part_type_direction(global.partTypPlantRubble,0,180, 0,0);
part_type_gravity(global.partTypPlantRubble,0.30,270)
part_type_speed(global.partTypPlantRubble,4,6,0,0);
part_type_life(global.partTypPlantRubble,15,40)
part_type_size(global.partTypPlantRubble,1,1.5,-0.03,0)