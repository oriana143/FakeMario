extends CanvasLayer

func _ready():
	$Control/LifeIcon/LifeCount.text = "3"
	
func update_GUI(lives_left,coins):
	$Control/LifeIcon/LifeCount.text = str(lives_left)
	$Control/CoinIcon/CoinCount.text = str(coins)
	

