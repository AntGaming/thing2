instance_create_layer(room_width/2, room_height/8, "Instances", obj_case_break_title);

summation = [];
nummy = 0;
ticker = 0;
todraw = -1;

//DELETE THESE LATER

weapon = global.murder_weapon; 
receiptstracked = true;
camera = true;

if(global.difficulty == 0)
{
	array_push(summation, [1, sfx_vl_victimpersonal_1]);
	array_push(summation, [0, 0]);
	array_push(summation, [0, 1]);
	array_push(summation, [1, sfx_vl_victimpersonal_2]);
	array_push(summation, [0, 2]);
}
else
{
	array_push(summation, [1, sfx_vl_victimrandom_1]);
	array_push(summation, [0, 3]);
	array_push(summation, [1, sfx_vl_victimrandom_2]);
	array_push(summation, [0, 4]);
	array_push(summation, [1, sfx_vl_victimrandom_3]);
	array_push(summation, [0, 5]);
}

array_push(summation, [1, sfx_vl_needweapon]);

switch(weapon)
{
	case 1://axe
		array_push(summation, [0, 6]);
		array_push(summation, [0, 8]);
		array_push(summation, [1, sfx_vl_buyaxe]);
		array_push(summation, [0, 9]);
		break;
		
	case 2://pipe
		array_push(summation, [0, 6]);
		array_push(summation, [0, 8]);
		array_push(summation, [1, sfx_vl_buypipe]);
		array_push(summation, [0, 10]);
		break;
		
	case 3://gun
		array_push(summation, [0, 7]);
		array_push(summation, [0, 8]);
		array_push(summation, [1, sfx_vl_buygun]);
		array_push(summation, [0, 11]);
		break;
}

if(receiptstracked)
{
	array_push(summation, [1, sfx_vl_firstmistake]);
	array_push(summation, [0, 12]);
	array_push(summation, [2, sfx_vl_firstmistake_2]);
}

array_push(summation, [1, sfx_vl_execute]);
array_push(summation, [0, 13]);

if(global.difficulty == 1)
{
	array_push(summation, [1, sfx_vl_train]);
	array_push(summation, [0, 14]);
}

if(camera)
{
	array_push(summation, [0, 15]);
	array_push(summation, [1, sfx_vl_camera]);
	array_push(summation, [0, 16]);
	array_push(summation, [0, 17]);
}

array_push(summation, [1, sfx_vl_gainedaccess]);
array_push(summation, [0, 18]);

switch(weapon)
{
	case 1://axe
		array_push(summation, [0, 19]);
		array_push(summation, [0, 20]);
		array_push(summation, [0, 21]);
		array_push(summation, [2, sfx_vl_killaxe]);
		break;
		
	case 2://pipe
		array_push(summation, [0, 22]);
		array_push(summation, [0, 23]);
		array_push(summation, [2, sfx_vl_killpipe]);
		break;
		
	case 3://gun
		array_push(summation, [0, 24]);
		array_push(summation, [0, 25]);
		array_push(summation, [1, sfx_vl_killgun]);
		array_push(summation, [0, 26]);
		array_push(summation, [0, 27]);
		break;
}

array_push(summation, [1, sfx_vl_deeddone]);
array_push(summation, [0, 28]);

array_push(summation, [1, sfx_vl_dumpweapon]);

switch(weapon)
{
	case 1://axe
		array_push(summation, [0, 29]);
		break;
		
	case 2://pipe
		array_push(summation, [0, 30]);
		break;
		
	case 3://gun
		array_push(summation, [0, 31]);
		break;
}

if(global.difficulty == 0) array_push(summation, [2, sfx_vl_littledid]);

if(global.difficulty == 1)
{
	array_push(summation, [1, sfx_vl_trainback]);
	array_push(summation, [0, 32]);
}

array_push(summation, [1, sfx_vl_gottenaway]);
array_push(summation, [0, 33]);
array_push(summation, [1, sfx_vl_wouldhavetoo]);
array_push(summation, [0, 34]);
array_push(summation, [1, sfx_vl_genius]);
array_push(summation, [0, 35]);
array_push(summation, [1, sfx_vl_me]);
array_push(summation, [0, 36]);

function set_text(input)
{
	var text = "";
	switch(input)
	{
		case sfx_vl_victimpersonal_1:
			text = "The victim was someone you knew personally.";
			break;
			
		case sfx_vl_victimpersonal_2:
			text = "You knew when they would be home alone.";
			break;
		
		case sfx_vl_victimrandom_1:
			text = "For this murder, you chose the victim at random.";
			break;
		
		case sfx_vl_victimrandom_2:
			text = "This made it harder to narrow down your location.";
			break;
		
		case sfx_vl_victimrandom_3:
			text = "You stalked them and memorised their schedule.";
			break;
		
		case sfx_vl_needweapon:
			text = "To prepare, you needed a weapon.";
			break;
		
		case sfx_vl_buyaxe:
			text = "You went to the hardware store and purchased an axe.";
			break;
		
		case sfx_vl_buypipe:
			text = "You went to the hardware store and purchased a metal pipe.";
			break;
		
		case sfx_vl_buygun:
			text = "You bought a firearm from the gun store.";
			break;
		
		case sfx_vl_firstmistake:
			text = "That was your first mistake.";
			break;
		
		case sfx_vl_firstmistake_2:
			text = "It allowed us to use the shop's sales records to find your name.";
			break;
		
		case sfx_vl_execute:
			text = "Then, you set out to execute your plan.";
			break;
		
		case sfx_vl_train:
			text = "You took a train journey to the victim's city.";
			break;
		
		case sfx_vl_camera:
			text = "On your way, you were spotted by a camera.";
			break;
		
		case sfx_vl_gainedaccess:
			text = "You gained access to the home of the victim.";
			break;
		
		case sfx_vl_killaxe:
			text = "Then, you murdered them with the axe.";
			break;
		
		case sfx_vl_killpipe:
			text = "Then, you struck them with the metal pipe.";
			break;
		
		case sfx_vl_killgun:
			text = "Then, you shot them dead in cold blood.";
			break;
		
		case sfx_vl_deeddone:
			text = "The deed was done.";
			break;
		
		case sfx_vl_dumpweapon:
			text = "Without thinking, you dumped the weapon in a bush outside the house.";
			break;	
			
		case sfx_vl_littledid:
			text = "Little did you know, this would be the evidence that got you arrested.";
			break;	
			
		case sfx_vl_trainback:
			text = "You took the train back home.";
			break;	
			
		case sfx_vl_gottenaway:
			text = "When you came back, you thought you had gotten away with it.";
			break;	
			
		case sfx_vl_wouldhavetoo:
			text = "And you would have, too..";
			break;	
			
		case sfx_vl_genius:
			text = "...if not for the work of one genius detective.";
			break;	
			
		case sfx_vl_me:
			text = "ME!";
			break;	
	}
	
	todraw = text;
}