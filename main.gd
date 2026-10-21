extends Node2D

var score: int = 0
var coins_remaining: int = 0
var total_coins = 0

func _ready() -> void:
	var coins = get_tree().get_nodes_in_group("coins")
	
	total_coins = coins.size()
	coins_remaining = total_coins
	
	$ScoreLabel.text = "Score: 0"
	$CoinsLeft.text = "Coins Left : " + str(coins_remaining)
	for coin in coins:
		coin.collected.connect(_on_coin_collected)
	
func _on_coin_collected() -> void:
	score += 1
	coins_remaining -= 1
	$ScoreLabel.text = "Score: " + str(score)
	$CoinsLeft.text = "Coins Left : " + str(coins_remaining)
	
	if coins_remaining == 0:
		$VictoryUI.show_victory(score, total_coins)
