extends Area2D

@export var next_scene:PackedScene
@export var lock_threshold:int


func _on_body_entered(body: Node2D) -> void:
	print("SocialPoints: %s" % Dialogic.VAR.SocialPoints)
	if body is Player and Dialogic.VAR.SocialPoints >= lock_threshold:
		get_tree().change_scene_to_packed(next_scene)
