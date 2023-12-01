draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fon_century_idk);
draw_set_color(c_lime);
if(todraw != -1) draw_text(room_width/2, room_height/12 * 10, "Terence D. Fortner");
draw_set_color(c_white);
if(todraw != -1) draw_text(room_width/2, room_height/12 * 11, todraw);