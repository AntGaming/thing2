if(dir != -1)
{
	draw_set_color(c_black);
	draw_set_alpha(alpha);
	draw_rectangle(0, 0, 2000, 2000, false);	
	
	draw_set_color(c_white);
	draw_set_alpha(1);
}

if(room == rm_intro && alpha > 0.98)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fon_century_big);
	
	draw_text(room_width/2, room_height/2, "GENERATING\nCASE...");
}