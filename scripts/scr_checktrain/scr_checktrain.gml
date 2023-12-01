// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checktrain(uid)
{
	var pers = global.people[uid];
	var is_at_train_station = false;
	
	for(var i = 0; i < array_length(global.buildings); i++)
	{
		var build = global.buildings[i];
		if(build.type == builds.train)
		{
			if(build.city_id == pers.cur_city && build.x_pos == pers.x_pos && build.y_pos == pers.y_pos)
			{
				is_at_train_station = true;
			}
		}
	}
	
	if(is_at_train_station)
	{
		if(pers.training != -1) create_trainlog(pers.training, pers.cur_city, uid);
		pers.training = pers.cur_city;
	}
	else
	{
		pers.training = -1;	
	}
}