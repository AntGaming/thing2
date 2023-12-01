tipo = global.furniture[fid].type;

image_index = tipo;

vel = 0;

if(tipo == furniture.bush || tipo == furniture.bin || tipo == furniture.namesign) targ_y = 320;
else if(tipo == furniture.security || tipo == furniture.coroner || tipo == furniture.train || tipo == furniture.forensics) targ_y = 50;
else if(tipo == furniture.camera) targ_y = 280;
else targ_y = 70;

if(!droppage) y = targ_y;

if(tipo == furniture.camera)
{
	if(x > room_width/2) image_xscale = -1;
	else image_xscale = 1;
}