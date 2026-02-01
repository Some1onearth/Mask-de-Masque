extends Node2D

func _ready() -> void:
	audio_manager.stop_music()

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	$CreditsWindow.visible = true


func _on_back_pressed() -> void:
	$CreditsWindow.visible = false


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
