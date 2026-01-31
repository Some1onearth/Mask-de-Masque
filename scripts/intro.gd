extends Node

@export var dialogue_timeline_name:String

func _ready():
	run_dialogue(dialogue_timeline_name)

# TODO maybe refactor this and npc's code into game manager
func run_dialogue(dialogue_string):
	Dialogic.timeline_ended.connect(ended_dialogue)
	game_manager.in_conversation = true
	Dialogic.start(dialogue_string)

func ended_dialogue():
	Dialogic.timeline_ended.disconnect(ended_dialogue)
	game_manager.in_conversation = false
