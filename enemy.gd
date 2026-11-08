extends CharacterBody2D
class_name Enemy

@onready var attack_timer = $AttackTimer

var speed: float = 50
var health: int = 5

var attack_time: float = 1
var can_attack: bool = true

func _process(delta: float) -> void:
	if health == 0:
		queue_free()
	
	$Label.text = str("hp: ", health)

func _physics_process(delta: float) -> void:
	if Global.player != null:
		var direction: Vector2 = global_position.direction_to(Global.player.global_position)
		
		velocity = direction * speed
		move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		atacar(body)

func atacar(target: Node2D):
	if !can_attack:
		return
		
	target.tomarDaño(1)
	can_attack = false
	attack_timer.start(attack_time)
	
func _on_attack_timer_timeout() -> void:
	can_attack = true
