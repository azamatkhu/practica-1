extends Control
class_name AmmoUI

var estaSinAmmo: bool = true
var atlas_texture = null

@onready var texture_rect: TextureRect = $TextureRect

func _ready() -> void:
	if texture_rect.texture:
		atlas_texture = texture_rect.texture.duplicate()
		texture_rect.texture = atlas_texture
	
	show()
		
func quitarAmmo(estado: bool) -> void:
	estaSinAmmo = estado
	probarAmmo()
	
func probarAmmo() -> void:
	if estaSinAmmo == false:
		atlas_texture.region = Rect2(0, 64, 16, 16)
	else:
		atlas_texture.region = Rect2(16, 64, 16, 16)	
