extends Sprite

signal splash

onready var area : Area2D = $Area2D
#onready var splash : Particles2D = $Splash

func _ready():
	material.set_shader_param("sprite_scale", scale)

func _on_Area2D_body_entered(body):
	if body.underwater != null:
		body.underwater = true
		emit_signal("splash", body.position.x)

func _on_Area2D_body_exited(body:PhysicsBody2D):
	if body.underwater != null: 
		body.underwater = false
		emit_signal("splash", body.position.x)