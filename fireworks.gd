extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("firework")

func play():
	$AnimatedSprite2D.play()
	await $AnimatedSprite2D
	$AnimatedSprite2D2.play()
