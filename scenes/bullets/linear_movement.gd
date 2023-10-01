extends Node

@export var projectile: Projectile

# Called when the node enters the scene tree for the first time.
func _ready():
	projectile.velocity = projectile.direction * projectile.speed
