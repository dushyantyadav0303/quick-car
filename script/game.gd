extends RigidBody2D

var wheels = []
var speed = 600000
var max_speed = 50
var driving = 0

func stop():
	speed = 0
	print("game over")
	var tween = create_tween()
	tween.tween_property($engineSFX, "volume_db", -40, 2.5)
	tween.tween_property($engineSFX, "pitch_scale", 0.5, 2.5)
	tween.tween_callback($engineSFX.stop)

func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")
	add_to_group("game")

func _physics_process(delta):
	driving = 0 
	if Input.is_action_pressed("ui_right"):
		driving += 1 
		apply_torque_impulse(-4000 * delta * 60)
		for wheel in wheels:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(speed * delta * 60)  

	if Input.is_action_pressed("ui_left"):
		driving += 1 
		apply_torque_impulse(2000 * delta * 60)
		for wheel in wheels:
			if wheel.angular_velocity > -max_speed:
				wheel.apply_torque_impulse(-speed * delta * 60)
	
	if driving == 1:
		$engineSFX.pitch_scale = lerpf($engineSFX.pitch_scale, 2 , 2* delta)
	else:
		$engineSFX.pitch_scale = lerpf($engineSFX.pitch_scale, 1, 2* delta)

	var total = 0.0
	for wheel in wheels:
		total += wheel.angular_velocity
	var ratio = clamp(total / wheels.size() / max_speed, 0.0, 1.0)
	get_tree().call_group("ui", "set_speed", ratio)
	
	
	
	
	
	
	
	
	
	
	
