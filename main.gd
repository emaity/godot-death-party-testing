extends Node3D

var CAMERA_FOLLOW_SPEED: float = 2.5

# Holds the global position of where we want the main camera to go
var camera_location := Vector3.ZERO
var player_in_room: bool = false

# Constantly moves the camera's location
func _ready() -> void:
	camera_location = $Player/PlayerCameraLocation.global_position
	$MainCamera.make_current()
	
	GlobalCameraScript.change_camera_position.connect(_move_camera)
	GlobalCameraScript.player_in_room.connect(_change_room_state)


func _physics_process(delta: float) -> void:
	if not player_in_room:
		camera_location = $Player/PlayerCameraLocation.global_position
	$MainCamera.global_position = $MainCamera.global_position.lerp(camera_location, delta * CAMERA_FOLLOW_SPEED)


func _move_camera(new_pos: Vector3):
	print(new_pos)
	camera_location = new_pos

func _change_room_state(is_in_room: bool):
	player_in_room = is_in_room
