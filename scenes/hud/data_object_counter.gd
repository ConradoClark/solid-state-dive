extends Node

class_name DataObjectCounter

@export var label: Label
var _amount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.collectedOnLevel = 0
	Signals.data_object_destroyed.connect(_on_object_destroyed)

func _on_object_destroyed():
	_amount+= Globals.currentMultiplier
	label.text = "{amount} / {total} data".format({"amount": _amount, "total": Globals.dataObjectsAmount})
