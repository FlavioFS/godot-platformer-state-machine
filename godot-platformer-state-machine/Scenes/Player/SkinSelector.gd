tool
extends Sprite

const MAX_SKINS : int = 19
export(int, 0, 19) var skin : int = 0 setget _set_skin

func _set_skin(val : int):
	if (val >= 0 and val <= MAX_SKINS):
		var loaded_texture : Texture = load("res://Sprites/Player/%02d.png" % val)
		loaded_texture.flags = 0
		if (loaded_texture):
			skin = val
			texture = loaded_texture