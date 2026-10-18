extends CharacterBody2D

@export var speed: float = 200.0
@export var sprint_speed: float = 500.0

func _physics_process(_delta):
	var direction = Input.get_vector(
		"ui_left",
		"ui_right",
		"ui_up",
		"ui_down"
	)

	var current_speed = speed
	
	if Input.is_key_pressed(KEY_SHIFT):
		current_speed = sprint_speed
	
	velocity = direction * current_speed

	move_and_slide()
	
