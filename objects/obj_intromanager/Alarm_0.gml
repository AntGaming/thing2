if(parameter <= 2)
{
	instance_create_layer(room_width/2, (room_height/4)*(parameter+1)-128, "Instances", obj_introtitle, {parameter: parameter})
	audio_play_sound(sfx_thud, 1, 0);
	parameter++;
	
	if(parameter == 3) alarm[0] = room_speed * 3;
	else alarm[0] = room_speed * 1;
}
else
{
	layer_enable_fx("Effect_1", true);
	layer_enable_fx("Effect_2", true);
	audio_play_sound(mus_title, 1, 1)
	stylish = true;
	instance_create_layer(room_width/2, (room_height/4)*(4)-128-64-16, "Instances", obj_introtitle, {parameter: parameter, sprite_index: spr_scale});
	audio_play_sound(sfx_thud2, 1, 0);
	alarm[1] = room_speed * 3;
	parameter++;
}