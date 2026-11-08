extends Control
class_name GameOverScreen

func _process(delta: float) -> void:
	if Input.is_action_pressed("escape"):
		get_tree().quit()
