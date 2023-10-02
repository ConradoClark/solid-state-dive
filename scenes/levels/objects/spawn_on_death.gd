extends Node

class_name SpawnOnDeath

@export var target: Node2D
@export var damageable: Damageable
@export var effect: PackedScene

func _ready():
	damageable.on_death.connect(_on_death)

func _on_death():
	call_deferred("_spawn")
	
func _spawn():
	var obj = effect.instantiate() as Node2D
	Globals.sceneExclusives.push_back(obj)
	get_tree().root.add_child(obj)
	obj.global_position = target.global_position
	obj.rotation_degrees = target.rotation_degrees
