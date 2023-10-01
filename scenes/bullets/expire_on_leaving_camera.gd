extends Node

@export var body: CharacterBody2D
var camera: Camera2D
# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_viewport().get_camera_2d()

func _process(delay):
	if !camera or !_is_in_camera_bounds(): body.queue_free()
	
func _is_in_camera_bounds():
	return (body.position.x > camera.limit_left and 
		body.position.x < camera.limit_right and
		body.position.y > camera.limit_top and
		body.position.y < camera.limit_bottom)
	
