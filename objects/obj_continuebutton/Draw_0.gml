draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fon_century_mid);

var wid = string_width(name)/2;
var hei = string_height(name)/2;

draw_set_color(c_black);
draw_rectangle(x - wid - 4, y - hei - 4, x + wid + 4, y + hei + 4, false);

draw_set_color(c_white);
draw_rectangle(x - wid, y - hei, x + wid, y + hei, false);

draw_set_color(c_black);
draw_text(x, y, name);

draw_set_color(c_white);