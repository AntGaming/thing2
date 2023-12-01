draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fon_century_0);

switch(but_num)
{
	case 0:
		name = "Talk";
		break;
		
	case 1:
		name = "Take prints";
		break;
	
	case 2:
		name = "See receipts";
		break;
	
	case 3:
		name = "Accuse";
		break;
}

var wid = string_width(name)/2;
var hei = string_height(name)/2;

if(point_in_rectangle(mouse_x, mouse_y, x - wid - 4, y - hei - 4, x + wid + 4, y + hei + 4) && mouse_check_button_pressed(mb_left))
{
	switch(but_num)
	{
		case 0:
			with(obj_typewriter)
			{
				am_in_dlgselect = false;
				talk_progress = 0;
				talk_dlg_type = -1;
				
				talk_once(["T*2*This is no time for chatting! Find the killer!", "P*0*Of course."]);
			}
			
			with(obj_talkbutton)
			{
				instance_destroy();	
			}
			break;
			
		case 1:
			with(obj_typewriter)
			{
				am_in_dlgselect = false;
				talk_progress = 0;
				talk_dlg_type = -1;
			}
			if(!array_contains(global.fingerprints, obj_typewriter.current_talking))
			{
			
				var matching = false;
			
				for(var i = 0; i < array_length(global.evidence); i++)
				{
					if(global.evidence[i].head == "weapon")
					{
						if(global.evidence[i].body.fingerprints == obj_typewriter.current_talking && global.difficulty == 0) matching = true;
					}
				}
			
				if(matching)
				{
					global.foundem = true;
					obj_typewriter.talk_once(["P*0*We need your fingerprints for an investigation.", "S*0*Alright.", "T*3*Hey, Detective...", "T*2*These fingerprints are in our evidence list!", "P*0*You're saying they match a weapon?", "T*2*That's exactly what I'm saying!", "S*0*Is something the matter?"]);	
				}
				else if(!array_contains(global.suspects, obj_typewriter.current_talking)) obj_typewriter.talk_once(["P*0*We need your fingerprints for an investigation.", "S*0*Alright.", "T*0*No match. Keep searching."]);
				else obj_typewriter.talk_once(["P*0*We need your fingerprints for an investigation.", "S*0*Alright.", "T*0*No match. Keep searching."]);
				
				if(!array_contains(global.suspects, obj_typewriter.current_talking)) array_push(global.suspects, obj_typewriter.current_talking);
				array_push(global.fingerprints, obj_typewriter.current_talking);
			}
			else
			{
				obj_typewriter.talk_once(["T*2*Detective. We already took their fingerprints.", "P*0*Oh, right."]);
			}
			
			with(obj_talkbutton)
			{
				instance_destroy();	
			}
			break;
			
		case 2:
			with(obj_typewriter)
			{
				am_in_dlgselect = false;
				talk_progress = 0;
				talk_dlg_type = -1;
				
				finish_type = "receipt";
				talk_once(["P*0*We want the names of everyone who's been to your store recently.", "S*0*Alright. Here are the receipts I kept from the last 24 hours.", "S*0*Anything older is thrown out."]);	
			}		
			
			with(obj_talkbutton)
			{
				instance_destroy();	
			}
			break;
			
		case 3:
			audio_sound_gain(mus_investigation, 0, 1000);
			if(global.people[obj_typewriter.current_talking].killer)
			{
				with(obj_typewriter)
				{
					am_in_dlgselect = false;
					talk_progress = 0;
					talk_dlg_type = -1;
				
					finish_type = "summation";
					obj_typewriter.talk_once(["P*0*The killer is... YOU!", "P*0*Isn't that right, " + global.people[obj_typewriter.current_talking].first_name + " " + global.people[obj_typewriter.current_talking].last_name + "?", "S*0*That's preposterous! I'm no killer!", "P*0*Oh yeah? I'll prove how you did it.", "P*0*I'll break down your crime, step by step.", "T*0*Excuse me.", "T*0*As the one who solved this case, I should be explaining it.", "P*0*What are you talking about? I did all the work!", "T*1*Listen, Detective. Sit back and relax. This is my thing."]);	
				}	
			}
			else
			{
				with(obj_typewriter)
				{
					am_in_dlgselect = false;
					talk_progress = 0;
					talk_dlg_type = -1;
				
					finish_type = "restart";
					obj_typewriter.talk_once(["P*0*The killer is... YOU!", "P*0*Isn't that right, " + global.people[obj_typewriter.current_talking].first_name + " " + global.people[obj_typewriter.current_talking].last_name + "?", "S*0*...", "T*0*.....", "P*0*.......", "P*0*That sounded a lot better in my head.", "T*0*Well, THAT just happened.", "S*0*Have I done something wrong?", "T*0*I'm very sorry about my partner's behavior.", "P*0*Hey!", "T*1*Listen, Detective. We're going to go get some drinks, and we can talk about a career change.", "P*0*But " + global.people[obj_typewriter.current_talking].first_name + " is the killer!", "T*2*Quiet now."]);	
				}		
			}
			break;
			
		case 4:
			with(obj_typewriter)
			{
				dialogbox = false;
				am_in_dlgselect = false;
				talk_progress = 0;
				current_talking = -1;
			}
			
			with(obj_talkbutton)
			{
				instance_destroy();	
			}
			break;
	}
	
	audio_play_sound(sfx_menublip, 1, 0);
}