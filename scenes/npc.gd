extends CharacterBody2D


var is_chatting = false

var player_in_area = false

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
	
func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("dialogic_default_action"):
			print(is_chatting)
			if is_chatting == false:
				run_dialogue("test_timeline")

func _on_chat_detection_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true


func _on_chat_detection_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false

func run_dialogue(dialogue_string):
	is_chatting = true
	Dialogic.start(dialogue_string)

	
func DialogicSignal(arg: String):
	if arg == "exit":
		is_chatting = false
