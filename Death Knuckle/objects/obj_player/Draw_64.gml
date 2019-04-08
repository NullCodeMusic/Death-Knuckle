//draw_healthbar(10,10,110+extraHPContainers*10,30,hp,c_black,c_red,c_green,1,1,1)
draw_set_font(fnt_normal)
draw_set_color(c_black)
draw_text(13,47,"HP:"+string(hp)+"/"+string(100+extraHPContainers*hpcontainervalue))
draw_set_color(c_white)
draw_text(10,45,"HP:"+string(hp)+"/"+string(100+extraHPContainers*hpcontainervalue))

var newhprange = 100+extraHPContainers*hpcontainervalue
var newhp = hp

var a = (newhprange - changingHPrange)/8
var b = (newhp - changingHP)/8

changingHPrange += a
changingHP += b

draw_sprite_stretched(spr_squareR,0,10,10,(changingHPrange)*3,30)
draw_sprite_stretched(spr_square,0,10,10,changingHP*3,30)
