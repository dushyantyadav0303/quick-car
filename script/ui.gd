extends CanvasLayer

var coins_collected = 0
var fuel = 100

func _ready() -> void:
	add_to_group("ui")
	#$fuelgauge.stop() 
	_update_fuel_gauge()


func _process(delta: float) -> void:
	if fuel > 0:
		fuel = max(fuel - 10 * delta, 0.0)
		_update_fuel_gauge()
	if fuel < 30:
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("low fuel ")
	else:
		$AnimationPlayer.stop()

	if fuel == 0:
		out_of_fuel()
				




func _update_fuel_gauge() -> void:
	#$fuelgauge.frame = roundi(fuel / 100.0 * 77)
	#print(fuel)
	var target2 = lerp(-6.0, 105.0, fuel / 100.0)
	$RedGaugeNeedleSprite2.rotation_degrees = lerp($RedGaugeNeedleSprite2.rotation_degrees, target2, 0.05)


func out_of_fuel() -> void:
	get_tree().call_group("game", "stop")
	print("out of fuel")
	
	
func add_coin():
	coins_collected += 5
	%Label.text = str(coins_collected)
	
func add_fuel():
	fuel = min(fuel + 50, 100.0)
	_update_fuel_gauge()
	
# ahhh maths!!!
func set_speed(ratio: float) -> void:
	var target = lerp(-28, 105, ratio)
	$RedGaugeNeedleSprite.rotation_degrees = lerp($RedGaugeNeedleSprite.rotation_degrees, target, 0.05)




func _on_pause_pressed() -> void:
	print("pause")
	pass # Replace with function body.
