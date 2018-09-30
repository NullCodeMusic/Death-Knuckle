/*

argument[0] target x
argument[1] target y
argument[2] curve amount

*/

x2 = argument[0]
y2 = argument[1]
curve = argument[2]

if(abs(direction-point_direction(x,y,x2,y2))<=y2){

    direction = point_direction(x,y,x2,y2)

}else{

if(x<x2){
	if(direction>point_direction(x,y,x2,y2)){
		//direction+=curve
		direction+=curve
		//if(direction<point_direction(x,y,x2,y2)){
		//	direction-=curve}
		}
    if(direction<point_direction(x,y,x2,y2)){
		//direction-=curve
		direction-=curve
		}

}else{
    if(direction>point_direction(x,y,x2,y2)){
		direction-=curve
		}
    if(direction<point_direction(x,y,x2,y2)){
		direction+=curve
		}
}
}

