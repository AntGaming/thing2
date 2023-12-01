global.hour = 9;

if(global.difficulty == 0)
{
	global.day = 2;
	global.month = 6;
	global.year = 2006;
}
else
{
	global.day = 2;
	global.month = 6;
	global.year = 2009;
}

daysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31];

function new_day()
{
	global.day++;
	
	if(global.day == daysInMonth[global.month-1]+1)
	{
		global.month++;
		global.day = 1;
		
		if(global.month == 13)
		{
			global.year++;
			global.month = 1;
		}
	}
}

function new_hour()
{
	global.hour++;
	if(global.hour == 24)
	{
		new_day();
		global.hour = 0;
	}
	
	night_update();
	
	for(var i = 0; i < array_length(global.people); i++)
	{
		update_needs(i);
		calculate_position(i, false);
		
		for(var j = 0; j < array_length(global.receipts); j++)
		{
			if(global.receipts[j].date.hour == global.hour && global.receipts[j].date.day == global.day - 1)
			{
				array_delete(global.receipts, j, 1);
				 j--;
			}
		}
	}
	
	if(room == rm_indoors)
	{
		obj_indoors_draw.drop_people(false);
	}
}

function night_update()
{
	if((room == rm_map || room == rm_city_view || room == rm_indoors) && isdark())
	{
		var tint = fx_create("_filter_tintfilter");
		fx_set_parameter(tint, "g_TintCol", 100/255, 100/255, 180/255, 1) ;
		layer_set_fx("Night", tint);
	}
	else
	{
		layer_clear_fx("Night");	
	}
}

function isdark()
{
	return (global.hour >= 20 || global.hour < 6);
}