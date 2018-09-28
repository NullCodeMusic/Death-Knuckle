// obj_player step
//                                                        get movement
xSpd = 0
ySpd = 0



if usingArrowKeys = false {
  dirMove= keyboard_check(ord(rightKey)) - keyboard_check(ord(leftKey));
  
  if keyboard_check(ord(rightKey)) || keyboard_check(ord(leftKey)){
		//if moveTimeHeld < 50 then moveTimeHeld = moveTimeHeld +1;
		if moveTimeHeld < 5 moveTimeHeld ++
	} else if moveTimeHeld > 0 then moveTimeHeld = moveTimeHeld -1;
	
  if jump = false && (keyboard_check_pressed(ord(upKey)) || keyboard_check_pressed(vk_space)) {
    if jump = false then jump = true;
    jumpPower=round(grav*jumpPowerPerGravity);
	
	//if xSpd != 0 {
  }
  
} else if usingArrowKeys = true{
  RorL= (keyboard_check(vk_right) - keyboard_check(vk_left));
  
  

  if keyboard_check(vk_right) || keyboard_check(vk_left){
		//if moveTimeHeld < 50 then moveTimeHeld = moveTimeHeld +1;
		if moveTimeHeld < 5 moveTimeHeld ++
	} else if moveTimeHeld > 0 then moveTimeHeld = moveTimeHeld -1; 		
		
		
   if jump=false && ( keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space)) {
    if jump = false then jump = true;
    jumpPower=grav*jumpPowerPerGravity;
	// if xSpd != 0 {
	
	}
  }
  
 


//                                                        moveTimeHeld

  

switch (moveTimeHeld)
{
  case 0:
	spd = 0; break;
  case 1:
    spd = 3; break;
  case 2:
    spd = 4; break;
  case 3:
    spd = 5; break;
  case 4:
    spd = 9; break;
  case 5:
    spd =10; break;
}



xSpd = dirMove * spd

if dirMove !=0 {
	lastFacing = dirMove
}

xSpd = lastFacing * spd


ySpd = grav;

if jump = true{
if jumpPower != -round(grav*jumpPowerPerGravity) then jumpPower --;


  
  ySpd = ySpd - jumpPower;
} 

xSpd = round(xSpd)
ySpd = round(ySpd)
//                                                        collision
while place_meeting(x+xSpd, y+ySpd, obj_obstacle) or place_meeting(x+xSpd,y, obj_obstacle) or place_meeting(x, y+ySpd, obj_obstacle){
  i = 0;

  while place_meeting(x,y+ySpd, obj_obstacle) do {
    i++;
    if i > 15 then break;
    if ySpd > 0 {
		ySpd --;
		jump = false;
		timeOnCieling = 0;}
    else if ySpd < 0 { 
		ySpd ++;
		timeOnCieling++;
			if timeOnCieling >=10 then jumpPower = grav;
	}

  }
  i = 0;
  while place_meeting(x + xSpd,y, obj_obstacle) do {
    i++;
    if i > 15 then break;
    if xSpd > 0 then xSpd --;
    else xSpd ++;
  }
  i = 0
  while place_meeting(x+xSpd,y+ySpd, obj_obstacle) do {
    i++;
    if i > 15 then break;
    if xSpd > 0 then xSpd --;
    else xSpd ++;
    if ySpd > 0 {
		ySpd --;
		jump = false;
		timeOnCieling = 0;}
    else if ySpd < 0 { 
		ySpd ++;
		timeOnCieling++;
			if timeOnCieling >=10 then jumpPower = grav;
	}

  }
}


x = x + xSpd;
y = y + ySpd;
// attack


if mouse_check_button_pressed(mb_left)

if attacking = false{

attacking = true;
mousex = mouse_x ;
mousey = mouse_y;
mouseAngle = point_direction(x,y,mousex,mousey);

fistID = instance_create_depth(x,y,-1, obj_fist);

fistID.dir = mouseAngle
fistID.spd = 10
fistID.image_angle = mouseAngle;
fistID.time = 40
fistID.tick = (point_distance(x,y,mousex,mousey)/(fistID.time/2))
fistID.distance = (point_distance(x,y,mousex,mousey)/(fistID.time/2))


}







//                                                          move

