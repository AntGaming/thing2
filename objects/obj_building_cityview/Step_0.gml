if(!dormant) y = lerp(y, destination, 0.07);

if(destination-y < 4 && collision_point(mouse_x, mouse_y, id, true, false) && mouse_check_button_pressed(mb_left) && obj_roomtrans.alpha == 0)
{
	obj_roomtrans.transition(rm_indoors);
	
	if(obj_indoors_draw.uid != uid)
	{
		obj_indoors_draw.uid = uid;
		obj_time.new_hour();
		audio_play_sound(sfx_walk, 1, 0);
	}
}