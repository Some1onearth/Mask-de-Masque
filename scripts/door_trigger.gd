extends Area2D

@export var next_scene:PackedScene
@export var lock_threshold:int


func _on_body_entered(body: Node2D) -> void:
	if not body is Player:
		return
	print("SocialPoints: %s" % Dialogic.VAR.SocialPoints)
	if Dialogic.VAR.SocialPoints >= lock_threshold:
		get_tree().change_scene_to_packed(next_scene)
	else:
		print("You need %s SocialPoints to enter this room" % lock_threshold)
