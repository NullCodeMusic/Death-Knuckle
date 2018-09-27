/// @description Insert description here
// You can write your code in this editor
// obj_player create

upKey = "W";
downKey = "S";
leftKey = "A";
rightKey = "D";
usingArrowKeys = false;
spd = 0;
jumpTime = 0;
jump = false;
moveTimeHeld = 0;
grav = 10;
attacking = false;

// obj_player step
//                                                        get movement
if (usingArrowkeys = false){
  xSpd= keyboard_check(ord(rightKey)) - keyboard_check(ord(leftKey))
} else {
  xSpd= keyboard_check(vk_right) - keyboard_check(vk_left)
  }
  if keyboard_check_pressed(ord(upKey)) or keyboard_check_pressed(vk_space) {
    if jump = false then jump = true
    jumpPower=grav*2
  }
  if keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_space) {
    if jump = false then jump = true;
    jumpPower=grav*2;
  }
//                                                        moveTimeHeld
if keyboard_check_pressed(ord(rightKey)) or keyboard_check_pressed(ord(leftKey)){
  if moveTimeHeld < 5 moveTimeHeld ++;
} else if moveTimeHeld >0 then moveTimeHeld --;

switch (moveTimeHeld)
{
  case 1:
    spd = 0; break;
  case 2:
    spd = 1; break;
  case 3:
    spd = 5; break;
  case 4:
    spd = 9; break;
  case 5:
    spd =10; break;
}

xSpd = xSpd * spd;
ySpd = grav;

if jump = true{
  jumpPower--;	
  if jumpPower < grav then jumpPower --;
  ySpd = ySpd - jumpPower;
  
  if(jumpPower <= 0){
    jump = false;
  }


//                                                        collision
while place_meeting(x+xSpd, y+ySpd, obj_obstacle) or place_meeting(x+xSpd,y, obj_obstacle) or place_meeting(x, y+ySpd, obj_obstacle){
  i = 0;
  while place_meeting(x,y+ySpd, obj_obstacle){
    i++;
    if i > 30 then break;
    if ySpd > 0 then ySpd --;
    else ySpd ++;
    if ySpd = 0 then jump = false;
  }
  i = 0;
  while place_meeting(x + xSpd,y, obj_obstacle){
    i++;
    if i > 30 then break;
    if xSpd > 0 then xSpd --;
    else xSpd ++;
  }
  i = 0
  while place_meeting(x+xSpd,y+ySpd, obj_obstacle){
    i++;
    if i > 30 then break;
    if xSpd > 0 then xSpd --;
    else xSpd ++;
    if ySpd > 0 then ySpd --;
    else ySpd ++;
  }
}

// attack

if attacking = false{

attacking = true;
mousex = mouse_x ;
mousey = mouse_y;
mouseAngle = point_direction(x,y,mousex,mousey);

fistID = instance_create(x+round(cos(mouseangle)), y+round(sin(mouseangle))), obj_fist);

fistID.dir = mouseAngle;
fistID.image_angle = mouseAngle;


}





if ySpd = 0 then jump = false;

//                                                          move
x = x + xSpd;
y = y + ySpd;
