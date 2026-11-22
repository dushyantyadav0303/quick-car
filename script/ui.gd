extends CanvasLayer

var coins_collected = 0

func _ready() -> void:
	add_to_group("ui")

func add_coin():
	coins_collected += 5
	%Label.text = str(coins_collected)
