draw_healthbar(10,10,110+extraHPContainers*10,30,hp,c_black,c_red,c_green,1,1,1)
draw_text(10,35,string(hp))

var newhprange = 100+extraHPContainers*hpcontainervalue
var newhp = hp

var a = (newhprange - changingHPrange)/8
var b = (newhp - changingHP)/8

changingHPrange += a
changingHP += b

draw_sprite_stretched(spr_squareR,0,10,10,(changingHPrange)*3,30)
draw_sprite_stretched(spr_square,0,10,10,changingHP*3,30)
