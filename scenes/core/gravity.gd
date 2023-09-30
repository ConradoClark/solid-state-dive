extends Node

class_name Gravity

@export var gravity = 500:
	set(p_gravity):
		gravity = p_gravity
		_update_globals()

var isActive = true:
	set(active):
		isActive = active
		_update_globals()

func _ready():
	_update_globals()

func _update_globals():
	Globals.gravity = gravity
	Globals.gravityEnabled = isActive
