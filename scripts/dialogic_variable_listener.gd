extends Node

func _ready() -> void:
	Dialogic.VAR.variable_changed.connect(_on_dialogic_variable_changed)
	
func _on_dialogic_variable_changed(info: Dictionary):
	if(info['variable'] == "SocialPoints"):
		print("Social points now" + info['new_value'])
	elif(info['variable'] == "CurrentMask"):
		print("Changed to Mask " + info['new_value'])
