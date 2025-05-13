extends StaticBody3D


func _physics_process(_delta: float) -> void:
	if $PlayerEntranceDetector.has_overlapping_bodies():
		var player: CharacterBody3D = $PlayerEntranceDetector.get_overlapping_bodies()[0]
		if Input.is_action_just_pressed("move_up") and round(player.global_position.z) != -1:
			player.global_position = $PlayerEntrancePoint.global_position
		if Input.is_action_just_pressed("move_down") and round(player.global_position.z) != 0:
			player.global_position = $PlayerEntranceReturnPoint.global_position

	if $PlayerExitDetector.has_overlapping_bodies():
		var player: CharacterBody3D = $PlayerExitDetector.get_overlapping_bodies()[0]
		player.global_position = $PlayerExitPoint.global_position
