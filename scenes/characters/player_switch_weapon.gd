extends Node

class_name PlayerSwitchWeapon

var weapons = [ 
	"res://scenes/weapons/default_blaster.tres",
	"res://scenes/weapons/bomb_blaster.tres" 
	]
	
var index: int
# Called when the node enters the scene tree for the first time.
func _ready():
	index = Globals.playerWeaponIndex

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("change"):
		if Globals.acquiredApps['bombs']:
			match index:
				0: 
					Globals.playerWeapon = load(weapons[1])
					Globals.playerWeaponIndex = 1
					index = 1
				1:
					Globals.playerWeapon = load(weapons[0])
					Globals.playerWeaponIndex = 0
					index = 0
			Signals.on_weapon_change.emit(index)
