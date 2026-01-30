class_name GameManager extends Node

@export var main_theme:AudioStream
@export var title_theme:AudioStream
@onready var audio_player:AudioStreamPlayer = $MusicPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func switch_track(track:AudioStream):
	audio_player.stream = track

#TODO:switch the audio when changing between main menu and game
