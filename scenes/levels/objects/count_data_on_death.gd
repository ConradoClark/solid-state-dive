extends Node

class_name CountDataOnDeath

@export var damageable: Damageable
@export var amount: int = 1

var camera: CustomCamera
# Called when the node enters the scene tree for the first time.
func _ready():
	damageable.on_death.connect(_on_death)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_death():
	Globals.collectedOnLevel+= amount * Globals.currentMultiplier
	Signals.data_object_destroyed.emit()
