// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_furniture(city_id, type, x_pos, y_pos)
{
	array_push(global.furniture,
	{
		city_id: city_id,
		type: type,
		x_pos: x_pos,
		y_pos: y_pos,
		contents: [],
		outside: (type == furniture.bush || type == furniture.bin || type == furniture.namesign)
	});
	
	/*
	switch(type)
	{
		case furniture.cupboard:
		{
			if(random(1) <= 0.8) array_push(global.furniture[array_length(global.furniture)-1].contents, create_item(items.knife, -1, -1));
			break;	
		}
	}
	*/
	
	var reps = 150;
	var farenough;
	var rand_x;
	do 
	{
		farenough = true;
		var out = true;
		
		if(type == furniture.bush || type == furniture.bin || type == furniture.namesign)
		{
			
			rand_x = irandom_range(260, 670);
		}
		else
		{
			out = false;
			rand_x = irandom_range(260, 700);
		}
		
				
		for(var j = max(array_length(global.furniture) - 10, 0); j < array_length(global.furniture) - 1; j++)
		{
			if(global.furniture[j].city_id == city_id && global.furniture[j].x_pos == x_pos && global.furniture[j].y_pos == y_pos)
			{
				if(abs(global.furniture[j].x_loc - rand_x) < reps && global.furniture[j].outside == out) farenough = false;
			}
		}
				
		reps--;
	}
	until(farenough)
	global.furniture[array_length(global.furniture)-1].x_loc = rand_x;
}