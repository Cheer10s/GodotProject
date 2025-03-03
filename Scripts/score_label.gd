extends Label

@onready var score_label: Label = $"."
@onready var game_manager: Node = %"Game Manager"

func _process(_delta: float) -> void:
	if game_manager.score == 1:
		score_label.text = str(game_manager.score) + " Coin"
	else:
		score_label.text = str(game_manager.score) + " Coins"
