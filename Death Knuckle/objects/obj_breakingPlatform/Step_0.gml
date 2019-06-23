if refresh>0{
	
refresh--
sprite_index=noone
}else{
sprite_index=sp_supportBeam	
}

if offtime=0{
	if str<startingstr{
	str+=0.5
	if str>startingstr then str=startingstr
	}
} else{
	offtime--	
}