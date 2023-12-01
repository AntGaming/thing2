if(room == rm_city_view)
{
	for(var i = 0; i < array_length(global.buildings); i++)
	{
		if(global.buildings[i].city_id == city_id)
		{
			var build = global.buildings[i];
			//draw_sprite(spr_buildings, build.type, 64+64*build.x_pos, 64+64*build.y_pos);
			instance_create_layer(64+64*build.x_pos, 64+64*build.y_pos-1000, "Instances", obj_building_cityview, {type : build.type, x_pos: build.x_pos, y_pos: build.y_pos, uid: i});
		}
	}
	
	global.p_city = city_id;
}