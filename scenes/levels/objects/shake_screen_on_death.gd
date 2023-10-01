extends Node

class_name ScreenShakeOnDeath

@export var damageable: Damageable
@export var amount: float
@export var duration: float

var camera: CustomCamera
# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_viewport().get_camera_2d() as CustomCamera
	damageable.on_death.connect(_on_death)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_death():
	if !camera: return
	camera.shake(amount, duration)
