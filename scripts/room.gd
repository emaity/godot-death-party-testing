## Detects when the player enters a room, changes camera
extends Area3D
var original_camera_position := Vector3.ZERO
var incoming_player_camera_position := Vector3.ZERO
var player: CharacterBody3D = null
var player_present = false


func _ready():
	$RoomCamera.clear_current()
	original_camera_position = $RoomCamera.global_position


func _process(_delta: float) -> void:
	if has_overlapping_bodies():
		$RoomCamera.make_current()
	else:
		$RoomCamera.clear_current()
