extends Node
class_name Main

@export var player: Player

@export var interaction_radius: float = 12.0

@export var left_limit: float = 0
@export var right_limit: float = 640

var score: int = 0
var playing: bool = true

func _ready() -> void:
	Global.player = $Player

func _process(delta: float) -> void:
	var enemies = get_tree().get_nodes_in_group("enemy").size()
	if enemies <= 0:
		get_tree().change_scene_to_file("res://win.tscn")
