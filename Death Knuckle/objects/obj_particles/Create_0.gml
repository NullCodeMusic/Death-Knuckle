global.rubblePartType = part_type_create();
part_type_sprite(global.rubblePartType , spr_square, 1, 0, 0);
//part_type_size(global.rubble, 1, 3, 0, 0);
//part_type_scale(global.rubble, 1, 1);
//part_type_colour1(global.rubble, c_white);
//part_type_alpha2(global.p1, 1, 0);
part_type_speed(global.rubblePartType, 2, 4, 0, 0);
part_type_direction(global.rubblePartType, 0, 180, 0, 0);
part_type_gravity(global.rubblePartType, 0.20, 270);
part_type_orientation(global.rubblePartType, 0, 0, 0, 0, 1);
//part_type_blend(global.p1, 1);
part_type_life(global.rubblePartType, 15, 60);

