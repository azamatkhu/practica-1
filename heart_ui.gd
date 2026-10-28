extends Control
class_name HeartUI

var estaDañado: bool = true
var atlas_texture = null

@onready var texture_rect: TextureRect = $TextureRect

func _ready() -> void:
	if texture_rect.texture:
		atlas_texture = texture_rect.texture.duplicate()
		texture_rect.texture = atlas_texture
	
	show()
		
func hacerDañado(estado: bool) -> void:
	estaDañado = estado
	probarDañado()
	
func probarDañado() -> void:
	if estaDañado == false:
		atlas_texture.region = Rect2(0, 80, 16, 16)
	else:
		atlas_texture.region = Rect2(16, 80, 16, 16)	
