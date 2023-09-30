extends Node2D

@export var hoverColor: Color
@export var panel: Panel
@export var hoverRegion: Area2D

var _styleBox: StyleBoxFlat
var _originalColor: Color
var _isMouseOver: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	_setup_stylebox()
	hoverRegion.mouse_entered.connect(_on_mouse_entered)
	hoverRegion.mouse_exited.connect(_on_mouse_exited)
	
func _setup_stylebox():
	_styleBox = panel.get_theme_stylebox("panel").duplicate()
	_originalColor = _styleBox.bg_color
	panel.add_theme_stylebox_override("panel", _styleBox)
	
func _on_mouse_entered():
	_isMouseOver = true
	_styleBox.bg_color = hoverColor

func _on_mouse_exited():
	_isMouseOver = false
	_styleBox.bg_color = _originalColor

