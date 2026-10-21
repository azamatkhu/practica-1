extends CharacterBody2D
class_name Player

@export var speed: float = 100.0
@onready var sprite2d: Sprite2D = $Sprite2D

func _ready() -> void:
	print("Jugador preparado")

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	
	if velocity.x > 0:
		sprite2d.flip_h = true
	elif velocity.x < 0:
		sprite2d.flip_h = false	
	
	move_and_slide()

func _on_timer_timeout() -> void:
	if sprite2d.visible == true:
		sprite2d.visible = false
	else:
		sprite2d.visible = true	
