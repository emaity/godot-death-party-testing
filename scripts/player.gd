extends CharacterBody3D

signal player_move_up

@export var gravity: float = 2.0
@export var player_speed: float = 3.0
@export var jump_power: float = 12.0

var player_velocity := Vector3.ZERO


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		GlobalPlayerAction.player_interacted.emit()
	if Input.is_action_just_pressed("move_up"):
		player_move_up.emit()


func _physics_process(_delta: float) -> void:
	# Direction of movement in the X axis
	var movement_direction: int = 0
	if Input.is_action_pressed("move_left") and Input.is_action_pressed("move_right"):
		pass
	elif Input.is_action_pressed("move_left"):
		movement_direction = -1
	elif  Input.is_action_pressed("move_right"):
		movement_direction = 1
	
	# Jump
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			player_velocity.y = jump_power
		else:
			# This line only exists to make slopes work after the player jumps
			player_velocity.y = 0
	
	# Move on x axis
	player_velocity.x = movement_direction * player_speed
	# Fall
	if not is_on_floor():
		player_velocity.y -= gravity
	
	velocity = player_velocity
	move_and_slide()
