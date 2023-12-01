vel += 0.3;
y += vel;

if(y >= targ_y)
{
	 y = targ_y;
	 vel = -vel/3;
}

depth = -bbox_bottom;

if(mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, id, true, false) && obj_roomtrans.alpha == 0 && !obj_typewriter.dialogbox)
{
	var me = global.people[person_id];
	if(!me.alive)
	{
		if(me.job == 0) var victimstate = "T*0*The victim was unemployed.";
		else var victimstate = "T*0*The victim was a " + global.names_jobs[me.job] + " who worked in " + global.city_info[me.work_city].name + ".";
		
		switch(me.death_method)
		{
			case items.axe:
			{
				obj_typewriter.talk_once([victimstate, "P*0*The deep wounds on this body seem characteristic of an axe.", "T*0*We need to start looking for it.", "P*0*The killer had to dispose of it somewhere... but where?", "T*0*It might also be worth asking around hardware stores and seeing who bought axes recently."]);
				break;		
			}
			case items.gun:
			{
				if(me.ineedmorebullets)
				{
					obj_typewriter.talk_once([victimstate, "P*0*A single bullet wound to the head.", "T*0*It would be helpful if we found the gun...", "P*0*The killer had to dispose of it somewhere... but where?", "T*0*We should also ask around gun stores to get a list of potential owners.", "P*0*For now, I'll take this bullet as evidence.", "T*0*If we find the gun, we can bring them both back to Forensics at the station...", "T*0*And we'll see if they match."]);
					me.ineedmorebullets = false;
					array_push(global.evidence, 
					{
						head: "bullet",
						body: person_id
					});
				}
				else
				{
					obj_typewriter.talk_once([victimstate, "P*0*A single bullet wound to the head.", "T*0*It would be helpful if we found the gun...", "P*0*The killer had to dispose of it somewhere... but where?", "T*0*We should also ask around gun stores to get a list of potential owners.", "P*0*Nothing new here. I've already removed the bullet as evidence."]);
				}
		
				break;		
			}
			case items.pipe:
			{
				obj_typewriter.talk_once([victimstate, "P*0*The impact on this body suggests an assault by a blunt object.", "T*0*We need to start looking for it.", "P*0*The killer had to dispose of it somewhere... but where?", "T*0*It might also be worth asking around hardware stores to see potential weapons."]);
				break;		
			}
		}
	}
	else
	{
		if(!global.met_terence) obj_typewriter.talk_once(["P*0*I should get to the crime scene before I start talking to people."]);
		else
		{
			obj_typewriter.current_talking = person_id;
			if(me.schedule[global.hour] == 2) var introtalk = choose("S*0*Why are you in my house?", "S*0*Is something wrong?", "S*0*Did you have to wake me up?", "S*0*Huh?", "S*0*Who are you?", "S*0*How did you get in?");
			else if(me.schedule[global.hour] == 1)
			{
				switch(me.job)
				{
					case jobs.bartender:
						var introtalk = choose("S*0*What can I get you?", "S*0*Would you like a drink?", "S*0*Can I get you something?");
						break;
					
					case jobs.police_officer:
						var introtalk = choose("S*0*How goes the investigation?", "S*0*Looking sharp, Detective.", "S*0*Go find that killer before we all get fired!", "S*0*Any new leads?", "S*0*Keep fighting for justice!", "S*0*That killer won't find themselves!");
						break;
					
					case jobs.waiter:
						var introtalk = choose("S*0*What can I get you?", "S*0*Can I get you something?", "S*0*Would you like to see the menu?", "S*0*Ordering pizza, Detective? At a time like this?", "S*0*We do not have a detectives' discount.", "S*0*I'm no killer, but our food is to die for!");
						break;
				
					default:
						var introtalk = choose("S*0*Is this urgent?", "S*0*Can this wait? I'm working.", "S*0*Can I get you something?", "S*0*Can I help you?", "S*0*Am I in trouble?", "S*0*Hello, Detective.", "S*0*What's up?", "S*0*What is it?", "S*0*Is there a problem?");	
				}
			}
			else
			{
				var introtalk = choose("S*0*Can I help you?", "S*0*Am I in trouble?", "S*0*Hello, Detective.", "S*0*What's up?", "S*0*What is it?", "S*0*Is there a problem?");	
			}
		
			var receptos = false;
		
			if(me.schedule[global.hour] == 1 && (me.job == jobs.cashier))
			{
				for(var j = 0; j < array_length(global.buildings); j++)
				{
					var theb = global.buildings[j];	
					if(theb.x_pos == me.work_x_pos && theb.y_pos == me.work_y_pos && theb.city_id == me.work_city && (theb.type == builds.gunstore || theb.type == builds.hardwarestore))
					{
						receptos = true;
					}
				}
			}
		
			if(receptos) obj_typewriter.talk_dlg([introtalk], 1);
			else obj_typewriter.talk_dlg([introtalk], 0);
		}
	}
}