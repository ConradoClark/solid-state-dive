extends Node

@export var clickable: Clickable
@export var window: OSWindow

# Called when the node enters the scene tree for the first time.
func _ready():
	clickable.on_click.connect(_on_click)

func _on_click():
	Signals.close_window_pressed.emit(window)
