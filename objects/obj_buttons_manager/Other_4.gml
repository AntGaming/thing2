if(room == rm_indoors)
{
	for(var i = 0; i < 4; i++)
	{
		instance_create_layer(room_width/15 * 14, room_height + 100, "Buttons", obj_gui_button, {num: i, targ_y: i * 80 + 50});	
	}
	
	instance_create_layer(room_width/15, room_height + 100, "Buttons", obj_gui_button, {num: 4, targ_y: 128});	
}