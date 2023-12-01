draw_detective(x, y, scale, 0);
if(global.met_terence) draw_sprite_ext(spr_terence, 1, x + 100, y, 0.4, 0.4, 0, c_white, 1);

draw_set_font(fon_century_0);
draw_set_halign(fa_center);

var name = scribble("[fon_century_0][scale, 0.5][fa_center][#000000]You");

draw_set_alpha(0.6);
draw_rectangle(name.get_left()+x-2, name.get_top()+(y-90)-2, name.get_right()+x+2, name.get_bottom()+(y-90)+2, false);

draw_set_color(c_white);
name.draw(x, y-90);

if(global.met_terence)
{
	name = scribble("[fon_century_0][scale, 0.5][fa_center][#000000]Terence");

	draw_set_alpha(0.6);
	draw_rectangle(name.get_left()+(x+100)-2, name.get_top()+(y-90)-2, name.get_right()+(x+100)+2, name.get_bottom()+(y-90)+2, false);

	draw_set_color(c_white);
	name.draw((x+100), y-90);
}

draw_set_alpha(1);
