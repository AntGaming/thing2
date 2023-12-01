// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_memories(uid)
{
	var pers = global.people[uid];
	for(var i = 0; i < array_length(global.people); i++)
	{
		var persj = global.people[i];
		if(i != uid && pers.cur_city == persj.cur_city && pers.x_pos == persj.x_pos && pers.y_pos == persj.y_pos)
		{
			if(pers.schedule[global.hour] == 1) create_memory(i, "served");
			else create_memory(i, "saw");
		}
	}
}