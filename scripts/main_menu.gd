extends Node2D

func _ready() -> void:
	audio_manager.switch_track(audio_manager.title_theme)
	audio_manager.play_music()

func _on_start_pressed() -> void:
	audio_manager.switch_track(audio_manager.main_theme)
	audio_manager.play_music()
	game_manager.intro_dialogue = true
	get_tree().change_scene_to_file("res://scenes/levels/cellar_scene.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	$CreditsWindow.visible = true


func _on_back_pressed() -> void:
	$CreditsWindow.visible = false
