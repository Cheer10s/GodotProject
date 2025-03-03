extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var game_manager: Node = %"Game Manager"

@warning_ignore("unused_parameter")
func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	queue_free()
