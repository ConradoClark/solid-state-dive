extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewportSize = get_viewport().size
	DisplayServer.window_set_size(Vector2i(viewportSize.x*2, viewportSize.y*2))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
