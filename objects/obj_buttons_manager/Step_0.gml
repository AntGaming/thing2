if((global.evidence_mode == "camera" || global.evidence_mode == "items" || global.evidence_mode == "suspects"  || global.evidence_mode == "receipts") && global.evidence_show)
{
	if(mouse_wheel_up() || keyboard_check_pressed(vk_right) || (mouse_check_button_pressed(mb_left) && mouse_x > room_width/4 * 3))
	{
		page++;
		page = min(page, total);
	}

	if(mouse_wheel_down() || keyboard_check_pressed(vk_left) || (mouse_check_button_pressed(mb_left) && mouse_x < room_width/4))
	{
		page--;
		page = max(page, 1);
	}
	
	if(keyboard_check_pressed(vk_down))
	{
		review_backwards(true);
	}
	
	if(keyboard_check_pressed(vk_up))
	{
		review_forwards(true);
	}
}

if(!global.messages_checked && !audio_is_playing(mus_ringtone) && room != rm_map) audio_play_sound(mus_ringtone, 1, 1);
else if(global.messages_checked) audio_stop_sound(mus_ringtone);

if(!global.evidence_show) destroy_cam_buttons();