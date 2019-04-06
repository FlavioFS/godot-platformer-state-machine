extends "res://Scenes/Player/BasePlayerState.gd"

func run(player:KinematicBody2D):
	if player.vy > 0:
		player.vy = 0
	if player.ladder_area and (\
		(player.vertical < 0 and not player.ladder_tip) or \
		(player.vertical > 0 and player.ladder_tip)\
	):
		return "ladder"
	if player.horizontal == 0 and player.vertical > 0:
		player.collision_layer = 1
		player.platform_timer.start()
		player.apply_gravity(player.gravity)
		player.move()
	if player.underwater:
		return "swim"
	if not player.grounded:
		return "air"
	if player.jumping:
		return "jump"
	if player.horizontal != 0:
		return "walk"
	return null