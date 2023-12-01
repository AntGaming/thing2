// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_trainlog(city1, city2, person)
{
	array_push(global.trainlogs,
	{
		city1: city1,
		city2: city2,
		person: person,
		date: pack_date()
	});
}