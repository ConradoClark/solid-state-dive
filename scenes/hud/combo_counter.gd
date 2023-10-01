extends Node

class_name ComboCounter

signal on_combo(number)

@export var comboCounter: Label
@export var comboMeter: Sprite2D

@export var minSize: int
@export var maxSize: int

var _currentCombo = 0
var _currentTween: Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	_reset()
	Signals.data_object_destroyed.connect(_on_object_destroyed)
	Signals.on_player_respawn.connect(_lose_combo)

func _lose_combo():
	if _currentTween:
		_currentTween.kill()
	_reset()

func _on_object_destroyed():
	_currentCombo+=1
	on_combo.emit(_currentCombo)
	if _currentTween:
		_currentTween.kill()
	_currentTween = get_tree().create_tween()
	_currentTween.finished.connect(_combo_finished)
	_currentTween.tween_method(_update_region_size, maxSize, minSize, 2 if _currentCombo > 20 else 4)
	Globals.sceneTweenExclusives.push_back(_currentTween)
	_update_meter()

func _update_region_size(value):
	if !comboMeter: return
	comboMeter.region_rect.size.x = value

func _reset():
	on_combo.emit(0)
	_currentCombo = 0
	comboCounter.text = ""
	comboMeter.region_rect.size.x = minSize

func _update_meter():
	comboMeter.region_rect.size.x = maxSize
	comboCounter.text = "1 hit" if _currentCombo == 1 else "{hits} hits".format({"hits": _currentCombo})

func _combo_finished():
	_reset()
