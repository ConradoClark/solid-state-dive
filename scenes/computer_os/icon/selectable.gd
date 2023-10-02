extends Node

class_name Selectable

signal on_select
signal on_deselect
@export var clickRegion: Area2D
@export var selectionRect: ColorRect
@export var selectionColor: Color
var _isMouseOver = false
var _isSelected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	clickRegion.mouse_entered.connect(_on_mouse_entered)
	clickRegion.mouse_exited.connect(_on_mouse_exited)

func _input(event):
	if !event.is_action_released("click"): return
	if !_isMouseOver and _isSelected: deselect()
	elif _isMouseOver and !_isSelected: select()

func select():
	selectionRect.color = selectionColor
	_isSelected = true
	on_select.emit()

func deselect():
	selectionRect.color = Color.TRANSPARENT
	_isSelected = false
	on_deselect.emit()

func _on_mouse_entered():
	_isMouseOver = true

func _on_mouse_exited():
	_isMouseOver = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
