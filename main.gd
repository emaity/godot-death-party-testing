extends Node3D

var PLAYER_CAMERA_FOLLOW_SPEED: float = 3.5
var CAMERA_TRANSITION_SPEED: float = 2
var camera_speed: float = PLAYER_CAMERA_FOLLOW_SPEED


var camera_location := Vector3.ZERO
var camera_on_player: bool = true
var camera_smooth: bool = true

# Constantly moves the camera's location
func _ready() -> void:
	camera_location = $Player/PlayerCameraLocation.global_position
	$MainCamera.make_current()
	
	GlobalCameraScript.move_camera_smooth.connect(_move_camera_smooth)
	GlobalCameraScript.move_camera_jump.connect(_move_camera_jump)
	GlobalCameraScript.camera_on_player.connect(_change_camera_state)


func _physics_process(delta: float) -> void:
	if camera_on_player:
		camera_speed = PLAYER_CAMERA_FOLLOW_SPEED
		camera_location = $Player/PlayerCameraLocation.global_position
	
	if camera_smooth:
		$MainCamera.global_position = $MainCamera.global_position.lerp(camera_location, delta * camera_speed)
	else:
		$MainCamera.global_position = camera_location


func _move_camera_smooth(new_pos: Vector3):
	camera_smooth = true
	camera_speed = CAMERA_TRANSITION_SPEED
	camera_location = new_pos


func _move_camera_jump(new_pos: Vector3):
	camera_smooth = false
	camera_location = new_pos


func _change_camera_state(tf: bool):
	camera_on_player = tf
