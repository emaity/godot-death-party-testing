extends StaticBody3D

func _ready() -> void:
	$InteractionDetector.player_interacted.connect(when_interacted)


func when_interacted(body):
	print("interacted")
	GlobalCameraScript.move_camera_smooth.emit($ConversationCameraPosition.global_position)
	GlobalCameraScript.camera_on_player.emit(false)
