extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	frame = Globals.playerWeaponIndex
	Signals.on_weapon_change.connect(_on_weapon_change)
	
func _on_weapon_change(i):
	frame = i
