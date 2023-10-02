extends Node

class_name CrtDisabler

@export var target: ColorRect

var enabled = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Input.is_action_just_pressed("crt"): return
	if enabled:
		enabled = false
		target.hide()
	else:
		enabled = true
		target.show()
		
