global.buildings = [];
global.people = [];
global.jobs = [];
global.furniture = [];

global.receipts = [];
global.trainlogs = [];
global.camlogs = array_create(10, []);
global.phone_messages = [];
global.messages_checked = true;
global.met_terence = false;
global.evidence = [];
global.suspects = [];
global.fingerprints = [];

global.foundem = false;

global.ppl = 0;
global.job = 0;


global.haskilled = false;

genned = false;

function generate_city(city_id)
{
	var city_grid = ds_grid_create(CITY_SIDE, CITY_SIDE);
	ds_grid_clear(city_grid, 0);
	var build =
	[
		0, 0, 0, 0, 0, 0, 0, 0, 0
	];
	
	for(var i = 1; i < array_length(build); i++)
	{
		do
		{
			var rand_x = irandom(CITY_SIDE-1);
			var rand_y = irandom(CITY_SIDE-1);
			if(city_grid[# rand_x, rand_y] == 0)
			{
				city_grid[# rand_x, rand_y] = i;
				build[i]++;
				create_building(city_id, i, rand_x, rand_y);
			}
		}
		until(build[i] >= global.build_reqs[i]);
	}
	
	for(var i = 0; i < CITY_SIDE; i++)
	{
		for(var j = 0; j < CITY_SIDE; j++)
		{
			if(city_grid[# i, j] == 0)
			{
				create_building(city_id, 0, i, j);
			}
		}
	}
	
	ds_grid_destroy(city_grid);
}