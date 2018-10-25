#region inital horiz collision 
if (place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&hspeed!=0){
	yy= vspeed
	for (i=0;i<17;i=i+1){
		
		if !place_meeting(x+hspeed,y+yy,obj_obstacle) {y= y+yy; break;} else yy--
	}
}
while(place_meeting(x+hspeed,y,obj_obstacle)&&hspeed!=0){
hspeed-= hspeed/abs(hspeed)
}
#endregion
#region vertical movement

vspeed = ymom
while(place_meeting(x,y+vspeed,obj_obstacle)&&vspeed!=0){
vspeed-= vspeed/abs(vspeed)
ymom=0
}
var jtID = instance_nearest(x,y,obj_jumpThru)
while(place_meeting(x,y+vspeed,jtID)&&vspeed!=0&&/*!place_meeting(x,y,jtID)&&*/y+55<jtID.y){
vspeed-= vspeed/abs(vspeed)
ymom=0
}

if(ymom<=ymax){ymom++}


#region vetical collsion

while(place_meeting(x+hspeed,y+vspeed,obj_obstacle)&&hspeed!=0){
hspeed-= hspeed/abs(hspeed)
vspeed-= vspeed/abs(vspeed)
ymom=0
}
#endregion
#endregion