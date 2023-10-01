extends Node

class_name DestroyOnDeath

@export var target: Node2D
@export var damageable: Damageable 

func _ready():
	damageable.on_death.connect(_on_death)

func _on_death():
	target.queue_free()
