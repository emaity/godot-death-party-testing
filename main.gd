extends Node3D

var CAMERA_FOLLOW_SPEED: float = 2.5
# Holds the global position of where we want the main camera to go
var camera_location := Vector3.ZERO

# Constantly moves the camera's location
func _ready() -> void:
	camera_location = $Player/PlayerCameraLocation.global_position
	$MainCamera.make_current()

func _physics_process(delta: float) -> void:
	camera_location = $Player/PlayerCameraLocation.global_position
	
	$MainCamera.global_position = $MainCamera.global_position.lerp(camera_location, delta * CAMERA_FOLLOW_SPEED)
