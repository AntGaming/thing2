// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function is_open(activity, start, duration)
{
	var open = true;
	for(var i = 0; i < duration; i++)
	{
		var time = (start + i)%24;
		switch activity
		{
			case activities.food:
			case activities.buygun:
			case activities.buyhard:
				if(time < 8 || time >= 20) open = false;
				break;
				
			case activities.pizza:
				if(time < 16) open = false;
				break;
				
			case activities.nightclub:
				if(time < 20 && time >= 4) open = false;
				break;
		}
	}
	
	return open;
}