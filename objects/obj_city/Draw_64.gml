var scale = view_get_wport(0)/camera_get_view_width(cam);
var tx = x-camera_get_view_x(cam);
var ty = y-camera_get_view_y(cam);

draw_set_font(fon_century_0);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_scribble(tx*scale, ty*scale-50, "[fon_century_1]" + global.city_info[city_id].name);

draw_set_color(c_red);
if(global.traintravel && distance_between_cities(city_id, obj_city_draw.city_id) == 1) draw_circle(tx * scale, ty * scale, 8 * (sin(get_timer()/600000) + 2) + 40, true);

draw_set_color(c_white);