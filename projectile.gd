extends Node2D
class_name Projectile

var speed: float = 600.0

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.health -= 1
		queue_free()
