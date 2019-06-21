//draw_healthbar(10,10,110+extraHPContainers*10,30,hp,c_black,c_red,c_green,1,1,1)
draw_set_font(fnt_normal)
draw_set_color(c_black)
draw_text(13,17+64,"HP:"+string(hp)+"/"+string(100+extraHPContainers*hpcontainervalue))
draw_set_color(c_white)
draw_text(10,15+64,"HP:"+string(hp)+"/"+string(100+extraHPContainers*hpcontainervalue))

var newhprange = 100+extraHPContainers*hpcontainervalue
var newhp = hp

var a = (newhprange - changingHPrange)/8
var b = (newhp - changingHP)/8

changingHPrange += a
changingHP += b

draw_sprite_stretched(spr_squareR,0,10,10,(changingHPrange)*4,64)
draw_sprite_stretched(spr_square,0,10,10,changingHP*4,64)
draw_sprite_stretched(spr_border,0,10,10,(changingHPrange)*2,64)

var viewportarray = room_get_viewport(rm_Cave2,0)
var viewwidth =  viewportarray[3]
var viewheight = viewportarray[4]
var size=200
var topx=viewwidth-size-viewwidth/20
var botx=viewwidth-viewwidth/20
draw_set_colour(c_black);
draw_rectangle(topx-5,viewportarray[4]/20-5,botx+5,size + viewheight/20+5,0)
draw_set_colour(c_white);
draw_rectangle(topx-5,viewportarray[4]/20-5,botx+5,size + viewheight/20+5,1)
draw_sprite(sp_marker,0,topx+size*obj_player.x/room_width,50 + size*obj_player.y/room_height)


