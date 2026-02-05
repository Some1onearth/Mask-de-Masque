extends Node

var social_points = 0 #tracking points to check/compare if it's increased

func _ready() -> void:
	social_points = Dialogic.VAR.SocialPoints
	Dialogic.VAR.variable_changed.connect(_on_dialogic_variable_changed)
	
func _on_dialogic_variable_changed(info: Dictionary):
	if(info['variable'] == "SocialPoints"):
		if audio_manager:
			if info["new_value"] > social_points:
				audio_manager.play_social_point_sound()
		print("Social points now %s" % info['new_value'])
	elif(info['variable'] == "CurrentMask"):
		print("Changed to Mask " + info['new_value'])
