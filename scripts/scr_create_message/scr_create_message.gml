// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_message(body)
{
	array_insert(global.phone_messages, 0, 
	{
		body: body,
		date: pack_date()
	});
	
	global.messages_checked = false;
}