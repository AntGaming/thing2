switch dir
{
	case 0:
		alpha = lerp(alpha, 1, (room == rm_intro ? 0.03 : 0.08))
		if(alpha > 0.99)
		{
			if(target == -1) obj_time.new_hour();
			else
			{
				room_goto(target);
			}
			dir = 1;
		}
		break;
		
	case 1:
		alpha = lerp(alpha, 0, 0.08);
		if(alpha < 0.01)
		{
			dir = -1;
			alpha = 0;
		}
		break;
}