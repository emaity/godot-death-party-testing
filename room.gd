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
	if player_present:
		$RoomCamera.global_position = incoming_player_camera_position
		
		$RoomCamera.make_current()
		var tween: Tween = create_tween()
		tween.tween_property($RoomCamera, "position", original_camera_position, 1.3)
		


func _on_body_entered(body: Node3D) -> void:
	player_present = true
	player = body
	incoming_player_camera_position = body.get_node("PlayerCamera").global_position


func _on_body_exited(body: Node3D) -> void:
	player_present = false
	$RoomCamera.clear_current()
