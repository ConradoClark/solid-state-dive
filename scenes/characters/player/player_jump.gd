extends Node

class_name PlayerJump

signal on_jump

@export var body: CharacterBody2D
@export var minJumpSpeed: float = 5100
@export var jumpSpeed: float = 720
@export var jumpHoldTimeSeconds: float = 0.2
@export var jumpBufferTimeSeconds: float = 0.2
@export var sfxPlayer: SfxPlayer

var _jump = false
var _jumping = false
var _holdingJump = false
var _jumpTimer: SceneTreeTimer
var _jumpBuffer: SceneTreeTimer
var _coyoteBuffer: SceneTreeTimer

func _ready():
	_watch_floor()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_holdingJump = Input.is_action_pressed("jump")
	#jump buffer rules
	if _jumpBuffer and _jumpBuffer.time_left > 0 and body.is_on_floor():
		_perform_jump()
		return
	if Input.is_action_just_pressed("jump"):
		if body.is_on_floor():
			_perform_jump()
		else:
			if _coyoteBuffer and _coyoteBuffer.time_left > 0:
				print('coyote jump')
				_perform_jump()
				return
			_jumpBuffer = get_tree().create_timer(jumpBufferTimeSeconds)

func _watch_floor():
	while body.is_inside_tree():
		while body.is_on_floor():
			await get_tree().process_frame
		if !_jump and !_jumping:
			_coyoteBuffer = get_tree().create_timer(jumpBufferTimeSeconds)
		while !body.is_on_floor():
			await get_tree().process_frame

func _perform_jump():
	_jump = true
	_jumpTimer = get_tree().create_timer(jumpHoldTimeSeconds)

func _physics_process(delta):
	if _jump:
		on_jump.emit()
		if sfxPlayer: sfxPlayer.play_jump()
		_jump = false
		_jumping = true
		body.velocity.y = -minJumpSpeed * delta
		return
	if _jumping:
		body.velocity.y -= jumpSpeed * delta
		if !_holdingJump or _jumpTimer.time_left == 0:
			_jumping = false
