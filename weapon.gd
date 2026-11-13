extends Node2D
class_name Weapon

@export var projectile_scene: PackedScene
@export var sprite2d: Sprite2D
@export var punto: Marker2D
@export var label: Label

var fire_rate: float = 0.2
var can_shoot: bool = true

var current_ammo: int
var max_ammo: int = 8

func _ready() -> void:
	label.hide()
	current_ammo = max_ammo
	
	await get_tree().process_frame
	SignalManager.emit_signal("ammo_changed", max_ammo, current_ammo)

func _process(delta: float) -> void:
	aim()
	
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot()

func aim() -> void:
	var mouse_pos = get_global_mouse_position()
	$Visuals.look_at(mouse_pos)

	if mouse_pos.x < global_position.x:
		$Visuals.scale.y = -1
	else:
		$Visuals.scale.y = 1
	
func shoot() -> void:
	if !can_shoot:
		return
	
	if current_ammo <= 0:
		reload()
		return
	
	can_shoot = false
	
	var projectile = projectile_scene.instantiate()
	projectile.global_position = punto.global_position
	projectile.global_rotation = $Visuals.global_rotation
	
	get_tree().root.add_child(projectile)
	current_ammo -= 1
	
	await get_tree().create_timer(fire_rate).timeout
	can_shoot = true
	
	SignalManager.emit_signal("ammo_changed", max_ammo, current_ammo)

func reload() -> void:
	label.show()
	await get_tree().create_timer(2).timeout
	
	label.hide()
	current_ammo = max_ammo
	SignalManager.emit_signal("ammo_changed", max_ammo, current_ammo)
