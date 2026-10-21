extends Node2D
class_name ScreenSaver

var speed: float = 300.0
var direction: Vector2 = Vector2(-1, 1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x <= 0:
		direction = Vector2(1, -1)
	elif position.y >= 640:	
		direction = Vector2(-1, -1)
	elif position.y <= 0:	
		direction = Vector2(1, 1)	
	elif position.x >= 1152:
		direction = Vector2(-1, 1)	

	position += direction * speed * delta
