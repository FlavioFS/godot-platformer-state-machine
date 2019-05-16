# [Godot] Platformer Player FSM
A Player state machine demo in Godot.

## [:tv: Video sample](http://www.youtube.com/watch?v=L62vRaYsDRw)
[![Preview image failed to load!](img/preview.gif)](http://www.youtube.com/watch?v=L62vRaYsDRw)

## Features
 - Edge jump tolerance (jump button press)
 - Floor anticipation (jump button press)
 - One-way platforms
 - 6 states

## How does it work?
The player finite state machine (aka. PlayerFSM) switches among 6 states:
 - [Air (StateAir)](Scenes/Player/StateAir.gd)
 - [Idle (StateIdle)](Scenes/Player/StateIdle.gd)
 - [Jump (StateJump)](Scenes/Player/StateJump.gd)
 - [Ladder (StateLadder)](Scenes/Player/StateLadder.gd)
 - [Swim (StateSwim)](Scenes/Player/StateSwim.gd)
 - [Walk (StateWalk)](Scenes/Player/StateWalk.gd)

Those states inherit from [BasePlayerState](Scenes/Player/BasePlayerState.gd) and the machine is controlled by [PlayerFSM](Scenes/Player/PlayerFSM.gd).

The player itself ([Player.gd](Scenes/Player/Player.gd)), which is a KinematicBody2D node, runs the PlayerFSM every frame.

# Extra - Skin selector
Through the **tool** keyword, it is possible to change player skin before runtime, within the engine editor:
 - [SkinSelector](Scenes/Player/SkinSelector.gd)

The skins are located in the [skins directory](Sprites/Player).

## Video Sample
[![Whoa, some problem occurred! You should see the video thumbnail instead of this text!](http://img.youtube.com/vi/3_7PjK7vzG4/0.jpg)](http://www.youtube.com/watch?v=3_7PjK7vzG4)
