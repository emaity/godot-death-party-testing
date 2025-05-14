## Handles signals that tell the camera where to go
extends Node

signal change_camera_position(new_camera_position: Vector3)
signal player_in_room(is_in_room: bool)
