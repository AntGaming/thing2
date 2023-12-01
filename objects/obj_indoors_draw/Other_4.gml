if(room == rm_indoors)
{
	switch(global.buildings[uid].type)
	{
		case builds.gunstore:
		case builds.hardwarestore:
		case builds.nightclub:
		case builds.office:
		case builds.store:
		case builds.station:
			todraw = 1;
			break;
		
		case builds.house:
		case builds.pizza:
			todraw = 0;
			break;
		
		case builds.train:
			todraw = 2;
			break;
	}
	drop_people(true);
	
	global.p_x_pos = global.buildings[uid].x_pos;
	global.p_y_pos = global.buildings[uid].y_pos;
}