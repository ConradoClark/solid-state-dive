extends Node

class_name PlayerDash

@export var body: CharacterBody2D
@export var dashSpeed: float
@export var gravityHandler: GravityHandler
@export var guideArm: PlayerGuideArm
@export var ghostEffect: PackedScene

var _canDash = false
var isDashing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_canDash = Globals.acquiredApps['dash']

func _process(delta):
	if _canDash and Input.is_action_just_pressed("dash"):
		_canDash = false
		_dash()

func _dash():
	isDashing = true
	gravityHandler.isBlocked = true
	body.velocity = dashSpeed * guideArm.currentDirection
	_spawn_ghost()
	await get_tree().create_timer(0.1).timeout
	_wait_for_floor()
	gravityHandler.isBlocked = false
	isDashing = false
	
func _spawn_ghost():
	for n in 3:
		var eff = ghostEffect.instantiate() as FadingCharacter
		Globals.sceneExclusives.push_back(eff)
		get_tree().root.add_child(eff)
		eff.global_position = body.global_position
		await get_tree().create_timer(0.1).timeout

func _wait_for_floor():
	while !body.is_on_floor():
		await get_tree().process_frame
	_canDash = Globals.acquiredApps['dash']
