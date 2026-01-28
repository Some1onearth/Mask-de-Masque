extends CharacterBody2D

@export var SPEED = 300.0

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# Custom gameplay actions set in Project > Project Settings > Input Map.
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED) #Vector2 version of the function

	move_and_slide()
	
func player():
	pass
