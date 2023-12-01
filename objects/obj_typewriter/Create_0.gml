dialogbox = false;
draw_phase = 0;

first = 0;

typist = scribble_typist()
.in(0.5, 0)
.sound_per_char([sfx_talk], 0.9, 1, " ", 0.2)
.function_on_complete(function()
{
	draw_phase = 1;
});

current_talking = -1;
talk_dlg_type = -1;
am_in_dlgselect = false;
finish_type = -1;

thesound = false;

function process_dlg(dlg, want)
{
	var processed = string_split(dlg, "*");
	return processed[want];
}

function talk_once(array)
{
	talk_progress = 0;
	talk_array = array;
	dialogbox = true;
	talk_dlg_type = -1;
	
	todraw = scribble("[fon_century_idk]" + process_dlg(talk_array[talk_progress], 2))
	.wrap(1360);
	draw_phase = 0;	
}

function talk_dlg(array, options)
{
	talk_progress = 0;
	talk_array = array;
	dialogbox = true;
	talk_dlg_type = options;
	
	todraw = scribble("[fon_century_idk]" + process_dlg(talk_array[talk_progress], 2))
	.wrap(1360);
	draw_phase = 0;	
}

function finish()
{
	switch(finish_type)
	{			
		case "receipt":
		{	
			finish_type = -1;
			
			with(obj_roomtrans)
			{
				menu = true;
			}
			
			global.evidence_show = true;
			global.evidence_mode = "receipts";
			
			with(obj_buttons_manager)
			{
				page = 1;
			}
			break;
		}
		
		case "restart":
		{
			game_restart();	
		}
		
		case "summation":
		{
			room_goto(rm_breakthecase);	
		}
	};
}