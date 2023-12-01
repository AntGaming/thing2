if(obj_intromanager.stylish && sprite_index == spr_detective)
{
	image_index = parameter+3;
}
else
{
	image_index = parameter;	
}

if(fading) alpha = 0; //fade has been removed
image_alpha = alpha;
if(alpha <= 0)
{
	instance_destroy();
	if(!instance_exists(obj_introheading)) instance_create_layer(0, 0, "Instances", obj_introheading);
}