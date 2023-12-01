city_count = 0;

with(obj_city)
{
	city_id = other.city_count;
	
	other.city_count++;
}

city_count = 0;

with(obj_state_marker)
{
	city_id = other.city_count;
	
	other.city_count++;
}

scribble_font_bake_outline_8dir_2px("fon_century_0", "fon_century_1", c_black, false);