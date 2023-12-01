// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function timeconvert(hour)
{
	hour = (hour+24)%24;
	
    var am_pm = "AM";
    var converted_hour = hour;

    if (hour >= 12)
    {
        am_pm = "PM";
        converted_hour = hour - 12;
    }

    if (converted_hour == 0)
    {
        // 0-hour should be displayed as 12 AM
        converted_hour = 12;
    }

    return string(converted_hour) + ":00 " + am_pm;
}