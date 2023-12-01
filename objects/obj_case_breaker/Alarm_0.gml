total_wait = 1.5;

if(nummy == array_length(summation))
{
	game_restart();	
}
else
{
	if(ticker == 3)
	{
		with(obj_case_break_panel)
		{
			alarm[0] = random_range(0.1, 0.7) * room_speed;
		}
		ticker = 0;
	}
	else
	{

		if(summation[nummy][0] >= 1)
		{
			total_wait += audio_sound_length(summation[nummy][1]);
			audio_play_sound(summation[nummy][1], 1, 0);
			set_text(summation[nummy][1]);
			if(summation[nummy][0] == 1) nummy++;
		}

		if(summation[nummy][0] == 0)
		{
			instance_create_layer(room_width/12 * (ticker*4 + 2), room_height/2, "Instances", obj_case_break_panel, {image_index: summation[nummy][1]});
			audio_play_sound(sfx_map, 1, 0);
			ticker++;
		}

		nummy++;

		if(ticker == 3)
		{
			total_wait += 0.5;
		}
	
		if(nummy == array_length(summation)) total_wait += 5;
	}

	alarm[0] = total_wait * room_speed;
}