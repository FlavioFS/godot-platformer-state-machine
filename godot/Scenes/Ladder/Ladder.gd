extends Area2D

func _on_Ladder_body_entered(body):
	if body.ladder_area != null:
		body.ladder_x = position.x
		body.ladder_area = true

func _on_Ladder_body_exited(body):
	if body.ladder_area != null:
		body.ladder_area = false