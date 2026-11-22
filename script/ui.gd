extends CanvasLayer

var coins_collected = 0
var fuel = 100

func _ready() -> void:
	add_to_group("ui")
	$fuelgauge.stop() 
	_update_fuel_gauge()


func _process(delta: float) -> void:
	if fuel > 0:
		fuel = max(fuel - 2 * delta, 0.0)
		_update_fuel_gauge()
		if fuel == 0:
			out_of_fuel()

func _update_fuel_gauge() -> void:
	$fuelgauge.frame = roundi(fuel / 100.0 * 77)


func out_of_fuel() -> void:
	print("Out of fuel!") 
	
	
func add_coin():
	coins_collected += 5
	%Label.text = str(coins_collected)
	
func add_fuel():
	fuel = min(fuel + 50, 100.0)
	_update_fuel_gauge()
	
	
	
