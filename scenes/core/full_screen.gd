extends Node

class_name ToggleFullScreen

var window = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(ev):
	if ev.is_action_released('fullscreen'):
		if window:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		window = !window
