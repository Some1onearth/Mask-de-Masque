extends Light2D

@export var noiseTex: NoiseTexture2D
@export var speed = 5
@export var minEnergy = 0.9
@export var maxEnergy = 1.1
var time_passed := 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_passed += delta
	#var sampled_noise = abs(noiseTex.noise.get_noise_1d(time_passed))
	energy = ((sin(time_passed*speed)+1)/2)*(maxEnergy-minEnergy) + minEnergy
	#print(energy)
	pass
