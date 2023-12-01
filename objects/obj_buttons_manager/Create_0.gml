global.evidence_show = false;
global.evidence_mode = "items";

first_pickup = false;

review_date = pack_date();
page = 1;

total = 0;

function create_cam_buttons()
{
	instance_create_layer(room_width/6, room_height/50 + 130, "Buttons", obj_nextprev, {pow: 0});
	instance_create_layer(room_width/6 * 5, room_height/50 + 130, "Buttons", obj_nextprev, {pow: 1});
}

function destroy_cam_buttons()
{
	with(obj_nextprev) instance_destroy();
	//with(obj_nextprev) instance_destroy();
}

function review_backwards(doit)
{
	if(!(review_date.hour == 10 && review_date.day == 2))
	{
		if(doit)
		{
			review_date.hour--;
			if(review_date.hour == -1)
			{
				review_date.hour = 23;
				review_date.day--;
			}
			page = 1;
			audio_play_sound(sfx_menublip, 1, 0);
		}
		return true;
	}
	else return false;
}

function review_forwards(doit)
{
	if(!(review_date.hour == global.hour && review_date.day == global.day))
	{
		if(doit)
		{
			review_date.hour++;
			if(review_date.hour == 24)
			{
				review_date.hour = 0;
				review_date.day++;
			}
			page = 1;
			audio_play_sound(sfx_menublip, 1, 0);
		}
		return true;
	}
	else return false;
}