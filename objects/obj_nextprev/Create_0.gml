image_index = pow;

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