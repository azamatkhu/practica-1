extends Node2D
class_name Weapon

@export var sprite2d: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	aim()

func aim() -> void:
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

	if mouse_pos.x < global_position.x:
		sprite2d.flip_v = true  
	else:
		sprite2d.flip_v = false
	
