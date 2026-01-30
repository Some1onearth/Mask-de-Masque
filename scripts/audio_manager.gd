class_name AudioManager extends Node

@export var main_theme:AudioStream
@export var title_theme:AudioStream
@onready var audio_player:AudioStreamPlayer = $MusicPlayer


#Audio Management
func switch_track(track:AudioStream):
	audio_player.stream = track

#TODO:switch the audio when changing between main menu and game
