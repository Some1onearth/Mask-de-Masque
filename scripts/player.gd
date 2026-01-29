extends CharacterBody2D

@export var SPEED = 300.0

#var masks = ["wild","peasant","eunuch","noble"]
var current_mask:String = "wild"

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# Custom gameplay actions set in Project > Project Settings > Input Map.
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED) #Vector2 version of the function
	
	move_and_slide()
	
	#Mask stuff
	#PLACEHOLDER INPUT FOR TESTING CHANGE LATER
	#idk what the mask changing is supposed to be so masks assigned on number keys 1 to 4
	if Input.is_key_pressed(KEY_1):
		maskSwap("wild")
	if Input.is_key_pressed(KEY_2):
		maskSwap("peasant")
	if Input.is_key_pressed(KEY_3):
		maskSwap("eunuch")
	if Input.is_key_pressed(KEY_4):
		maskSwap("noble")
	
func maskSwap(mask_name:String):
	current_mask = mask_name
	#sets the variable in Dialogic
	Dialogic.VAR.CurrentMask = current_mask
	print("mask changed to %s" % mask_name)
	pass
	
func player():
	pass
