extends AnimationPlayer

@export var playerSprite: Sprite2D
@export var playerBody: CharacterBody2D
@export var playerMove: PlayerMove
@export var playerJump: PlayerJump

var _animating = true
var _moving = false
var _triggerJump = false
var _state = 'idle'
var _playingState = ''

# Called when the node enters the scene tree for the first time.
func _ready():
	playerMove.on_start_move.connect(_on_start_move)
	playerMove.on_stop_move.connect(_on_stop_move)
	playerJump.on_jump.connect(_on_jump)
	_handle_animations()

func _on_start_move():
	_moving = true
	
func _on_stop_move():
	_moving = false
	
func _on_jump():
	_triggerJump = true
	
func _handle_animations():
	if _playingState!=_state:
		play(_state)
		_playingState = _state
	match(_state):
		"idle": await _idle_state()
		"walking": await _walk_state()
		"jumping": await _jump_state()
		"falling": await _fall_state()
		_:  await get_tree().process_frame
	if _animating: await _handle_animations()

func _idle_state():
	if _moving and playerBody.is_on_floor(): _state = "walking"
	if _triggerJump: _state= "jumping"
	await get_tree().process_frame
	
func _walk_state():
	if !_moving and playerBody.is_on_floor(): _state = "idle"
	if _triggerJump: _state= "jumping"
	await get_tree().process_frame
	
func _jump_state():
	_triggerJump = false
	if !playerJump._jumping: _state = "falling"
	if playerBody.is_on_floor():
		match (_moving):
			true: _state = "walking"
			false: _state = "idle"
	await get_tree().process_frame
			
func _fall_state():
	if playerBody.is_on_floor():
		match (_moving):
			true: _state = "walking"
			false: _state = "idle"
	await get_tree().process_frame
	
func _process(delta):
	if _moving:
		# print(sign(playerMove.lastDirection))
		playerSprite.flip_h = true if sign(playerMove.lastDirection) < 0 else false 

