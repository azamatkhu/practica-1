extends CharacterBody2D
class_name Enemy

var speed: float = 50
var health: int = 10

func _process(delta: float) -> void:
	if health == 0:
		queue_free()
	
	$Label.text = str("hp: ", health)

func _physics_process(delta: float) -> void:
	if Global.player != null:
		var direction: Vector2 = global_position.direction_to(Global.player.global_position)
		
		velocity = direction * speed
		move_and_slide()
