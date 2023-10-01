extends Node

class_name SignalOnImpact

@export var projectile: Projectile
@export var physicsHandler: PhysicsHandler
	
func _physics_process(delta):
	if !physicsHandler.collisionData: return
	_emit_global()

func _emit_global():
	var collider = physicsHandler.collisionData.get_collider()
	Signals.object_hit.emit(collider, projectile)
