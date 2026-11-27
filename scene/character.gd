extends RigidBody2D


var ground_time = 0.0

func _ready():
	contact_monitor = true
	max_contacts_reported = 4

func _physics_process(delta):
	#print(get_colliding_bodies())
	var touching = false
	for body in get_colliding_bodies():
		if body.is_in_group("ground"):
			touching = true

	if touching:
		ground_time += delta
		if ground_time >= 0.5:
			print("dead")
			$"../limiter".free()
			$"../limiter2".free()
			$"spring effect".softness = 10
			$"../dead".play()
			set_physics_process(false) 
	else:
		ground_time = 0.0
