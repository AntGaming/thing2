draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fon_century_mid);

var wid = string_width(name)/2;
var hei = string_height(name)/2;

switch(obj_intromanager.phase)
{
	case 0:
		if(obj_intromanager.stylish)
		{
			name = "START";
			visible = true;
		}
		break;
		
	case 1:
		name = "CONTINUE";
		break;
		
	case 2:
		name = "OPEN THE CASE!";
		break;
}

if(point_in_rectangle(mouse_x, mouse_y, x - wid - 4, y - hei - 4, x + wid + 4, y + hei + 4) && mouse_check_button_pressed(mb_left))
{
	if(obj_intromanager.phase == 0) obj_intromanager.next();
	else
	{
		audio_play_sound(sfx_menuconf, 1, 0);
		obj_intromanager.phase++;
		with(obj_introbutton) instance_destroy();
		
		if(obj_intromanager.phase == 2)
		{
			instance_create_layer(room_width/4, room_height/8 * 3, "Instances", obj_difficultybutton, {image_index: 0});
			instance_create_layer(room_width/4 * 3, room_height/8 * 3, "Instances", obj_difficultybutton, {image_index: 1});
		}
		else if(obj_intromanager.phase == 3)
		{
			audio_play_sound(sfx_impact, 1, 0);
			audio_sound_gain(mus_title, 0, 2000);
			obj_roomtrans.transition(rm_map);
			instance_destroy();
		}
	}
}