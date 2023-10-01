extends Node

class_name ChangeSceneOnDeath

@export var damageable: Damageable
@export var scene: String

func _ready():
	damageable.on_death.connect(_on_death)

func _on_death():
	Globals.changeScene(get_tree(), scene)
