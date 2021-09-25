extends Node2D

onready var rb = $RigidBody2D

export var speed=250.0
export var fric=0.1

func _physics_process(delta):
	var vel=rb.linear_velocity
	if Input.is_action_pressed("left"):
		vel.x=-speed
	elif Input.is_action_pressed("right"):
		vel.x=speed
	else:
		# Enables friction
		vel.x=lerp(vel.x,0.0,fric)
	rb.linear_velocity=vel
