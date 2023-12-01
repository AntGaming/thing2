if(room == rm_breakthecase)
{
	if(room == rm_city_view) draw_set_alpha(0.4);

	draw_set_font(fon_century_0);
	draw_set_halign(fa_center);

	var time = scribble("[fon_century_0][scale, 2]" + timeconvert(global.hour));
	var date = scribble("[fon_century_0]" + string(global.day) + "/" + string(global.month) + "/" + string(global.year));

	draw_set_color(c_black);
	draw_rectangle(time.get_left()+30-5, time.get_top()+20-5, time.get_right()+30+5, time.get_bottom()+20+5, false);
	draw_rectangle(date.get_left()+30-5, date.get_top()+110-5, date.get_right()+30+5, date.get_bottom()+110+5, false);
	draw_set_color(c_white);

	time.draw(30, 20);
	date.draw(30, 110);

	draw_set_alpha(1);
}