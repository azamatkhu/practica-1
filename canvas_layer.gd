extends CanvasLayer
class_name UI

@export var health_bar: HealthBarUI

@onready var heart_ui_scene = load("res://heart_ui.tscn")

func _ready() -> void:
	SignalManager.health_changed.connect(_update_health)
	
func _on_button_pressed() -> void:
	print("button")

func _update_hud() -> void:
	pass

func _update_health(max_amount: int, amount: int) -> void:
	var container = health_bar.hbox_container

	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()

	for i in range(max_amount):
		var heart = heart_ui_scene.instantiate()
		container.add_child(heart)
		
		var damaged: bool = (i >= amount)
		heart.hacerDañado(damaged)
