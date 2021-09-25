extends Node2D

onready var rb=$KinematicBody2D
var velocity
export var gravityScale=1.0
export var acceleration=900.0
export var maxSpeed=400.0
export var friction=0.25

func _ready():
	velocity = Vector2.ZERO

func _physics_process(delta):
	apply_gravity(delta)
	apply_motion(delta)
	velocity = rb.move_and_slide(velocity)

func apply_gravity(delta):
	velocity.y+=9.8*gravityScale*delta*100.0

func apply_motion(delta):
	var xDir=0.0
	if Input.is_action_pressed("left"):
		xDir = -1.0
	elif Input.is_action_pressed("right"):
		xDir = 1.0
	if is_equal_approx(xDir,0.0):
		velocity.x = lerp(velocity.x,0.0,friction)
	else:
		velocity.x += xDir*acceleration*delta
	velocity.x=clamp(velocity.x,-maxSpeed,maxSpeed)
