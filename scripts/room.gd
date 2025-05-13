## Emits signal when player is in room
extends Area3D

signal player_present(new_camera_location: Vector3)

func _physics_process(_delta: float) -> void:
	if has_overlapping_bodies():
		player_present.emit($RoomCameraLocation.global_position)
