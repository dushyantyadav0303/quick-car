extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("fireworks")

func play():
	$AnimatedSprite2D.show()
	$AnimatedSprite2D2.show()
	$AnimatedSprite2D.play()
	await $AnimatedSprite2D.animation_finished
	$AnimatedSprite2D2.play()
	await $AnimatedSprite2D2.animation_finished
	$AnimatedSprite2D.hide()
	$AnimatedSprite2D2.hide()
