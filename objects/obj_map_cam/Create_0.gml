//window_set_fullscreen(true);

globalvar cam;
cam = view_camera[0];

zoom_speed = 0.07;
pan_speed = 20;

switch(room)
{
	case rm_map:
		maxzoom = 1.3;
		minzoom = 0.8;
		break;
		
	case rm_city_view:
		maxzoom = 0.45;
		minzoom = 0.2;
		break;
}

zoom = maxzoom;
zoom_target = maxzoom;

camera_set_view_size(cam, 1920*zoom, 1080*zoom);

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

mouse_xstart = window_views_mouse_get_x();
mouse_ystart = window_views_mouse_get_y();

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);
