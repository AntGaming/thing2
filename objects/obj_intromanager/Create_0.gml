randomise();

global.difficulty = 0;

alarm[0] = room_speed * 1;
parameter = 0;
stylish = false;
showing = false;

phase = 0;

audio_sound_gain(mus_investigation, 1, 0);
audio_sound_gain(mus_moment_of_truth, 1, 0);
audio_sound_gain(mus_ringtone, 1, 0);
audio_sound_gain(mus_title, 1, 0);

window_set_fullscreen(true);
audio_master_gain(0.5);

layer_enable_fx("Effect_1", false);
layer_enable_fx("Effect_2", false);

function next()
{
	with(obj_introtitle) fading = true;
	showing = false;
	audio_play_sound(sfx_menuconf, 1, 0);
	alarm[1] = 0;
	alarm[2] = 1;
}