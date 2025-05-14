## Emits signal when player is in room
extends Area3D

signal player_present(new_camera_location: Vector3)


func _on_body_entered(_body: Node3D) -> void:
	GlobalCameraScript.change_camera_position.emit($RoomCameraLocation.global_position)
	GlobalCameraScript.player_in_room.emit(true)


func _on_body_exited(_body: Node3D) -> void:
	GlobalCameraScript.player_in_room.emit(false)
