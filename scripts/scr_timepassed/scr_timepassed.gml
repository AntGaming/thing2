// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function timepassed(time1, time2)
{
	for(var i = 0; i < 24; i++)
	{
		if((time1 + i)%24 == time2) return i;	
	}
}