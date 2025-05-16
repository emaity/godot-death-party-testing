extends Area3D

signal player_interacted

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and has_overlapping_bodies():
		player_interacted.emit()
