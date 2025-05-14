## Handles signals that tell the camera where to go
extends Node

signal move_camera_smooth(new_camera_position: Vector3)
signal move_camera_jump(new_camera_position: Vector3)
signal change_current_camera(new_camera: Camera3D)
signal camera_on_player(tf: bool)
signal camera_smooth(is_smooth: bool)
