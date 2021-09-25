extends KinematicBody2D

onready var velocity = Vector2.ZERO
export var gravityScale=1.0
export var acceleration=900.0
export var maxSpeed=400.0
export var friction=0.25
export var jumpForce=500.0
export var onGround=false

func _process(delta):
	if Input.is_action_just_pressed("jump"):
	# Replace Comment to check for Ground
	# if onGround and Input.is_action_just_pressed("jump"):
			jump()

func _physics_process(delta):
	apply_motion(delta)
	if is_on_floor():
		print("ground")
		onGround=true
	else:
		print("air")
		onGround=false
		apply_gravity(delta)
	move_and_slide(velocity,Vector2(0.0,-1.0))
	

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

func jump():
	velocity.y=-jumpForce
	onGround=false
