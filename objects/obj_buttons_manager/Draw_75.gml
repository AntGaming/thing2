var scale = view_get_wport(0)/camera_get_view_width(cam);
var tx = mouse_x-camera_get_view_x(cam);
var ty = mouse_y-camera_get_view_y(cam);

if(global.evidence_show)
{
	switch(global.evidence_mode)
	{
		case "items":
		{
			draw_set_font(fon_century_big);
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
	
			draw_text(1920/2, 1080/50, "EVIDENCE");
	
			for(var i = 0; i < array_length(global.evidence); i++)
			{
				if(floor(i/4) == page-1)
				{
					var evd = global.evidence[i];
					draw_set_color(c_black);
					draw_rectangle(1920/4 - 4, 170*((i%4)+2) - 64 - 4, 1920/4 * 3 + 4, 170*((i%4)+2) + 64 + 4, false);
					draw_set_color(c_grey);
					draw_rectangle(1920/4, 170*((i%4)+2) - 64, 1920/4 * 3, 170*((i%4)+2) + 64, false);
					draw_set_color(c_white);
		
					switch(evd.head)
					{
						case "weapon":
						{
							var weapons = ["Knife", "Axe", "Metal pipe", "Gun"];
							draw_sprite(spr_weapons, evd.body.type, 1920/4, 170*((i%4)+2)-64);
							draw_set_font(fon_century_idk);
							draw_set_halign(fa_left);
							draw_set_valign(fa_top);
							draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64, weapons[evd.body.type]);
							var sh = string_height("Metal pipe");
							draw_set_font(fon_century_0);
			
							if(global.difficulty == 1)
							{
								draw_set_color(c_orange);
								draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64+sh, "Fingerprints wiped off");
								draw_set_color(c_white);
							}
							else if(array_contains(global.fingerprints, evd.body.fingerprints))
							{
								draw_set_color(c_lime);
								draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64+sh, "Contains the fingeprints of " + global.people[evd.body.fingerprints].first_name + " " + global.people[evd.body.fingerprints].last_name);
								draw_set_color(c_white);
							}
							else
							{
								draw_set_color(c_orange);
								draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64+sh, "Contains fingerprints (no matches)");
								draw_set_color(c_white);
							}
				
							var sh2 = string_height("Contains unknown fingerprints");
				
							if(evd.body.type != items.gun)
							{
								draw_set_color(#8f0700);
								draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64+sh+sh2, "Has the blood of " + global.people[evd.body.blood].first_name + " " + global.people[evd.body.blood].last_name);
								draw_set_color(c_white);
							}
							else if(evd.body.revealed)
							{
								draw_set_color(#8f0700);
								draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64+sh+sh2, "The murder weapon of " + global.people[evd.body.blood].first_name + " " + global.people[evd.body.blood].last_name);
								draw_set_color(c_white);
							}
				
							break;
						}
			
						case "bullet":
						{
							draw_sprite(spr_extraevidence, 1, 1920/4, 170*((i%4)+2)-64);
							draw_set_font(fon_century_idk);
							draw_set_halign(fa_left);
							draw_set_valign(fa_top);
							draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64, "Bullet");
							var sh = string_height("Bullet");
							draw_set_font(fon_century_0);
			
							draw_set_color(c_aqua);
							draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64+sh, "Needs to be matched to a gun");
							draw_set_color(c_white);
				
							var sh2 = string_height("Needs to be matched to a gun");
				
							draw_set_color(#8f0700);
							draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64+sh+sh2, "Found in the body of " + global.people[evd.body].first_name + " " + global.people[evd.body].last_name);
							draw_set_color(c_white);
				
							break;
						}
			
						case "autopsy":
						{
							draw_sprite(spr_extraevidence, 0, 1920/4, 170*((i%4)+2)-64);
							draw_set_font(fon_century_idk);
							draw_set_halign(fa_left);
							draw_set_valign(fa_top);
							draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64, "Autopsy report - " + global.people[evd.body.victim].last_name);
							var sh = string_height("Autopsy report - " + global.people[evd.body.victim].last_name);
							draw_set_font(fon_century_0);
			
							var autopsy = "";
				
							autopsy += timeconvert(evd.body.death_time_start.hour) + ", [#d1d1d1]" + (evd.body.death_time_start.day < 10 ? "0" : "") + string(evd.body.death_time_start.day) + "/" + (evd.body.death_time_start.month < 10 ? "0" : "") + string(evd.body.death_time_start.month) + "[/]";
							autopsy += " - " + timeconvert(evd.body.death_time_end.hour) + ", [#d1d1d1]" + (evd.body.death_time_end.day < 10 ? "0" : "") + string(evd.body.death_time_end.day) + "/" + (evd.body.death_time_end.month < 10 ? "0" : "") + string(evd.body.death_time_end.month) + "[/]";
			
							draw_text_scribble(1920/4 + 128 + 32, 170*((i%4)+2)-64+sh, autopsy);	
				
							var sh2 = string_height("Deathg time goes here");
				
							var deathdesc = "";
				
							switch(global.people[evd.body.victim].death_method)
							{
								case items.axe:
									deathdesc = "Struck by an axe.";
									break;
						
								case items.gun:
									deathdesc = "Fatal shot to the head.";
									break;
						
								case items.pipe:
									deathdesc = "Struck in the head by a large blunt object.";
									break;
							}
				
							draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64+sh+sh2, deathdesc);
				
							break;
						}
					}
				}
			}
			
			
			total = ceil(i/4);
			
			if(total != 0)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_top);
				draw_set_color(c_lime);
				draw_set_font(fon_century_0);
				draw_text(1920/2, 1080/50 + 200, "Page " + string(page) + " of " + string(ceil(i/4)));
			}
			
			draw_set_color(c_white);
			
			if(page < ceil(i/4)) draw_sprite(spr_leftright, 1, 1920/5 * 4, 1080/2);
			if(page > 1) draw_sprite(spr_leftright, 0, 1920/5, 1080/2);
			break;
		}
	
		case "camera":
		{
			draw_set_font(fon_century_big);
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
	
			draw_text(1920/2, 1080/50, "OUTSIDE CAMERA");
			
			var k = 0;
			
			for(var i = 0; i < array_length(global.camlogs[obj_city_draw.city_id]); i++)
			{
				var logg = global.camlogs[obj_city_draw.city_id][i];
				
				if(dates_equal(review_date, logg.date))
				{
					var passed = false;
					for(var j = 0; j < array_length(logg.log); j++)
					{
						if(logg.log[j][0] == global.p_x_pos && logg.log[j][1] == global.p_y_pos) passed = true;
					}
					
					if(passed)
					{
						if(floor(k/4) == page-1)
						{
							draw_set_color(c_black);
							draw_rectangle(1920/4 - 4, 170*((k%4)+2) - 64 - 4, 1920/4 * 3 + 4, 170*((k%4)+2) + 64 + 4, false);
							draw_set_color(c_grey);
							if(array_contains(global.suspects, logg.person))
							{
								draw_set_color(#5e4444);
							}
							else if(point_in_rectangle(tx*scale, ty*scale, 1920/4, 170*((k%4)+2) - 64, 1920/4 * 3, 170*((k%4)+2) + 64))
							{
								draw_set_color(#5e5e5e);	
								if(mouse_check_button_pressed(mb_left))
								{
									array_push(global.suspects, logg.person);
									audio_play_sound(sfx_menuconf, 1, 0);
								}
							}
							
							//if(global.people[logg.person].killer) draw_set_color(c_aqua);
							draw_rectangle(1920/4, 170*((k%4)+2) - 64, 1920/4 * 3, 170*((k%4)+2) + 64, false);
							draw_set_color(c_white);
							
							
				
							draw_person(logg.person, 1920/4+64, 170*((k%4)+2)-64+64, 0.5, 0, false);
							draw_set_font(fon_century_idk);
							draw_set_halign(fa_left);
							draw_set_valign(fa_top);
							draw_text(1920/4 + 128 + 32, 170*((k%4)+2)-64, global.people[logg.person].first_name + " " + global.people[logg.person].last_name);
							
							if(!array_contains(global.suspects, logg.person))
							{
								var sh = string_height("Bullet");
								draw_set_font(fon_century_0);
			
				
								draw_set_color(c_lime);
								draw_text(1920/4 + 128 + 32, 170*((k%4)+2)-64+sh, "Click to add to your suspects list");
								draw_set_color(c_white);
							}
							else
							{
								var sh = string_height("Bullet");
								draw_set_font(fon_century_0);
			
				
								draw_set_color(c_white);
								draw_text(1920/4 + 128 + 32, 170*((k%4)+2)-64+sh, "Suspect");
								draw_set_color(c_white);
							}
						}
						
						k++;
					}
				}
			}
			
			total = ceil(k/4);
			
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			
			if(total == 0)
			{
				draw_set_font(fon_century_mid);
				draw_set_color(c_lime);
				draw_text(1920/2, 1080/50 + 130, timeconvert(review_date.hour-1) + "-" + timeconvert(review_date.hour) + ", " + (review_date.day < 10 ? "0" : "") + string(review_date.day) + "/" + (review_date.month < 10 ? "0" : "") + string(review_date.month));
				draw_set_font(fon_century_0);
				draw_text(1920/2, 1080/50 + 200, "No people spotted");
			}
			else
			{
				draw_set_font(fon_century_mid);
				draw_set_color(c_lime);
				draw_text(1920/2, 1080/50 + 130, timeconvert(review_date.hour-1) + "-" + timeconvert(review_date.hour) + ", " + (review_date.day < 10 ? "0" : "") + string(review_date.day) + "/" + (review_date.month < 10 ? "0" : "") + string(review_date.month));
				draw_set_font(fon_century_0);
				draw_text(1920/2, 1080/50 + 200, "Page " + string(page) + " of " + string(ceil(k/4)));
			
				draw_set_color(c_white);
			
				if(page < ceil(k/4)) draw_sprite(spr_leftright, 1, 1920/5 * 4, 1080/2);
				if(page > 1) draw_sprite(spr_leftright, 0, 1920/5, 1080/2);
			}
			
			draw_set_color(c_white);
			
			break;
		}
	
		case "messages":
		{
			draw_set_font(fon_century_big);
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
	
			draw_text(1920/2, 1080/50, "MESSAGES");
	
			for(var i = 0; i < array_length(global.phone_messages); i++)
			{
				var msg = global.phone_messages[i];
				draw_set_color(c_black);
				draw_rectangle(1920/4 - 4, 170*(i+2) - 64 - 4, 1920/4 * 3 + 4, 170*(i+2) + 64 + 4, false);
				draw_set_color(c_grey);
				draw_rectangle(1920/4, 170*(i+2) - 64, 1920/4 * 3, 170*(i+2) + 64, false);
				draw_set_color(c_white);
		
				draw_sprite(spr_text, 0, 1920/4, 170*(i+2)-64);
				draw_set_font(fon_century_idk);
				draw_set_halign(fa_left);
				draw_set_valign(fa_top);
				draw_text(1920/4 + 128 + 32, 170*(i+2)-64,  + "Homicide Unit");
				var sh = string_height("Metal pipe");
				draw_set_font(fon_century_0);
			
				draw_set_color(c_lime);
				draw_text(1920/4 + 128 + 32, 170*(i+2)-64+sh, timeconvert(msg.date.hour) + ", " + (msg.date.day < 10 ? "0" : "") + string(msg.date.day) + "/" + (msg.date.month < 10 ? "0" : "") + string(msg.date.month));
				draw_set_color(c_white);
				
				var sh2 = string_height("Deathg time goes here");
				
				draw_set_color(c_black);
				draw_text(1920/4 + 128 + 32, 170*(i+2)-64+sh+sh2, msg.body);
				draw_set_color(c_white);
				
			}
			break;
		}
	
		case "suspects":
		{
			draw_set_font(fon_century_big);
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
	
			draw_text(1920/2, 1080/50, "SUSPECTS");
	
			for(var i = 0; i < array_length(global.suspects); i++)
			{
				if(floor(i/4) == page-1)
				{
					var evd = global.suspects[i];
					var pers = global.people[global.suspects[i]];
					draw_set_color(c_black);
					draw_rectangle(1920/4 - 4, 170*((i%4)+2) - 64 - 4, 1920/4 * 3 + 4, 170*((i%4)+2) + 64 + 4, false);
					draw_set_color(c_grey);
					draw_rectangle(1920/4, 170*((i%4)+2) - 64, 1920/4 * 3, 170*((i%4)+2) + 64, false);
					draw_set_color(c_white);
		
					draw_person(evd, 1920/4+64, 170*((i%4)+2)-64+64, 0.5, 0, false);
					draw_set_font(fon_century_idk);
					draw_set_halign(fa_left);
					draw_set_valign(fa_top);
					draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64, pers.first_name + " " + pers.last_name);
					var sh = string_height("Metal pipe");
					draw_set_font(fon_century_0);
			
					draw_set_color(c_black);
					if(pers.job == 0)
					{
						draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64+sh, "Unemployed, lives in " + global.city_info[pers.addr_city].name);
					}
					else
					{
						draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64+sh, string_ucfirst(global.names_jobs[pers.job]) + ", works in " + global.city_info[pers.work_city].name);
					}
					
					draw_set_color(c_white);
				
					//FINGERPRINTS
					var sh2 = string_height("Contains unknown fingerprints");
				
					if(array_contains(global.fingerprints, evd))
					{
						draw_set_color(c_lime);
						if(pers.killer && global.difficulty == 0) draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64+sh+sh2, "Fingerprints taken - match with weapon");
						else draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64+sh+sh2, "Fingerprints taken - no match found");
						draw_set_color(c_white);
					}
					else
					{
						draw_set_color(#8f0700);
						draw_text(1920/4 + 128 + 32, 170*((i%4)+2)-64+sh+sh2, "Fingerprints not taken");
						draw_set_color(c_white);
					}
				}
			}
			
			
			total = ceil(i/4);
			
			if(total != 0)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_top);
				draw_set_color(c_lime);
				draw_set_font(fon_century_0);
				draw_text(1920/2, 1080/50 + 200, "Page " + string(page) + " of " + string(ceil(i/4)));
			}
			
			draw_set_color(c_white);
			
			if(page < ceil(i/4)) draw_sprite(spr_leftright, 1, 1920/5 * 4, 1080/2);
			if(page > 1) draw_sprite(spr_leftright, 0, 1920/5, 1080/2);
			break;
		}
	
		case "receipts":
		{
			draw_set_font(fon_century_big);
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
	
			draw_text(1920/2, 1080/50, "SALES RECORDS");
			
			var k = 0;
			
			for(var i = 0; i < array_length(global.receipts); i++)
			{
				var rcpt = global.receipts[i];
				
				var passed = false;
				if(rcpt.x_pos == global.p_x_pos && rcpt.y_pos == global.p_y_pos && rcpt.city_id == global.p_city) passed = true;
					
				if(passed)
				{
					if(floor(k/4) == page-1)
					{
						draw_set_color(c_black);
						draw_rectangle(1920/4 - 4, 170*((k%4)+2) - 64 - 4, 1920/4 * 3 + 4, 170*((k%4)+2) + 64 + 4, false);
						draw_set_color(c_grey);
						if(array_contains(global.suspects, rcpt.person))
						{
							draw_set_color(#5e4444);
						}
						else if(point_in_rectangle(tx*scale, ty*scale, 1920/4, 170*((k%4)+2) - 64, 1920/4 * 3, 170*((k%4)+2) + 64))
						{
							draw_set_color(#5e5e5e);	
							if(mouse_check_button_pressed(mb_left))
							{
								array_push(global.suspects, rcpt.person);
								audio_play_sound(sfx_menuconf, 1, 0);
							}
						}
							
						//sif(global.people[logg.person].killer) draw_set_color(c_aqua);
						draw_rectangle(1920/4, 170*((k%4)+2) - 64, 1920/4 * 3, 170*((k%4)+2) + 64, false);
						draw_set_color(c_white);
							
				
						draw_person(rcpt.person, 1920/4+64, 170*((k%4)+2)-64+64, 0.5, 0, false);
						draw_set_font(fon_century_idk);
						draw_set_halign(fa_left);
						draw_set_valign(fa_top);
						draw_text(1920/4 + 128 + 32, 170*((k%4)+2)-64, global.people[rcpt.person].first_name + " " + global.people[rcpt.person].last_name);
						
						if(!array_contains(global.suspects, rcpt.person))
						{
							var sh = string_height("Bullet");
							draw_set_font(fon_century_0);
			
				
							draw_set_color(c_lime);
							draw_text(1920/4 + 128 + 32, 170*((k%4)+2)-64+sh, "Click to add to your suspects list");
							draw_set_color(c_white);
						}
						else
						{
							var sh = string_height("Bullet");
							draw_set_font(fon_century_0);
			
				
							draw_set_color(c_white);
							draw_text(1920/4 + 128 + 32, 170*((k%4)+2)-64+sh, "Suspect");
							draw_set_color(c_white);
						}
						
						var weapons = ["a knife", "an axe", "a metal pipe", "a gun"];
						
						var sh2 = string_height("Bullet");
						draw_set_color(c_black);
						draw_text(1920/4 + 128 + 32, 170*((k%4)+2)-64+sh+sh2, "Bought " + weapons[rcpt.type] + " at " + timeconvert(rcpt.date.hour) + ", " + (rcpt.date.day < 10 ? "0" : "") + string(rcpt.date.day) + "/" + (rcpt.date.month < 10 ? "0" : "") + string(rcpt.date.month));
						draw_set_color(c_white);
					}
						
					k++;
				}
			}
			
			total = ceil(k/4);
			
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			
			if(total == 0)
			{
				draw_set_color(c_lime);
				draw_set_font(fon_century_0);
				draw_text(1920/2, 1080/50 + 200, "No purchases in the last 24 hours");
			}
			else
			{
				draw_set_color(c_lime);
				draw_set_font(fon_century_0);
				draw_text(1920/2, 1080/50 + 200, "Page " + string(page) + " of " + string(ceil(k/4)));
			
				draw_set_color(c_white);
			
				if(page < ceil(k/4)) draw_sprite(spr_leftright, 1, 1920/5 * 4, 1080/2);
				if(page > 1) draw_sprite(spr_leftright, 0, 1920/5, 1080/2);
			}
			
			draw_set_color(c_white);
			
			break;
		}
	}
}

draw_set_color(c_white);