

if image_yscale < 3 {
	factor= factor +0.02
	image_yscale= (image_yscale+factor)*2
}else {
factor= factor/1.5
	image_yscale= (image_yscale+factor)*6
	time ++
	if time > 60{
	image_alpha=image_alpha-0.02
	if image_alpha <0.1 then instance_destroy()
	}
}

