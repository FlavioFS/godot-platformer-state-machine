extends Node2D

var states : Dictionary = {}
var active_state
var player : KinematicBody2D

func generate_state_dictionary():
	for state in get_children():
		if state.tag:
			states[state.tag] = state

func init(player:KinematicBody2D):
	self.player = player
	generate_state_dictionary()
	active_state = states.idle
	active_state.enter(self.player)

func run():
	var next_state_tag = active_state.run(player)
	if next_state_tag:
		change_state(next_state_tag)

func change_state(var next_state_tag : String):
	var next_state = states.get(next_state_tag)
	if next_state:
		active_state.exit(player)
		active_state = next_state
		active_state.enter(player)