extends RigidBody2D

var wheels = []
var speed = 90000
var max_speed = 50


func stop():
	speed = 0
	
	
func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")
	add_to_group("game")
	
	
	
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		for wheel in wheels:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(speed * delta * 60)  

	if Input.is_action_pressed("ui_left"):
		for wheel in wheels:
			if wheel.angular_velocity > -max_speed:
				wheel.apply_torque_impulse(-speed * delta * 60)
				
	var total = 0.0
	for wheel in wheels:
		total += wheel.angular_velocity
	var ratio = clamp(total / wheels.size() / max_speed, 0.0, 1.0)
	get_tree().call_group("ui", "set_speed", ratio)
