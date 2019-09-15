extends BasePlayerState

export var swim_speed : float = 100
export var gravity : float = 10
export var anim_speed : float = 1.5
var original_anim_speed : float

func enter(player: KinematicBody2D):
	player.velocity *= 0.5
	original_anim_speed = player.anim.playback_speed
	player.anim.playback_speed = anim_speed

func run(player: KinematicBody2D):
	if player.ladder_area and player.vertical < 0:
		return "ladder"
	player.vx = player.horizontal * swim_speed
	player.apply_gravity(gravity)
	if player.jumping:
		player.vy = -2*swim_speed
		player.play("jump")
	if player.underwater:
		if player.horizontal != 0:
			player.waves.emitting = true
			player.play("walk")
		else:
			player.waves.emitting = false
			player.play("idle")
		player.move()
		return null
	player.waves.emitting = false
	if player.grounded:
		player.move()
		return "walk" if player.horizontal != 0 else "idle"
	player.vy = -5*swim_speed
	player.move()
	return "air"

func exit(player: KinematicBody2D):
	player.anim.playback_speed = original_anim_speed
	player.waves.emitting = false