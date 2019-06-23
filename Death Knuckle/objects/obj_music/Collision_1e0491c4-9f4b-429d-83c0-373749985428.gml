/// @description Insert description here
// You can write your code in this editor
if(!audio_is_playing(activSnd)){
	audio_stop_all()
	audio_play_sound(activSnd,1,1)}

audio_sound_gain(snd_alt,1,500)
audio_sound_gain(snd_level,1,500)
audio_sound_gain(snd_bossfight,1,500)
audio_sound_gain(snd_save,1,500)
