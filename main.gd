extends Node2D

#Score
var score: int = 0
var carrots_remaining: int = 0
var total_coins = 0

#Time
var time_left: int = 15
var game_finished: bool = false

func _ready() -> void:
	var coins = get_tree().get_nodes_in_group("coins")
	
	total_coins = coins.size()
	carrots_remaining = total_coins
	
	$ScoreLabel.text = "Score: " + str(score)
	$CoinsLeft.text = "Carrots Left : " + str(carrots_remaining)
	$TimerLabel.text = "Time: " + str(time_left)
	
	for coin in coins:
		coin.collected.connect(_on_coin_collected)
		
	$CountdownTimer.timeout.connect(_on_countdown_timer_timeout)
	$CountdownTimer.start()
	
func _on_coin_collected() -> void:
	if game_finished:
		return
		
	score += 1
	carrots_remaining -= 1
	$ScoreLabel.text = "Score: " + str(score)
	$CoinsLeft.text = "Carrots Left : " + str(carrots_remaining)
	
	if carrots_remaining == 0:
		game_finished = true
		$CountdownTimer.stop()
		$VictoryUI.show_victory(score, total_coins)

func _on_countdown_timer_timeout() -> void:
	if game_finished:
		return
		
	time_left -= 1
	update_timer_label()
	
	if time_left <= 0:
		game_finished = true
		$CountdownTimer.stop()
		$VictoryUI.show_game_over(score, total_coins)
		
func update_timer_label() -> void:
	$TimerLabel.text = "Time: " + str(time_left)
