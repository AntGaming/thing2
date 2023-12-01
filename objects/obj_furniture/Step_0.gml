vel += 0.3;
y += vel;

if(y >= targ_y)
{
	 y = targ_y;
	 vel = -vel/3;
}

depth = -bbox_bottom;

if((tipo == furniture.bush || tipo == furniture.bin || tipo == furniture.security || tipo == furniture.coroner || tipo == furniture.train || tipo == furniture.forensics || tipo == furniture.camera || tipo == furniture.namesign) && !collision_point(mouse_x, mouse_y, id, true, false))
{
	image_alpha = 0.5;
	depth -= 100;
}
else image_alpha = 1;

if(mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, id, true, false) && obj_roomtrans.alpha == 0 && !obj_typewriter.dialogbox)
{
	if(global.met_terence || tipo == furniture.train)
	{
		switch(tipo)
		{
			case furniture.train:
			{
				global.traintravel = true;
				obj_roomtrans.transition(rm_map);
				break;
			}
		
			case furniture.camera:
			{
				obj_typewriter.talk_once(["P*0*A CCTV camera. This has a good view of the outside.", "P*0*If our killer passed by, it would have seen them.", "T*0*Must be a room inside where they keep the footage."]);
				break;
			}
		
			case furniture.bush:
			case furniture.bin:
			{
				if(array_length(global.furniture[fid].contents) != 0)
				{
					switch(global.furniture[fid].contents[0].type)
					{
						case items.axe:
						{
							if(global.difficulty == 0) obj_typewriter.talk_once(["P*0*...", "P*0*I found a blood-covered axe!", "T*0*Nobody knows how to hide weapons these days.", "P*0*We need to start testing suspects for fingerprints."]);
							else obj_typewriter.talk_once(["P*0*...", "P*0*I found a blood-covered axe!", "T*0*Nobody knows how to hide weapons these days.", "P*0*One problem... I can't find any fingerprints.", "T*2*We're dealing with a professional."]);
							break;		
						}
						case items.gun:
						{
							if(global.difficulty == 0) obj_typewriter.talk_once(["P*0*...", "P*0*I found a gun!", "P*0*This is probably the murder weapon.", "T*2*Don't count on it. You should match it to a bullet from the victim first.", "P*0*Right. Then, I need to take fingerprints from suspects..."]);
							else obj_typewriter.talk_once(["P*0*...", "P*0*I found a gun!", "P*0*This is probably the murder weapon.", "T*2*Just as I thought. No fingerprints", "P*0*What use is it, then?", "T*0*We can still try and investigate people who bought guns recently.", "T*2*But without prints, we'll have to rely on cross-examining with the other evidence at out disposal."]);
							break;		
						}
						case items.pipe:
						{
							if(global.difficulty == 0) obj_typewriter.talk_once(["P*0*...", "P*0*I found a blood-covered metal pipe!", "T*1*We've found ourselves the weapon.", "P*0*We need to start testing suspects for fingerprints."]);
							else if(global.difficulty == 0) obj_typewriter.talk_once(["P*0*...", "P*0*I found a blood-covered metal pipe!", "T*1*We've found ourselves the weapon.", "P*0*Wait... no fingerprints", "T*2*That complicates the matter."]);
							break;		
						}
					}
				
					audio_play_sound(sfx_mystery, 1, 0);
				
					array_push(global.evidence, 
					{
						head: "weapon",
						body: array_pop(global.furniture[fid].contents)
					});
				}
				else
				{
					obj_typewriter.talk_once(["P*0*There's nothing hidden in this one."]);
				}
				break;
			}
		
			case furniture.forensics:
			{
				//check if has bullet
				var foundbullet = false;
				var foundgun = false;
				var match = false;
				for(var i = 0; i < array_length(global.evidence); i++)
				{
					if(global.evidence[i].head == "bullet")
					{
						foundbullet = true;
						for(var j = 0; j < array_length(global.evidence); j++)
						{
							if(global.evidence[j].head == "weapon")
							{
								if(global.evidence[j].body.type == items.gun)
								{
									foundgun = true;
									if(global.evidence[j].body.blood == global.evidence[i].body)
									{
										match = true;
										global.evidence[j].body.revealed = true;
										array_delete(global.evidence, i, 1);
									}
								}
							}
						}
					}
				}
			
				if(!foundbullet) obj_typewriter.talk_once(["F*0*You need to bring us a bullet so we can compare it to a gun."]);
				else if(!foundgun) obj_typewriter.talk_once(["F*0*You have a bullet, but no gun to compare it to.", "F*0*You'd best get searching."]);
				else if(!match) obj_typewriter.talk_once(["F*0*I'm sorry, but I can't match any of your evidence.", "F*0*You need to find more.", "T*1*You have your work cut out for you."]);
				else obj_typewriter.talk_once(["F*0*We found a match!", "F*0*You can say with certainty that this gun is a murder weapon.", "T*2*Now to find out who bought it...", "P*0*We won't be needing this bullet any more."]);
				break;	
			}
		
			case furniture.security:
			{
				obj_roomtrans.menu = true;
				global.evidence_show = true;
				global.evidence_mode = "camera";
				obj_buttons_manager.review_date = pack_date();
				obj_buttons_manager.page = 1;
				
				obj_buttons_manager.create_cam_buttons();
				break;	
			}
			
			//vanity
			
			case furniture.table:
			{
				obj_typewriter.talk_once(["T*2*Focus, Detective. Wasting time is off the table.", "T*1*Heh. See what I did there?", "P*0*Can you remind me why you're even here?"]);
				break;
			}
			
			case furniture.bed:
			{
				obj_typewriter.talk_once(["T*1*I would love to sleep right about now.", "P*0*It's fine. I don't need you for the investigation anyway.", "T*2*That was a joke, right?", "P*0*..."]);
				break;
			}
			
			case furniture.cupboard:
			{
				obj_typewriter.talk_once(["T*3*What's in here?", "P*0*You can't just search a random person's home!", "T*2*Boring."]);
				break;
			}
			
			case furniture.tv:
			{
				obj_typewriter.talk_once(["P*0*I wish the crimes got more attention on the news.", "P*0*That way, we would finally get some funding.", "T*3*But there's this killer who can give you a heart attack if he knows your name and face.", "T*3*If you go on live TV, you're finished!", "P*0*I don't think anyone can do that.", "T*2*It's real! I saw it on a show once.", "P*0*Sure..."]);
				break;
			}
			
			case furniture.shelf:
			{
				obj_typewriter.talk_once(["T*1*You don't actually have to pay for anything. You can just take it and run.", "P*0*What about the camera outside?", "T*3*Oh.", "P*0*How did you even become a detective?"]);
				break;
			}
			
			case furniture.hardshelf:
			{
				obj_typewriter.talk_once(["T*0*Axes. My father was good with axes. Used them for pest control.", "P*0*What pests need an axe to be controlled!?", "T*3*Don't ask me. He never shared much about his... hunting.", "P*0*And this pest lived here?", "T*0*Oh, no. This was back in Georgia."]);
				break;
			}
			
			case furniture.gunshelf:
			{
				obj_typewriter.talk_once(["P*0*Guns.", "T*2*They leave too much evidence.", "T*1*If I had to kill you, I would use an icicle.", "P*0*What?", "T*1*It would melt afterwards. It's the perfect crime.", "T*1*Such ideas only spring forth after decades of experience.", "P*0*Well, I'm happy you chose to use your knowledge for good."]);
				break;
			}
			
			case furniture.pizzatable:
			{
				obj_typewriter.talk_once(["T*1*You know, once they catch this killer, I want to sit down and enjoy a pizza in peace.", "P*0*Who's 'they'?", "T*3*Sorry?", "P*0*We're the ones who have to catch the killer.", "T*2*Damn."]);
				break;
			}
			
			case furniture.bar:
			{
				obj_typewriter.talk_once(["T*1*So, beer relaxes you, right?", "P*0*Yeah.", "T*1*And a relaxed driver is better than a stressed one, yes?", "P*0*You can stop talking now.", "T*2*Hey, hear me out!"]);
				break;
			}
			
			case furniture.desk:
			{
				obj_typewriter.talk_once(["P*0*Do you think the killer works here?", "T*0*Entirely possible.", "T*0*Truth is, we might've already passed by the killer somewhere. They're hiding in plain sight.", "P*0*Then let's carry on searching.", "T*1*Right on."]);
				break;
			}
			
			case furniture.speaker:
			{
				obj_typewriter.talk_once(["T*2*I'd become a killer too if someone blasted loud music all night next to my house.", "P*0*Do you live next a nightclub?", "T*1*Luckily not.", "P*0*That's one less killer to deal with, I guess."]);
				break;
			}
			
			case furniture.namesign:
			{
				for(var i = 0; i < array_length(global.people); i++)
				{
					var pp = global.people[i];
					var fu = global.furniture[fid];
					
					if(pp.addr_x_pos == fu.x_pos && pp.addr_y_pos == fu.y_pos && pp.addr_city == fu.city_id)
					{
						if(pp.alive) 
						{
							obj_typewriter.talk_once(["P*0*This house belongs to a " + (pp.gender == 0 ? "Mr. " : "Mrs. ") + pp.last_name + "."]);	
						}
						else
						{
							obj_typewriter.talk_once(["P*0*This house belongs to a " + (pp.gender == 0 ? "Mr. " : "Mrs. ") + pp.last_name + ".", "T*0*Well, belonged."])
						}
					}
				}
				break;	
			}
		
			default:
			{
				obj_typewriter.talk_once(["P*0*There's nothing important here."]);	
			}
		}
	}
	else
	{
		obj_typewriter.talk_once(["P*0*I should get to the crime scene before I start investigating things."]);
	}
}