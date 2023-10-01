extends Node

class_name PhysicsHandler

@export var body: CharacterBody2D
@export var moveAndCollide = false

var collisionData: KinematicCollision2D

# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	if moveAndCollide:
		collisionData = body.move_and_collide(body.velocity * delta)
	else: body.move_and_slide()
	body.position = body.position.round()
