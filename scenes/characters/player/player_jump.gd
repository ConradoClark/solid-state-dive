extends Node

@export var body: CharacterBody2D
@export var minJumpSpeed: float = 7000
@export var jumpSpeed: float = 500
@export var jumpHoldTimeSeconds: float = 0.2

var _jump = false
var _jumping = false
var _holdingJump = false
var _jumpTimer: SceneTreeTimer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_holdingJump = Input.is_action_pressed("jump")	
	if Input.is_action_just_pressed("jump") && body.is_on_floor():
		_jump = true
		_jumpTimer = get_tree().create_timer(jumpHoldTimeSeconds)

func _physics_process(delta):
	if _jump:
		_jump = false
		_jumping = true
		body.velocity.y = -minJumpSpeed * delta
		return
	if _jumping:
		body.velocity.y -= jumpSpeed * delta
		if !_holdingJump or _jumpTimer.time_left == 0:
			_jumping = false
