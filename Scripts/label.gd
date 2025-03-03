extends Label

func _physics_process(delta: float) -> void:
	if Input.is_key_pressed(KEY_SHIFT):
		queue_free()
