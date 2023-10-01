extends Node

class_name SpawnOnTrigger

@export var target: TriggerObject
@export var effect: PackedScene

func _ready():
	Signals.trigger_object.connect(_on_trigger)

func _on_trigger(tag):
	if tag != target.triggerTag: return
	var obj = effect.instantiate() as Node2D
	Globals.sceneExclusives.push_back(obj)
	get_tree().root.add_child(obj)
	obj.global_position = target.global_position
