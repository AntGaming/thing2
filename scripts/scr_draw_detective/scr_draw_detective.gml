// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_detective(_x, _y, scale, rot)
{
	var appearance = global.det_appear;
	
	draw_sprite_ext(spr_base, 0, _x, _y, scale, scale, rot, c_white, 1);
	draw_sprite_ext(spr_detclothes, 0, _x, _y, scale, scale, rot, c_white, 1);
	
	if(appearance[2] == 0)
	{
		switch(appearance[0])
		{
			case 0:
				draw_sprite_ext(spr_hair_m1, appearance[1], _x, _y, scale, scale, rot, c_white, 1);
				break;
			
			case 1:
				draw_sprite_ext(spr_hair_m2, appearance[1], _x, _y, scale, scale, rot, c_white, 1);
				break;
			
			case 2:
				draw_sprite_ext(spr_hair_m3, appearance[1], _x, _y, scale, scale, rot, c_white, 1);
				break;
		}
		draw_sprite_ext(spr_face_m, 0, _x, _y, scale, scale, rot, c_white, 1);
	}
	else
	{
		switch(appearance[0])
		{
			case 0:
				draw_sprite_ext(spr_hair_f1, appearance[1], _x, _y, scale, scale, rot, c_white, 1);
				break;
			
			case 1:
				draw_sprite_ext(spr_hair_f2, appearance[1], _x, _y, scale, scale, rot, c_white, 1);
				break;
			
			case 2:
				draw_sprite_ext(spr_hair_f3, appearance[1], _x, _y, scale, scale, rot, c_white, 1);
				break;
		}
		draw_sprite_ext(spr_face_f, 0, _x, _y, scale, scale, rot, c_white, 1);
	}
	
	draw_sprite_ext(spr_detscarf, 0, _x, _y, scale, scale, rot, c_white, 1);
}