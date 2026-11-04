extends Node2D
class_name NodoGirante

var progress: float = 0.0
@export var duration: float = 1.0

func _process(delta: float) -> void:
	progress = minf(progress + delta / duration, 1.0)
	$Sprite2D.rotation = lerp_angle(
		0.0, deg_to_rad(90.0), progress
	)
