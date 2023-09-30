extends Node

class_name GravityHandler

@export var body: CharacterBody2D

func _physics_process(delta):
	body.velocity.y += delta * (Globals.gravity if Globals.gravityEnabled else 0)
