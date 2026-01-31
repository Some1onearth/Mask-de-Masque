extends Node

@export var current_mask_rect:TextureRect

func _physics_process(delta: float) -> void:
	var x = -1
	if Input.is_action_just_pressed("mask_1"):
		x = 0
	if Input.is_action_just_pressed("mask_2"):
		x = 64
	if Input.is_action_just_pressed("mask_3"):
		x = 128
	if Input.is_action_just_pressed("mask_4"):
		x = 196
		
	if x != -1:
		current_mask_rect.texture.region = Rect2(Vector2(x, 0), Vector2(64, 64))
