x= xOrigin //+ mouse_x*0.5)
y= yOrigin //+ mouse_y*0.5)


h = (mouse_x - obj_cameraFollowing.x )*0.02/// obj_cameraFollowing.sprite_width
v = (mouse_y - obj_cameraFollowing.y)*0.02
x=x+h
y=y+v
if place_meeting(x,y,obj_cameraFollowing){
	image_blend = $807070
draw_self()	
}
