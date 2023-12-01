switch(but_num)
{
	case 0:
		name = "Hair type";
		break;
		
	case 1:
		name = "Hair col.";
		break;
	
	case 2:
		if(global.det_appear[2] == 0) name = "Male";
		else name = "Female";
		break;
}