draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fon_century_0);

var wid = string_width(name)/2;
var hei = string_height(name)/2;

if(but_num == 3) draw_set_color(c_white);
else draw_set_color(c_black);
draw_rectangle(x - wid - 4, y - hei - 4, x + wid + 4, y + hei + 4, false);

if(but_num == 3) draw_set_color(c_red);
else draw_set_color(c_white);
draw_rectangle(x - wid, y - hei, x + wid, y + hei, false);

if(but_num == 3) draw_set_color(c_white);
else draw_set_color(c_black);
draw_text(x, y, name);

draw_set_color(c_white);