extends StaticBody3D

func _ready() -> void:
	$InteractionDetector.player_interacted.connect(when_interacted)

func when_interacted(body):
	print("interacted")
