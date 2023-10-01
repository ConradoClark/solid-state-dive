extends Node2D

@export var reference: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	reference.rotation_degrees = randf_range(0,360)

