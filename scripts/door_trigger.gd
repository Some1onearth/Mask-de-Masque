class_name DoorTrigger extends Area2D

@export var next_scene:String ##Name of level like "main_hall_scene"
@export var connected_door:String ##Name of the door in the next scene player will spawn at
@export var lock_threshold:int

@export var spawn:Node2D ##Holds position of where player will come out at

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("SocialPoints: %s" % Dialogic.VAR.SocialPoints)
		if Dialogic.VAR.SocialPoints >= lock_threshold:
			game_manager.switch_level_with_door(body.get_parent(), next_scene, connected_door)
		else:
			print("You need %s SocialPoints to enter this room" % lock_threshold)
