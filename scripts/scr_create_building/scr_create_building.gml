// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_building(city_id, type, x_pos, y_pos)
{
	array_push(global.buildings,
	{
		city_id: city_id,
		type: type,
		x_pos: x_pos,
		y_pos: y_pos,
		crimescene: false,
		scene_inspected: false
	});
}