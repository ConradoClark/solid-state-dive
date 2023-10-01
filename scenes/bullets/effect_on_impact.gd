extends Node

@export var projectile: Projectile
@export var physicsHandler: PhysicsHandler
	
func _physics_process(delta):
	if !physicsHandler.collisionData: return
	_spawn_effect()

func _spawn_effect():
	var collider = physicsHandler.collisionData.get_collider()
	var impactEffect = projectile.impactEffect.instantiate() as Node2D
	impactEffect.global_position = physicsHandler.collisionData.get_position()
	get_tree().root.add_child(impactEffect)
	projectile.queue_free()
