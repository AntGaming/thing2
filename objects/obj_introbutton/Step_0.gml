draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fon_century_big);

switch(but_num)
{
	case 0:
		name = "Hair type";
		break;
		
	case 1:
		name = "Hair col.";
		break;
	
	case 2:
		if(global.det_appear[2] == 0) name = "Male";
		else name = "Female";
		break;
}


var wid = string_width(name)/2;
var hei = string_height(name)/2;

if(point_in_rectangle(mouse_x, mouse_y, x - wid - 8, y - hei - 8, x + wid + 8, y + hei + 8) && mouse_check_button_pressed(mb_left))
{
	global.det_appear[but_num]++;
	
	switch(but_num)
	{
		case 0:
			global.det_appear[but_num] = global.det_appear[but_num] % 3;
			break;
			
		case 1:
			global.det_appear[but_num] = global.det_appear[but_num] % 8;
			break;
			
		case 2:
			global.det_appear[but_num] = global.det_appear[but_num] % 2;
			break;
	}
	
	audio_play_sound(sfx_menublip, 1, 0);
}