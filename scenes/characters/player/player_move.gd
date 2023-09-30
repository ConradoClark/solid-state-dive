extends Node

var _currentMovement: float = 0
@export var body: CharacterBody2D
@export var speed: float = 200
@export var accel: float = 0.15
@export var friction : float = 0.3
@export var airFriction: float = 0.05
@export var airControl: float = 0.05

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_currentMovement =  Input.get_action_strength("right") - Input.get_action_strength("left")
	
func _physics_process(delta):
	if _currentMovement != 0:
		if (sign(_currentMovement) == sign(body.velocity.x)):
			body.velocity.x = lerp(body.velocity.x, _currentMovement * speed,  accel)
		else:
			body.velocity.x = lerp(body.velocity.x, _currentMovement * speed,  accel if body.is_on_floor() else airControl)
	else:
		body.velocity.x = lerp(body.velocity.x, 0.0, friction if body.is_on_floor() else airFriction)
