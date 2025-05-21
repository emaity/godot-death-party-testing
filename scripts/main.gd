extends Node3D

var PLAYER_CAMERA_FOLLOW_SPEED: float = 3.5
var CAMERA_TRANSITION_SPEED: float = 2
var camera_speed: float = PLAYER_CAMERA_FOLLOW_SPEED

var camera_location := Vector3.ZERO
var camera_on_player: bool = true
var camera_smooth: bool = true

var camera_bound_x: bool = false
var camera_left_bound_x: float = 0.0;
var camera_right_bound_x: float = 0.0;

# Constantly moves the camera's location
func _ready() -> void:
	camera_location = $Player/PlayerCameraLocation.global_position
	$MainCamera.make_current()
	
	GlobalCameraScript.move_camera_smooth.connect(_move_camera_smooth)
	GlobalCameraScript.move_camera_jump.connect(_move_camera_jump)
	GlobalCameraScript.change_current_camera.connect(_change_camera)
	GlobalCameraScript.camera_on_player.connect(_change_camera_state)
	GlobalCameraScript.bind_camera_x.connect(_bind_camera_x)
	GlobalCameraScript.remove_camera_bounds_x.connect(_unbind_camera_x)


func _physics_process(delta: float) -> void:
	if camera_on_player:
		camera_speed = PLAYER_CAMERA_FOLLOW_SPEED
		camera_location = $Player/PlayerCameraLocation.global_position
	
	if camera_bound_x:
		if camera_location.x < camera_left_bound_x:
			camera_location.x = camera_left_bound_x
		elif camera_location.x > camera_right_bound_x:
			camera_location.x = camera_right_bound_x
	
	
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


func _change_camera(new_camera: Camera3D):
	new_camera.make_current()


func _change_camera_state(tf: bool):
	camera_on_player = tf


func _bind_camera_x(left: float, right: float):
	camera_bound_x = true
	camera_left_bound_x = left
	camera_right_bound_x = right


func _unbind_camera_x():
	camera_bound_x = false
