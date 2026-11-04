extends Node2D
class_name Weapon

@export var projectile_scene: PackedScene
@export var sprite2d: Sprite2D

@export var punto: Marker2D

var fire_rate: float = 0.2
var can_shoot: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	aim()
	
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot()

func aim() -> void:
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

	if mouse_pos.x < global_position.x:
		scale.y = -1
	else:
		scale.y = 1
	
func shoot() -> void:
	can_shoot = false
	
	var projectile = projectile_scene.instantiate()
	projectile.global_position = punto.global_position
	projectile.global_rotation = global_rotation
	
	get_tree().root.add_child(projectile)
	
	await get_tree().create_timer(fire_rate).timeout
	can_shoot = true
