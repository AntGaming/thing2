vel = 0;
scale = 0.4;

if(!droppage || !global.people[person_id].alive) y = targ_y;

if(!global.people[person_id].alive || global.people[person_id].schedule == 2)
{
	image_angle = 90;
}

image_xscale = 0.4;
image_yscale = 0.4;

if(!global.people[person_id].alive && !global.met_terence)
{
	global.met_terence = true;
	if(global.difficulty == 0) obj_typewriter.talk_once(["T*1*Took you long enough, pal.", "P*0*Who are you? This is a crime scene.", "T*0*Me?", "T*1*Name's Terence.","T*1*I'm your supervisor for this case.", "P*0*So... are you going to help me?", "T*2*I'm supervising.", "T*1*What are you waiting for? Go solve the case.", "P*0*Ok...", "P*0*How was the victim killed?", "T*0*Here's the autopsy report.", "P*0*Alright. I can do this."]);
	else obj_typewriter.talk_once(["T*1*Hey! Long time no see.", "P*0*Why'd it have to be you again?", "T*2*I'm the best supervisor you could ask for!", "T*0*Anyway, let's start investigating.", "T*0*Here's the autopsy report.", "P*0*Alright. What else do we know?", "T*0*This crime scene suggests to me the murder was planned well in advance.", "T*2*In other words, our killer is very dangerous, and not as careless as the last one.", "P*0*And I was hoping for an easy case. Oh well.", "T*0*The surrounding area hasn't been searched yet, so that falls down to you.", "P*0*Why don't you ever do the searching?", "T*1*I said, I'm supervising!", "T*0*If you need advice, then ask me.", "P*0*Fine..."]);
}

var me = global.people[person_id];

global.buildings[obj_indoors_draw.uid].scene_inspected = true;

if(!me.body_inspected && !me.alive)
{
	me.body_inspected = true;
			
	if(global.difficulty = 0) var autopsywindow = 2;
	else var autopsywindow = 3;
			
	var death_time_start = copy_struct(me.death_time);
	var death_time_end = copy_struct(me.death_time);	
			
	var fluctstart = irandom(autopsywindow);
	var fluctend = autopsywindow-fluctstart;
			
	if(death_time_start.hour - fluctstart < 0)
	{
		death_time_start.day--;
	}
			
	if(death_time_end.hour + fluctend > 23)
	{
		death_time_start.day++;
	}
			
	death_time_start.hour = (death_time_start.hour - fluctstart + 24) % 24;
	death_time_end.hour = (death_time_end.hour + fluctend + 24) % 24;
			
	array_push(global.evidence, 
	{
		head: "autopsy",
		body:
		{
			death_time_start: death_time_start,
			death_time_end: death_time_end,
			victim: person_id
		}
	});
}