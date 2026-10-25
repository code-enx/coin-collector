extends CharacterBody2D

@export var speed: float = 200.0
@export var sprint_speed: float = 500.0
@onready var animated_character_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta):
	var direction = Input.get_vector(
		"ui_left",
		"ui_right",
		"ui_up",
		"ui_down"
	)
	if direction != Vector2.ZERO:
		animated_character_sprite.play("default")
	else:
		animated_character_sprite.stop()
		animated_character_sprite.frame = 0

	var current_speed = speed
	
	if Input.is_key_pressed(KEY_SHIFT):
		current_speed = sprint_speed
	
	velocity = direction * current_speed

	move_and_slide()
	
