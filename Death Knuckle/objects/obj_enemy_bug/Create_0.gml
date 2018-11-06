/// @description Insert description here
// You can write your code in this editor

tick = 0
accl = 0.3
damage = 10
knockback = 10
stagger = 10
hp = 5

xOrigin=x
yOrigin=y

staggerTime=0
invulTime=0
atkAnim=0
maxAtkAnim=2

maxSpd=irandom_range(5,10)

upixelH = shader_get_uniform(BlackOutline,"pixelH")
upixelW = shader_get_uniform(BlackOutline,"pixelW")
texelW = texture_get_texel_width(sprite_get_texture(sprite_index,0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index,0));