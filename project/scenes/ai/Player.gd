extends Node2D
export var speed=100.0

func _process(delta):
	var dir=Vector2.ZERO
	dir.x = Input.get_action_strength("right")-Input.get_action_strength("left")
	dir.y = Input.get_action_strength("down")-Input.get_action_strength("up")
	position+=dir*speed*delta
