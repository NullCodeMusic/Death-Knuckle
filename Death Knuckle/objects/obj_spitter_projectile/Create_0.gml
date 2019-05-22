stagger=5
damage=8
knockback=5
maxspd=15



var xdist =point_distance(x,0,obj_player.x,0)



if xdist<5{
	
var heightdif = xdist
	
}else{
	
var heightdif = 5 + (xdist-5)*.5

}

direction = point_direction(x,y,obj_player.x,obj_player.y-heightdif*2)
speed = 10