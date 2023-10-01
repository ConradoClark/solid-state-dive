extends Node

class_name DestroyOnTrigger

@export var target: TriggerObject

func _ready():
	Signals.trigger_object.connect(_on_trigger)

func _on_trigger(tag):
	if tag != target.triggerTag: return
	target.queue_free()
