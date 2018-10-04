// obj_player step



//														Charge and attack
/*mouse_check_button(mb_left) and*/

if attacking2 = false{

if attacking = true and !instance_exists(obj_fist){
	timeHeld = timeHeld + 1
}
if mouse_check_button_released(mb_left) && timeHeld>29{
	if !instance_exists(obj_fist){
	mousex = mouse_x ;
	mousey = mouse_y;
	mouseAngle = point_direction(x,y,mousex,mousey);
	fistID = instance_create_depth(x,y,-1, obj_fist);

	fistID.dir = mouseAngle
	fistID.spd = 30
	fistID.direction = mouseAngle;
	fistID.time = 40
	distPercentage = timeHeld/60
	if distPercentage > 1 then distPercentage = 1
	Dist = (point_distance(x,y,x+maxDist,y+maxDist)/((fistID.time/2)))*(distPercentage)
	if Dist > maxDist then Dist = maxDist
	fistID.tick = Dist
	fistID.distance = Dist
	timeHeld = 0
	}
}else if mouse_check_button_pressed(mb_left) and attacking = false
{
	attacking = true;
	timeHeld = 29
}else if attacking = true && !mouse_check_button(mb_left) && timeHeld >29 {
	if !instance_exists(obj_fist){
	mousex = mouse_x ;
	mousey = mouse_y;
	mouseAngle = point_direction(x,y,mousex,mousey);
	fistID = instance_create_depth(x,y,-1, obj_fist);

	fistID.dir = mouseAngle
	fistID.spd = 10
	fistID.direction = mouseAngle;
	fistID.time = 40
	distPercentage = timeHeld/60
	if distPercentage > 1 then distPercentage = 1
	Dist = (point_distance(x,y,x+maxDist,x+maxDist)/((fistID.time/2)))*(distPercentage)
	if Dist > maxDist then Dist = maxDist
	fistID.tick = Dist
	fistID.distance = Dist
	timeHeld = 0
	}
}
}
// arc attack
if attacking = false{
	if rocketFist =1 {
		if mouse_check_button_released(mb_right) && attacking2 = false {
		fistID = instance_create_depth(x,y,-1,obj_rocketFist)	
		fistID.tick = 50
		fistID.spd = 10
		}
	}
}

//                                                        get movement
xSpd = 0
ySpd = 0

if usingArrowKeys = false {
  dirMove= keyboard_check(ord(rightKey)) - keyboard_check(ord(leftKey));
  
  if keyboard_check(ord(rightKey)) || keyboard_check(ord(leftKey)){
		//if moveTimeHeld < 50 then moveTimeHeld = moveTimeHeld +1;
		if moveTimeHeld < 8 moveTimeHeld ++
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
    spd = 2; break;
  case 2:
    spd = 2; break;
  case 3:
    spd = 5; break;
  case 4:
    spd = 5; break;
  case 5:
    spd =7; break;
  case 6:
    spd =7; break;
  case 7:
    spd =9; break;
  case 8:
    spd =10; break;
}

if timeHeld!=0{
	if spd > chargeMaxSpd then spd = chargeMaxSpd
}
xSpd = dirMove * spd

if dirMove !=0 {
	lastFacing = dirMove
}

xSpd = lastFacing * spd


ySpd = grav;

if jump = true{
if jumpPower != 0 then jumpPower--//-round(grav*jumpPowerPerGravity) then jumpPower --;


  
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
  
  
  if place_meeting(x+xSpd,y,obj_obstacle){
	if xSpd > 0{
		for (b=1;b<46;b=b+1){
			hspeed = xSpd
			vspeed = ySpd
			direction= b
	
			if !place_meeting(x+hspeed,y+vspeed,obj_obstacle) {
				xSpd = floor(hspeed)
				ySpd = floor(vspeed)
				hspeed = 0
				vspeed = 0
				break;
			}

	}
	} else if xSpd <0 {
		for (b=180;b>(180-46);b=b-1){
			hspeed = xSpd
			vspeed = ySpd
			direction= b
	
			if !place_meeting(x+hspeed,y+vspeed,obj_obstacle) {
				xSpd = round(hspeed)
				ySpd = round(vspeed)
				hspeed=0
				vspeed=0
				break;
			}
		}
	}
  }
  
  
  
  
  while place_meeting(x + xSpd,y, obj_obstacle) do {
 
    if xSpd > 0 then xSpd --;
    else xSpd ++;
  }

  while place_meeting(x+xSpd,y+ySpd, obj_obstacle) do {
    
    if ySpd > 0 {
		ySpd --;
		jump = false;
		timeOnCieling = 0;}
    else if ySpd < 0 { 
		ySpd ++;
		timeOnCieling++;
			if timeOnCieling >=10 then jumpPower = grav;
	}
	
	if xSpd > 0 then xSpd --;
    else xSpd ++;
  }
}
if ySpd > 0 then jump = true
xSpd = round(xSpd)
ySpd = round(ySpd)
x = x + xSpd;
y = y + ySpd;
// attack






if keyboard_check_pressed(ord("R")) then room_restart()



//                                                          move
