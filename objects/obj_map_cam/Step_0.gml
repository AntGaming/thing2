if(room == rm_map)
{
	zoom += (zoom_target - zoom)/5;

	camera_set_view_size(cam, 1920*zoom, 1080*zoom);

	view_w_half = camera_get_view_width(cam) * 0.5;
	view_h_half = camera_get_view_height(cam) * 0.5;

	//panning with mouse
	if	mouse_check_button_pressed(mb_left)
	{
		mouse_xstart = window_views_mouse_get_x();
		mouse_ystart = window_views_mouse_get_y();
	}


	if mouse_check_button(mb_left)
	{
		x += mouse_xstart - window_views_mouse_get_x();
		y += mouse_ystart - window_views_mouse_get_y();
	}

	//panning with wasd
	if (keyboard_check(ord("D"))) x += pan_speed*zoom;
	if (keyboard_check(ord("A"))) x -= pan_speed*zoom;
	if (keyboard_check(ord("S"))) y += pan_speed*zoom;
	if (keyboard_check(ord("W"))) y -= pan_speed*zoom;

	x = clamp(x, view_w_half, room_width - view_w_half);
	y = clamp(y, view_h_half, room_height - view_h_half);

	camera_set_view_pos(cam, x - view_w_half, y - view_h_half);
}