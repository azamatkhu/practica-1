extends CharacterBody2D
class_name Player

@export var speed: float = 100.0
@export var timer: Timer

@export var max_health: int = 5
var current_health: int = 5

@onready var sprite2d: Sprite2D = $Sprite2D
@onready var weapon: Weapon = $Weapon

signal interact_requested

func _ready() -> void:
	current_health = max_health
	
	print("Jugador preparado")
	timer.paused = true
	
	await get_tree().process_frame
	SignalManager.emit_signal("health_changed", max_health, current_health)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		interact_requested.emit()

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	
	if velocity.x > 0:
		sprite2d.flip_h = true
	elif velocity.x < 0:
		sprite2d.flip_h = false	
	
	move_and_slide()

func tomarDaño(amount: int) -> void:
	current_health -= amount
	SignalManager.emit_signal("health_changed", max_health, current_health)
	
	if current_health <= 0:
		die()

func die() -> void:
	get_tree().change_scene_to_file("res://game_over.tscn")

func _on_timer_timeout() -> void:
	if sprite2d.visible == true:
		sprite2d.visible = false
	else:
		sprite2d.visible = true	

func _on_button_pressed() -> void:
	timer.paused = false
