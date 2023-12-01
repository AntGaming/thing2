image_xscale = obj_map_cam.zoom * 1;
image_yscale = obj_map_cam.zoom * 1;

if(collision_point(mouse_x, mouse_y, id, true, false) && mouse_check_button_pressed(mb_left) && global.traintravel && distance_between_cities(city_id, obj_city_draw.city_id) <= 1)
{
	if(distance_between_cities(city_id, obj_city_draw.city_id) != 0)
	{
		audio_play_sound(sfx_train, 1, 0);
		obj_time.new_hour();
	}
	obj_city_draw.city_id = city_id;
	for(var i = 0; i < array_length(global.buildings); i++)
	{
		var bui = global.buildings[i];
		if(bui.city_id = city_id && bui.type == builds.train)
		{
			obj_indoors_draw.uid = i;	
		}
	}
	obj_roomtrans.dir = -1;
	obj_roomtrans.transition(rm_indoors);
	global.traintravel = false;
}

if(global.traintravel && distance_between_cities(city_id, obj_city_draw.city_id) == 0) image_index = 1;
else image_index = 0;