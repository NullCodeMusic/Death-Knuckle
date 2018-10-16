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

global.partTypFistTrail = part_type_create()
part_type_sprite(global.partTypFistTrail,spr_particle_fistTrail,true,true,false)
part_type_size(global.partTypFistTrail,1,1,-0.03,0)
part_type_life(global.partTypFistTrail,15,20)
part_type_speed(global.partTypFistTrail,1,2,0,0)

global.partTypEnemyRubble = part_type_create()
part_type_sprite(global.partTypEnemyRubble,spr_square,1,1,0)
part_type_life(global.partTypEnemyRubble,15,20)
part_type_gravity(global.partTypEnemyRubble,0.25,270)
part_type_direction(global.partTypEnemyRubble,0,180, 0,0);
part_type_speed(global.partTypEnemyRubble,6,7,0,0);




global.partEmtStream = part_emitter_create(global.partSys)

global.partTypMenacing = part_type_create()
part_type_sprite(global.partTypMenacing,spr_menacing,0,0,0)
part_type_alpha2(global.partTypMenacing,1,0)
part_type_direction(global.partTypMenacing,70,110,0.25,-2)
part_type_speed(global.partTypMenacing,1,2,-0.05,1)
part_type_life(global.partTypMenacing,30,40)
