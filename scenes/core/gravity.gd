extends Node

class_name Gravity

@export var gravity = 400
var _isActive = true

func getGravity():
	return gravity if _isActive else 0
