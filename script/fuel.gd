extends Area2D


var fuel_collected = 0

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().call_group("ui", "add_fuel")
		$AnimationPlayer.play("RESET")
		$"energy fill".play()
		$CollisionShape2D.set_deferred("disabled",true)



func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	queue_free()
