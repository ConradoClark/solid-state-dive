extends Node

class_name GravityHandler

@export var body: CharacterBody2D
var isBlocked = false

func _physics_process(delta):
	if isBlocked: return
	body.velocity.y += delta * (Globals.gravity if Globals.gravityEnabled else 0)
