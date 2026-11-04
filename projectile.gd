extends Node2D
class_name Projectile

var speed: float = 600.0

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta
