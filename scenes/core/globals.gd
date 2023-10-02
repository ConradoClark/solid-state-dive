extends Node

var gravity: float
var gravityEnabled: bool = true

var playerCanShoot: bool = false
var playerWeapon: Weapon = preload("res://scenes/weapons/default_blaster.tres") as Weapon
var playerWeaponIndex = 0

var currentCheckpoint: Vector2
var currentCombo: int
var currentMultiplier:int = 1

var dataObjectsAmount: int = 100
var collectedOnLevel: int = 0

var sceneExclusives = []
var sceneTweenExclusives = []

var levelName: String = "level1"

var totalSaved = 15.37

var save = {
	"level1" : 10.79,
	"level2" : 25.12
}

var acquiredApps = {
	"bombs": false,
	"dash": false,
	"bolder": false
}

func _ready():
	Signals.on_app_install.connect(_on_app_install)

func _on_app_install(app):
	match app:
		"bombs": 
			playerWeapon = preload("res://scenes/weapons/bomb_blaster.tres") as Weapon
			playerWeaponIndex = 1
		
func changeScene(tree: SceneTree, scene: String):
	for obj in sceneExclusives:
		if obj and obj != null: obj.queue_free()
	for obj in sceneTweenExclusives:
		if obj and obj != null: obj.kill()
	sceneExclusives.clear()
	sceneTweenExclusives.clear()
	Signals.on_scene_change.emit()
	await tree.create_timer(1.5).timeout
	tree.change_scene_to_file(scene)
