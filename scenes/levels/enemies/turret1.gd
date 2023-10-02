extends StaticBody2D

@export var projectileType: PackedScene
@export var direction: Vector2

var animation: AnimatedSprite2D
var _shooting = false

func _ready():
	animation = get_node_or_null("sprite")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !animation or animation.frame != 1 or _shooting: return
	_shoot()

func _shoot():
	_shooting = true
	var projectile = projectileType.instantiate() as Projectile
	Globals.sceneExclusives.push_back(projectile)
	projectile.direction = direction.rotated(rotation)
	get_tree().root.add_child(projectile)
	projectile.global_position = global_position + projectile.direction*5
	projectile.rotation_degrees = rotation_degrees
	await animation.animation_looped
	_shooting = false
