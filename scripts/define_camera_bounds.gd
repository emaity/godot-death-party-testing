extends Area3D

@export var camera_x_offset: float = 4.33
var left_bound: float
var right_bound: float

func _ready() -> void:
	camera_x_offset = $CollisionShape3D.shape.size.x/2 - camera_x_offset
	left_bound = global_position.x - camera_x_offset
	right_bound = global_position.x + camera_x_offset
	
	# If left bound and right bound go past each other (in the case of small rooms),
	# center the camera on the room instead
	if(left_bound > right_bound):
		left_bound = (left_bound + right_bound)/2
		right_bound = left_bound


func _on_body_entered(_body: Node3D) -> void:
	GlobalCameraScript.bind_camera_x.emit(left_bound, right_bound)


func _on_body_exited(_body: Node3D) -> void:
	GlobalCameraScript.remove_camera_bounds_x.emit()
