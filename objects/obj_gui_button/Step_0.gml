y = lerp(y, targ_y, 0.05);

if(mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, id, true, false) && obj_roomtrans.alpha == 0 && !obj_typewriter.dialogbox)
{
	if(global.met_terence || !(num == 2 || num == 3))
	{
		if(num != 4) audio_play_sound(sfx_menublip, 1, 0);
		switch(num)
		{
			case 0:
				audio_play_sound(sfx_map, 1, 0);
				obj_roomtrans.transition(rm_city_view);
				break;
			
			case 1:
				obj_roomtrans.menu = true;
				global.evidence_show = true;
				global.evidence_mode = "messages";
				if(!global.messages_checked)
				{
					global.messages_checked = true;
					audio_play_sound(sfx_cellphone, 1, 0);
				}
				break;	
			
			case 2:
				obj_roomtrans.menu = true;
				global.evidence_show = true;
				global.evidence_mode = "items";
				obj_buttons_manager.page = 1;
				break;
			
			case 3:
				obj_roomtrans.menu = true;
				global.evidence_show = true;
				global.evidence_mode = "suspects";
				obj_buttons_manager.page = 1;
				break;
			
			case 4:
				audio_play_sound(sfx_timepass, 1, 0);
				obj_roomtrans.hour_trans();
				break;
		}
	}
}
else if((keyboard_check_pressed(vk_escape) && !obj_typewriter.dialogbox && obj_roomtrans.menu) || (mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, id, true, false) && global.evidence_show))
{
	if(global.evidence_mode == "messages" && obj_buttons_manager.first_pickup == false)
	{
		obj_buttons_manager.first_pickup = true;
		obj_typewriter.talk_once(["P*0*I'd best get there fast and start investigating!", "P*0*I might need to go to the train station to travel between cities."]);
	}
	obj_roomtrans.menu = false;
	obj_roomtrans.alpha = 0;
	global.evidence_show = false;
}

if(num != 1) image_index = num;
else if(global.messages_checked || sin(get_timer()/100000) >= 0) image_index = 1;
else image_index = 5;

if(!global.met_terence)
{
	if(num == 2 || num == 3) visible = false;
}
else
{
	visible = true;	
}