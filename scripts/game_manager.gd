class_name GameManager extends Node

@export var main_theme:AudioStream
@export var title_theme:AudioStream
@onready var audio_player:AudioStreamPlayer = $MusicPlayer


#Audio Management
func switch_track(track:AudioStream):
	audio_player.stream = track

#TODO:switch the audio when changing between main menu and game

#Scene Management
func switch_scene(from_scene, to_scene):
	#Unparent player from old scene
	
	#Instantiate next scene
	#Delete duplicate player
	#Parent player to new scene
	#Make new scene active in scene_tree
	#Move player to correct door
	pass
