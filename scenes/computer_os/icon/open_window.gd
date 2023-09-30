extends Node

@export var eventSource: NodePath
@export var eventName: String
@export var openWindowEffect: PackedScene
@export var window: PackedScene

@export var winOrigin: Vector2
@export var winDestination: Vector2

var _isOpen = false
var _finishedOpenAnim = false
var _openWin: OpenWinEffect
var _win: OSWindow

func _ready():
	var node = get_node(eventSource)
	node[eventName].connect(_open_window)
	Signals.window_opened.connect(_on_opened_window)
	Signals.close_window_pressed.connect(_on_window_closed)
	
func _on_window_closed(winInstance):
	if winInstance != _win: return
	_close_window()

func _on_opened_window(win):
	if win == self: return
	_close_window()

func _open_window():
	if _isOpen: return
	_isOpen = true
	Signals.window_opened.emit(self)
	await _show_open_effect()
	_instantiate_window()

func _instantiate_window():
	if !window: return
	_win = window.instantiate() as OSWindow
	get_tree().root.add_child(_win)
	_win.position = winDestination - _win.window_size / 2

func _close_window():
	if !_isOpen: return
	_isOpen = false
	if _win: _win.queue_free()
	_show_close_effect()

func _show_open_effect():
	_openWin = openWindowEffect.instantiate() as OpenWinEffect
	_openWin.origin = winOrigin
	_openWin.destination = winDestination
	get_tree().root.add_child(_openWin)
	await _openWin.openWindow()

func _show_close_effect():
	if !_openWin: return
	_openWin.closeWindow()
