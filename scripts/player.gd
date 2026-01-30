extends CharacterBody2D

@export var SPEED = 300.0

#sprites draw from atlas texture so just change the frame of animation
@onready var player_sprite:Sprite2D = $Sprite2D
var sprite_up:int = 2
var sprite_down:int = 1

#var masks = ["wild","peasant","eunuch","noble"]
var current_mask:String = "wild"

func _ready() -> void:
	player_sprite.frame = sprite_down

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# Custom gameplay actions set in Project > Project Settings > Input Map.
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED) #Vector2 version of the function
	
	#animation stuff
	if velocity.y > 0:
		player_sprite.frame = sprite_down
	if velocity.y < 0:
		player_sprite.frame = sprite_up
	
	move_and_slide()
	
	#Mask stuff
	#PLACEHOLDER INPUT FOR TESTING CHANGE LATER
	#idk what the mask changing is supposed to be so masks assigned on number keys 1 to 4
	if Input.is_action_just_pressed("mask_1"):
		maskSwap("wild")
	if Input.is_action_just_pressed("mask_2"):
		maskSwap("peasant")
	if Input.is_action_just_pressed("mask_3"):
		maskSwap("eunuch")
	if Input.is_action_just_pressed("mask_4"):
		maskSwap("noble")
	
func maskSwap(mask_name:String):
	current_mask = mask_name
	#sets the variable in Dialogic
	Dialogic.VAR.CurrentMask = current_mask
	
	#change sprites
	match mask_name:
		"wild":
			sprite_up = 2
			sprite_down = 1
		"peasant":
			sprite_up = 4
			sprite_down = 3
		"eunuch":
			sprite_up = 6
			sprite_down = 5
		"noble":
			sprite_up = 8
			sprite_down = 7
	player_sprite.frame = sprite_down
	
	print("mask changed to %s" % mask_name)
	pass
	
func player():
	pass
