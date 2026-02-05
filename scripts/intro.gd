extends Node

@export var dialogue_timeline_name:String

func _ready():
	game_manager.game_started.emit()
	#Check to run intro dialogue
	if game_manager.intro_dialogue:
		run_dialogue(dialogue_timeline_name)
		#Disable intro for walking back into cellar
		game_manager.intro_dialogue = false

# TODO maybe refactor this and npc's code into game manager
func run_dialogue(dialogue_string):
	Dialogic.timeline_ended.connect(ended_dialogue)
	game_manager.in_conversation = true
	Dialogic.start(dialogue_string)

func ended_dialogue():
	Dialogic.timeline_ended.disconnect(ended_dialogue)
	game_manager.in_conversation = false
