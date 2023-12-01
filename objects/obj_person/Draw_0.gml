if(global.people[person_id].schedule[global.hour] == 2 || !global.people[person_id].alive) draw_person(person_id, x, y, scale, 90, true);
else draw_person(person_id, x, y, scale, 0, true);

draw_set_font(fon_century_0);
draw_set_halign(fa_center);

var name = scribble("[fon_century_0][scale, 0.5][fa_center][#000000]" + global.people[person_id].first_name + " " + global.people[person_id].last_name);
var job = scribble("[fon_century_0][scale, 0.25][fa_center][#FFFFFF]" + string_ucfirst(global.names_jobs[global.people[person_id].job]));

draw_set_alpha(0.6);
if(array_contains(global.suspects, person_id)) draw_set_color(#662a2a);
draw_rectangle(name.get_left()+x-2, name.get_top()+(y-90)-2, name.get_right()+x+2, name.get_bottom()+(y-90)+2, false);
if(global.people[person_id].schedule[global.hour] == 1 && global.people[person_id].alive)
{
	draw_set_color(c_red);
	draw_rectangle(job.get_left()+x-2, job.get_top()+(y-70)-2, job.get_right()+x+2, job.get_bottom()+(y-70)+2, false);
	job.draw(x, y-70);
}

draw_set_color(c_white);
name.draw(x, y-90);

draw_set_alpha(1);
