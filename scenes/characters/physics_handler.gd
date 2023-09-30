extends Node

class_name PhysicsHandler

@export var body: CharacterBody2D
# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	body.move_and_slide()
