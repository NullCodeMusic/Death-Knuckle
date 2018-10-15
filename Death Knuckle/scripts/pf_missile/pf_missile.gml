/*
    argument[0] bounce condition
    argument[1] inaccuracy
    argument[2] curve amount
    argument[3] target object
    argument[4] gravity
    argument[5] speed
    argument[6] acceleration
*/


if(instance_exists(argument[3])){
#region bounce

targ = argument[3]

if(argument[0]){
    direction = direction+180 
    tick = 0
}

#endregion
#region move

motion_set(direction+random_range(-argument[1],argument[1]),argument[5]+argument[6]*tick)
vspeed+=argument[4]*tick

#endregion
#region curve

if(abs(direction-point_direction(x,y,targ.x,targ.y))<=argument[2]){

    direction = point_direction(x,y,targ.x,targ.y)

}else{

if(x<targ.x){
	if(direction>point_direction(x,y,targ.x,targ.y)){direction+=argument[2]}
    if(direction<point_direction(x,y,targ.x,targ.y)){direction-=argument[2]}

}else{
    if(direction>point_direction(x,y,targ.x,targ.y)){direction-=argument[2]}
    if(direction<point_direction(x,y,targ.x,targ.y)){direction+=argument[2]}
}
}

#endregion
}