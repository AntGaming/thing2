if(obj_roomtrans.alpha == 0 && dialogbox)
{
	if((keyboard_check_pressed(vk_anykey)) && !am_in_dlgselect)
	{	
		if(draw_phase == 0) typist.skip();
		else
		{
			talk_progress++;
			if(talk_progress == array_length(talk_array))
			{
				if(talk_dlg_type == -1)
				{
					talk_progress = 0;
					dialogbox = false;
					finish();
				}
				
				if(!thesound && global.foundem)
				{
					thesound = true;
					audio_sound_gain(mus_investigation, 0, 2000);
					audio_play_sound(sfx_spooky, 1, 0);
				}
			
				if(first == 1)
				{
					first = 2;
				
					obj_city_draw.city_id = global.p_city;
				
					for(var i = 0; i < array_length(global.buildings); i++)
					{
						var bui = global.buildings[i];
						if(bui.city_id = global.p_city && bui.type == builds.station)
						{
							obj_indoors_draw.uid = i;	
						}
					}
				
					obj_roomtrans.transition(rm_indoors);
				}
				else if(talk_dlg_type != -1)
				{
					am_in_dlgselect = true;
					talk_progress--;
					switch(talk_dlg_type)
					{
						case 0:
							instance_create_layer(room_width/11 * 8, room_height/12 * 3, "Buttons", obj_talkbutton, {but_num: 0});
							instance_create_layer(room_width/11 * 8, room_height/12 * 4, "Buttons", obj_talkbutton, {but_num: 1});
							instance_create_layer(room_width/11 * 8, room_height/12 * 5, "Buttons", obj_talkbutton, {but_num: 3});
							instance_create_layer(room_width/11 * 8, room_height/12 * 6, "Buttons", obj_talkbutton, {but_num: 4});
							break;
							
						case 1:
							instance_create_layer(room_width/11 * 8, room_height/12 * 3, "Buttons", obj_talkbutton, {but_num: 0});
							instance_create_layer(room_width/11 * 8, room_height/12 * 4, "Buttons", obj_talkbutton, {but_num: 1});
							instance_create_layer(room_width/11 * 8, room_height/12 * 5, "Buttons", obj_talkbutton, {but_num: 3});
							instance_create_layer(room_width/11 * 8, room_height/12 * 6, "Buttons", obj_talkbutton, {but_num: 4});
							instance_create_layer(room_width/11 * 8, room_height/12 * 7, "Buttons", obj_talkbutton, {but_num: 2});
							break;
					}
				}
				
				if(talk_dlg_type == -1) current_talking = -1;
			}
			else
			{
				todraw = scribble("[fon_century_idk]" + process_dlg(talk_array[talk_progress], 2))
				.wrap(1360);
				draw_phase = 0;	
			}
		}
	}
}

if(first == 0 && room == rm_map && obj_roomtrans.alpha == 0)
{
	first = 1;
	dialogbox = true;
	talk_progress = 0;
	
	if(global.difficulty == 0)
	{
		talk_array = 
		[
			"P*0*My name is [#376494]The Detective[#FFFFFF].",
			"P*0*This island, [#29f430]Vespiella[#FFFFFF], has about 300 residents.",
			"P*0*I've lived here since I was a kid.",
			"P*0*For my entire life, it's been a quiet and safe place.",
			"P*0*Today, that changed.",
			"P*0*It all started with the first death..."
		];
	}
	else
	{
		talk_array = 
		[
			"P*0*It's been a few years since the killer was arrested.",
			"P*0*When we sent them away, we thought it was over.",
			"P*0*However, our problems had only just begun.",
			"P*0*Inspired by what happened, a new one has appeared.",
			"P*0*And this one is not as careless as the first.",
			"P*0*This... will be a difficult case."
		];
	}
	
	
	todraw = scribble("[fon_century_idk]" + process_dlg(talk_array[talk_progress], 2))
	.wrap(1360);
}