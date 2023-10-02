extends AnimatedSprite2D

class_name Checkpoint

@export var targetColor: Color
@export var effect: PackedScene
@export var effectOffset: Vector2
var _isActive = false
var snd: AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	snd = get_node("snd")
	material = material.duplicate()
	get_node('Area2D').body_entered.connect(_on_checkpoint)
	Signals.on_checkpoint.connect(_on_global_checkpoint)

func _on_global_checkpoint(check):
	if check == self: return
	if _isActive: _deactivate()

func _on_checkpoint(body):
	if _isActive: return
	_activate()
	Signals.on_checkpoint.emit(self)
	Globals.currentCheckpoint = global_position
	
func _activate():
	if snd: snd.play()
	_isActive = true
	material['shader_parameter/Target'] = targetColor
	var obj = effect.instantiate() as Node2D
	Globals.sceneExclusives.push_back(obj)
	get_tree().root.add_child(obj)
	obj.global_position = global_position + effectOffset
	
func _deactivate():
	_isActive = false
	material['shader_parameter/Target'] = material['shader_parameter/Source']
	
