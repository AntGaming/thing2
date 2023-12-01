phase = 1;

for(var i = 0; i < 3; i++)
{
	instance_create_layer(room_width/3 * 2, room_height/4 * (i+1), "Instances", obj_introbutton, {but_num: i});
}