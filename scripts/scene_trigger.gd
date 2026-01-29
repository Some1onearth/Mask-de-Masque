class_name SceneTrigger extends Area2D

@export var connected_scene: PackedScene
@export var destination_door_ref:String
@onready var spawn = $Spawn

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		game_manager.change_scene(get_owner(), connected_scene)
