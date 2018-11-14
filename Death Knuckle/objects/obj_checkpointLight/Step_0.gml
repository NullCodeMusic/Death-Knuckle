alpha = sin((tick * pi )/ 80)-.5
xscl = sin((tick*pi)/80)+0.5
yscl = .5*sin((tick*pi)/80)+0.5

image_xscale = 1*sin((tick * pi )/ 80)+1
image_yscale = 1*sin((tick * pi )/ 80)+1
image_index = ceil((15*tick)/80)
tick ++

if tick > 80 then instance_destroy()