
if place_meeting(x+hspeed,y+vspeed,obj_obstacle){
direction+=180	
}

if place_meeting(x,y,obj_pathDirectionGrapple){
var pathDirObj = instance_place(x,y,obj_pathDirectionGrapple)
direction=pathDirObj.image_angle	
}