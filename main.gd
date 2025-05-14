extends Node3D

var PLAYER_CAMERA_FOLLOW_SPEED: float = 3.5
var CAMERA_TRANSITION_SPEED: float = 2

# Holds the global position of where we want the main camera to go
var camera_location := Vector3.ZERO
var player_in_room: bool = false
var camera_speed: float = PLAYER_CAMERA_FOLLOW_SPEED

# Constantly moves the camera's location
func _ready() -> void:
	camera_location = $Player/PlayerCameraLocation.global_position
	$MainCamera.make_current()
	
	GlobalCameraScript.change_camera_position.connect(_move_camera)
	GlobalCameraScript.player_in_room.connect(_change_room_state)


func _physics_process(delta: float) -> void:
	if not player_in_room:
		camera_speed = PLAYER_CAMERA_FOLLOW_SPEED
		camera_location = $Player/PlayerCameraLocation.global_position
	
	$MainCamera.global_position = $MainCamera.global_position.lerp(camera_location, delta * camera_speed)


func _move_camera(new_pos: Vector3):
	camera_speed = CAMERA_TRANSITION_SPEED
	camera_location = new_pos

func _change_room_state(is_in_room: bool):
	player_in_room = is_in_room
