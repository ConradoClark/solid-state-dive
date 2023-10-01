extends Node2D

class_name DamageOnImpact

@export var collisionSource: Node2D
@export var damageable: Damageable
# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.object_hit.connect(_damage_on_hit)

func _damage_on_hit(object: Node2D, source: Projectile):
	if collisionSource != object: return 
	var projectile = source as Projectile
	damageable.damage(source.damage)
 
