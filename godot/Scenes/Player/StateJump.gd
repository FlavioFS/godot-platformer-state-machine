extends BasePlayerState

export var jump_speed : float = 650

func run(player: KinematicBody2D):
	player.vy = -jump_speed
	player.move()
	if player.underwater:
		return "swim"
	return "air"