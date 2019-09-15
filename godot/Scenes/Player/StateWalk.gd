extends BasePlayerState

export var walk_speed : float = 300

func run(player: KinematicBody2D):
	if player.vertical > 0:
		player.collision_layer = 1
		player.platform_timer.start()
	player.vx = player.horizontal * walk_speed
	player.apply_gravity(player.gravity)
	player.move()
	if player.ladder_area and (\
		(player.vertical < 0 and not player.ladder_tip) or\
		(player.vertical > 0 and player.ladder_tip)\
	):
		return "ladder"
	if player.underwater:
		return "swim"
	if not player.is_on_floor():
		return "air"
	if player.vy > 0:
		player.vy = 0
	if player.jumping:
		return "jump"
	if player.horizontal == 0:
		return "idle"
	return null