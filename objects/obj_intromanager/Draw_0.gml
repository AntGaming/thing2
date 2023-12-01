switch(phase)
{
	case 0:
		if(showing)
		{
			//draw_sprite(spr_begin, 0, room_width/2, (room_height/4)*(4)-128+16+16);
		}
		break;
	
	case 1:
		draw_detective(room_width/3, room_height/2, 2, 0);
		break;
	
	case 2:
	case 3:
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fon_century_mid);
		draw_set_color(c_white);
		var text = (global.difficulty == 0 ? "The killer is hard to find, but will make mistakes.\nRecommended for first time players." : "The killer is patient and calculating.\nExperienced detectives only.")
		draw_text(room_width/2, room_height/8 * 6, text)
		break;
}