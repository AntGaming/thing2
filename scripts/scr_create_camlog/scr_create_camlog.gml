// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_camlog(person, x1, y1, x2, y2)
{
	var camlog = 
	{
		person: person,
		log: [],
		date: pack_date()
	};
	
	var total_dist_x = abs(x1-x2);
	var total_dist_y = abs(y1-y2);
	
	if(total_dist_x == 0 && total_dist_y == 0) return false;
	else
	{
		if(random(0.5) <= 1)
		{
			for(var i = x1; i != x2; i+=sign(x2-x1))
			{
				array_push(camlog.log, [i, y1]);	
			}
			
			for(var i = y1; i != y2; i+=sign(y2-y1))
			{
				array_push(camlog.log, [x2, i]);	
			}
		}
		else
		{
			for(var i = y1; i != y2; i+=sign(y2-y1))
			{
				array_push(camlog.log, [x1, i]);	
			}
			
			for(var i = x1; i != x2; i+=sign(x2-x1))
			{
				array_push(camlog.log, [i, y2]);	
			}
		}
	}
	
	array_push(camlog.log, [x2, y2]);
	
	return camlog;
}