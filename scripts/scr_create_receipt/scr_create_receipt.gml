// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_receipt(city_id, x_pos, y_pos, person, type, date)
{
	array_push(global.receipts,
	{
		city_id: city_id,
		x_pos: x_pos,
		y_pos: y_pos,
		person: person,
		type: type,
		date: date
	});
}