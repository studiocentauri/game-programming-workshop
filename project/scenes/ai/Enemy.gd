extends Node2D

enum States{IDLE, CHASE, SEARCH, RETREAT}
export var state=States.IDLE

onready var trigger=$KinematicBody2D/DetectionRange/AreaShape
export var detectRadius=10.0
var distFactor=10.0

var target
var lastPos
export var moveSpeed=150.0
var origin

func _ready():
	origin = position
	trigger.shape.radius=distFactor*detectRadius

func _process(delta):
	match(state):
		States.IDLE:
			idle_state()
		States.CHASE:
			chase_state(delta)
		States.SEARCH:
			search_state(delta)
		States.RETREAT:
			retreat_state(delta)

func idle_state():
	print("idle")

func chase_state(delta):
	print("chase")
	lastPos=target.position
	if ((lastPos-position).length()>=1.20*distFactor*detectRadius):
		state=States.SEARCH
	else:
		move_to(lastPos,delta)

func search_state(delta):
	print("search")
	if ((lastPos-position).length()>=1.0):
		move_to(lastPos,delta)
	else:
		state=States.RETREAT
	pass

func retreat_state(delta):
	print("retreat")
	if ((origin-position).length()>=1.0):
		move_to(origin,delta)
	else:
		state=States.IDLE
	pass

func move_to(pos,delta):
	var dir=(pos-position).normalized()
	position+=dir*moveSpeed*delta
	
	
func _on_DetectionRange_body_entered(body):
	if state!=States.CHASE and body.get_parent().is_in_group("Player"):
		state=States.CHASE
		target=body.get_parent()
