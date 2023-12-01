// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function open_for_business(type)
{
	var open = true;

	var time = global.hour;
	switch type
	{
		case builds.store:
		case builds.gunstore:
		case builds.hardwarestore:
			if(time < 8 || time >= 20) open = false;
			break;
				
		case builds.pizza:
			if(time < 16) open = false;
			break;
				
		case builds.nightclub:
			if(time < 20 && time >= 4) open = false;
			break;
				
		case builds.office:
			if(time < 9 || time >= 17) open = false;
			break;
	}
	
	return open;
}