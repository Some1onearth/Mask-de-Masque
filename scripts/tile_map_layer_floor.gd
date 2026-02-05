extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_manager.tilemaps.push_back(self)
