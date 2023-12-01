image_alpha = lerp(image_alpha, 1, 0.05);

if(escaping)
{
	x_vel += spd;
	y += x_vel;
	image_angle += x_vel/4;
	
	image_alpha = lerp(image_alpha, 0, spd);
}