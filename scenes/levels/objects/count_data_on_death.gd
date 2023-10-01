extends Node

class_name CountDataOnDeath

@export var damageable: Damageable

var camera: CustomCamera
# Called when the node enters the scene tree for the first time.
func _ready():
	damageable.on_death.connect(_on_death)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_death():
	Globals.collectedOnLevel+= Globals.currentMultiplier
	Signals.data_object_destroyed.emit()
