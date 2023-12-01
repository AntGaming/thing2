// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calculate_position(uid, first)
{
	var person = global.people[uid];
	if(!person.alive)
	{
		person.cur_city = person.addr_city;
		person.x_pos = person.addr_x_pos;
		person.y_pos = person.addr_y_pos;
	}
	else
	{
		var tt = person.schedule;
	
		var init_x = person.x_pos;
		var init_y = person.y_pos;
		var init_cit = person.cur_city;
	
		if(tt[global.hour] == 0)//free time or sleep
		{
			if(person.free_time.act_type != -1)
			{
				if(person.free_time.commute_dur == -1)
				{
					person.cur_city = person.free_time.act_city;
					person.x_pos = person.free_time.act_x_pos;
					person.y_pos = person.free_time.act_y_pos;
				}
				else
				{
					var newschedule = array_create(24, 0);
				
					for(var i = 0; i < person.free_time.commute_dur; i++)
					{
						newschedule[(i + person.free_time.act_start)%24] = 1;	
					}
					for(var i = 0; i < person.free_time.act_dur - person.free_time.commute_dur; i++)
					{
						newschedule[(i + person.free_time.act_start + person.free_time.commute_dur)%24] = 2;	
					}
					for(var i = 0; i < person.free_time.commute_dur; i++)
					{
						newschedule[(i + person.free_time.act_start + person.free_time.act_dur - person.free_time.commute_dur)%24] = 3;	
					}
				
					switch(newschedule[global.hour])
					{
						case 2:
							person.cur_city = person.free_time.act_city;
							person.x_pos = person.free_time.act_x_pos;
							person.y_pos = person.free_time.act_y_pos;
							break;
						
						case 1:
							var commute_info = shortest_path_between_cities(person.addr_city, person.free_time.act_city);
	
		
							person.cur_city = commute_info[timepassed(person.free_time.act_start, global.hour)];
		
							for(var i = 0; i < array_length(global.buildings); i++)
							{
								var build = global.buildings[i];
								if(build.city_id == person.cur_city && build.type == builds.train)
								{
									person.x_pos = build.x_pos;
									person.y_pos = build.y_pos;
								}
							}
							break;
						
						case 3:
							var commute_info = shortest_path_between_cities(person.free_time.act_city, person.addr_city);
										
							person.cur_city = commute_info[timepassed(person.free_time.act_start + person.free_time.act_dur - person.free_time.commute_dur, global.hour)];
	
							for(var i = 0; i < array_length(global.buildings); i++)
							{
								var build = global.buildings[i];
								if(build.city_id == person.cur_city && build.type == builds.train)
								{
									person.x_pos = build.x_pos;
									person.y_pos = build.y_pos;
								}
							}
							break;
						
						default:
							//show_message("ERROR");
					}
				}
			}
			else
			{
				person.cur_city = person.addr_city;
				person.x_pos = person.addr_x_pos;
				person.y_pos = person.addr_y_pos;
			}
		}
		else if(tt[global.hour] == 2)
		{
			person.cur_city = person.addr_city;
			person.x_pos = person.addr_x_pos;
			person.y_pos = person.addr_y_pos;
		}
		else if(tt[global.hour] == 1)//work
		{
			person.cur_city = person.work_city;
			person.x_pos = person.work_x_pos;
			person.y_pos = person.work_y_pos;
		}
		else if(tt[global.hour] == 3)//train to work
		{
			var comstart = -1;
			
			for(var z = 0; z < array_length(person.schedule); z++)
			{
				if(person.schedule[z] == 3 && comstart == -1) comstart = z;	
			}
		
			person.cur_city = person.commute_info[abs((global.hour-comstart)%24)];
		
			for(var i = 0; i < array_length(global.buildings); i++)
			{
				var build = global.buildings[i];
				if(build.city_id == person.cur_city && build.type == builds.train)
				{
					person.x_pos = build.x_pos;
					person.y_pos = build.y_pos;
				}
			}
		
		
		}
		else if(tt[global.hour] == 4)//train from work
		{
			var comstart = -1;
			
			for(var z = 0; z < array_length(person.schedule); z++)
			{
				if(person.schedule[z] == 4 && comstart == -1) comstart = z;	
			}
		
			person.cur_city = person.commute_info[array_length(person.commute_info)-((global.hour-comstart)%24)-1];
	
			for(var i = 0; i < array_length(global.buildings); i++)
			{
				var build = global.buildings[i];
				if(build.city_id == person.cur_city && build.type == builds.train)
				{
					person.x_pos = build.x_pos;
					person.y_pos = build.y_pos;
				}
			}
		}
	
		if(person.cur_city == init_cit && !first)
		{
			if(init_x != person.x_pos || init_y != person.y_pos)
			{
				if(person.killer || random(1) <= 0.15) array_push(global.camlogs[person.cur_city], create_camlog(uid, init_x, init_y, person.x_pos, person.y_pos));	
			}
		}
	}
}