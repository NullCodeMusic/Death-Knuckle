/*
argument[0] = launch direction
argument[1] = orientation
1 is clockwise
-1 counter clockwise
argument[2] = distance
must be greater than 0
argument[3] = speed
argument[4] = angle step
argument[5] = target oject
*/

targ = argument[5] 
ang = point_direction(x,y,targ.x,targ.y)
direction = argument[0]
if(distance_to_object(targ)<argument[2]){
tick = 0
motion_set(direction,argument[3])
}