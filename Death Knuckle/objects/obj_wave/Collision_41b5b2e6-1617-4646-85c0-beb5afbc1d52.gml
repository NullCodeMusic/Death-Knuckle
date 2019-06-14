/// @description Insert description here
// You can write your code in this editor
colList=ds_list_create()
instance_place_list(x,y,prnt_enemy,colList,0)

i=0
repeat(ds_list_size(colList)){
var hitID=ds_list_find_value(colList,i)
hitID.hp-=5
i++
}