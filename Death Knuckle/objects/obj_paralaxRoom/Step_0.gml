
if (is_colliding /2 = 5){

var placex = (obj_player.x-x) / (sprite_width)
var placey = (obj_player.y-y) / (sprite_height)
if place_meeting(x,y,obj_paralax1){
var paralax = instance_place(x,y,obj_paralax1) //closest

paralax.x = x - sprite_width*placex/10
paralax.y = y - sprite_width*placey/10
}
if place_meeting(x,y,obj_paralax2){
var paralax = instance_place(x,y,obj_paralax2)		

paralax.x = x - sprite_width*placex/8
paralax.y = y - sprite_width*placey/8
}
if place_meeting(x,y,obj_paralax3){
var paralax = instance_place(x,y,obj_paralax3)	//furthest

paralax.x = x - sprite_width*placex/5
paralax.y = y - sprite_width*placey/5
}
}


