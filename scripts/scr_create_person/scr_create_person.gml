// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_person(city_id, x_pos, y_pos)
{
	var sex = irandom(1);
	var theperson =
	{
		addr_city: city_id,
		addr_x_pos: x_pos,
		addr_y_pos: y_pos,
		work_city: city_id,
		work_x_pos: x_pos,
		work_y_pos: y_pos,
		job: 0,
		work_start: 0,
		work_duration: 0,
		commute_info: [],
		schedule: array_create(24, 0),
		cur_city: city_id,
		x_pos: x_pos,
		y_pos: y_pos,
		alive: true,
		body: true,
		killer: false,
		needs:
		{
			food: random_range(0.45, 1),
			social: random_range(0.45, 1),
			weapon: random_range(0.45, 1),
			kill: 0.6
		},
		socialtype: choose(activities.nightclub, activities.pizza),
		likesweapon: (random(1) <= 0.7),
		holding: -1,
		free_time:
		{
			act_type: -1,
			act_start: -1,
			act_end: -1,
			act_city: -1,
			act_x_pos: -1,
			act_y_pos: -1,
			commute_dur: -1
		},
		training: -1,
		memories: [],
		first_name: obj_namegen.generate_person_name(0, sex),
		last_name: obj_namegen.generate_person_name(1, sex),
		gender: sex,
		death_time: -1,
		ineedmorebullets: false,
		death_method: -1,
		body_inspected: false,
		discovery_countdown: (global.difficulty == 0 ? irandom_range(3, 4) : irandom_range(3, 6))
	};
	
	while(array_contains(global.taken_names, theperson.first_name + " " + theperson.last_name))
	{
		theperson.first_name = obj_namegen.generate_person_name(0, sex);
		theperson.last_name = obj_namegen.generate_person_name(1, sex);
	}
	
	array_push(global.taken_names, theperson.first_name + " " + theperson.last_name);
	
	theperson.appearance = obj_appeargen.generate_appearance(sex);
	
	array_push(global.people, theperson);
	global.ppl++;
}