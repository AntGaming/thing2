global.taken_appearances = [];

function generate_appearance(sex)
{
	var appearance = [sex, 0, 0, 0, 0];
	
	appearance[1] = irandom(9);
	appearance[2] = irandom(9);
	
	if(sex == 0)
	{
		appearance[3] = irandom(2);	
	}
	else
	{
		appearance[3] = irandom(2);
	}
	appearance[4] = irandom(7);
	
	for(var i = 0; i < array_length(global.taken_appearances); i++)
	{
		var theappear = global.taken_appearances[i];
		if(theappear[1] == appearance[1] && theappear[2] == appearance[2] && theappear[4] == appearance[4]) return generate_appearance(sex);
	}

	array_push(global.taken_appearances, appearance);
	return appearance;
}