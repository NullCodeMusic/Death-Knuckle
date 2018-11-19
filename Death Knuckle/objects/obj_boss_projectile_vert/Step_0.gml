

if image_yscale < 3.5 {
	factor= factor +0.02
	image_yscale= (image_yscale+factor)
}else {
factor= factor/1.25
	image_yscale= (image_yscale+factor)
	time ++
	if time > 60{
	mask_index = spr_null
	image_alpha/=1.1
	if image_alpha <0.1 then instance_destroy()
	}
}


if image_xscale <1.5 then {
	xfactor = xfactor +0.1
	image_xscale = image_xscale + xfactor
}
	