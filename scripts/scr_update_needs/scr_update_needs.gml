// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_needs(uid)
{
	var pers = global.people[uid];
	pers.needs.food -= random_range(0.01, 0.02);
	pers.needs.social -= random_range(0.01, 0.02);
	pers.needs.weapon -= 0.01;
	pers.needs.kill -= 0.03;
	
	if(!pers.alive && pers.discovery_countdown > 0)
	{
		pers.discovery_countdown--;
		if(pers.discovery_countdown <= 0 || (global.p_x_pos == pers.x_pos && global.p_y_pos == pers.y_pos && pers.addr_city == obj_city_draw.city_id))
		{
			if(pers.discovery_countdown > 0) pers.discovery_countdown = 0;
			create_message("A body has been discovered in " + global.city_info[pers.addr_city].name + ".");
			global.haskilled = true;
		}
	}
	
	//end free time
	if(pers.free_time.act_type != -1)
	{
		if(pers.free_time.act_type == activities.food && pers.free_time.act_end == global.hour)
		{
			pers.needs.food = 1;
			pers.free_time.act_type = -1;
		}
		if((pers.free_time.act_type == activities.nightclub || pers.free_time.act_type == activities.pizza) && pers.free_time.act_end == global.hour)
		{
			pers.needs.social = 1;
			pers.free_time.act_type = -1;
		}
		if((pers.free_time.act_type == activities.buyhard || pers.free_time.act_type == activities.buygun) && pers.free_time.act_end == global.hour)
		{
			pers.needs.weapon = 1;
			pers.likesweapon = false;
			pers.free_time.act_type = -1;
			
			for(var i = 0; i < array_length(global.furniture); i++)
			{
				var furn = global.furniture[i];
				if(furn.city_id == pers.addr_city && furn.x_pos == pers.addr_x_pos && furn.y_pos == pers.addr_y_pos && furn.type == furniture.cupboard)
				{
					array_push(furn.contents, pers.holding);	
				}
			}
			pers.holding = -1;
		}
		//checks stabbing
		if(pers.free_time.act_type == activities.kill && pers.x_pos == pers.free_time.act_x_pos && pers.y_pos == pers.free_time.act_y_pos)
		{
			var tpers = global.people[pers.prey];
			if(tpers.cur_city == tpers.addr_city && tpers.x_pos == tpers.addr_x_pos && tpers.y_pos == tpers.addr_y_pos)
			{
				tpers.alive = false;
				tpers.death_time = pack_date();
				
				pers.needs.kill = 1;
				pers.likesweapon = true;
				pers.needs.weapon = 0;
				
				for(var i = 0; i < array_length(global.furniture); i++)
				{
					var furni = global.furniture[i];
					if(furni.city_id = pers.addr_city && furni.y_pos = pers.addr_y_pos && furni.x_pos = pers.addr_x_pos && furni.type == furniture.cupboard)
					{
						pers.holding = furni.contents[0];
						pers.holding.fingerprints = uid;
						pers.holding.blood = pers.prey;
						furni.contents = [];
					}
				}
				
				tpers.death_method = pers.holding.type;
				if(tpers.death_method == items.gun) tpers.ineedmorebullets = true;
				
				var dumped = false;
				
				for(var i = 0; i < array_length(global.furniture); i++)
				{
					var furni = global.furniture[i];
					if(furni.city_id = pers.cur_city && furni.y_pos = pers.y_pos && furni.x_pos = pers.x_pos && furni.type == furniture.bush && !dumped)
					{
						dumped = true;
						array_push(furni.contents, pers.holding);
						global.murder_weapon = pers.holding.type;
						pers.holding = -1;
					}
				}
				
				for(var i = 0; i < array_length(global.buildings); i++)
				{
					var build = global.buildings[i];
					if(build.type == builds.house)
					{
						if(build.city_id == pers.cur_city && build.x_pos == pers.x_pos && build.y_pos == pers.y_pos)
						{
							build.crimescene = true;
						}
					}
				}
				//show_message(global.city_info[tpers.addr_city].name + " " + string(tpers.addr_x_pos) + " " + string(tpers.addr_y_pos));
			}
		}
		
		if(pers.free_time.act_type == activities.kill && pers.free_time.act_end == global.hour)
		{
			pers.free_time.act_type = -1;
		}
	}
	
	//food buy
	if(pers.needs.food <= 0.5 && pers.free_time.act_type == -1 && pers.schedule[global.hour] == 0 && is_open(activities.food, global.hour, 1))
	{
		pers.free_time.act_type = activities.food;
		pers.free_time.act_start = global.hour;
		pers.free_time.act_end = (global.hour + 1)%24;
		pers.free_time.act_city = pers.addr_city;
		pers.free_time.commute_dur = -1;
		
		var targ_b = -1;
		do
		{
			for(var i = 0; i < array_length(global.buildings); i++)
			{
				if(global.buildings[i].type == builds.store && global.buildings[i].city_id == pers.addr_city && random(1) > 0.6)	
				{
					targ_b = global.buildings[i];	
				}
			}
		}
		until(targ_b != -1);
		
		pers.free_time.act_x_pos = targ_b.x_pos;
		pers.free_time.act_y_pos = targ_b.y_pos;
	}
	
	//weapon buy
	if(pers.needs.weapon <= 0.5 && pers.free_time.act_type == -1 && pers.schedule[global.hour] == 0 && pers.likesweapon)
	{
		if(random(1) <= 1/4) var activ = activities.buygun;
		else var activ = activities.buyhard;
		
		
		var tohold = -1;
		
		if(is_open(activ, global.hour, 1))
		{
			pers.free_time.act_type = activ;
			pers.free_time.act_start = global.hour;
			pers.free_time.act_end = (global.hour + 1)%24;
			pers.free_time.act_city = pers.addr_city;
			pers.free_time.commute_dur = -1;
			
			switch activ
			{
				case activities.buygun:
					targ_type = builds.gunstore;
					tohold = items.gun;
					break;
				
				case activities.buyhard:
					targ_type = builds.hardwarestore;
					tohold = choose(items.pipe, items.axe);
					break;
			}
		
			var targ_b = -1;
			do
			{
				for(var i = 0; i < array_length(global.buildings); i++)
				{
					if(global.buildings[i].type == targ_type && global.buildings[i].city_id == pers.addr_city && random(1) > 0.6)	
					{
						targ_b = global.buildings[i];	
					}
				}
			}
			until(targ_b != -1);
		
			pers.free_time.act_x_pos = targ_b.x_pos;
			pers.free_time.act_y_pos = targ_b.y_pos;
			
			pers.holding = create_item(tohold, -1, uid);
			
			if(random(1) <= 1 || pers.killer) create_receipt(targ_b.city_id, targ_b.x_pos, targ_b.y_pos, uid, tohold, pack_date());
		}
	}
	
	//social
	if(pers.needs.social <= 0.5 && pers.free_time.act_type == -1 && pers.schedule[global.hour] == 0 && random(1) <= 0.5)
	{
		var activ = pers.socialtype;
		var targ_type = -1;
		var act_time = irandom_range(1, 2);
		
		switch activ
		{
			case activities.nightclub:
				targ_type = builds.nightclub;
				break;
				
			case activities.pizza:
				targ_type = builds.pizza;
				break;
		}
		
		var targ_b = -1;
		do
		{
			for(var i = 0; i < array_length(global.buildings); i++)
			{
				if(global.buildings[i].type == targ_type && distance_between_cities(pers.addr_city, global.buildings[i].city_id) <= 1 && (random(1) <= 0.1))	
				{
					targ_b = global.buildings[i];	
				}
			}
		}
		until(targ_b != -1);
		
		var commute_time = 0;
		if(distance_between_cities(pers.addr_city, targ_b.city_id) > 0) commute_time = (distance_between_cities(pers.addr_city, targ_b.city_id) + 1)*2;
		else pers.free_time.commute_dur = -1;
		
		var total_time = act_time + commute_time;
		
		var cango = true;
		for(var i = 0; i < total_time; i++)
		{
			var time = (global.hour + i)%24;
			if(pers.schedule[time] != 0) cango = false;
		}
		
		if(cango && is_open(activ, global.hour + commute_time/2, act_time))
		{
			//then, update all info
			//then, add code to calculate_position for commuting
			//maybe add a new free_time property that factors in commutes? from home city to act_city
			
			pers.free_time.act_type = activ;
			pers.free_time.act_start = global.hour;
			pers.free_time.act_end = (global.hour + act_time + commute_time)%24;
			pers.free_time.act_dur = timepassed(pers.free_time.act_start, pers.free_time.act_end);
			pers.free_time.act_city = targ_b.city_id;
			pers.free_time.act_x_pos = targ_b.x_pos;
			pers.free_time.act_y_pos = targ_b.y_pos;
			pers.free_time.commute_dur = commute_time/2;
		}
	}

	

	//KILL
	if(pers.needs.kill <= 0.5 && pers.killer && pers.free_time.act_type == -1 && !pers.likesweapon)
	{		
		var targeted = false;
		var tpers = -1;
		var targ_p = -1;
		var act_time = 1;
		
		do
		{
			targ_p = irandom(array_length(global.people)-1);
			tpers = global.people[targ_p];
			
			if(!tpers.killer && tpers.alive && (tpers.schedule[global.hour] == 0 || tpers.schedule[global.hour] == 2) && distance_between_cities(tpers.addr_city, pers.addr_city) <= global.difficulty)
			{
				targeted = true;
			}
		}
		until(targeted);
		
		var commute_time = 0;
		if(distance_between_cities(pers.addr_city, tpers.addr_city) > 0) commute_time = (distance_between_cities(pers.addr_city, tpers.addr_city) + 1)*2;
		else pers.free_time.commute_dur = -1;
		
		var total_time = act_time + commute_time;
		
		var cango = true;
		for(var i = 0; i < total_time; i++)
		{
			var time = (global.hour + i)%24;
			if(pers.schedule[time] != 0) cango = false;
		}
		
		if(cango)
		{	
			pers.free_time.act_type = activities.kill;
			pers.free_time.act_start = global.hour;
			pers.free_time.act_end = (global.hour + act_time + commute_time)%24;
			pers.free_time.act_dur = timepassed(pers.free_time.act_start, pers.free_time.act_end);
			pers.free_time.act_city = tpers.addr_city;
			pers.free_time.act_x_pos = tpers.addr_x_pos;
			pers.free_time.act_y_pos = tpers.addr_y_pos;
			pers.free_time.commute_dur = commute_time/2;
			pers.prey = targ_p;
			//show_message(global.city_info[tpers.addr_city].name + " " + string(tpers.addr_x_pos) + " " + string(tpers.addr_y_pos));
		}
	}
}