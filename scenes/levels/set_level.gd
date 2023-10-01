extends Node

@export var levelName: String
# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.levelName = levelName
