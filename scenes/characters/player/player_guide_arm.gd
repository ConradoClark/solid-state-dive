extends Node2D

class_name PlayerGuideArm

@export var playerArm: Sprite2D

var currentAngle: float
var currentDirection: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mousePos = get_global_mouse_position()
	playerArm.look_at(mousePos)
	currentAngle = playerArm.rotation_degrees
	currentDirection = (mousePos - playerArm.global_position).normalized()
	pass
