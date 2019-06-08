var newhp = hp

draw_sprite_stretched(spr_squareR,0,10,800,newhp*6,30)
draw_set_color(c_black)
draw_text(13,603,"Bug hive:"+string(hp)+"/"+string(200))
draw_set_color(c_white)
draw_text(10,600,"Bug hive:"+string(hp)+"/"+string(200))
