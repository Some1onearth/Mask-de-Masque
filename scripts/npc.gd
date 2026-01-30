extends CharacterBody2D

##Name of Dialogic timeline for character dialogue (don't add file extension)
@export var dialogue_timeline_name:String

var is_chatting = false

var player_in_area = false

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
	
func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("dialogic_default_action"):
			#print("is_chatting: %s" % is_chatting)
			if is_chatting == false:
				run_dialogue(dialogue_timeline_name)

func _on_chat_detection_body_entered(body: Node2D) -> void:
	if body is Player:
		player_in_area = true


func _on_chat_detection_body_exited(body: Node2D) -> void:
	if body is Player:
		player_in_area = false

func run_dialogue(dialogue_string):
	Dialogic.timeline_ended.connect(ended_dialogue)
	is_chatting = true
	Dialogic.start(dialogue_string)
	

func ended_dialogue():
	Dialogic.timeline_ended.disconnect(ended_dialogue)
	is_chatting = false
	print("After convo SocialPoints:%s" % Dialogic.VAR.SocialPoints)
	
		
func DialogicSignal(arg: String):
	if arg == "exit":
		is_chatting = false
