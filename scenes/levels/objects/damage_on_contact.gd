extends Node

class_name DamageOnContact

@export var region: Area2D

var _triggering_hit = false

# Called when the node enters the scene tree for the first time.
func _ready():
	region.body_entered.connect(_trigger_hit)

func _trigger_hit(body):
	if _triggering_hit: return
	_triggering_hit = true
	Signals.object_hit.emit(body, null)
	await get_tree().create_timer(0.2).timeout
	_triggering_hit = false
	
