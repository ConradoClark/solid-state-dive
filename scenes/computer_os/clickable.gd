extends Node

class_name Clickable

signal on_click
@export var clickRegion: Area2D
var _isMouseOver = false

# Called when the node enters the scene tree for the first time.
func _ready():
	clickRegion.mouse_entered.connect(_on_mouse_entered)
	clickRegion.mouse_exited.connect(_on_mouse_exited)

func _input(event):
	if !event.is_action_released("click") or !_isMouseOver: return
	on_click.emit()

func _on_mouse_entered():
	_isMouseOver = true

func _on_mouse_exited():
	_isMouseOver = false
