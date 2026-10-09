extends CharacterBody2D
class_name Player

@export var speed: float = 100.0
var speed_de_angulo := PI

# _ready() esta en cargado en ejecura el codigo cuando el nodo esta listo en la escena
func _ready() -> void:
	print("Jugador preparado")

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	rotation += speed_de_angulo * direction * delta # se multiplica por delta para procesar la rotacion en tiempo real
	
	if Input.is_action_pressed("move_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
		
		move_and_slide()
	elif Input.is_action_pressed("move_down"):
		velocity = Vector2.DOWN.rotated(rotation) * speed
		
		move_and_slide()
