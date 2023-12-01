image_alpha = lerp(image_alpha, 1, 0.06);

image_xscale-=v;
image_yscale-=v;
v+= 0.01;

if(image_xscale < 1)
{
	image_xscale = 1;
	image_yscale = 1;
	
	if(!boomed)
	{
		boomed = true;
		audio_play_sound(sfx_thud2, 1, 0);
		alarm[0] = room_speed * 0.2;
		alarm[1] = room_speed * 1.5;
	}
}	