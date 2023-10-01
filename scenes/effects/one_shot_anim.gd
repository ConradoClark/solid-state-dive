extends AnimatedSprite2D

class_name OneShotAnim

# Called when the node enters the scene tree for the first time.
func _ready():
	play()
	animation_looped.connect(_destroy)
	animation_finished.connect(_destroy)

func _destroy():
	queue_free()
