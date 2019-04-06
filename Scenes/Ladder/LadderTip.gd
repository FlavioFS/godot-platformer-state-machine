extends Area2D

func _on_LadderTip_body_entered(body):
	if body.ladder_tip != null:
		body.ladder_tip = true

func _on_LadderTip_body_exited(body):
	if body.ladder_tip != null:
		body.ladder_tip = false