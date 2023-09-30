extends Node2D

class_name HoverSprite

signal on_hover
signal on_exit_hover

@export var hoverRegion: Area2D
@export var sprite: Sprite2D
@export var defaultFrame: int
@export var hoverFrame: int

var _isMouseOver: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.frame = defaultFrame
	hoverRegion.mouse_entered.connect(_on_mouse_entered)
	hoverRegion.mouse_exited.connect(_on_mouse_exited)
	
func _on_mouse_entered():
	on_hover.emit()
	_isMouseOver = true
	sprite.frame = hoverFrame

func _on_mouse_exited():
	on_exit_hover.emit()
	_isMouseOver = false
	sprite.frame = defaultFrame

