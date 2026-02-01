class_name AudioManager extends Node

#Music
@export var main_theme:AudioStream
@export var title_theme:AudioStream
@onready var music_player:AudioStreamPlayer = $MusicPlayer

@export var mask_switch_sound:AudioStream
@export var social_point_sound:AudioStream

#Footsteps
@export var tilemaps: Array[TileMapLayer] = []
@export var footstep_sounds:Dictionary[String, Array] = {
	"dirt": [
		preload("res://audio/SFX/Mov, Abil, Non interact/footsteps/Walk on Dirt-SandSingle1.wav"),
		preload("res://audio/SFX/Mov, Abil, Non interact/footsteps/Walk on Dirt-SandSingle2.wav"),
		preload("res://audio/SFX/Mov, Abil, Non interact/footsteps/Walk on Dirt-SandSingle3.wav"),
	],
	"stone": [
		preload("res://audio/SFX/Mov, Abil, Non interact/footsteps/Walk on Stone-WoodSingle1.wav"),
		preload("res://audio/SFX/Mov, Abil, Non interact/footsteps/Walk on Stone-WoodSingle2.wav"),
		preload("res://audio/SFX/Mov, Abil, Non interact/footsteps/Walk on Stone-WoodSingle3.wav"),
		preload("res://audio/SFX/Mov, Abil, Non interact/footsteps/Walk on Stone-WoodSingle4.wav"),
	],
	"wood": [
		preload("res://audio/SFX/Mov, Abil, Non interact/footsteps/Walk on Stone-WoodSingle1.wav"),
		preload("res://audio/SFX/Mov, Abil, Non interact/footsteps/Walk on Stone-WoodSingle2.wav"),
		preload("res://audio/SFX/Mov, Abil, Non interact/footsteps/Walk on Stone-WoodSingle3.wav"),
		preload("res://audio/SFX/Mov, Abil, Non interact/footsteps/Walk on Stone-WoodSingle4.wav"),
	],
	"carpet": [
		preload("res://audio/SFX/Mov, Abil, Non interact/footsteps/Walk on CarpetSingle1.wav"),
		preload("res://audio/SFX/Mov, Abil, Non interact/footsteps/Walk on CarpetSingle2.wav"),
		preload("res://audio/SFX/Mov, Abil, Non interact/footsteps/Walk on CarpetSingle3.wav"),
	],
}

#Audio Management
func switch_track(track:AudioStream):
	music_player.stream = track
	music_player.play()

func play_oneshot_audio(sound_clip:AudioStream):
	var audio_player = AudioStreamPlayer2D.new()
	audio_player.bus = &"SFX"
	audio_player.stream = sound_clip
	get_tree().root.add_child(audio_player)
	audio_player.play()
	await audio_player.finished
	audio_player.queue_free()

func play_footstep(position:Vector2):
	var tile_data = []
	for tilemap in tilemaps:
		var tile_position = tilemap.local_to_map(position)
		var data = tilemap.get_cell_tile_data(tile_position)
		if data:
			tile_data.push_back(data)
	
	if tile_data.size() > 0 :
		var tile_type = tile_data.back().get_custom_data("footstep_sound")
		#print(tile_type)
		
		if footstep_sounds.has(tile_type):
			play_oneshot_audio(footstep_sounds[tile_type].pick_random())

func play_mask_switch_sound():
	play_oneshot_audio(mask_switch_sound)

func play_social_point_sound():
	play_oneshot_audio(social_point_sound)
