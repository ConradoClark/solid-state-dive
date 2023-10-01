extends Node2D

class_name FlashOnImpact

@export var collisionSource: Node2D
@export var flashColor: Color
@export var seconds: float
@export var effect: TintFlash
# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.object_hit.connect(_flash_on_hit)

func _flash_on_hit(object, source):
	if collisionSource != object: return 
	effect.flash(seconds,flashColor)
	
