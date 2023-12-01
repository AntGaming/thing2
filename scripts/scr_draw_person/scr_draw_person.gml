// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_person(person, _x, _y, scale, rot, pov)
{
	var appearance = global.people[person].appearance;
	
	if(!global.people[person].alive && pov) draw_sprite_ext(spr_blood, 0, _x, _y, scale, scale, 0, c_white, 1);
	
	draw_sprite_ext(spr_base, 0, _x, _y, scale, scale, rot, c_white, 1);
	draw_sprite_ext(spr_shirts, appearance[1], _x, _y, scale, scale, rot, c_white, 1);
	draw_sprite_ext(spr_trousers, appearance[2], _x, _y, scale, scale, rot, c_white, 1);
	if(appearance[0] == 0)
	{
		switch(appearance[3])
		{
			case 0:
				draw_sprite_ext(spr_hair_m1, appearance[4], _x, _y, scale, scale, rot, c_white, 1);
				break;
			
			case 1:
				draw_sprite_ext(spr_hair_m2, appearance[4], _x, _y, scale, scale, rot, c_white, 1);
				break;
			
			case 2:
				draw_sprite_ext(spr_hair_m3, appearance[4], _x, _y, scale, scale, rot, c_white, 1);
				break;
		}
		if(global.people[person].alive || !pov) draw_sprite_ext(spr_face_m, (global.people[person].schedule[global.hour] == 2 && pov && obj_typewriter.current_talking != person ? 1 : 0), _x, _y, scale, scale, rot, c_white, 1);
	}
	else
	{
		switch(appearance[3])
		{
			case 0:
				draw_sprite_ext(spr_hair_f1, appearance[4], _x, _y, scale, scale, rot, c_white, 1);
				break;
			
			case 1:
				draw_sprite_ext(spr_hair_f2, appearance[4], _x, _y, scale, scale, rot, c_white, 1);
				break;
			
			case 2:
				draw_sprite_ext(spr_hair_f3, appearance[4], _x, _y, scale, scale, rot, c_white, 1);
				break;
		}
		if(global.people[person].alive || !pov) draw_sprite_ext(spr_face_f, (global.people[person].schedule[global.hour] == 2 && pov && obj_typewriter.current_talking != person ? 1 : 0), _x, _y, scale, scale, rot, c_white, 1);
	}
	
	if(!global.people[person].alive)
	{
		draw_sprite_ext(spr_face_dead, 0, _x, _y, scale, scale, rot, c_white, 1);
	}
	
	if(global.people[person].schedule[global.hour] == 1 && global.people[person].alive && pov)
	{
		switch(global.people[person].job)
		{
			case jobs.police_officer:
				draw_sprite_ext(spr_uniform, 0, _x, _y, scale, scale, rot, c_white, 1);
				break;
			
			case jobs.guard:
				draw_sprite_ext(spr_uniform, 1, _x, _y, scale, scale, rot, c_white, 1);
				break;
		
			case jobs.station_manager:
				draw_sprite_ext(spr_uniform, 2, _x, _y, scale, scale, rot, c_white, 1);
				break;
		
			case jobs.chef:
				draw_sprite_ext(spr_uniform, 3, _x, _y, scale, scale, rot, c_white, 1);
				break;
		}
	}
}