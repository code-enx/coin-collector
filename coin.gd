extends Area2D
signal collected

@onready var animated_carrot_sprite: AnimatedSprite2D = $CarrotAnimation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_carrot_sprite.play("carrot")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		collected.emit()
		queue_free()
