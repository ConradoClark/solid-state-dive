extends Node

class_name TriggerOnDeath

@export var triggerTag: String
@export var target: Node2D

func _ready():
	Signals.on_global_death.connect(_on_death)

func _on_death(obj):
	if obj != target: return
	Signals.trigger_object.emit(triggerTag)
