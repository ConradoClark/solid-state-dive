extends Node

class_name PlayerShoot

@export var playerBody: CharacterBody2D
@export var guideArm: PlayerGuideArm
var _currentCooldown: SceneTreeTimer

func random_point_on_ring(outer_radius: float, inner_radius := 0.0):
	return Vector2.RIGHT.rotated(randf() * TAU) * sqrt(randf_range(pow(1 - (outer_radius - inner_radius) / outer_radius, 2), 1)) * outer_radius

func _process(delta):
	if !Input.is_action_pressed("shoot") or !Globals.playerCanShoot: return
	if _currentCooldown and _currentCooldown.time_left > 0: return
	_instantiateProjectile()

func _instantiateProjectile():
	var projectile = Globals.playerWeapon.projectile.instantiate() as Projectile
	Globals.sceneExclusives.push_back(projectile)
	projectile.direction = guideArm.currentDirection
	get_tree().root.add_child(projectile)
	projectile.global_position = (playerBody.global_position + projectile.direction*5
		 + random_point_on_ring(Globals.playerWeapon.positionVariance))
	projectile.rotation_degrees = guideArm.currentAngle
	_currentCooldown = get_tree().create_timer(Globals.playerWeapon.cooldownInMs * 0.001)
