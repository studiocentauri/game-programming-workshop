extends Node2D

onready var target
export var offset = Vector2(3.0,0.0)

func _ready():
	target = get_parent().get_child(0)
	
func _process(delta):
	position=target.position+offset
	pass
