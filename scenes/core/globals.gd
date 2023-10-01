extends Node

var gravity: float
var gravityEnabled: bool = true

var playerCanShoot: bool = false
var playerWeapon: Weapon = preload("res://scenes/weapons/default_blaster.tres") as Weapon

var currentCheckpoint: Vector2
var currentCombo: int
var currentMultiplier:int = 1

var dataObjectsAmount: int = 100

var sceneExclusives = []
var sceneTweenExclusives = []

func changeScene(tree: SceneTree, scene: String):
	for obj in sceneExclusives:
		if obj and obj != null: obj.queue_free()
	for obj in sceneTweenExclusives:
		if obj and obj != null: obj.kill()
	sceneExclusives.clear()
	sceneTweenExclusives.clear()
	tree.change_scene_to_file(scene)
