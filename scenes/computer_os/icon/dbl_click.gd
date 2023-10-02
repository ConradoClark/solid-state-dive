extends Node

signal on_dbl_click
@export var clickRegion: Area2D
@export var maxDelayInSeconds: float = 0.5
@export var selectable: Selectable

var _isMouseOver = false
var _dblClicked = false
var _clickTimer: SceneTreeTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	clickRegion.mouse_entered.connect(_on_mouse_entered)
	clickRegion.mouse_exited.connect(_on_mouse_exited)

func _input(event):
	if selectable and selectable._isSelected and event.is_action("confirm"):
		on_dbl_click.emit()
		return
	if !event.is_action_released("click"): return
	if !_isMouseOver: return
	if _clickTimer and _clickTimer.time_left>0 and !_dblClicked:
		on_dbl_click.emit()
		_dblClicked = true
	else:
		_clickTimer = get_tree().create_timer(maxDelayInSeconds)
		_clickTimer.timeout.connect(_reset_dbl_clicked)
		
func _reset_dbl_clicked():
	_dblClicked = false

func _on_mouse_entered():
	_isMouseOver = true

func _on_mouse_exited():
	_isMouseOver = false
