image_xscale*=1.1
image_yscale=image_xscale
if sprite_index=0{
	image_alpha=1
}else {
	image_alpha=(18-image_index)/12	
}

draw_self()