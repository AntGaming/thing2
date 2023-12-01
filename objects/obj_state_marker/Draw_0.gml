draw_set_halign(fa_center);
draw_set_valign(fa_center);

if obj_time.isdark() draw_set_color(c_white);
else draw_set_color(c_black);
draw_set_alpha(0.4);
draw_text_scribble(x, y, "[fon_century_0][scale, 2]" + global.state_info[city_id].name);

draw_set_color(c_white);
draw_set_alpha(1);