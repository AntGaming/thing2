if(collision_point(mouse_x, mouse_y, id, false, false) && mouse_check_button_pressed(mb_left))
{
	if(pow == 0)
	{
		obj_buttons_manager.review_backwards(true);
	}
	else
	{
		obj_buttons_manager.review_forwards(true);
	}
}

if(pow == 0)
{
	if(obj_buttons_manager.review_backwards(false)) image_alpha = 1;
	else image_alpha = 0;
}
else
{
	if(obj_buttons_manager.review_forwards(false)) image_alpha = 1;
	else image_alpha = 0;
}