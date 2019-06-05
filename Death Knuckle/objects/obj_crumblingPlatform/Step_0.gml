if refresh>0{
	
refresh--
sprite_index=sp_null
if refresh=0 { refresh=-1
	str=30
	touched=0}
}else{
sprite_index=sp_wood	
}

if touched=1 {
	if str>0 {str--}else{
	str=-1
	refresh=360
}
}

