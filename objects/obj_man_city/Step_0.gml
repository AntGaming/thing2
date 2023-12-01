if(keyboard_check_pressed(vk_escape) && global.traintravel)
{
	obj_roomtrans.transition(rm_indoors);
	global.traintravel = false;	
}