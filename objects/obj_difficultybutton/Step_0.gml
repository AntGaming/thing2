if(global.difficulty == image_index)
{
	image_xscale = 1.2;
	image_yscale = 1.2;
}
else
{
	image_xscale = 1;
	image_yscale = 1;
}

if(collision_point(mouse_x, mouse_y, id, false, false) && mouse_check_button_pressed(mb_left) && obj_intromanager.phase == 2)
{
	audio_play_sound(sfx_menublip, 1, 0);
	global.difficulty = image_index;
}