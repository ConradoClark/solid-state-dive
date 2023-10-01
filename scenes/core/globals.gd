extends Node

var gravity: float
var gravityEnabled: bool = true

var playerCanShoot: bool = false
var playerWeapon: Weapon = preload("res://scenes/weapons/default_blaster.tres") as Weapon

var dataObjectsAmount: int = 100

var sceneExclusives = []

func changeScene(tree: SceneTree, scene: String):
	for obj in sceneExclusives:
		if obj and obj != null: obj.queue_free()
	tree.change_scene_to_file(scene)
