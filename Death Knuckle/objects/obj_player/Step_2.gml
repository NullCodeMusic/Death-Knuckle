if atkTimeHeld>0&&cursorspeed>1{
cursorspeed --;	
	
} else if cursorspeed<4 cursorspeed++

if cursorspeed=4&&frame!=0{
cursortick++	
}

if cursortick<4 then cursortick++
if cursortick>cursorspeed{
	cursortick=2
	frame++
	if frame = 10 then frame=0
	switch(frame){
	case 0: cursor_sprite=sp_cursor0;break;	
	case 1: cursor_sprite=sp_cursor1;break;	
	case 2: cursor_sprite=sp_cursor2;break;	
	case 3: cursor_sprite=sp_cursor3;break;	
	case 4: cursor_sprite=sp_cursor4;break;	
	case 5: cursor_sprite=sp_cursor5;break;	
	case 6: cursor_sprite=sp_cursor6;break;	
	case 7: cursor_sprite=sp_cursor7;break;	
	case 8: cursor_sprite=sp_cursor8;break;	
	case 9: cursor_sprite=sp_cursor9;break;	
	}
	
}


