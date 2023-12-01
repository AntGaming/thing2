if(room == rm_city_view)
{
	draw_set_font(fon_century_0);
	
	draw_set_color(#2a2e75);
	draw_rectangle(64, 64, 64+64*CITY_SIDE, 64+64*CITY_SIDE, false);
	draw_set_color(c_white);
	
	for(var i = 0; i < CITY_SIDE+1; i++)
	{
		draw_set_color(#181a45);
		draw_rectangle(64 + 64*i-2, 64, 64+64*i+2, 64+64*CITY_SIDE, false);	
		draw_rectangle(64, 64 + 64*i-2, 64+64*CITY_SIDE, 64 + 64*i+2, false);	
		
		var numbs = ["A", "B", "C", "D", "E", "F", "G"];
		
		draw_set_color(c_white);
		if(i > 0)
		{
			draw_text(32 + 64*i, 44, i);
			draw_text(44, 32 + 64*i, numbs[i-1]);
		}
	}
	
	draw_set_font(fon_century_mid);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(room_width/4 * 3, 128, global.city_info[city_id].name);
}