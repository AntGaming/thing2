if(dialogbox)
{
	if(!(room == rm_map && obj_roomtrans.alpha != 0))
	{
		draw_set_color(#000226);
		draw_set_alpha(0.8);
		draw_rectangle(0, 1080/15 * 10, 1920, 1080/15 * 14, false);
	
		draw_set_color(c_white);
		draw_set_alpha(1);
	
		todraw.draw(500, 1080/15 * 11, typist);
		
		var daname = "";
		
		switch(process_dlg(talk_array[talk_progress], 0))
		{
			case "P":
				draw_detective(200, 1080/15 * 14, 3, 0);
				daname = "You";
				break;
				
			case "T":
				draw_sprite_ext(spr_terence, process_dlg(talk_array[talk_progress], 1), 200, 1080/15 * 14, 3, 3, 0, c_white, 1);
				daname = "Terence D. Fortner";
				break;
				
			case "F":
				daname = "Forensics";
				break;
				
			case "S":
				daname = global.people[current_talking].first_name + " " + global.people[current_talking].last_name;
				draw_person(current_talking, 200, 1080/15 * 14, 3, 0, true);
				break;
		}
		
		draw_set_font(fon_century_idk);
		draw_set_color(c_black);
		draw_rectangle(400 - 16, 1080/15 * 9.5 + sin(get_timer()/800000)*10 + string_height(daname) + 16, 400 + string_width(daname) + 16, 1080/15 * 9.5 + sin(get_timer()/800000)*10 -16, false);
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		draw_set_color(c_white);
		draw_text_ext_transformed(400, 1080/15 * 9.5 + sin(get_timer()/800000)*10, daname, 0, 9999, 1, 1, 0);
		
		if(!am_in_dlgselect)
		{
			draw_set_color(c_white);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_font(fon_century_0);
			draw_set_alpha(0.2);
			draw_text(1920/2, 1080/15 * 13, "SPACE to advance text");
			draw_set_alpha(1);
		}
		
	}
}