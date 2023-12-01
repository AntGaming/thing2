dir = -1;
alpha = 0;
target = -1;

function transition(targ_room)
{
	if(dir == -1)
	{	
		dir = 0;
		target = targ_room;
	}
}

function hour_trans(targ_room)
{
	if(dir == -1)
	{	
		dir = 0;
		target = -1;
	}
}

firstmap = false;

menu = false;