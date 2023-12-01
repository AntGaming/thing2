if(!genned)
{
	//making buildings
	genned = true;
	
	for(var i = 0; i < array_length(global.city_info); i++)
	{
		generate_city(i);	
	}
	
	//making people
	for(var i = 0; i < array_length(global.buildings); i++)
	{
		var build = global.buildings[i];
		if(build.type == 0)
		{
			create_person(build.city_id, build.x_pos, build.y_pos);
		}
	}
	
	for(var i = 0; i < array_length(global.people); i++) 
	{
		j = irandom_range(i, array_length(global.people)-1);
		var temp = global.people[i];
		global.people[i] = global.people[j];
		global.people[j] = temp;
	}
	
	//making jobs
	
	for(var i = 0; i < array_length(global.buildings); i++)
	{
		
		var build = global.buildings[i];
		//show_message(string(build.type))
		switch(build.type)
		{
			case builds.house:
			{
				create_furniture(build.city_id, furniture.table, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.bed, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.cupboard, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.namesign, build.x_pos, build.y_pos);
				if(random(1) <= 0.5) create_furniture(build.city_id, furniture.tv, build.x_pos, build.y_pos);
				
				create_furniture(build.city_id, furniture.bush, build.x_pos, build.y_pos);
				if(random(1) <= 0.5) create_furniture(build.city_id, furniture.bush, build.x_pos, build.y_pos);
				break;	
			}
			case builds.station:
			{
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.police_officer, 1, 0, 8);
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.police_officer, 2, 8, 8);
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.police_officer, 2, 16, 8);
				
				create_furniture(build.city_id, furniture.security, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.camera, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.forensics, build.x_pos, build.y_pos);
				break;
			}
			
			case builds.store:
			{
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.cashier, 1, 8, 6);
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.cashier, 1, 14, 6);
				create_furniture(build.city_id, furniture.shelf, build.x_pos, build.y_pos);
				if(random(1) <= 0.5) create_furniture(build.city_id, furniture.shelf, build.x_pos, build.y_pos);
				
				create_furniture(build.city_id, furniture.bin, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.security, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.camera, build.x_pos, build.y_pos);
				break;
			}
			
			case builds.office:
			{
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.boss, 1, 12, 5);
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.office_worker, 6, 9, 8);
				create_furniture(build.city_id, furniture.desk, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.desk, build.x_pos, build.y_pos);
				if(random(1) <= 0.5) create_furniture(build.city_id, furniture.desk, build.x_pos, build.y_pos);
				
				create_furniture(build.city_id, furniture.bush, build.x_pos, build.y_pos);
				break;
			}
			
			case builds.gunstore:
			{
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.cashier, 1, 8, 6);
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.cashier, 1, 14, 6);
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.guard, 1, 8, 6);
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.guard, 1, 14, 6);
				create_furniture(build.city_id, furniture.gunshelf, build.x_pos, build.y_pos);
				if(random(1) <= 0.5) create_furniture(build.city_id, furniture.gunshelf, build.x_pos, build.y_pos);
				
				create_furniture(build.city_id, furniture.security, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.camera, build.x_pos, build.y_pos);
				break;
			}
			
			case builds.hardwarestore:
			{
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.cashier, 1, 8, 6);
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.cashier, 1, 14, 6);
				create_furniture(build.city_id, furniture.hardshelf, build.x_pos, build.y_pos);
				if(random(1) <= 0.5) create_furniture(build.city_id, furniture.hardshelf, build.x_pos, build.y_pos);
				
				create_furniture(build.city_id, furniture.security, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.camera, build.x_pos, build.y_pos);
				break;
			}
			
			case builds.pizza:
			{
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.chef, 1, 16, 8);
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.waiter, 2, 16, 8);
				create_furniture(build.city_id, furniture.pizzatable, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.pizzatable, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.pizzatable, build.x_pos, build.y_pos);
				
				create_furniture(build.city_id, furniture.bin, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.bush, build.x_pos, build.y_pos);
				break;
			}
			
			case builds.nightclub:
			{
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.bartender, 1, 20, 8);
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.guard, 1, 20, 8);
				create_furniture(build.city_id, furniture.bar, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.speaker, build.x_pos, build.y_pos);
				
				create_furniture(build.city_id, furniture.bin, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.security, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.camera, build.x_pos, build.y_pos);
				break;
			}
			
			case builds.train:
			{
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.station_manager, 1, 8, 8);
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.guard, 1, 8, 8);
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.guard, 1, 16, 8);
				create_job(build.city_id, build.x_pos, build.y_pos, jobs.guard, 1, 0, 8);
				
				create_furniture(build.city_id, furniture.train, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.security, build.x_pos, build.y_pos);
				create_furniture(build.city_id, furniture.camera, build.x_pos, build.y_pos);
				break;
			}
		}
	}
	
	//show_message(string(global.job) + " " + string(global.ppl))
	
	//assigning jobs
	for(var i = 0; i < array_length(global.jobs); i++)
	{
		var job = global.jobs[i];
		var assignage = false;
		
		switch(job.type)
		{
			case jobs.police_officer:
			case jobs.station_manager:
			case jobs.cashier:
			case jobs.guard:
			case jobs.waiter:
				var range = 0;
				break;
			
			default:
				var range = 1;
		}
		
		do
		{
			for(var j = 0; j < array_length(global.people); j++)
			{
				var person = global.people[j];
				
				if(person.job == 0)
				{
					if(distance_between_cities(person.addr_city, job.city_id) <= range)
					{
						person.job = job.type;
						person.work_city = job.city_id;
						person.work_x_pos = job.x_pos;
						person.work_y_pos = job.y_pos;
						person.work_start = job.start;
						person.work_duration = job.duration;
						assignage = true;
						for(var k = 0; k < job.duration; k++)
						{
							person.schedule[(job.start + k)%24]	= 1;
						}
					
						//add the commute
						if(distance_between_cities(person.addr_city, person.work_city) > 0)
						{
							person.commute_info = shortest_path_between_cities(person.addr_city, person.work_city);
						
							for(var k = 0; k < array_length(person.commute_info); k++)
							{
								person.schedule[(job.start-1-k+24)%24] = 3;
							}
					
							//back home
							for(var k = 0; k < array_length(person.commute_info); k++)
							{
								person.schedule[abs((job.start+job.duration+k)%24)] = 4;
							}
						}
						else
						{
							person.commute_info = [];	
						}

						if(job.start - array_length(person.commute_info) <= 12)
						{
							if(job.start == 0)
							{
								for(var k = 0; k < 8; k++)
								{
									person.schedule[24-abs((job.start - k - array_length(person.commute_info) - 1)%24)] = 2;
								}
							}
							else
							{
								for(var k = 0; k < 8; k++)
								{
									person.schedule[abs((job.start - k - array_length(person.commute_info) - 1)%24)] = 2;
								}
							}
						}
						else
						{
							for(var k = 0; k < 8; k++)
							{
								person.schedule[abs((job.start + k + job.duration + array_length(person.commute_info))%24)] = 2;
							}
						}
					
						j = array_length(global.people);
					}
				}
			}
			
			if(range < 2) range++;
		}
		until(assignage);
	}
	
	for(var i = 0; i < array_length(global.people); i++)
	{
		var person = global.people[i];
		if(person.job == 0)
		{
			for(var k = 0; k < 8; k++)
			{
				person.schedule[abs((0 + k)%24)] = 2;
			}
		}
	}
	
	var kill_number = irandom(array_length(global.people)-1);
	var kira = global.people[kill_number];
	
	kira.killer = true;
	kira.likesweapon = true;
	
	for(var i = 0; i < array_length(kira.schedule); i++)
	{
		if(kira.schedule[i] == 2) kira.schedule[i] = 0;
	}
	
	while(!global.haskilled) obj_time.new_hour();
}