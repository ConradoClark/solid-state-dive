extends Node2D

@export var playerArm: Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	playerArm.look_at(get_global_mouse_position())
	pass
