/*

argument[0] target x
argument[1] target y
argument[2] curve amount

*/

if(abs(direction-point_direction(x,y,argument[0],argument[1]))<=argument[2]){

    direction = point_direction(x,y,argument[0],argument[1])

}else{

if(x<argument[0]){
	if(direction>point_direction(x,y,argument[0],argument[1])){direction+=argument[2]}
    if(direction<point_direction(x,y,argument[0],argument[1])){direction-=argument[2]}

}else{
    if(direction>point_direction(x,y,argument[0],argument[1])){direction-=argument[2]}
    if(direction<point_direction(x,y,argument[0],argument[1])){direction+=argument[2]}
}
}