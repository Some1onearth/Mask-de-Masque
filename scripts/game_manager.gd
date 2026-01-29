class_name GameManager extends Node

var player:Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_scene(from, to_scene:PackedScene):
	player = from.player
	player.get_parent().remove_child(player)
	
	from.get_tree().call_defered()
