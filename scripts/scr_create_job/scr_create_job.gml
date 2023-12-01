// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_job(city_id, x_pos, y_pos, type, reps, start, duration)
{
	for(var i = 0; i < reps; i++)
	{
		array_push(global.jobs,
		{
			city_id: city_id,
			type: type,
			x_pos: x_pos,
			y_pos: y_pos,
			start: start,
			duration: duration
		});
		global.job++;
	}

}