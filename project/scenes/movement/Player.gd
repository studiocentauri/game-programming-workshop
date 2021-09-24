extends Node2D

onready var speed = 300.0

func _process(delta):
	var xDir = 0.0
	if Input.is_action_pressed("left"):
		xDir = -1.0
	if Input.is_action_pressed("right"):
		xDir = 1.0
	position.x += xDir * speed * delta
	
	var yDir = 0.0
	if Input.is_action_pressed("up"):
		yDir = -1.0
	if Input.is_action_pressed("down"):
		yDir = 1.0
	position.y += yDir * speed * delta
