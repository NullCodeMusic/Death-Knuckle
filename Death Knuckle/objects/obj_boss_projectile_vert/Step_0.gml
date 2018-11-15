

if image_yscale < 3 {
	factor= factor +0.02
	image_yscale= (image_yscale+factor)
}else {
factor= factor/1.25
	image_yscale= (image_yscale+factor)
	time ++
	if time > 60{
	image_alpha=image_alpha-0.02
	if image_alpha <0.1 then instance_destroy()
	}
}


if image_xscale <2 then {
	xfactor = xfactor +0.1
	image_xscale = image_xscale + xfactor
}
	