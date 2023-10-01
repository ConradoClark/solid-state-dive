extends Node

@export var enable: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.playerCanShoot = enable
