extends Node

class_name PlayerMove

signal on_start_move
signal on_stop_move

var _currentMovement: float = 0
var _previousSpeed: float = 0.
@export var body: CharacterBody2D
@export var dash: PlayerDash
@export var speed: float = 75
@export var accel: float = 0.25
@export var friction : float = 0.3
@export var airFriction: float = 0.05
@export var airControl: float = 0.05
var lastDirection: float = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_currentMovement =  Input.get_action_strength("right") - Input.get_action_strength("left")
	if _currentMovement!=0: lastDirection = sign(_currentMovement)
	
func _physics_process(delta):
	if dash and dash.isDashing: return
	if _currentMovement != 0:
		if is_zero_approx(body.velocity.x): on_start_move.emit()
		if (sign(_currentMovement) == sign(body.velocity.x)):
			body.velocity.x = lerp(body.velocity.x, _currentMovement * speed,  accel)
		else:
			body.velocity.x = lerp(body.velocity.x, _currentMovement * speed,  accel if body.is_on_floor() else airControl)
	else:
		var wasZero = is_zero_approx(_previousSpeed)
		body.velocity.x = lerp(body.velocity.x, 0.0, friction if body.is_on_floor() else airFriction)
		if is_zero_approx(body.velocity.x) and !wasZero: 
			on_stop_move.emit()
			body.velocity.x = 0
	_previousSpeed = body.velocity.x
