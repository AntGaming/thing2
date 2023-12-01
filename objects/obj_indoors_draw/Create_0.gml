uid = 0;

function drop_people(drop)
{
	with(obj_furniture) instance_destroy();
	
	for(var i = 0; i < array_length(global.furniture); i++)
	{
		var furn = global.furniture[i];
		if(furn.city_id == obj_city_draw.city_id && furn.x_pos == global.buildings[uid].x_pos && furn.y_pos == global.buildings[uid].y_pos)
		{			
			instance_create_layer(global.furniture[i].x_loc, irandom_range(-100, -300), "Furniture", obj_furniture, {fid: i, droppage: drop});
		}
	}
	
	with(obj_person) instance_destroy();
	
	var coords = [];
	
	for(var i = 0; i < array_length(global.people); i++)
	{
		var person = global.people[i];
		if(person.cur_city == obj_city_draw.city_id && person.x_pos == global.buildings[uid].x_pos && person.y_pos == global.buildings[uid].y_pos)
		{
			var reps = 200;
			var farenough;
			var rand_x;
			var rand_y;
			do 
			{
				farenough = true;
				rand_x = irandom_range(200, 750);
				rand_y = irandom_range(150, 270);
				
				for(var j = 0; j < array_length(coords); j++)
				{
					if(distance_between_coords(coords[j], [rand_x, rand_y]) < reps) farenough = false;
				}
				
				reps--;
			}
			until(farenough)
			array_push(coords, [rand_x, rand_y]);
			
			instance_create_layer(coords[array_length(coords)-1][0], irandom_range(-100, -300), "People", obj_person, {person_id: i, targ_y: coords[array_length(coords)-1][1], droppage: drop});
		}
	}
	
	
}

function distance_between_coords(array1, array2)
{
	var x1 = array1[0];
	var y1 = array1[1];
	var x2 = array2[0];
	var y2 = array2[1];

	var dx = x2 - x1;
	var dy = y2 - y1;

	var distance = sqrt(dx * dx + dy * dy);

	return distance;
}