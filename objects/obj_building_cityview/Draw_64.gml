if(collision_point(mouse_x, mouse_y, id, false, false))
{
	/*
	var drawn = 0;
	for(var i = 0; i < array_length(global.people); i++)
	{
		if(type == 0)
		{
			if(global.people[i].addr_city == obj_city_draw.city_id && global.people[i].addr_x_pos == x_pos && global.people[i].addr_y_pos == y_pos)	
			{
				draw_text(1250, 64, global.people[i].first_name + " " + global.people[i].last_name);
				draw_text(1250, 64 + 64*1, global.names_jobs[global.people[i].job]);
				draw_text(1250, 64 + 64*2, "now at " + string(global.city_info[global.people[i].cur_city].name) + " " + string(global.people[i].x_pos) + " " + string(global.people[i].y_pos));
				draw_text(1250, 64 + 64*4, "lives at " + string(global.city_info[global.people[i].addr_city].name) + " " + string(global.people[i].addr_x_pos) + " " + string(global.people[i].addr_y_pos));
				draw_text(1250, 64 + 64*5, "works at " + string(global.city_info[global.people[i].work_city].name) + " " + string(global.people[i].work_x_pos) + " " + string(global.people[i].work_y_pos));
			
				for(var j = 0; j < 24; j++)
				{
					draw_text(1500, 64+j*32, string(j) + ": " + string(global.people[i].schedule[j]));
				}
				
				draw_person(i, 1800, 300, 1, 0);
			}
		}
		else
		{
			if(global.people[i].work_city == obj_city_draw.city_id && global.people[i].work_x_pos == x_pos && global.people[i].work_y_pos == y_pos && global.people[i].alive)	
			{
				draw_text(1250, 64 + 64*drawn, global.people[i].first_name + " " + global.people[i].last_name + " - " + global.names_jobs[global.people[i].job]);
				drawn++;
			}
		}	
	}
	*/
	
	draw_set_font(fon_century_idk);
	draw_set_halign(fa_center);
	
	var numbs = ["A", "B", "C", "D", "E", "F", "G"];
	
	draw_text(room_width/4 * 6, 256 + 64, string_ucfirst(global.names_builds[type]));
	
	draw_text(room_width/4 * 6, 256 + 128, "Address [" + string(x_pos + 1) + numbs[y_pos] + "]");

	if(type != builds.house && type != builds.station)
	if(open_for_business(type))
	{
		draw_set_color(c_lime);
		draw_text(room_width/4 * 6, 256 + 128 + 64, "Open for business");
	}
	else
	{
		draw_set_color(c_red);
		draw_text(room_width/4 * 6, 256 + 128 + 64, "Currently closed");
	}

	draw_set_color(c_white);
}