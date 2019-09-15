extends BasePlayerState

export var midair_speed : float = 300

func enter(player: KinematicBody2D):
	if player.anim.current_animation == "jump":
		yield (player.anim, "animation_finished")
		if player.state_machine.active_state.tag == tag:
			.enter(player) # Base class
	else:
		.enter(player) # Base class

func run(player: KinematicBody2D):
	player.vx = player.horizontal * midair_speed
	player.apply_gravity(player.gravity)
	player.move()
	if player.ladder_area and player.vertical != 0:
		return "ladder"
	if player.underwater:
		return "swim"
	if player.is_on_floor():
		return "idle" if player.horizontal == 0 else "walk"
	if player.grounded and player.jumping:
		return "jump"
	return null