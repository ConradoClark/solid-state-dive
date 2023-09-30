extends Node

class_name GravityHandler

@export var body: CharacterBody2D
var _gravityRef: Gravity

func _ready():
	_gravityRef = get_node_or_null("%Gravity") as Gravity

func _physics_process(delta):
	body.velocity.y += delta * (_gravityRef.getGravity() if _gravityRef else 0)
