class_name GameManager extends Node

signal game_started
var intro_dialogue:bool = false

var player:Player
var in_conversation:bool = false

#Scene Management
##Changes the scene, moving the player between them and to a door's position
func switch_level_with_door(from_scene:Node, to_scene:String, spawn_door:String):
	#Unparent player from old scene
	player = from_scene.get_node("Player")
	player.get_parent().remove_child(player)
	
	#Instantiate next scene
	var new_scene := load_level(to_scene)
	
	#Delete any duplicate player
	var dupe_player = new_scene.get_node("Player")
	if dupe_player:
		dupe_player.free()
	
	#Parent player to new scene
	new_scene.add_child(player)
	
	#Replace old scene
	get_tree().call_deferred("change_scene_to_node", new_scene)
	
	#Move player to correct door
	var target_door = new_scene.get_node(spawn_door) as DoorTrigger
	if target_door:
		player.global_position = target_door.spawn.global_position

##Loads a level by name from the levels folder, creates and instance of the scene *but hasn't added it to tree yet
func load_level(level_name:String) -> Node:
	var level_path:String = "res://scenes/levels/%s.tscn" % level_name
	var level_resource := load(level_path) as PackedScene
	if level_resource:
		return level_resource.instantiate()
	return null
	
func change_scene(scene_name:String) -> void:
	get_tree().change_scene_to_file("res://scenes/levels/%s.tscn" % scene_name)
