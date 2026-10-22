extends CanvasLayer

@onready var victory_title = $CenterContainer/PanelContainer/VBoxContainer/VictoryTitle
@onready var collected_label = $CenterContainer/PanelContainer/VBoxContainer/CollectedLabel
@onready var restart_button = $CenterContainer/PanelContainer/VBoxContainer/RestartButton
@onready var quit_button = $CenterContainer/PanelContainer/VBoxContainer/QuitButton

func _ready() -> void:
	hide()
	
	restart_button.pressed.connect(_on_restart_pressed)
	quit_button.pressed.connect(_on_quit_pressed)
	
func show_victory(coins_collected: int, total_coins: int) -> void:
	victory_title.text = "Victory!"
	collected_label.text = "Coins Collected: %d/%d" % [coins_collected, total_coins]
	show()

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	get_tree().quit()

func show_game_over(coins_collected: int, total_coins: int) -> void:
	victory_title.text = "Time's Up!"
	collected_label.text = "Coins collected: %d/%d" % [coins_collected, total_coins]
	show()
